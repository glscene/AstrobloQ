(*****************************************************************************
                           AstrobloQ System
******************************************************************************)
unit fgStarcube_ru;
(*
## Соответствие планам (GLScene -> AstrobloQ -> HYG 4.0 -> Gaia DR4)
- TGLStar наследуется от `TGLSphere`, поэтому он сразу корректно работает с `TGLScene` и всеми привычными механизмами сцены (трансформация, материалы, отрисовка).
- AstrobloQ: объект хранит и визуализацию, и все астрофизические параметры — 
  можно напрямую использовать в системе моделирования.
- Gaia DR4: сравнение пока идёт через HYG 4.0 как промежуточный этап валидации;
  после подгонки параметров можно добавить модуль сравнения по каталогу Gaia.
- Поиск пути: финальный массив `TGLStars` содержит координаты и состояния всех объектов — 
  идеально для построения графа и применения алгоритма поиска пути по тетраэдрам Делоне.

Важные моменты генерации звёзд! Подготовка к сравнению с Gaia DR4.
Функция CompareWithHYG — это первый уровень валидации по HYG 4.0 (ближний объём).
После подгонки параметров по HYG можно будет сделать отдельный модуль
сравнения по Gaia DR4 (по цвету/температуре, если спектральных классов нет).

Поиск пути.
Финальный массив TGLStars содержит координаты и состояния всех объектов.
Из него можно строить граф для алгоритма поиска пути по тетраэдрам Делоне
(в том числе исключая чёрные дыры/пульсары или задавая им особые веса).
Наследование: TGLStar от GLSphere.
Логика симуляции, свёртки, потомков и сравнения с HYG.

## Как подключить и использовать

1. На форме размещается `GLScene1: TGLScene`.
2. В uses модуля формы подключаются основные юниты:
   uses
     Stage.BaseClasses, GLS.Scene, GLS.Objects, GLS.Materials;
   ```
3. Запуск симуляции:
   var
     StarsCollection: TGLStars;
     Fit: Double;
   begin
     StarsCollection := TGLStars.Create;
     try
       // тест популяция 2000 звёзд
       StarsCollection.GenerateInitialPopulation(GLScene1, 2000);
       StarsCollection.RunSimulation(GLScene1);
       StarsCollection.CompareWithHYG(HYGFile, Fit);
     finally
       StarsCollection.Free;
     end;
   end;
---
*)

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  Stage.BaseClasses,
  Stage.Coordinates,
  Stage.Color,

  GLS.Scene,
  GLS.Objects,
  GLS.Material,
  GLS.RenderContextInfo,
  GLS.SceneViewer, GLS.Cadencer;

type
  TSpectralClass = (scO, scB, scA, scF, scG, scK, scM);
  TStarState = (ssAlive, ssBlackHole, ssPulsar, ssWhiteDwarf, ssNova);


 TGLStar = class(TGLSphere)
  private
    FSpectrality: TSpectralClass;
    FMagnitude: Double;
    FLongevity: Double;   // среднее время жизни в млрд лет
    FHowOld: Double;      // текущий возраст в млрд лет
    FCurrentState: TStarState;
    FDescendantType: TStarState;
  public
    constructor Create(AOwner: TComponent); override;
    property Spectrality: TSpectralClass read FSpectrality write FSpectrality;
    property Magnitude: Double read FMagnitude write FMagnitude;
    property Longevity: Double read FLongevity write FLongevity;
    property HowOld: Double read FHowOld write FHowOld;
    property CurrentState: TStarState read FCurrentState write FCurrentState;
    property DescendantType: TStarState read FDescendantType write FDescendantType;

    procedure InitializeFromParams(ASpectral: TSpectralClass; AMagnitude, ALongevity, AAge: Double);
    procedure AgeBy(dt: Double);
    procedure DieAndSpawnDescendant;
    procedure UpdateVisuals;
  end;

  TGLStars = class
  private
    FItems: TObjectList<TGLStar>;
    FTotalTime: Double;       // длительность симуляции в млрд лет (10 Gyr)
    FTimeStep: Double;        // шаг времени в млрд лет (0.1 Gyr)
    FLifetimes: array[TSpectralClass] of Double;
  public
    constructor Create;
    destructor Destroy; override;

    function Count: Integer;
    function Item(Index: Integer): TGLStar;

    procedure GenerateInitialPopulation(const Scene: TGLScene; Count: Integer);
    procedure RunSimulation(const Scene: TGLScene);
    procedure CompareWithHYG(const HYGData: TStringList; var FitQuality: Double);
  end;


type
  TfrmStarcube = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    GLPoints1: TGLPoints;
    GLSphere1: TGLSphere;
    dcStarcube: TGLDummyCube;
    GLCadencer1: TGLCadencer;
  private
  public
  end;

var
  frmStarcube: TfrmStarcube;

implementation //============================================================

{$R *.dfm}

//---------------------------------------------------------------------------
// TGLStar
//---------------------------------------------------------------------------
constructor TGLStar.Create(AOwner: TComponent);
begin
  inherited;
  FSpectrality := scM;
  FMagnitude := 0;
  FLongevity := 50.0;
  FHowOld := 0.0;
  FCurrentState := ssAlive;
  FDescendantType := ssWhiteDwarf;
  Radius := 3.0; // пк, для наглядности в сцене
  UpdateVisuals;
end;

//---------------------------------------------------------------------------
procedure TGLStar.InitializeFromParams(ASpectral: TSpectralClass; AMagnitude,
  ALongevity, AAge: Double);
begin
  FSpectrality := ASpectral;
  FMagnitude := AMagnitude;
  FLongevity := ALongevity;
  FHowOld := AAge;
  FCurrentState := ssAlive;
  FDescendantType := ssWhiteDwarf;
  UpdateVisuals;
end;

//---------------------------------------------------------------------------
procedure TGLStar.AgeBy(dt: Double);
begin
 if FCurrentState <> ssAlive then Exit;
  FHowOld := FHowOld + dt;
end;

//---------------------------------------------------------------------------
procedure TGLStar.DieAndSpawnDescendant;
begin
  if FCurrentState <> ssAlive then Exit;

  case FSpectrality of
    scO, scB: FDescendantType := ssBlackHole;
    scA, scF: FDescendantType := ssPulsar;
    scG, scK, scM: FDescendantType := ssWhiteDwarf;
  else
    FDescendantType := ssWhiteDwarf;
  end;

  FCurrentState := FDescendantType;
  UpdateVisuals;
end;

//---------------------------------------------------------------------------
procedure TGLStar.UpdateVisuals;
var
  ColorVec: TColor;
begin
  case FCurrentState of
   ssAlive:
    case FSpectrality of
      scO: ColorVec := clSkyBlue;
      scB: ColorVec := clAqua;  // or clCyan
      scA: ColorVec := clWhite;
      scF: ColorVec := $00F0F0FF; // жёлто-белый
      scG: ColorVec := clYellow;
      scK: ColorVec := ConvertColorVector(clrOrange);
      scM: ColorVec := clRed;
    else
      ColorVec := clGray;
    end;
    ssBlackHole: ColorVec := clBlack;
    ssPulsar: ColorVec := clLime;
    ssWhiteDwarf: ColorVec := clSilver;
    ssNova: ColorVec := clMaroon;
  else
    ColorVec := clGray;
  end;
  Material.FrontProperties.Diffuse.AsWinColor := ColorVec;
  case FCurrentState of
    ssBlackHole: Radius := 1.0;
    ssPulsar: Radius := 0.5;
    ssWhiteDwarf: Radius := 2.0;
    ssNova: Radius := 4.0;
  else
    Radius := 3.0;
  end;
end;

//---------------------------------------------------------------------------
// TGLStars
//---------------------------------------------------------------------------
constructor TGLStars.Create;
begin
 inherited;
  FItems := TObjectList<TGLStar>.Create(True); // OwnsObjects = True
  FTotalTime := 10.0; // 10 Gyr
  FTimeStep := 0.1;   // 0.1 Gyr

  FLifetimes[scO] := 0.1;
  FLifetimes[scB] := 0.5;
  FLifetimes[scA] := 1.5;
  FLifetimes[scF] := 4.0;
  FLifetimes[scG] := 10.0;
  FLifetimes[scK] := 20.0;
  FLifetimes[scM] := 50.0;
end;

//---------------------------------------------------------------------------
destructor TGLStars.Destroy;
begin
  FItems.Free;
  inherited;
end;

//---------------------------------------------------------------------------
function TGLStars.Count: Integer;
begin
  Result := FItems.Count;
end;

//---------------------------------------------------------------------------
function TGLStars.Item(Index: Integer): TGLStar;
begin
  Result := FItems[Index];
end;

//---------------------------------------------------------------------------
procedure TGLStars.GenerateInitialPopulation(const Scene: TGLScene;
  Count: Integer);
var
  i, j: Integer;
  Star: TGLStar;
  Cum, R: Double;
  Weights: array[0..6] of Double;
  TotalWeight: Double;
  Spectral: TSpectralClass;
  Age: Double;
begin
  Weights[Ord(scO)] := 0.001;
  Weights[Ord(scB)] := 0.01;
  Weights[Ord(scA)] := 0.05;
  Weights[Ord(scF)] := 0.15;
  Weights[Ord(scG)] := 0.25;
  Weights[Ord(scK)] := 0.30;
  Weights[Ord(scM)] := 0.24;
  TotalWeight := 0.0;
  for j := Ord(scO) to Ord(scM) do TotalWeight := TotalWeight + Weights[j];

  // случайные координаты
  for i := 0 to Count - 1 do
  begin
    Star := TGLStar.Create(nil);
    Star.Position.X := Random * 1000 - 500;
    Star.Position.Y := Random * 1000 - 500;
    Star.Position.Z := Random * 1000 - 500;

    R := Random;
    Cum := 0.0;
    for j := Ord(scO) to Ord(scM) do
    begin
      Cum := Cum + Weights[j] / TotalWeight;
      if R <= Cum then
      begin
        Spectral := TSpectralClass(j);
        Break;
      end;
      if j = Ord(scM) then Spectral := scM;
    end;
    Age := Random * FTotalTime;
    Star.InitializeFromParams(Spectral, -1.0, FLifetimes[Spectral], Age);

 ///   Scene.dcStarcube.AddChild(Star);

    FItems.Add(Star);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStars.RunSimulation(const Scene: TGLScene);
var
  t, dt: Double;
  Star: TGLStar;
  DeathProb: Double;
begin
  dt := FTimeStep;
  t := 0.0;

  while t <= FTotalTime do
  begin
    for Star in FItems do
    begin
      if Star.CurrentState = ssAlive then
      begin
        Star.AgeBy(dt);
        DeathProb := 1.0 - Exp(-dt / Star.Longevity);
        if Random < DeathProb then
          Star.DieAndSpawnDescendant;
      end;
    end;
    t := t + dt;
  end;
  for Star in FItems do
    Star.UpdateVisuals;
end;

//---------------------------------------------------------------------------
procedure TGLStars.CompareWithHYG(const HYGData: TStringList;
  var FitQuality: Double);
var
  i: Integer;
  AliveCount, OCount, BCount, ACount, FCount, GCount, KCount, MCount: Integer;
  HYG_O, HYG_B, HYG_A, HYG_F, HYG_G, HYG_K, HYG_M: Integer;
begin
  AliveCount := 0; OCount := 0; BCount := 0; ACount := 0; FCount := 0; GCount := 0; KCount := 0; MCount := 0;

  // Заглушки: здесь должна быть логика парсинга HYG 4.0, работы с каталогом
  HYG_O := 1; HYG_B := 5; HYG_A := 15; HYG_F := 40; HYG_G := 60; HYG_K := 80; HYG_M := 120;

  for i := 0 to FItems.Count - 1 do
    if FItems[i].CurrentState = ssAlive then
    begin
      Inc(AliveCount);
      case FItems[i].Spectrality of
        scO: Inc(OCount);
        scB: Inc(BCount);
        scA: Inc(ACount);
        scF: Inc(FCount);
        scG: Inc(GCount);
        scK: Inc(KCount);
        scM: Inc(MCount);
      end;
    end;

  FitQuality :=
    Abs(OCount - HYG_O) + Abs(BCount - HYG_B) + Abs(ACount - HYG_A) +
    Abs(FCount - HYG_F) + Abs(GCount - HYG_G) + Abs(KCount - HYG_K) +
    Abs(MCount - HYG_M);
end;

//---------------------------------------------------------------------------
end.
