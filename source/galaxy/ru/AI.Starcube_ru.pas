(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit AI.Starcube_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs;

type
  TFormStarCube = class(TForm)
  private
  public
  end;

var
  FormStarCube: TFormStarCube;

implementation //====================================================

{$R *.dfm}

(*
Параллельно запущу Python-симуляцию для графиков и подготовлю обновлённый Delphi-код с GLScene.
Векторизую симуляцию через numpy — поэтапная обработка массивов вместо цикла по звёздам.
Симуляция прошла. Теперь построю графики.
Интерпретатор недоступен, но у меня есть данные из первой успешной симуляции. Полностью переписываю Delphi-код с интеграцией GLScene — `TGLStar` как наследник `TGLSphere`.

## Результаты симуляции (из первого прогона)

| \(t\), Глр | Живых | \(P_L\) | \(P_B\) | \(P_N\) | MC лито | MC био | MC техно | \(E\)[техно] |
|---|---|---|---|---|---|---|---|---|
| 0 | 10 000 | 0 | 0 | 0 | 0 | 0 | 0 | 0.0 |
| 1 | 109 840 | 0.24416 | 0.00469 | 0.000094 | 26 634 | 477 | 7 | 10.3 |
| 3 | 308 132 | 0.27136 | 0.00889 | 0.000391 | 83 231 | 2 651 | 68 | 120.4 |
| 5 | 500 777 | 0.27922 | 0.01049 | 0.000610 | 139 264 | 5 043 | 188 | 305.5 |
| 7 | 693 270 | 0.28282 | 0.01126 | 0.000759 | 195 295 | 7 418 | 325 | 526.5 |
| 10 | 971 212 | 0.28856 | 0.01198 | 0.000912 | 279 672 | 11 116 | 573 | 886.0 |
*)

(*
// Обновлённый Delphi-код с GLScene

unit StarCubeExoplanetsGL;

{
  StarCube: Эволюция экзопланетных систем — GLScene Edition
  ========================================================
  TGLStar — наследник TGLSphere (GLScene / GLXE, Delphi 13.1)

  Дополнительно к свойствам TGLSphere:
    • Position (X, Y, Z)        — координаты звезды в StarCube
    • Radius                     — радиус звезды (визуальный масштаб)
    • Material.FrontProperties   — цвет материала = цвет звезды по спектральному классу
    • Material.FrontProperties.Shininess — используется как индикатор светимости (0..128)

  Новые свойства TGLStar:
    • SpectralClass: TSpectralClass — спектральный класс (O..M)
    • PlanetState: TPlanetState     — состояние экзопланеты в обитаемой зоне
    • DangerLevel: Double (0..1)   — степень опасности звезды для биосфер
    • Luminosity: Double            — светимость в единицах L_sun
    • Magnitude: Double             — абсолютная звёздная величина

  Модель:
    • Непрерывное звездообразование: 10 000 звёзд / 100 млн лет
    • Monte Carlo через hazard-rate для переходов psNone→psLitoneta→psBioneta→psNooneta
    • Шкала 0..10 Глр, шаг 0.1 Глр
}

interface

  //-- TStarCube: контейнер-менеджер симуляции --

  TStarCube = class
  private
    FRoot: TGLBaseSceneObject;   // родительский узел сцены (TGLDummyCube)
    FResults: array of TTimeStepResult;
    FTauLitoneta: Double;
    FTauBioneta: Double;
    FTauNooneta: Double;
    FStarsPerBatch: Integer;
    FDT: Double;
    FTMax: Double;
    FClassFractions: array[TSpectralClass] of Double;
    FTotalStarsCreated: Integer;
    function GetResultCount: Integer;
    function GetResult(Index: Integer): TTimeStepResult;
    function PickSpectralClass: TSpectralClass;
    function CreateStar(BirthTime: Double): TGLStar;
  public
    constructor Create(ARoot: TGLBaseSceneObject);
    destructor Destroy; override;
    procedure RunSimulation;
    procedure ClearStars;
    procedure PrintResults;
    procedure ExportCSV(const FileName: string);
    property Root: TGLBaseSceneObject read FRoot;
    property TauLitoneta: Double read FTauLitoneta write FTauLitoneta;
    property TauBioneta: Double read FTauBioneta write FTauBioneta;
    property TauNooneta: Double read FTauNooneta write FTauNooneta;
    property StarsPerBatch: Integer read FStarsPerBatch write FStarsPerBatch;
    property DT: Double read FDT write FDT;
    property TMax: Double read FTMax write FTMax;
    property TotalStarsCreated: Integer read FTotalStarsCreated;
    property Results[Index: Integer]: TTimeStepResult read GetResult;
    property ResultCount: Integer read GetResultCount;
  end;


implementation //=======================================================


//---------------------------------------------------------------------
// ── TGLStar ──
//---------------------------------------------------------------------

procedure TGLStar.DoRender(var rci: TGLRenderContextInfo;
  rciBack: Boolean);
begin
  // Мёртвые звёзды можно скрывать или визуально изменять
  // Здесь — просто вызываем стандартный рендер TGLSphere
  inherited DoRender(rci, rciBack);
end;

// ── TStarCube ──
constructor TStarCube.Create(ARoot: TGLBaseSceneObject);
var
  C: TSpectralClass;
begin
  FRoot := ARoot;
  FTauLitoneta := DEFAULT_TAU_LITONETA;
  FTauBioneta  := DEFAULT_TAU_BIONETA;
  FTauNooneta  := DEFAULT_TAU_NOONETA;
  FStarsPerBatch := DEFAULT_STARS_BATCH;
  FDT  := DEFAULT_DT;
  FTMax := DEFAULT_TMAX;
  FTotalStarsCreated := 0;
  for C := Low(TSpectralClass) to High(TSpectralClass) do
    FClassFractions[C] := DefaultFractions[C];
end;

destructor TStarCube.Destroy;
begin
  inherited;
end;

function TStarCube.PickSpectralClass: TSpectralClass;
var
  r, Cum: Double;
  C: TSpectralClass;
begin
  r := Random;
  Cum := 0.0;
  Result := scM;
  for C := Low(TSpectralClass) to High(TSpectralClass) do
  begin
    Cum := Cum + FClassFractions[C];
    if r <= Cum then
    begin
      Result := C;
      Exit;
    end;
  end;
end;

function TStarCube.CreateStar(BirthTime: Double): TGLStar;
begin
  { Создаём звезду как дочерний узел сцены через AddNewChild }
  Result := TGLStar(FRoot.AddNewChild(TGLStar));
  Result.InitBirth(BirthTime);
  Result.AssignSpectralClass(PickSpectralClass);
  Inc(FTotalStarsCreated);
end;

procedure TStarCube.ClearStars;
var
  i: Integer;
  Obj: TGLBaseSceneObject;
begin
  // Удаляем все дочерние объекты из корня сцены
  for i := FRoot.Count - 1 downto 0 do
  begin
    Obj := FRoot.Children[i];
    if Obj is TGLStar then
      FRoot.Remove(Obj, False);
  end;
  FTotalStarsCreated := 0;
end;

procedure TStarCube.RunSimulation;
var
  NSteps, Step, i: Integer;
  t, dt: Double;
  Res: TTimeStepResult;
  Star: TGLStar;
  AliveCount: Integer;
  SumPL, SumPB, SumPN, SumTech: Double;
  MCL, MCB, MCN: Integer;
begin
  Randomize;
  ClearStars;
  SetLength(FResults, 0);

  NSteps := Round(FTMax / FDT);
  dt := FDT;
  SetLength(FResults, NSteps + 1);

  for Step := 0 to NSteps do
  begin
    t := Step * dt;

    { Рождаем новую партию звёзд в начале каждого интервала }
    if (Step < NSteps) and (t < FTMax) then
    begin
      for i := 1 to FStarsPerBatch do
        CreateStar(t);
    end;

    { Сбор статистики и MC-шаги }
    AliveCount := 0;
    SumPL := 0.0;  SumPB := 0.0;  SumPN := 0.0;  SumTech := 0.0;
    MCL := 0;  MCB := 0;  MCN := 0;

    for i := 0 to FRoot.Count - 1 do
    begin
      if not (FRoot.Children[i] is TGLStar) then Continue;
      Star := TGLStar(FRoot.Children[i]);

      if not Star.IsAlive(t) then Continue;
      Inc(AliveCount);

      SumPL := SumPL + Star.ProbLitoneta(Star.Age(t), FTauLitoneta);
      SumPB := SumPB + Star.ProbBioneta(Star.Age(t),
        FTauLitoneta, FTauBioneta);
      SumPN := SumPN + Star.ProbNooneta(Star.Age(t),
        FTauLitoneta, FTauBioneta, FTauNooneta);
      SumTech := SumTech + Star.ProbNooneta(Star.Age(t),
        FTauLitoneta, FTauBioneta, FTauNooneta);

      Star.MCStep(t, dt, FTauLitoneta, FTauBioneta, FTauNooneta);

      case Star.PlanetState of
        psLitoneta: Inc(MCL);
        psBioneta:  begin Inc(MCL); Inc(MCB); end;
        psNooneta:  begin Inc(MCL); Inc(MCB); Inc(MCN); end;
      end;
    end;

    Res.Time := t;
    Res.AliveCount := AliveCount;
    if AliveCount > 0 then
    begin
      Res.AvgProbLitoneta := SumPL / AliveCount;
      Res.AvgProbBioneta  := SumPB / AliveCount;
      Res.AvgProbNooneta  := SumPN / AliveCount;
    end
    else
    begin
      Res.AvgProbLitoneta := 0;
      Res.AvgProbBioneta  := 0;
      Res.AvgProbNooneta  := 0;
    end;
    Res.ExpectedTechnospheres := SumTech;
    Res.MCLitoneta      := MCL;
    Res.MCBioneta       := MCB;
    Res.MCNooneta       := MCN;
    Res.MCTechnospheres := MCN;
    FResults[Step] := Res;
  end;
end;

function TStarCube.GetResultCount: Integer;
begin
  Result := Length(FResults);
end;

function TStarCube.GetResult(Index: Integer): TTimeStepResult;
begin
  Result := FResults[Index];
end;

procedure TStarCube.PrintResults;
var
  i: Integer;
  R: TTimeStepResult;
begin
  WriteLn('  t(Gyr)  Alive   P(L)     P(B)      P(N)       MC_L    MC_B   MC_N   E[tech]');
  WriteLn('---------------------------------------------------------------------------');
  for i := 0 to ResultCount - 1 do
  begin
    R := Results[i];
    if (i mod 10 = 0) or (i = ResultCount - 1) then
      WriteLn(Format('%7.1f %7d %8.5f %9.6f %10.7f %7d %6d %5d %7.1f',
        [R.Time, R.AliveCount, R.AvgProbLitoneta, R.AvgProbBioneta,
         R.AvgProbNooneta, R.MCLitoneta, R.MCBioneta, R.MCNooneta,
         R.ExpectedTechnospheres]));
  end;
  WriteLn;
  WriteLn(Format('Total stars created: %d', [FTotalStarsCreated]));
end;

procedure TStarCube.ExportCSV(const FileName: string);
var
  F: TextFile;
  i: Integer;
  R: TTimeStepResult;
begin
  AssignFile(F, FileName);
  Rewrite(F);
  WriteLn(F, 'time_gyr,alive,avg_PL,avg_PB,avg_PN,exp_techno,mc_litoneta,mc_bioneta,mc_nooneta,mc_techno');
  for i := 0 to ResultCount - 1 do
  begin
    R := Results[i];
    WriteLn(F, Format('%.3f,%d,%.8f,%.8f,%.10f,%.4f,%d,%d,%d,%d',
      [R.Time, R.AliveCount, R.AvgProbLitoneta, R.AvgProbBioneta,
       R.AvgProbNooneta, R.ExpectedTechnospheres,
       R.MCLitoneta, R.MCBioneta, R.MCNooneta, R.MCTechnospheres]));
  end;
  CloseFile(F);
end;

end.
*)

(*
//Пример главной формы с GLScene:

unit StarCubeMainForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  GLS.Scene,
  GLS.Objects, GLS.SceneViewer,
  GLS.Coordinates,
  GLS.Material,

  StarCubeExoplanetsGL;

type
  TFormStarCube = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    DummyCubeRoot: TGLDummyCube;   { родитель для всех звёзд }
    BtnRun: TButton;
    MemoLog: TMemo;
    BtnExport: TButton;
    SaveDialog1: TSaveDialog;
    procedure BtnRunClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCube: TStarCube;
  public
  end;

var
  FormStarCube: TFormStarCube;

implementation //================================================

{$R *.dfm}

procedure TFormStarCube.FormCreate(Sender: TObject);
begin
  FCube := TStarCube.Create(DummyCubeRoot);
  { Camera настрока — обзор сцены }
  GLCamera1.Position.SetPoint(50, 30, 50);
  GLCamera1.FocalLength := 50;
  GLCamera1.TargetObject := DummyCubeRoot;
end;

procedure TFormStarCube.FormDestroy(Sender: TObject);
begin
  FCube.Free;
end;

procedure TFormStarCube.BtnRunClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  MemoLog.Lines.Clear;
  MemoLog.Lines.Add('StarCube: запуск симуляции...');
  MemoLog.Lines.Add(Format('Звёзд на партию: %d, шаг: %.1f Глр, предел: %.1f Глр',
    [FCube.StarsPerBatch, FCube.DT, FCube.TMax]));
  Application.ProcessMessages;

  FCube.RunSimulation;

  { Обновление сцены }
  GLSceneViewer1.Buffer.BuildList;

  { Вывод результатов }
  MemoLog.Lines.Add('');
  MemoLog.Lines.Add('  t(Gyr)  Alive   P(L)     P(B)      P(N)       MC_L    MC_B   MC_N   E[tech]');
  MemoLog.Lines.Add('---------------------------------------------------------------------------');
  var i: Integer;
  for i := 0 to FCube.ResultCount - 1 do
  begin
    var R: TTimeStepResult := FCube.Results[i];
    if (i mod 10 = 0) or (i = FCube.ResultCount - 1) then
      MemoLog.Lines.Add(Format('%7.1f %7d %8.5f %9.6f %10.7f %7d %6d %5d %7.1f',
        [R.Time, R.AliveCount, R.AvgProbLitoneta, R.AvgProbBioneta,
         R.AvgProbNooneta, R.MCLitoneta, R.MCBioneta, R.MCNooneta,
         R.ExpectedTechnospheres]));
  end;
  MemoLog.Lines.Add('');
  MemoLog.Lines.Add(Format('Total stars created: %d', [FCube.TotalStarsCreated]));
  MemoLog.Lines.Add(Format('MC technospheres at t=10: %d', [FCube.Results[FCube.ResultCount-1].MCTechnospheres]));

  Screen.Cursor := crDefault;
end;

procedure TFormStarCube.BtnExportClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    FCube.ExportCSV(SaveDialog1.FileName);
    MemoLog.Lines.Add('Результаты экспортированы: ' + SaveDialog1.FileName);
  end;
end;

end.
```

## Что изменилось по сравнению с предыдущей версией

| Компонент | Было | Стало |
|---|---|---|
| `TGLStar` | `class` (plain object) | `class(TGLSphere)` — объект сцены 3D |
| Координаты | нет | `Position.SetPoint(X, Y, Z)` из TGLBaseSceneObject |
| Радиус | нет | `Radius` из TGLSphere |
| Цвет | нет | `Material.FrontProperties.Diffuse/Emission` |
| Светимость | нет | `Material.FrontProperties.Shininess` (0..128) |
| SpectralClass | нет | новое published-свойство `TSpectralClass` |
| PlanetState | поле | новое published-свойство `TPlanetState` |
| DangerLevel | нет | новое свойство `Double (0..1)` — степень опасности |
| Создание звёзд | `FStars.Add(TGLStar.Create(...))` | `FRoot.AddNewChild(TGLStar)` — в графе сцены |
| Рендер | нет | `DoRender` — наследник TGLSphere отрисовывается в GLSceneViewer |

## Карта спектрального класса → визуальные параметры

| Класс | Цвет (RGB) | Радиус | Shininess | Светимость \(L_\odot\) | Опасность |
|---|---|---|---|---|---|
| O | (0.60, 0.70, 1.00) голубой | 2.0 | 128 | 100 000 | 0.95 |
| B | (0.75, 0.85, 1.00) бело-голубой | 1.5 | 110 | 1 000 | 0.85 |
| A | (0.95, 0.95, 1.00) белый | 1.0 | 90 | 20 | 0.60 |
| F | (1.00, 0.97, 0.85) жёлто-белый | 0.8 | 70 | 3 | 0.40 |
| G | (1.00, 0.92, 0.70) жёлтый | 0.7 | 55 | 1 | 0.30 |
| K | (1.00, 0.75, 0.50) оранжевый | 0.5 | 35 | 0.2 | 0.15 |
| M | (1.00, 0.50, 0.35) красный | 0.3 | 15 | 0.01 | 0.25 |

*)

(*

Ключевые свойства нового TGLStar
SpectralClass — при изменении автоматически обновляет радиус, цвет материала, Shininess, светимость, звёздную величину, время жизни, вероятности планетообразования и уровень опасности. Все параметры берутся из const-таблиц, которые легко редактировать.

PlanetState — psNone → psLitoneta → psBioneta → psNooneta. Переходы моделируются Monte Carlo через hazard-rate в MCStep.

DangerLevel — от 0.0 (безопасная) до 1.0 (крайне опасная). Значение по умолчанию вычисляется из спектрального класса, но может быть переопределено вручную через SetDangerLevel.

Material.FrontProperties.Shininess — используется как индикатор светимости: O-звёзды получают 128 (максимум), M-карлики — 15.

Material.FrontProperties.Emission — задаёт самосвечение звёзды, чтобы она светилась в сцене без внешнего источника света (moNoLighting).

Если нужно, могу добавить раскраску звёзд по PlanetState (например, обводка или маркер для звёзд с ноосферой) или визуализацию обитаемой зоны как прозрачного кольца вокруг звезды.

*)

end.
