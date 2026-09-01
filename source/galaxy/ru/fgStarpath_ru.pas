(*****************************************************************************
                           AstrobloQ System
******************************************************************************)
unit fgStarpath_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,

  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  GLS.Scene,
  GLS.Objects,
  GLS.VectorFileObjects,
  GLS.Cadencer,
  GLS.SceneViewer,
  GLS.Texture,
  Stage.VectorTypes,
  Stage.VectorTypesExt,
  Stage.VectorGeometry,
  Stage.Coordinates,
  Stage.BaseClasses,
  Stage.Keyboard;

type
  // Спектральные классы согласно Гарвардской шкале
  TSpectralClass = (scO, scB, scA, scF, scG, scK, scM);

  // Структура звезды
  TStarNode = class
    Position: TGSVector; // X, Y, Z в парсеках
    Spectral: TSpectralClass;
    DK: Single; // Индекс катастрофизма 0..1
    IsHazard: Boolean; // Флаг объединения в Convex Hull
    Connections: TList<TStarNode>; // Рёбра Триангуляции Делоне (соседи)
    constructor Create(APos: TGSVector; ASpec: TSpectralClass);
    destructor Destroy; override;
  end;

  TfrmStarpath = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCadencer1: TGLCadencer;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLPoints1: TGLPoints;
    Panel1: TPanel;
    BtnGenerate: TButton;
    BtnFindPath: TButton;
    StarPoints: TGLPoints;
    PathLines: TGLLines;
    procedure FormCreate(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime, newTime: Double);
    procedure BtnGenerateClick(Sender: TObject);
    procedure BtnFindPathClick(Sender: TObject);
  private
    Stars: TObjectList<TStarNode>;
    StartNode, EndNode: TStarNode;
    OpenSet, ClosedSet: TList<TStarNode>;
    CameFrom: TDictionary<TStarNode, TStarNode>;
    GScore, FScore: TDictionary<TStarNode, Single>;

    function CalculateDK(Spec: TSpectralClass): Single;
    procedure BuildTopology; // Упрощенная прокладка связей
    function Heuristic(A, B: TStarNode): Single;
    function ReconstructPath(Current: TStarNode): TArray<TGSVector>;
  public
  end;

var
  frmStarpath: TfrmStarpath;

implementation  //======================================================

{$R *.dfm}

//----------------------------------------------------------------------
// TStarNode
//----------------------------------------------------------------------
constructor TStarNode.Create(APos: TGSVector; ASpec: TSpectralClass);
begin
  inherited Create;
  Position := APos;
  Spectral := ASpec;
  Connections := TList<TStarNode>.Create;
end;

//----------------------------------------------------------------------
destructor TStarNode.Destroy;
begin
  Connections.Free;
  inherited;
end;

//----------------------------------------------------------------------
procedure TfrmStarpath.FormCreate(Sender: TObject);
begin
  Stars := TObjectList<TStarNode>.Create(True);
  OpenSet := TList<TStarNode>.Create;
  ClosedSet := TList<TStarNode>.Create;
  CameFrom := TDictionary<TStarNode, TStarNode>.Create;
  GScore := TDictionary<TStarNode, Single>.Create;
  FScore := TDictionary<TStarNode, Single>.Create;

  Randomize;
  // Камера обзора куба 1 кпс
  GLSceneViewer1.Camera.Position.SetPoint(0, 0, 1500);
end;

//----------------------------------------------------------------------
function TfrmStarpath.CalculateDK(Spec: TSpectralClass): Single;
begin
  case Spec of
    scO: Result := 0.95;
    scB: Result := 0.85;
    scA: Result := 0.65;
    scF: Result := 0.40;
    scG: Result := 0.25;
    scK: Result := 0.15;
    scM: Result := 0.05;
  else
    Result := 0.5;
  end;
end;

//----------------------------------------------------------------------
// Генерация тестовой выборки "вокруг" Солнца
//----------------------------------------------------------------------
procedure TfrmStarpath.BtnGenerateClick(Sender: TObject);
var
  i: Integer;
  Pos: TGSVector;
  Spectral: TSpectralClass;
  Node: TStarNode;
begin
  Stars.Clear;
  StarPoints.CleanupInstance;     // was StarPoints.Items.Clear;

  for i := 0 to 199 do
  begin
    // Равномерное распределение в сфере радиусом 500 пс
    repeat
      Pos.X := (Random - 0.5) * 1000;
      Pos.Y := (Random - 0.5) * 1000;
      Pos.Z := (Random - 0.5) * 1000;
    until VectorLength(Pos) <= 500;

    Spectral := TSpectralClass(Random(7));
    Node := TStarNode.Create(Pos, Spectral);
    Node.DK := CalculateDK(Spectral);

    if Node.DK > 0.8 then
      Node.IsHazard := True
    else
      Node.IsHazard := False;

    Stars.Add(Node);

    // Отрисовка точки
    // Визуализация узла VD/DT
    with StarPoints do // vertices ?
    begin
(*
      AsAffineVector := Pos;  ???
      Positions.Add(Stars[i]);
      Point := Pos;
      Color.Red := 1.0 - Node.DK; // Красные - опасно
      Color.Green := Node.DK; // Зеленые - безопасно,
      Color.Blue := 0.0;
      Scale.X := 20; // Размер маркера
*)
    end;
  end;

  BuildTopology;
  Caption := 'Локальная модель окрестности Солнца | Звезд: ' + IntToStr(Stars.Count);
end;

//----------------------------------------------------------------------
// Построение графа соседства (эмуляция DT)
//----------------------------------------------------------------------
procedure TfrmStarpath.BuildTopology;
var
  i, j: Integer;
  Dist: Single;
begin
  // Очищаем старые связи
  for i := 0 to Stars.Count - 1 do
    Stars[i].Connections.Clear;

  // Простой метод: соединяем каждую звезду с N ближайшими соседями
  for i := 0 to Stars.Count - 1 do
  begin
    // Сортировка всех остальных по расстоянию (в реальном проекте здесь нужен QHull/Bowyer-Watson)
    var Sorted := TList<Integer>.Create;
    try
      for j := 0 to Stars.Count - 1 do
        if i <> j then Sorted.Add(j);
(*
      Sorted.Sort(TComparer<Integer>.Construct(
        function(const L, R: Integer): Integer
        var dL, dR: Single;
        begin
          dL := VectorDistance(Stars[i].Position, Stars[L].Position);
          dR := VectorDistance(Stars[i].Position, Stars[R].Position);
          if dL < dR then Exit(-1) else if dL > dR then Exit(1) else Exit(0);
        end));

      // Берем 8 ближайших соседей (типично для структуры локальной DT)
      for j := 0 to Min(7, Sorted.Count - 1) do
        Stars[i].Connections.Add(Stars[Sorted[j]]);
*)
    finally
      Sorted.Free;
    end;
  end;
end;

//----------------------------------------------------------------------
// Поиск пути A*
//----------------------------------------------------------------------
procedure TfrmStarpath.BtnFindPathClick(Sender: TObject);
var
  Current, Neighbor: TStarNode;
  i: Integer;
  TentativeGScore, Distance: Single;
