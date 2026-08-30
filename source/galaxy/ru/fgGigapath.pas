unit fgGigapath;

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
  Stage.Keyboard, Vcl.StdCtrls;

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

  TForm1 = class(TForm)
 //   BtnGenerate: TButton;
 //   BtnFindPath: TButton;
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
  Form1: TForm1;

implementation  //======================================================

{$R *.dfm}

//=====================================================================
// TStarNode
//=====================================================================
constructor TStarNode.Create(APos: TGSVector; ASpec: TSpectralClass);
begin
  inherited Create;
  Position := APos;
  Spectral := ASpec;
  Connections := TList<TStarNode>.Create;
end;

destructor TStarNode.Destroy;
begin
  Connections.Free;
  inherited;
end;

//=====================================================================
procedure TForm1.FormCreate(Sender: TObject);
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

function TForm1.CalculateDK(Spec: TSpectralClass): Single;
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

//=====================================================================
// Генерация тестовой выборки "вокруг" Солнца
//=====================================================================
procedure TForm1.BtnGenerateClick(Sender: TObject);
var
  i: Integer;
  Pos: TGSVector;
  Spec: TSpectralClass;
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

    Spec := TSpectralClass(Random(7));
    Node := TStarNode.Create(Pos, Spec);
    Node.DK := CalculateDK(Spec);

    if Node.DK > 0.8 then
      Node.IsHazard := True
    else
      Node.IsHazard := False;

    Stars.Add(Node);

    // Отрисовка точки
    // Визуализация узла VD/DT
    with StarPoints.Vertices.Add do
    begin
  //    AsAffineVector := Pos;
      Point := Pos;
      Color.Red := 1.0 - Node.DK; // Зеленые - безопасно, Красные - опасно
      Color.Green := Node.DK;
      Color.Blue := 0.0;
      Scale.X := 20; // Размер маркера
    end;
  end;

  BuildTopology;
  Caption := 'Локальная модель окрестности Солнца | Звезд: ' + IntToStr(Stars.Count);
end;

//=====================================================================
// Построение графа соседства (эмуляция DT)
//=====================================================================
procedure TForm1.BuildTopology;
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
    finally
      Sorted.Free;
    end;
  end;
end;

// Поиск пути A*
procedure TForm1.BtnFindPathClick(Sender: TObject);
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

function TForm1.Heuristic(A, B: TStarNode): Single;
begin
  // Прямая линия без учета препятствий (оптимистичная оценка)
  Result := VectorDistance(A.Position, B.Position) * 1.0;
end;

function TForm1.ReconstructPath(Current: TStarNode): TArray<TGLVector>;
var
  TotalPath: TList<TGLVector>;
begin
  TotalPath := TList<TGLVector>.Create;
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

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime, newTime: Double);
begin
  // Обработка вращения сцены мышью можно добавить здесь через GLUserInterface
end;

end.

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

- **Количество вершин критично.** Задача коммивояжёра NP‑трудная: при $n$ вершинах число возможных маршрутов растёт как $(n-1)!/2$. Даже для 20 звёзд это уже миллионы вариантов, для 30+ точный перебор невозможен. Для сотен и тысяч звёзд используют эвристики (2‑opt, алгоритм ближайшего соседа, муравьиный алгоритм, солверы типа Concorde с релаксациями и т. п.).
- **Смысл маршрута условный.** В космосе нет «дорог», и «оптимальный путь» будет чисто математическим: минимальная сумма расстояний между выбранными звёздами.
- **Выборка сильно влияет на результат.** Если взять все G‑карлики в радиусе 100 пк, получится несколько сотен звёзд; если в радиусе 500 пк — тысячи. Для TSP лучше начинать с небольшой выборки (например, 20–50 звёзд), чтобы можно было получить точное решение и проверить метод.

---

## Практические инструменты

- **Данные:** каталог Gaia (через Astropy + astroquery), Hipparcos.
- **Обработка:** Python + Astropy (координаты, расстояния), Pandas (фильтрация по спектральному классу).
- **Граф и TSP:** NetworkX (построение графа), OR‑Tools / Google OR‑Tools (TSP‑солвер), либо специализированные солверы (Concorde).
- **Визуализация 3D:** Matplotlib (mplot3d), Plotly, PyVista.

Пример логики на Python (упрощённо):

```python
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

Если брать действительно «все» G‑карлики, видимых на небе, их будет очень много (десятки тысяч и более), и TSP в классическом виде на таком графе нереализуем. На практике делают так:

- ограничивают выборку по расстоянию (например, до 200–300 пк);
- либо берут подвыборку (случайно или по плотности, чтобы покрыть разные области неба);
- либо решают не полный TSP, а его варианты (например, маршрут через часть точек, кластеризацию + TSP внутри кластеров и т. д.).

Если скажете, какой масштаб задачи вы хотите (сколько примерно звёзд, нужна ли точность или хватит эвристики, что важнее — минимальная длина или покрытие разных областей неба), подскажу, какую стратегию и какие инструменты лучше выбрать.
*)