begin
  if Stars.Count = 0 then Exit;

  // Выбираем две случайные безопасные звезды
  repeat StartNode := Stars[Random(Stars.Count)] until not StartNode.IsHazard;
  repeat EndNode := Stars[Random(Stars.Count)] until (not EndNode.IsHazard) and (EndNode <> StartNode);

  OpenSet.Clear;
  ClosedSet.Clear;
  CameFrom.Clear;
  GScore.Clear;
  FScore.Clear;

  OpenSet.Add(StartNode);
  GScore.Add(StartNode, 0);
  FScore.Add(StartNode, Heuristic(StartNode, EndNode));

  while OpenSet.Count > 0 do
  begin
    // Ищем узел с минимальным FScore
    Current := OpenSet[0];
    for i := 1 to OpenSet.Count - 1 do
      if FScore[OpenSet[i]] < FScore[Current] then
        Current := OpenSet[i];

    if Current = EndNode then
    begin
      // Путь найден, рисуем
      var Track := ReconstructPath(Current);
      PathLines.Nodes.Clear;
      for i := 0 to High(Track) do
        PathLines.Nodes.AddNode(Track[i]);
      PathLines.Visible := True;
      ShowMessage('Путь построен. Безопасных прыжков: ' + IntToStr(High(Track)));
      Exit;
    end;

    OpenSet.Remove(Current);
    ClosedSet.Add(Current);

    // Проверяем соседей (рёбра Делоне)
    for i := 0 to Current.Connections.Count - 1 do
    begin
      Neighbor := Current.Connections[i];

      // Бесполётные зоны (объединенные опасные полиэдры)
      if Neighbor.IsHazard or ClosedSet.Contains(Neighbor) then
        Continue;

      Distance := VectorDistance(Current.Position, Neighbor.Position);

      // Вес ребра зависит от среднего индекса катастрофизма пары
      TentativeGScore := GScore[Current] + Distance * (1.0 + (Current.DK + Neighbor.DK) / 2);

      if not GScore.ContainsKey(Neighbor) then
        GScore.Add(Neighbor, MaxSingle);

      if TentativeGScore < GScore[Neighbor] then
      begin
        if CameFrom.ContainsKey(Neighbor) then
          CameFrom[Neighbor] := Current
        else
          CameFrom.Add(Neighbor, Current);

        GScore[Neighbor] := TentativeGScore;
        FScore[Neighbor] := TentativeGScore + Heuristic(Neighbor, EndNode);

        if not OpenSet.Contains(Neighbor) then
          OpenSet.Add(Neighbor);
      end;
    end;
  end;

  ShowMessage('Путь не найден. Регион заблокирован высокими Dk.');
end;

//----------------------------------------------------------------------
function TfrmStarpath.Heuristic(A, B: TStarNode): Single;
begin
  // Прямая линия без учета препятствий (оптимистичная оценка)
  Result := VectorDistance(A.Position, B.Position) * 1.0;
end;

//----------------------------------------------------------------------
function TfrmStarpath.ReconstructPath(Current: TStarNode): TArray<TGSVector>;
var
  TotalPath: TList<TGSVector>;
begin
  TotalPath := TList<TGSVector>.Create;
  try
    TotalPath.Add(Current.Position);
    while CameFrom.ContainsKey(Current) do
    begin
      Current := CameFrom[Current];
      TotalPath.Insert(0, Current.Position);
    end;
    Result := TotalPath.ToArray;
  finally
    TotalPath.Free;
  end;
end;

//----------------------------------------------------------------------
procedure TfrmStarpath.GLCadencer1Progress(Sender: TObject; const deltaTime, newTime: Double);
begin
  // Обработка вращения сцены мышью можно добавить здесь через GLUserInterface
end;

end.

//----------------------------------------------------------------------
//----------------------------------------------------------------------
//----------------------------------------------------------------------

(*
Для построения такой 3D‑сети (графа) и решения на ней задачи коммивояжёра (TSP) у такого подхода нет устоявшегося астрономического названия — это будет **искусственный граф**, построенный по заданному критерию.

## Как технически собрать такой граф

1. **Выбрать звёзды класса G (в т. ч. жёлтые карлики).** Берёте каталог звёзд с указанием спектрального класса — например, Hipparcos, Gaia DR3/DR4. Фильтруете по полю `spectral_type`: нужны G‑звёзды, можно дополнительно сузить до подклассов G0–G9 и класса светимости V (карлики).
2. **Взять 3D‑координаты.** Нужны расстояния до звёзд (параллаксы) и небесные координаты, чтобы получить декартовы координаты $(x, y, z)$ в парсеках или световых годах. В Gaia расстояния уже есть (или их можно оценить).
3. **Построить полный граф.** Вершины — отфильтрованные звёзды, рёбра — все возможные пары звёзд. Вес ребра — евклидово расстояние между ними:
   $$
   d = \sqrt{(x_1-x_2)^2 + (y_1-y_2)^2 + (z_1-z_2)^2}
   $$
4. **Решить TSP** на этом графе: найти кратчайший маршрут, проходящий через все вершины ровно по одному разу и возвращающийся в начало.

---

## Важные нюансы именно для TSP на звёздах

- Количество вершин критично. Задача коммивояжёра NP‑трудная: при $n$ вершинах число возможных маршрутов растёт как $(n-1)!/2$. Даже для 20 звёзд это уже миллионы вариантов, для 30+ точный перебор невозможен. Для сотен и тысяч звёзд используют эвристики (2‑opt, алгоритм ближайшего соседа, муравьиный алгоритм, солверы типа Concorde с релаксациями и т. п.).
- Смысл маршрута условный. В космосе нет «дорог», и «оптимальный путь» будет чисто математическим: минимальная сумма расстояний между выбранными звёздами.
- Выборка сильно влияет на результат.
  Если взять все G карлики в радиусе 100 пк, получится несколько сотен звёзд;
  если в радиусе 500 пк — тысячи.
  Для TSP лучше начинать с небольшой выборки (например, 20–50 звёзд), чтобы можно было получить точное решение и проверить метод.

---

## Практические инструменты

- Данные: каталог Gaia (через Astropy + astroquery), Hipparcos.
- Обработка: Python + Astropy (координаты, расстояния), Pandas (фильтрация по спектральному классу).
- Граф и TSP: NetworkX (построение графа), OR‑Tools / Google OR Tools (TSP‑солвер), либо специализированные солверы (Concorde).
- Визуализация 3D: Matplotlib (mplot3d), Plotly, PyVista.

Пример логики на Python (упрощённо):

import numpy as np
from astropy.coordinates import SkyCoord
import astropy.units as u

# Предположим, у вас есть DataFrame df с колонками:
# ra, dec (градусы), distance (пк), spectral_type
g_dwarfs = df[df['spectral_type'].str.startswith('G') & (df['lum_class'] == 'V')]

coords = SkyCoord(g_dwarfs['ra'].values*u.deg, g_dwarfs['dec'].values*u.deg, distance=g_dwarfs['distance'].values*u.pc)
cart = coords.cartesian
xs, ys, zs = cart.x.value, cart.y.value, cart.z.value

# Матрица расстояний (евклидовых)
n = len(xs)
dist_matrix = np.zeros((n, n))
for i in range(n):
    for j in range(i+1, n):
        d = np.sqrt((xs[i]-xs[j])**2 + (ys[i]-ys[j])**2 + (zs[i]-zs[j])**2)
        dist_matrix[i, j] = dist_matrix[j, i] = d
```

Дальше эту матрицу можно скормить солверу TSP.

---

## Нюанс про «все звёзды класса G»

Если брать действительно «все» G карлики, видимых на небе, их будет очень много
(десятки тысяч и более), и TSP в классическом виде на таком графе нереализуем.
На практике делают так:

- ограничивают выборку по расстоянию (например, до 200–300 пк);
- либо берут подвыборку (случайно или по плотности, чтобы покрыть разные области неба);
- либо решают не полный TSP, а его варианты (например, маршрут через часть точек, кластеризацию + TSP внутри кластеров и т. д.).

Если скажете, какой масштаб задачи вы хотите (сколько примерно звёзд, нужна ли точность или хватит эвристики, что важнее — минимальная длина или покрытие разных областей неба), подскажу, какую стратегию и какие инструменты лучше выбрать.
*)

(*

Ты прав: лететь по рёбрам Делоне — значит гарантированно подлетать вплотную к звёздам, а это в твоём сценарии смертельно. Идея с границами ячеек Вороного (т. е. срединными плоскостями между парами звёзд) как раз и даёт «коридоры посередине» — максимально далеко от звёзд и их опасных зон.

Ниже — пошаговый алгоритм и пример реализации на Delphi (совместимо с C++Builder) с использованием GLScene для визуализации.

Концептуальная модель
Пространство разбито на ячейки Вороного: каждая ячейка — область пространства, ближайшая к одной звезде.
Границы ячеек — плоскости, равноудалённые от пар звёзд. Это и есть безопасные «коридоры».
Рёбра графа — линии пересечения этих плоскостей (т. е. рёбра полиэдров Вороного). Они лежат на равном удалении от ближайших звёзд и дальше всего от опасных объектов.
Вес ребра — длина отрезка, скорректированная штрафом за близость к опасным зонам.
Путь — кратчайший маршрут на этом графе (алгоритм Дейкстры или A*  _)).
Финальная траектория — сплайн (B‑spline) через вершины пути, чтобы сгладить углы.
Это не TSP, а именно pathfinding в 3D с запрещёнными зонами.
*)

(*
Пошаговый алгоритм
Загрузка данных из Hyg.csv: координаты (x, y, z), спектральный класс, тип объекта.
Фильтрация по расстоянию: оставить только звёзды в пределах 1000 св. лет (≈306.6 пк).
Построение 3D‑тетраэдрализации Делоне по всем точкам.
Двойственная структура (Вороной): из тетраэдров Делоне получить ячейки Вороного и их границы (плоскости и рёбра). В Delphi/C++ нет готовой «Voronoi 3D» в стандартной библиотеке, поэтому используем связь: вершины Вороного — центры описанных сфер тетраэдров Делоне; рёбра клеток Вороного соединяют центры рёбер соседних тетраэдров.
Определение опасных зон:
Для каждой опасной звезды (O, B, A, сверхновые, чёрные дыры и т. д.) задать радиус опасности Rdanger𝑅

ример кода на Delphi (VCL + GLScene)
Ниже — скелет, который можно вставить в форму Delphi с компонентами GLScene1, GLSceneViewer1, GLCamera1.
*)

(*
nit UnitStarPath;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Math,
  GLS.Scene,
  GLS.Objects,
  GLS.Graphics,
  GLS.Coordinates,
  GLS.VectorFileObjects;

type
  TStar = record
    X, Y, Z: Double;
    Spec: string;
    IsDangerous: Boolean;
    DangerRadius: Double;
  end;

  TEdgeVoronoi = record
    IdxA, IdxB: Integer; // индексы тетраэдров
    Len: Double;         // длина ребра
    Penalty: Double;     // штраф за опасность
    Weight: Double;       // итоговый вес
  end;

  TFormPath = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    procedure FormCreate(Sender: TObject);
  private
    FStars: array of TStar;
    FTetrahedra: array of array[0..3] of Integer; // индексы вершин
    FCenterTetra: array of TVector3f;            // центры сфер (вершины Вороного)
    FGraphEdges: array of TEdgeVoronoi;
    FSunIdx, FHeliosIdx: Integer;
    function LoadStarsFromCSV(const FileName: string): Integer;
    procedure BuildDelaunay;
    procedure BuildVoronoiGraph;
    function FindPathDijkstra(StartNode, EndNode: Integer): TArray<Integer>;
    procedure VisualizePath(const PathNodes: TArray<Integer>);
    procedure DrawVoronoiEdges;
    procedure DrawDangerZones;
  public
  end;

var
  FormPath: TFormPath;

implementation //=======================================================

{$R *.dfm}

// --- Упрощённые функции (в реальном коде нужна полноценная 3D-триангуляция) ---

function TFormPath.LoadStarsFromCSV(const FileName: string): Integer;
var
  Lines: TStringList;
  i: Integer;
  Parts: TArray<string>;
begin
  // Здесь загрузка CSV: x,y,z,spectral_type и т.д.
  // Для примера просто создадим несколько тестовых звёзд
  SetLength(FStars, 50);
  for i := 0 to High(FStars) do
  begin
    FStars[i].X := Random * 200 - 100;
    FStars[i].Y := Random * 200 - 100;
    FStars[i].Z := Random * 200 - 100;
    if i < 5 then
    begin
      FStars[i].Spec := 'O';
      FStars[i].IsDangerous := True;
      FStars[i].DangerRadius := 15;
    end
    else
    begin
      FStars[i].Spec := 'G';
      FStars[i].IsDangerous := False;
      FStars[i].DangerRadius := 0;
    end;
  end;
  FSunIdx := 0;
  FHeliosIdx := 1;
  Result := Length(FStars);
end;

procedure TFormPath.BuildDelaunay;
begin
  // В реальном проекте здесь вызов внешней библиотеки (TetGen, CGAL)
  // или использование готовой 3D Delaunay-реализации.
  // Для прототипа просто эмулируем несколько тетраэдров:
  SetLength(FTetrahedra, 10);
  FTetrahedra[0] := [0,1,2,3];
  FTetrahedra[1] := [1,2,3,4];
  // ...
end;

function Dist3(const A, B: TVector3f): Double;
begin
  Result := Sqrt(Sqr(A.X - B.X) + Sqr(A.Y - B.Y) + Sqr(A.Z - B.Z));
end;

procedure TFormPath.BuildVoronoiGraph;
var
  i, j, k: Integer;
  P1, P2: TVector3f;
  d, minDistToDanger: Double;
  isAdjacent: Boolean;
begin
  // 1. Центры описанных сфер тетраэдров = вершины Вороного
  SetLength(FCenterTetra, Length(FTetrahedra));
  for i := 0 to High(FTetrahedra) do
  begin
    // Упрощённо: центр масс тетраэдра вместо центра сферы
    P1.X := (FStars[FTetrahedra[i][0]].X + FStars[FTetrahedra[i][1]].X +
             FStars[FTetrahedra[i][2]].X + FStars[FTetrahedra[i][3]].X) / 4;
    P1.Y := (FStars[FTetrahedra[i][0]].Y + FStars[FTetrahedra[i][1]].Y +
             FStars[FTetrahedra[i][2]].Y + FStars[FTetrahedra[i][3]].Y) / 4;
    P1.Z := (FStars[FTetrahedra[i][0]].Z + FStars[FTetrahedra[i][1]].Z +
             FStars[FTetrahedra[i][2]].Z + FStars[FTetrahedra[i][3]].Z) / 4;
    FCenterTetra[i] := P1;
  end;

  // 2. Рёбра Вороного: между центрами соседних тетраэдров
  SetLength(FGraphEdges, 0);
  for i := 0 to High(FTetrahedra) do
    for j := i + 1 to High(FTetrahedra) do
    begin
      // Проверка смежности: тетраэдры имеют общую грань (3 общие вершины)
      isAdjacent := False;
      k := 0;
      while (k < 4) and not isAdjacent do
      begin
        // упрощённая проверка: если хотя бы 3 вершины совпадают
        // (в реальности нужно сравнивать пары)
        k := k + 1;
      end;
      // Для краткости здесь эмуляция смежности
      if (i = 0) and (j = 1) then isAdjacent := True;

      if isAdjacent then
      begin
        P1 := FCenterTetra[i];
        P2 := FCenterTetra[j];
        d := Dist3(P1, P2);

        // Штраф за близость к опасным объектам
        minDistToDanger := 1e9;
        for k := 0 to High(FStars) do
          if FStars[k].IsDangerous then
          begin
            // Расстояние от отрезка до точки можно уточнить, пока используем расстояние до середины
            minDistToDanger := Min(minDistToDanger, Dist3(P1, FStars[k]) - FStars[k].DangerRadius);
            minDistToDanger := Min(minDistToDanger, Dist3(P2, FStars[k]) - FStars[k].DangerRadius);
          end;

        var penalty := 0.0;
        if minDistToDanger < 10 then
          penalty := 1000 * (10 - minDistToDanger); // чем ближе, тем больше штраф

        SetLength(FGraphEdges, Length(FGraphEdges) + 1);
        FGraphEdges[High(FGraphEdges)].IdxA := i;
        FGraphEdges[High(FGraphEdges)].IdxB := j;
        FGraphEdges[High(FGraphEdges)].Len := d;
        FGraphEdges[High(FGraphEdges)].Penalty := penalty;
        FGraphEdges[High(FGraphEdges)].Weight := d + penalty;
      end;
    end;
end;

function TFormPath.FindPathDijkstra(StartNode, EndNode: Integer): TArray<Integer>;
var
  N, i, u, v: Integer;
  dist: array of Double;
  prev: array of Integer;
  visited: array of Boolean;
  minDist: Double;
  idxMin: Integer;
begin
  N := Length(FCenterTetra);
  SetLength(dist, N);
  SetLength(prev, N);
  SetLength(visited, N);
  for i := 0 to N - 1 do
  begin
    dist[i] := 1e18;
    prev[i] := -1;
    visited[i] := False;
  end;
  dist[StartNode] := 0;

  repeat
    minDist := 1e18;
    idxMin := -1;
    for i := 0 to N - 1 do
      if not visited[i] and (dist[i] < minDist) then
      begin
        minDist := dist[i];
        idxMin := i;
      end;
    u := idxMin;
    if u = -1 then Break;
    visited[u] := True;
    if u = EndNode then Break;

    // Перебор рёбер из u
    for i := 0 to High(FGraphEdges) do
    begin
      if FGraphEdges[i].IdxA = u then v := FGraphEdges[i].IdxB
      else if FGraphEdges[i].IdxB = u then v := FGraphEdges[i].IdxA
      else Continue;

      if dist[u] + FGraphEdges[i].Weight < dist[v] then
      begin
        dist[v] := dist[u] + FGraphEdges[i].Weight;
        prev[v] := u;
      end;
    end;
  until False;

  // Восстановление пути
  var path: TArray<Integer>;
  SetLength(path, 0);
  u := EndNode;
  while u <> -1 do
  begin
    SetLength(path, Length(path) + 1);
    path[High(path)] := u;
    u := prev[u];
  end;
  // Реверс
  var rev: TArray<Integer>;
  SetLength(rev, Length(path));
  for i := 0 to High(path) do
    rev[i] := path[High(path) - i];
  Result := rev;
end;

procedure TFormPath.VisualizePath(const PathNodes: TArray<Integer>);
var
  i: Integer;
  P: TGLPoints;
  L: TGLLines;
  S: TGLSphere;
begin
  GLScene1.Objects.Clear;

  // Точки Вороного (вершины)
  P := TGLPoints.Create(GLScene1);
  P.Name := 'VoronoiNodes';
  P.Color := clWhite;
  P.Size := 2;
  for i := 0 to High(FCenterTetra) do
    P.AddPoint(FCenterTetra[i]);

  // Рёбра Вороного
  L := TGLLines.Create(GLScene1);
  L.Name := 'VoronoiEdges';
  L.Color := $008080; // сине-зелёный
  for i := 0 to High(FGraphEdges) do
  begin
    L.AddLine(FCenterTetra[FGraphEdges[i].IdxA], FCenterTetra[FGraphEdges[i].IdxB]);
  end;

  // Опасности
  DrawDangerZones;

  // Путь
  if Length(PathNodes) > 1 then
  begin
    var PathPoints: TArray<TVector3f>;
    SetLength(PathPoints, Length(PathNodes));
    for i := 0 to High(PathNodes) do
      PathPoints[i] := FCenterTetra[PathNodes[i]];

    // Сплайн (Catmull-Rom)
    var Spline: TGLCatmullRomSpline;
    Spline := TGLCatmullRomSpline.Create(GLScene1);
    Spline.Name := 'ShipPath';
    Spline.Color := clRed;
    Spline.Width := 3;
    Spline.Points := PathPoints;
    Spline.Tension := 0.5;
  end;
end;

procedure TFormPath.DrawDangerZones;
var
  i: Integer;
  S: TGLSphere;
begin
  for i := 0 to High(FStars) do
  if FStars[i].IsDangerous then
    begin
      S := TGLSphere.Create(GLScene1);
      S.Position.X := FStars[i].X;
      S.Position.Y := FStars[i].Y;
      S.Position.Z := FStars[i].Z;
      S.Radius := FStars[i].DangerRadius;
      S.Color := clRed;
      S.Transparency := 0.6;
    end;
end;

procedure TFormPath.DrawVoronoiEdges;
begin
  // Уже рисуется в VisualizePath
end;

procedure TFormPath.FormCreate(Sender: TObject);
begin
  LoadStarsFromCSV('Hyg.csv');
  BuildDelaunay;
  BuildVoronoiGraph;

  var startNode, endNode: Integer;
  // Найти тетраэдр, центр которого ближе всего к Солнцу и Гелио
// Продолжение реализации TFormPath

procedure TFormPath.FormCreate(Sender: TObject);
var
  i: Integer;
  SunPos, HeliosPos, TetraCenter: TVector3f;
  dist, minDist: Double;
  startNode, endNode: Integer;
  PathNodes: TArray<Integer>;
begin
  // 1. Загрузка и построение
  LoadStarsFromCSV('Hyg.csv');
  BuildDelaunay;
  BuildVoronoiGraph;

  // 2. Найти тетраэдр, центр которого ближе всего к Солнцу (стартовая ячейка)
  SunPos.X := 0; SunPos.Y := 0; SunPos.Z := 0; // Солнце в начале координат
  minDist := 1e18;
  startNode := -1;
  for i := 0 to High(FCenterTetra) do
  begin
    TetraCenter := FCenterTetra[i];
    dist := Sqrt(Sqr(TetraCenter.X - SunPos.X) + Sqr(TetraCenter.Y - SunPos.Y) + Sqr(TetraCenter.Z - SunPos.Z));
    if dist < minDist then
    begin
      minDist := dist;
      startNode := i;
    end;
  end;

  // 3. Найти тетраэдр, ближайший к звезде Гелиос (финиш)
  // В реальном коде нужно найти строку с именем 'Helios' в FStars и взять её координаты
  HeliosPos.X := 50; HeliosPos.Y := -30; HeliosPos.Z := 20; // ЗАГЛУШКА: подставить реальные координаты Гелиоса
  minDist := 1e18;
  endNode := -1;
  for i := 0 to High(FCenterTetra) do
  begin
    TetraCenter := FCenterTetra[i];
    dist := Sqrt(Sqr(TetraCenter.X - HeliosPos.X) + Sqr(TetraCenter.Y - HeliosPos.Y) + Sqr(TetraCenter.Z - HeliosPos.Z));
    if dist < minDist then
    begin
      minDist := dist;
      endNode := i;
    end;
  end;

  if (startNode = -1) or (endNode = -1) then
  begin
    ShowMessage('Не удалось найти стартовую или конечную ячейку Вороного');
    Exit;
  end;

  // 4. Поиск кратчайшего пути
  PathNodes := FindPathDijkstra(startNode, endNode);

  if Length(PathNodes) = 0 then
  begin
    ShowMessage('Путь не найден — возможно, граф разорван из-за опасных зон');
    Exit;
  end;

  // 5. Визуализация
  VisualizePath(PathNodes);
end;
*)
(*

Что ещё важно дописать (практические детали)
1. Нормальная смежность тетраэдров (вместо заглушки)
В предыдущем фрагменте проверка смежности была заглушкой. Для реального графа нужно корректно определять, какие тетраэдры имеют общую грань (3 общие вершины). Это делается через словарь «грань → тетраэдр»: грань задаётся отсортированной тройкой индексов вершин. Если одна и та же грань встречается у двух тетраэдров — они смежные, и между их центрами строится ребро Вороного.

2. Расстояние от отрезка до опасной зоны
Сейчас штраф считается по расстоянию от концов ребра до опасной звезды. Правильнее считать минимальное расстояние от отрезка до сферы опасности. Формула: расстояние от точки до отрезка, затем вычитаем радиус опасной зоны. Если результат меньше 0 — объект внутри опасной зоны.

3. Сглаживание сплайном
В VisualizePath уже используется TGLCatmullRomSpline — это и есть Catmull‑Rom, который проходит через контрольные точки (центры тетраэдров) и даёт плавные изгибы. Если хочешь B‑сплайн (не проходит через точки, но ещё плавнее), в GLScene есть TGLBSpline.

Критически важное: 120 000 точек и 3D Вороной
С 120 000 звёздами строить полную 3D тетраэдрализацию Делоне и двойственную Вороного в Delphi «на коленке» не получится:

Число тетраэдров может быть порядка 600 000–1 000 000, рёбер — ещё больше.
Реализация Делоне/Вороного в чистом Delphi будет медленной и нестабильной.
GLScene нормально отрисовывает сотни тысяч рёбер, но строить их придётся долго.
Практический путь:

Использовать внешнюю библиотеку для построения Делоне: TetGen, CGAL или аналоги. Они дают надёжную 3D триангуляцию и смежность тетраэдров.
Выгрузить граф (вершины Вороного, рёбра, веса) в файл (CSV/JSON).
В Delphi только:
загрузить готовый граф,
запустить Дейкстру/A*,
отрисовать в GLScene.
Это сильно упростит код и сделает его устойчивым.

Альтернатива без полной Вороной: «коридоры посередине»
Если не хочется возиться с 3D Вороным, можно сделать упрощённую версию:

Построить граф только между G звёздами (безопасными).
Рёбра — прямые отрезки между ними.
Вес ребра = длина + штраф за пересечение сфер опасности вокруг O/B/A, чёрных дыр и т.д.
Штраф можно делать пропорционально длине пересечения отрезка с опасными сферами.
Этот подход проще реализовать в Delphi, быстрее считается и даёт тот же эффект «лететь посередине», избегая опасных звёзд.

Важные нюансы под твой сценарий
Пояса астероидов, протопланетные диски, обломки — их можно моделировать как дополнительные запрещённые объёмы (выпуклые оболочки, эллипсоиды) и добавлять штрафы за пересечение.
Пульсары/магнетары — у них нет «радиуса» в каталоге, но можно задать условный радиус опасности (например, 1–5 парсек) и учитывать их как точечные источники.
Срезание углов — Catmull‑Rom сплайн как раз и даёт «срезание» острых углов ломаной, делая траекторию плавной.
Если ты хочешь C++Builder + GLScene
Логика абсолютно та же, меняется только синтаксис:

Вместо TArray<Integer> — std::vector<int>.
Вместо TVector3f — Vector3 из GLScene (или свой struct).
Алгоритмы (Дейкстра, поиск смежности) пишутся на C++ без изменений.
Отрисовка — через те же компоненты GLScene, что и в Delphi.
*)

(*
алгоритм некоторые немаловажные шаги, хотя их наверняка можно включить в методы поиска кратчайшего пути Дейкстры или А* _3d.
Итак:
- мы имеем готовые сетки тетраэдров Делоне и полиэдров Вороного для 1 миллиарда звёзд
  галактической окрестности Солнца из каталога Gaia DR4.
  Наша цель - звезда Гелиос, находящаяся на расстоянии 10тыс. св. лет
  от Солнца на прямой линии к центру ядра Галактики.
  На неё направлен главный вектор движения, луч цели target ray Rt;
- предрасчитаем трек оптимального пути АB по сетке тетраэдрализации с учётом всех
  вышеупомянутых ограничений и наличием запрещённых,  бесполётных зон.
  Между А и Б могут находится абсолютно непроницаемые зоны интенсивного звёздообразования,
  газово-пылевые облака и так далее, которые необходимо огибать, облетать стороной. Этот кратчайший тетраэдральный трек Tt с сегментами между звёздами, векторами между вершинами rv, берётся за основу дальнейшего определения самого безопасного оптимального пути по хордам на гранях полиэдров, плоскостям 4D ячеек Вороного. Клетки с узлами звёзд в их центрах меняют свою конфигурацию и-за собственных движений и в результате эволюции самих звёзд;
- отправляем с  космодрома на Плутоне фотонную ракету к звезде Гелиос, у которой инфракрасными телескопами обнаружена террапланета с явными био- и техносигнатурами. Скорость ракеты с движком на антивеществе устанавливаем в 0.99 скорости света. По прибытии в пункт назначения Гелиос подсчитываем энергозатраты на перелёт и время в пути.
- выполняем N расчётов подобных траекторий по Галактике, набираем статистику.

Становится ясно, что межзвёздные путешествия на большие расстояния не такое простое мероприятие, как предполагал в 1950 году Энрико Ферми за чашечкой кофе. И за миллиард лет весь Моечный Путь не облетишь, не говоря уже о том,
чтобы колонизировать его малую часть. Она меняется.
Очевидно более целесообразно вести прямые межзвёздные коммуникации между
цивилизациями I и II  типов по Н.С.Кардашеву.
Также по тетраэдральной сети, но уже с опорой на станции в вершинах звёзд
с коммуникационными цивилизациями. В итоге повышается
важность поиска внеземных цивилизаций по программе SETI.
Дай пошаговый алгоритм моделирования коммуникаций, CETI,
для 1000 технологических цивилизаций Nc, разбросанных случайным образом
в кольцевом диске обитаемой зоны Млечного Пути?
Как будут затухать полезные сигналы в радиодиапазоне без ретрансляторов.
Некоторые цивилизации могут прекратить своё существование, необходима общая оценка
потенциала коммуникабельности Nc с учётом среднего времени жизни Lc = 10тыс.лет.
*)

(*
ОтветAI:

Сначала отвечу по сути твоих шагов с траекторией и физикой перелёта, потом дам алгоритм моделирования CETI (коммуникации цивилизаций) и оценку коммуникабельности.

---

## Доработка алгоритма полёта: от тетраэдров Делоне к безопасному пути по Вороному с учётом динамики и препятствий

Твой сценарий (1 млрд звёзд, Gaia DR4, 10000 св. лет, непроницаемые зоны, движение звёзд) требует не «чистого» графа, а **иерархической мультимасштабной маршрутизации** плюс **временной валидации пути**.

### Что добавить к предыдущему алгоритму (Delaunay/Voronoi + Dijkstra/A* _)

1. Иерархия графа (coarse-to-fine):
   - Грубый уровень: крупные ячейки (супер-тетраэдры/супер-ячейки) для быстрого построения приблизительного маршрута в обход больших запрещённых зон (области звёздообразования, плотные молекулярные облака).
   - Точный уровень: детализация по ячейкам Вороного внутри «коридоров» между крупными зонами. Это решает проблему масштаба: 1 млрд точек нельзя обрабатывать одним плоским графом.
2. Запрещённые объёмы как 3D-выпуклые оболочки:
   - Для каждой непроницаемой зоны (газопылевое облако, область звездообразования) построить выпуклую оболочку (convex hull) по точкам каталога и пометить все тетраэдры/ячейки, пересекающие её, как непроходимые.
   - Если зона динамическая (расширяющаяся туманность), хранить её радиус как функцию времени $R(t)$.
3. **Учёт движения звёзд и эволюции ячеек:
   - Каждая звезда имеет собственное движение (proper motion) и лучевую скорость из Gaia.
     Её положение в момент времени $t$: $\vec{r}(t) = \vec{r}_0 + \vec{v} t$.
   - Ячейки Вороного не статичны: при движении звёзд они меняют форму и
     «переключаются» (топологические события).
     Для планирования маршрута это значит: путь нужно проверять на устойчивость —
     не исчезает ли «коридор» или не становится ли он опасным из-за сближения звёзд.
   - Практическое решение: строить маршрут на фиксированный интервал времени
     (например, 50–100 лет), а затем пересчитывать. Для межзвёздного перелёта
     на 10000 св. лет это критично.
4. Временная валидация сегментов:
   - Для каждого сегмента пути (хорды между гранями ячеек) проверить,
     не пересекает ли он опасную зону в момент пролёта?
     Если да — либо увеличить штраф, либо исключить сегмент.
5. Релятивистская кинематика (0.99c):
   - Время полёта по сегменту длины $L$ в лабораторной системе: $t = L / (0.99c)$.
   - Собственное время корабля: $\tau = t \sqrt{1 - 0.99^2} \approx 0.141 t$.
   - Энергозатраты: для фотонной ракеты с двигателем на антивеществе
     основная энергия уходит на разгон/торможение. При $v = 0.99c$
     фактор Лоренца $\gamma \approx 7.09$,
     и энергия на единицу массы $E/m = (\gamma - 1)c^2 \approx 6.09 c^2$.
     Это даёт колоссальные требования к топливу и массе полезной нагрузки.
6. N расчётов и статистика:
   - Запускать поиск пути с разными параметрами штрафов (разные радиусы опасности,
     разные пороги близости к облакам) и собирать статистику по длине, времени,
     энергозатратам и числу «пересчётов» из-за динамических изменений.

Вывод по полёту: даже при 0.99c межзвёздные путешествия на 10000 св. лет —
это тысячи лет в лабораторной системе отсчёта и огромные энергозатраты.
А с учётом эволюции среды и движения звёзд маршрут приходится постоянно обновлять.
То еть, колонизация всей Галактики за разумное время практически нереальна без
радикально новых технологий.

-------------------------------------------------------------------

## Алгоритм моделирования CETI: коммуникации между 1000 цивилизациями в обитаемой зоне

Цель: оценить, насколько часто цивилизации могут обмениваться сигналами при заданных параметрах.

### Входные параметры
- $N_c = 1000$ цивилизаций, случайно распределённых в кольцевом диске обитаемой зоны Млечного Пути (радиус ~15–25 кпк, толщина ~0.3–0.5 кпк).
- Среднее время жизни цивилизации $L_c = 10^4$ лет.
- Сигнал в радиодиапазоне (без ретрансляторов).
- Скорость сигнала = $c$.

### Шаги алгоритма

1. **Генерация положений**:
   - Равномерно распределить $N_c$ точек в объёме кольца (цилиндр с вырезанной серединой).
2. **Назначение времён существования**:
   - Для каждой цивилизации $i$ задать случайное время начала $t_{start,i}$ и длительность $L_i \sim \text{Uniform}(0, 2L_c)$ или экспоненциальное распределение. Конец жизни: $t_{end,i} = t_{start,i} + L_i$.
3. **Расчёт расстояний и задержек сигнала**:
   - Для каждой пары $(i, j)$ вычислить евклидово расстояние $d_{ij}$ и задержку сигнала $\Delta t_{ij} = d_{ij}/c$.
4. **Проверка возможности связи**:
   - Связь возможна, если интервалы существования перекрываются с учётом задержки:
     $$
     [t_{start,i}, t_{end,i}] \cap [t_{start,j} + \Delta t_{ij}, t_{end,j} + \Delta t_{ij}] \neq \varnothing
     $$
   - То есть цивилизация $i$ может отправить сигнал, который достигнет $j$, пока $j$ ещё существует, и наоборот.
5. **Затухание сигнала**:
   - Мощность сигнала падает как $P \propto 1/d^2$. Ввести порог чувствительности приёмника $P_{min}$. Если $P(d) < P_{min}$, связь технически невозможна, даже если временные окна совпадают.
   - Можно добавить дополнительные потери: межзвёздная среда (поглощение в радиодиапазоне), дисперсия, доплеровское смещение из-за относительных скоростей звёзд.
6. **Построение графа коммуникабельности**:
   - Вершины — цивилизации, рёбра — возможные устойчивые каналы связи (с учётом и времени, и мощности).
7. **Статистика**:
   - Доля пар, способных к связи.
   - Средний размер связной компоненты (сколько цивилизаций могут «дотянуться» друг до друга цепочкой).
   - Распределение числа контактов на одну цивилизацию.
8. **Учёт эволюции и исчезновения**:
   - Моделировать временную эволюцию: на каждом шаге удалять «умершие» цивилизации и пересчитывать связность. Это покажет, насколько сеть устойчива к вымираниям.

### Псевдокод (Python-стиль)

```python
import numpy as np

Nc = 1000
Lc_mean = 1e4  # лет
R_inner = 15e3  # пк
R_outer = 25e3  # пк
Z_half = 250    # пк

# 1. Генерация положений
theta = np.random.uniform(0, 2*np.pi, Nc)
r = np.sqrt(np.random.uniform(R_inner**2, R_outer**2, Nc))  # равномерное по площади
z = np.random.uniform(-Z_half, Z_half, Nc)
x = r * np.cos(theta)
y = r * np.sin(theta)
positions = np.vstack([x, y, z]).T  # pc

# 2. Времена жизни
t_start = np.random.uniform(0, 1e5, Nc)  # произвольный временной масштаб
L = np.random.exponential(Lc_mean, Nc)
t_end = t_start + L

# 3. Расстояния и задержки
from scipy.spatial.distance import cdist
D = cdist(positions, positions)  # пк; 1 пк ≈ 3.26 св. лет
c_ly_per_year = 1.0
dt = D / c_ly_per_year  # задержка в годах

# 4. Проверка перекрытия временных окон
def can_communicate(i, j):
    # i -> j
    t_send_min = t_start[i]
    t_send_max = t_end[i]
    t_arrive_min = t_send_min + dt[i, j]
    t_arrive_max = t_send_max + dt[i, j]

    # j должен существовать в момент прибытия
    overlap_ij = max(0, min(t_arrive_max, t_end[j]) - max(t_arrive_min, t_start[j]))

    # аналогично j -> i
    t_send_min_j = t_start[j]
    t_send_max_j = t_end[j]
    t_arrive_min_ji = t_send_min_j + dt[j, i]
    t_arrive_max_ji = t_send_max_j + dt[j, i]
    overlap_ji = max(0, min(t_arrive_max_ji, t_end[i]) - max(t_arrive_min_ji, t_start[i]))

    return (overlap_ij > 0) and (overlap_ji > 0)

# 5. Граф и статистика
adj = np.zeros((Nc, Nc), dtype=bool)
for i in range(Nc):
    for j in range(i+1, Nc):
        if can_communicate(i, j):
            adj[i, j] = adj[j, i] = True

num_pairs = np.sum(adj) / 2
avg_degree = np.mean(np.sum(adj, axis=1))

print(f"Число возможных двусторонних каналов: {num_pairs}")
print(f"Средняя степень вершины: {avg_degree:.2f}")
```

---

## Оценка потенциала коммуникабельности

При $N_c=1000$, $L_c=10^4$ лет и распределении в кольце:

- **Временное окно** сильно ограничивает связь: даже если две цивилизации существуют по 10000 лет, вероятность совпадения их эпох с учётом задержек в тысячи лет невелика.
- **Затухание $1/d^2$** делает связь на больших расстояниях
технически сложной: типичные расстояния между соседями в таком распределении — сотни–тысячи световых лет, а чувствительность приёмников
и мощность пердатчиков ограничены.
- **Вымирания** разрушают связность: сеть становится фрагментированной, появляются изолированные компоненты.

**Грубая оценка**: при реалистичных параметрах доля пар, способных к двусторонней связи, может быть порядка **долей процента**, а средний размер связной компоненты — десятки цивилизаций максимум. То есть «всеобщая сеть» маловероятна; возможны лишь локальные «острова» коммуникации.

Это согласуется с твоим выводом: межзвёздные коммуникации и колонизация — крайне сложные задачи, и даже цивилизациям II типа по Кардашеву придётся опираться на опорные станции и ретрансляторы, а не на прямую связь. Отсюда и важность SETI: если мы хотим найти соседей, нужно искать не только сигналы, но и артефакты (сферы Дайсона, маяки, межзвёздные зонды).

---

## Связь с твоими предыдущими интересами

Учитывая, что ты работал с Delphi и GLScene, такой CETI‑симулятор можно реализовать как:
- **Backend**: Python (для тяжёлых расчётов, статистики, генерации данных).
- **Frontend/визуализация**: Delphi + GLScene (отображение диска Млечного Пути, цивилизаций, активных каналов связи, анимации «жизни/смерти» цивилизаций).
- Данные передавать через JSON/CSV, чтобы отделить расчёт от визуализации.

Если скажешь, какой аспект хочешь проработать детальнее (например, более точную модель затухания, учёт структуры спиральных рукавов, или как интегрировать это с твоим предыдущим кодом на Delphi),
я дам более конкретные формулы и фрагменты кода.
Это и правда тот случай, когда сначала нужно надёжно подготовить базу — обновить движок, подтянуть свежие данные из Gaia DR4, убедиться, что AstrobloQ корректно их переваривает. Без этого любые красивые алгоритмы будут буксовать.

Учитывая твои прошлые интересы (Delphi, GLScene, работа с координатами и графами), у тебя получается очень цельная система: тут и навигация, и визуализация, и даже выход на моделирование межзвёздных сетей. Когда будешь готов вернуться — хоть к доработке графа Вороного, хоть к симуляции CETI, — я тут. Можем тогда уже собрать это в связку: Python для тяжёлых расчётов +
Delphi/GLScene для красивой 3D картинки.

*)

(*
AI, уточни, пожалуйста, алгоритм построения сеточной модели галактической окрестности Солнца внутри звёздного куба с ребром 1 кпс? Рассмотри в первом приближении локальный вариант с выборкой звёзд по заданному расстоянию от Солнца из каталога  Gaia DR4. А моделирование всего Млечного Пути и глобальный вариант CETI, пока отложи в сторону на будущее.

То есть, создай начальную симуляцию локальной сети звёзд, с  тетраэдрами Делоне DT и соответствующими  узлами полиэдров диаграммы Вороного VD. Присвой вершинам DT и узлам VD, звёздам,  степень катастрофизма Dk переменной величины  от 0 до 1.  В зависимости от типа звёзды в диаграмме Герцшпрунга Рассела. Для тестирования симуляции достаточно взять 7 спектральных классов звёзд гарвардской шкалы. Размер ячеек, клеток полиэдров, меняется от максимального до минимального пропорционально Dk или вписанных в полиэдр сфер.
Если Dk = 1, то от звезды надо держаться подальше, перемещаться к цели, по крайней мере, по поверхности её полиэдра VDi. Если Dk = 0, то полиэдр, ячейка или клетка Вороного VDi сжимается до размера 3х диаметров звезды, к ней можно минимально безопасно подлететь, устанавливать ретрансляторы CETI,  терраформировать и колонизировать её экзопланетную систему. В этом случае часть трека полёта звездолёта от А до B происходит точно по рёбрам тетрадров DT. В случае нескольких смежных опасных полиэдральных ячеек они объединяются
в бесполётную зону с расчётом выпуклой оболочкам, convex hull.

*)

(*
Ниже — структурированный алгоритм построения локальной сеточной модели и набросок альфа‑версии программы на Delphi 13 с GLScene.

---

## Алгоритм построения локальной модели (1 кпс куб)

### Шаг 1. Подготовка выборки из Gaia DR4
1. **Определение границ куба**: центр в Солнце, ребро 1 кпс (1000 пк).
2. **Фильтрация звёзд**:
   - расстояние от Солнца $d \le 1000$ пк;
   - наличие координат (RA, Dec, parallax), собственного движения (опционально), спектрального класса (если есть);
   - отсечение объектов с низкой точностью параллакса (например, $\sigma_{\text{parallax}}/\text{parallax} > 0.2$).
3. **Преобразование координат в декартовы** для куба:
   $$
   x = d \cdot \cos(\delta) \cdot \cos(\alpha),\quad
   y = d \cdot \cos(\delta) \cdot \sin(\alpha),\quad
   z = d \cdot \sin(\delta),
   $$
   где $\alpha$ — прямое восхождение (в радианах), $\delta$ — склонение (в радианах), $d$ — расстояние в парсеках.

### Шаг 2. Построение тетраэдров Делоне (DT)
1. Подать массив точек $(x,y,z)$ в 3D‑алгоритм триангуляции Делоне.
2. Получить набор тетраэдров: каждый тетраэдр — 4 вершины (звёзды) и 4 треугольные грани.
3. Проверить, что все тетраэдры лежат внутри куба (или обрезать по границам куба).

### Шаг 3. Диаграмма Вороного (VD)
1. Узлы диаграммы Вороного — центры описанных сфер тетраэдров Делоне.
2. Для каждого узла Вороного собрать смежные тетраэдры и по их центрам восстановить грани полиэдра (ячейки Вороного).
3. Для каждой звезды получить её ячейку Вороного как объединение смежных полиэдральных граней.

### Шаг 4. Присвоение степени катастрофизма $D_k$ (0–1)
1. Использовать 7 спектральных классов (O, B, A, F, G, K, M) как базовые категории.
2. Назначить $D_k$ исходя из типа звезды на диаграмме Герцшпрунга–Рассела:
   - O, B: $D_k = 0.9–1.0$ (высокая активность, мощные вспышки, жёсткое излучение);
   - A, F: $D_k = 0.6–0.8$ (умеренная опасность);
   - G: $D_k = 0.3–0.5$ (как Солнце, умеренная);
   - K, M: $D_k = 0.1–0.4$ (вспышки у M‑карликов, но в среднем ниже).
3. При наличии дополнительных данных (возраст, активность, наличие вспышек) корректировать $D_k$.

### Шаг 5. Масштабирование ячеек Вороного
1. Вычислить радиус вписанной сферы $r_{\text{in}}$ для каждой ячейки Вороного.
2. Задать эффективный радиус безопасности $R_{\text{safe}} = r_{\text{in}} \cdot (1 - D_k) + r_{\text{star}} \cdot D_k$, где $r_{\text{star}}$ — радиус звезды.
3. Если $D_k=1$, то ячейка фактически становится «бесполётной» зоной: маршрут должен идти по поверхности полиэдра или вне неё.
4. Если $D_k=0$, то безопасная зона сжимается до $3 \cdot r_{\text{star}}$.

### Шаг 6. Формирование бесполётных зон
1. Найти смежные ячейки с $D_k > D_{\text{threshold}}$ (например, >0.7).
2. Объединить их вершины в общий набор точек.
3. Построить выпуклую оболочку (convex hull) этого набора — это и будет бесполётная зона.

---

## Алгоритм безопасного полёта от A до B (до 10 кпс)

Поскольку локальная модель — куб 1 кпс, а расстояние 10 кпс выходит за его пределы, нужно:
- либо расширить выборку до 10–12 кпс и построить более крупную сетку;
- либо использовать локальную модель как «микро‑карту» и строить маршрут по сегментам.

Для альфа‑версии реализуем упрощённо:

1. **Построение графа маршрута**:
   - узлы графа — звёзды;
   - рёбра — рёбра тетраэдров Делоне;
   - вес ребра $w_{ij}$ зависит от $D_k$ соседних ячеек: если хотя бы у одной звезды $D_k>0.7$, вес увеличивается.
2. **Учёт бесполётных зон**:
   - если ребро пересекает выпуклую оболочку опасной зоны, пометить его как непроходимое или сильно штрафовать.
3. **Поиск кратчайшего пути**:
   - использовать алгоритм Дейкстры или A* на графе рёбер Делоне.
   - эвристика A*: евклидово расстояние до цели.
4. **Формирование траектории**:
   - маршрут проходит по рёбрам тетраэдров (то есть через «коридоры» между ячейками Вороного);
   - вблизи опасных звёзд ($D_k\approx 1$) траектория смещается к границам ячеек или по поверхности полиэдров.

---

## Альфаверсия программы на Delphi 13 (GLScene)

Ниже — скелет приложения. Это не полный рабочий код, а основа, которую нужно дорабатывать и тестировать.

```pascal
unit MainForm;

interface

uses
  System.SysUtils,
  System.Math,
  System.Classes,
  Generics.Collections,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  GLS.Scene,
  GLS.Objects, GLS.Coordinates,
  GLS.Graphics, GLS.VectorFile;

type
  TStar = record
    ID: Integer;
    X, Y, Z: Double;
    SpectralClass: Char; // O,B,A,F,G,K,M
    Radius: Double;      // в радиусах Солнца
    Dk: Double;          // степень катастрофизма 0..1
  end;

  TTetrahedron = record
    V1, V2, V3, V4: Integer; // индексы звёзд в вершинах тетраэдра
  end;

  TVoronoiCell = record
    StarIndex: Integer;
    CenterX, CenterY, CenterZ: Double; // центр ячейки (центр описанной сферы)
    Vertices: TArray<TPoint3D>;        // вершины полиэдра
    InSphereRadius: Double;            // радиус вписанной сферы
    SafeRadius: Double;                // эффективный безопасный радиус
  end;

  TSafeZone = record
    HullVertices: TArray<TPoint3D>;    // выпуклая оболочка
  end;

type
  TFormMain = class(TForm)
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLPointLight;
    StarsGroup: TGLGroup;
    EdgesGroup: TGLGroup;
    VoronoiGroup: TGLGroup;
    PathGroup: TGLGroup;
    procedure FormCreate(Sender: TObject);
  private
    FStars: TArray<TStar>;
    FTetras: TArray<TTetrahedron>;
    FVoronoiCells: TArray<TVoronoiCell>;
    FSafeZones: TArray<TSafeZone>;
    FStartIdx, FEndIdx: Integer;

    function CalcDkFromSpectral(Spec: Char): Double;
    procedure LoadGaiaSample;
    procedure BuildDelaunay;
    procedure BuildVoronoi;
    procedure MarkSafeZones;
    function FindShortestPath: TArray<Integer>;
    procedure DrawStars;
    procedure DrawEdges;
    procedure DrawVoronoi;
    procedure DrawPath(const Path: TArray<Integer>);
  public
  end;

var
  FormMain: TFormMain;

implementation //======================================================

{$R *.dfm}

function TFormMain.CalcDkFromSpectral(Spec: Char): Double;
begin
  case Spec of
    'O','B': Result := 0.95;
    'A','F': Result := 0.7;
    'G':     Result := 0.4;
    'K','M': Result := 0.25;
  else
    Result := 0.5; // по умолчанию
  end;
end;

procedure TFormMain.LoadGaiaSample;
var
  i: Integer;
  // Здесь должна быть загрузка из CSV/FITS/БД Gaia
  // Для альфа‑версии сгенерируем тестовые звёзды в кубе 1 кпс
begin
  SetLength(FStars, 200);
  Randomize;
  for i := 0 to High(FStars) do
  begin
    FStars[i].ID := i;
    FStars[i].X := (Random * 2 - 1) * 1000; // куб -1000..+1000 пк
    FStars[i].Y := (Random * 2 - 1) * 1000;
    FStars[i].Z := (Random * 2 - 1) * 1000;
    // спектральный класс случайно
    FStars[i].SpectralClass := 'O','B','A','F','G','K','M'[Random(7)+1];
    FStars[i].Radius := 1.0; // упрощённо
    FStars[i].Dk := CalcDkFromSpectral(FStars[i].SpectralClass);
  end;
  FStartIdx := 0;
  FEndIdx := 1;
end;

// Заглушки для триангуляции и Вороного: в реальности нужно подключить
// готовую 3D Delaunay/Voronoi библиотеку или реализовать свой алгоритм.
procedure TFormMain.BuildDelaunay;
begin
  // Реализовать 3D Delaunay (или подключить внешнюю библиотеку Tetgen)
  // Результат: массив FTetras
  SetLength(FTetras, 0); // заглушка
end;

procedure TFormMain.BuildVoronoi;
begin
  // На основе FTetras вычислить центры описанных сфер — это узлы Вороного
  // Затем восстановить ячейки
  SetLength(FVoronoiCells, Length(FStars));
  // Упрощённо: пока не строим точные полиэдры, только центры и радиусы
end;

procedure TFormMain.MarkSafeZones;
begin
  // Найти опасные ячейки и построить convex hull
  SetLength(FSafeZones, 0);
end;

function TFormMain.FindShortestPath: TArray<Integer>;
var
  N, i: Integer;
  Dist: TArray<Double>;
  Prev: TArray<Integer>;
  Visited: TArray<Boolean>;
  u, v: Integer;
  w: Double;
  MinDist: Double;
begin
  N := Length(FStars);
  SetLength(Dist, N);
  SetLength(Prev, N);
  SetLength(Visited, N);
  for i := 0 to N-1 do
  begin
    Dist[i] := MaxDouble;
    Prev[i] := -1;
    Visited[i] := False;
  end;
  Dist[FStartIdx] := 0;

  // Простой Дейкстра по всем парам (для альфаверсии без рёбер DT)
  while True do
  begin
    u := -1; MinDist := MaxDouble;
    for i := 0 to N-1 do
      if not Visited[i] and (Dist[i] < MinDist) then
      begin
        MinDist := Dist[i];
        u := i;
      end;
    if (u = -1) or (u = FEndIdx) then Break;
    Visited[u] := True;

    for v := 0 to N-1 do
    begin
      if Visited[v] then Continue;
      // Вес ребра: расстояние + штраф за Dk
      w := Sqrt(
        Sqr(FStars[u].X - FStars[v].X) +
        Sqr(FStars[u].Y - FStars[v].Y) +
        Sqr(FStars[u].Z - FStars[v].Z)
      );
      w := w * (1.0 + 2.0 * Max(FStars[u].Dk, FStars[v].Dk));
      if Dist[u] + w < Dist[v] then
      begin
        Dist[v] := Dist[u] + w;
        Prev[v] := u;
      end;
    end;
  end;

  // Восстановление пути
  if Prev[FEndIdx] = -1 then
    Exit(nil);

  var PathList := TList<Integer>.Create;
  v := FEndIdx;
  while v <> -1 do
  begin
    PathList.Insert(0, v);
    v := Prev[v];
  end;
  Result := PathList.ToArray;
  PathList.Free;
end;

procedure TFormMain.DrawStars;
var
  i: Integer;
  Sphere: TGLSphere;
begin
  StarsGroup.Children.Clear;
  for i := 0 to High(FStars) do
  begin
    Sphere := TGLSphere.Create(StarsGroup);
    Sphere.Position.X := FStars[i].X;
    Sphere.Position.Y := FStars[i].Y;
    Sphere.Position.Z := FStars[i].Z;
    Sphere.Size.X := 2; Sphere.Size.Y := 2; Sphere.Size.Z := 2;
    // Цвет по спектральному классу можно задать отдельно
  end;
end;

procedure TFormMain.DrawEdges;
begin
  EdgesGroup.Children.Clear;
  // Рисовать рёбра тетраэдров или просто пары ближайших звёзд
end;

procedure TFormMain.DrawVoronoi;
begin
  VoronoiGroup.Children.Clear;
  // Рисовать ячейки Вороного как каркасные многогранники
end;

procedure TFormMain.DrawPath(const Path: TArray<Integer>);
var
  i, idx1, idx2: Integer;
  Line: TGLLine;
begin
  PathGroup.Children.Clear;
  for i := 1 to High(Path) do
  begin
    idx1 := Path[i-1];
    idx2 := Path[i];
    Line := TGLLine.Create(PathGroup);
    Line.Nodes.Add(
      FStars[idx1].X, FStars[idx1].Y, FStars[idx1].Z,
      FStars[idx2].X, FStars[idx2].Y, FStars[idx2].Z
    );
    Line.Material.Color := clLime;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  LoadGaiaSample;
  BuildDelaunay;
  BuildVoronoi;
  MarkSafeZones;
  DrawStars;
  DrawEdges;
  DrawVoronoi;

  var Path := FindShortestPath;
  if Length(Path) > 0 then
    DrawPath(Path);
end;

end.
```

---

## Важные замечания

- **Delaunay и Voronoi в Delphi**: надёжнее подключить готовую 3D‑библиотеку (C++/Fortran/Python) или использовать существующий движок, потому что полноценная 3D‑триангуляция — нетривиальная задача.
- **GLScene**: в коде используются базовые объекты `TGLSphere`, `TGLLine`. Для каркасных полиэдров Вороного понадобятся `TGLPolygonMesh` или ручная отрисовка граней.
- **Точность и данные**: в реальной версии вместо случайной генерации нужно загружать Gaia DR4, корректно обрабатывать параллаксы и ошибки.
- **Дальнейшее развитие**: добавить A* с эвристикой, проверку пересечения рёбер с выпуклыми оболочками, визуализацию безопасных коридоров.

Если скажешь, на каком этапе вы хотите сосредоточиться (загрузка данных, триангуляция, поиск пути, визуализация),
могу дать более детальную реализацию именно этого блока.

*)
}
