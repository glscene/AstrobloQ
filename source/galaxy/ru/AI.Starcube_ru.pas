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
  TForm2 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

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

uses
  System.Classes, System.SysUtils, System.Math,
  System.Generics.Collections,
  GLScene, GLObjects, GLTexture, GLCoordinates,
  GLCrossPlatform, GLMaterial, GLRenderContextInfo;

type
  TSpectralClass = (scO, scB, scA, scF, scG, scK, scM);
  TPlanetState = (psNone, psLitoneta, psBioneta, psNooneta);

  //-- TGLStar: звезда как объект 3D-сцены GLScene --
  TGLStar = class(TGLSphere)
  private
    FSpectralClass: TSpectralClass;
    FPlanetState: TPlanetState;
    FDangerLevel: Double;
    FBirthTime: Double;
    FLifetime: Double;
    FLuminosity: Double;
    FMagnitude: Double;
    FpsLitoneta: Double;
    FpsBioneta: Double;
    FpsNooneta: Double;
    FPrevPL: Double;
    FPrevPBL: Double;
    FPrevPNB: Double;
    FPrevAge: Double;
    procedure SetSpectralClass(const Value: TSpectralClass);
    procedure SetPlanetState(const Value: TPlanetState);
    procedure SetDangerLevel(const Value: Double);
    procedure ApplyVisualProperties;
    procedure SetStarColor(R, G, B: Single);
  protected
    procedure DoRender(var rci: TGLRenderContextInfo;
      rciBack: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignSpectralClass(AClass: TSpectralClass);
    procedure InitBirth(ABirthTime: Double);
    function Age(CurrentTime: Double): Double;
    function IsAlive(CurrentTime: Double): Boolean;
    function ProbLitoneta(AgeVal, TauL: Double): Double;
    function ProbBioneta(AgeVal, TauL, TauB: Double): Double;
    function ProbNooneta(AgeVal, TauL, TauB, TauN: Double): Double;
    function ProbBionetaGivenLitoneta(AgeVal, TauB: Double): Double;
    function ProbNoonetaGivenBioneta(AgeVal, TauN: Double): Double;
    procedure MCStep(CurrentTime, dt, TauL, TauB, TauN: Double);
    procedure ResetPrev;
    property SpectralClass: TSpectralClass
      read FSpectralClass write SetSpectralClass;
    property PlanetState: TPlanetState
      read FPlanetState write SetPlanetState;
    property DangerLevel: Double
      read FDangerLevel write SetDangerLevel;
    property BirthTime: Double read FBirthTime write FBirthTime;
    property Lifetime: Double read FLifetime write FLifetime;
    property Luminosity: Double read FLuminosity;
    property Magnitude: Double read FMagnitude;
    property psLitoneta: Double read FpsLitoneta;
    property psBioneta: Double read FpsBioneta;
    property psNooneta: Double read FpsNooneta;
  end;

  //-- TTimeStepResult: запись результатов одного шага --

  TTimeStepResult = record
    Time: Double;
    AliveCount: Integer;
    AvgProbLitoneta: Double;
    AvgProbBioneta: Double;
    AvgProbNooneta: Double;
    ExpectedTechnospheres: Double;
    MCLitoneta: Integer;
    MCBioneta: Integer;
    MCNooneta: Integer;
    MCTechnospheres: Integer;
  end;

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

// Вспомогательные функции

function SpectralClassName(AClass: TSpectralClass): string;
function GetClassInitProbs(AClass: TSpectralClass;
  out pL, pB, pN: Double): Boolean;
function GetClassLifetime(AClass: TSpectralClass): Double;
function GetClassLuminosity(AClass: TSpectralClass): Double;
function GetClassMagnitude(AClass: TSpectralClass): Double;
function GetClassRadius(AClass: TSpectralClass): Single;
function GetClassDanger(AClass: TSpectralClass): Double;
procedure GetClassColor(AClass: TSpectralClass; out R, G, B: Single);
function GetClassShininess(AClass: TSpectralClass): Byte;

const
  DEFAULT_TAU_LITONETA = 0.1;
  DEFAULT_TAU_BIONETA  = 1.0;
  DEFAULT_TAU_NOONETA  = 3.0;
  DEFAULT_DT           = 0.1;    { 100 млн лет }
  DEFAULT_TMAX         = 10.0;   { 10 млрд лет  }
  DEFAULT_STARS_BATCH  = 10000;

implementation //=======================================================

const
  // Начальные вероятности: [psLitoneta, psBioneta, psNooneta]
  ClassInitProbs: array[TSpectralClass, 0..2] of Double = (
    (0.1,  0.0,   0.0),    { O }
    (0.1,  0.0,   0.0),    { B }
    (0.1,  0.01,  0.0),    { A }
    (0.1,  0.01,  0.001),  { F }
    (0.2,  0.02,  0.002),  { G }
    (0.3,  0.03,  0.003),  { K }
    (0.3,  0.01,  0.001)   { M }
  );

  // Времена жизни на главной последовательности (млрд лет)
  ClassLifetimes: array[TSpectralClass] of Double = (
    0.01, 0.1, 1.0, 3.0, 10.0, 50.0, 100.0
  );

  // Доли спектральных классов в Галактике
  DefaultFractions: array[TSpectralClass] of Double = (
    0.0000003, 0.0013, 0.006, 0.03, 0.076, 0.121, 0.7645
  );

  // Светимость в единицах L_sun
  ClassLuminosities: array[TSpectralClass] of Double = (
    100000.0, 1000.0, 20.0, 3.0, 1.0, 0.2, 0.01
  );

  // Абсолютная звёздная величина
  ClassMagnitudes: array[TSpectralClass] of Double = (
    -6.5, -3.0, 1.0, 3.5, 5.0, 7.0, 12.0
  );

  // Визуальный радиус в единицах сцены GLScene
  ClassRadii: array[TSpectralClass] of Single = (
    2.0, 1.5, 1.0, 0.8, 0.7, 0.5, 0.3
  );

  // Shininess (0..128) — индикатор светимости для Material.FrontProperties
  ClassShininess: array[TSpectralClass] of Byte = (
    128, 110, 90, 70, 55, 35, 15
  );

  // Степень опасности звезды для биосфер (0..1)
  // O/B — жёсткое УФ, короткая жизнь, сверхновые
  // M — вспышечная активность, но долгоживущие
    ClassDanger: array[TSpectralClass] of Double = (
    0.95, 0.85, 0.60, 0.40, 0.30, 0.15, 0.25
  );

  // Цвета звёзд (R, G, B) по спектральному классу
  ClassColors: array[TSpectralClass, 0..2] of Single = (
    (0.60, 0.70, 1.00),  // O — голубой
    (0.75, 0.85, 1.00),  // B — бело-голубой
    (0.95, 0.95, 1.00),  // A — белый
    (1.00, 0.97, 0.85),  // F — жёлто-белый
    (1.00, 0.92, 0.70),  // G — жёлтый
    (1.00, 0.75, 0.50),  // K — оранжевый
    (1.00, 0.50, 0.35)   // M — красный
  );

  SpecNames: array[TSpectralClass] of string = ('O','B','A','F','G','K','M');

// ── Вспомогательные функции ──

function SpectralClassName(AClass: TSpectralClass): string;
begin
  Result := SpecNames[AClass];
end;

function GetClassInitProbs(AClass: TSpectralClass;
  out pL, pB, pN: Double): Boolean;
begin
  pL := ClassInitProbs[AClass, 0];
  pB := ClassInitProbs[AClass, 1];
  pN := ClassInitProbs[AClass, 2];
  Result := True;
end;

function GetClassLifetime(AClass: TSpectralClass): Double;
begin
  Result := ClassLifetimes[AClass];
end;

function GetClassLuminosity(AClass: TSpectralClass): Double;
begin
  Result := ClassLuminosities[AClass];
end;

function GetClassMagnitude(AClass: TSpectralClass): Double;
begin
  Result := ClassMagnitudes[AClass];
end;

function GetClassRadius(AClass: TSpectralClass): Single;
begin
  Result := ClassRadii[AClass];
end;

function GetClassDanger(AClass: TSpectralClass): Double;
begin
  Result := ClassDanger[AClass];
end;

procedure GetClassColor(AClass: TSpectralClass; out R, G, B: Single);
begin
  R := ClassColors[AClass, 0];
  G := ClassColors[AClass, 1];
  B := ClassColors[AClass, 2];
end;

function GetClassShininess(AClass: TSpectralClass): Byte;
begin
  Result := ClassShininess[AClass];
end;

// ── TGLStar ──

constructor TGLStar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSpectralClass := scG;        // по умолчанию — солнцеподобная
  FPlanetState := psNone;
  FDangerLevel := 0.30;
  FBirthTime := 0.0;
  FLifetime := 10.0;
  FLuminosity := 1.0;
  FMagnitude := 5.0;
  FpsLitoneta := 0.2;
  FpsBioneta := 0.02;
  FpsNooneta := 0.002;
  FPrevPL := 0.0;
  FPrevPBL := 0.0;
  FPrevPNB := 0.0;
  FPrevAge := 0.0;
  Slices := 16;
  Stacks := 16;
  ApplyVisualProperties;
end;

destructor TGLStar.Destroy;
begin
  inherited;
end;

procedure TGLStar.SetStarColor(R, G, B: Single);
begin
  // Настройка материала — диффузный и эмиссионный цвет
  with Material.FrontProperties do
  begin
    Diffuse.Color := Vector3f(R, G, B);
    Emission.Color := Vector3f(R * 0.6, G * 0.6, B * 0.6);
    Ambient.Color := Vector3f(R * 0.2, G * 0.2, B * 0.2);
    Specular.Color := Vector3f(1.0, 1.0, 1.0);
  end;
  Material.BlendingMode := bmOpaque;
  Material.MaterialOptions := [moNoLighting];
  // Emission даёт самосвечение — звезда светится без внешнего источника
end;

procedure TGLStar.ApplyVisualProperties;
var
  R, G, B: Single;
  Shin: Byte;
begin
  GetClassColor(FSpectralClass, R, G, B);
  SetStarColor(R, G, B);
  Radius := GetClassRadius(FSpectralClass);
  Shin := GetClassShininess(FSpectralClass);
  Material.FrontProperties.Shininess := Shin;
  NotifyChange(Self);
end;

procedure TGLStar.SetSpectralClass(const Value: TSpectralClass);
begin
  if FSpectralClass <> Value then
  begin
    FSpectralClass := Value;
    FLifetime := GetClassLifetime(Value);
    FLuminosity := GetClassLuminosity(Value);
    FMagnitude := GetClassMagnitude(Value);
    GetClassInitProbs(Value, FpsLitoneta, FpsBioneta, FpsNooneta);
    FDangerLevel := GetClassDanger(Value);
    ApplyVisualProperties;
  end;
end;

procedure TGLStar.SetPlanetState(const Value: TPlanetState);
begin
  if FPlanetState <> Value then
  begin
    FPlanetState := Value;
    NotifyChange(Self);
  end;
end;

procedure TGLStar.SetDangerLevel(const Value: Double);
begin
  if Value < 0.0 then
    FDangerLevel := 0.0
  else if Value > 1.0 then
    FDangerLevel := 1.0
  else
    FDangerLevel := Value;
  NotifyChange(Self);
end;

procedure TGLStar.AssignSpectralClass(AClass: TSpectralClass);
begin
  SetSpectralClass(AClass);
end;

procedure TGLStar.InitBirth(ABirthTime: Double);
begin
  FBirthTime := ABirthTime;
  FPlanetState := psNone;
  ResetPrev;
end;

function TGLStar.Age(CurrentTime: Double): Double;
begin
  Result := CurrentTime - FBirthTime;
end;

function TGLStar.IsAlive(CurrentTime: Double): Boolean;
var
  a: Double;
begin
  a := Age(CurrentTime);
  Result := (a >= 0.0) and (a < FLifetime);
end;

function TGLStar.ProbLitoneta(AgeVal, TauL: Double): Double;
begin
  if AgeVal <= 0 then
    Result := 0.0
  else
    Result := FpsLitoneta * (1.0 - Exp(-AgeVal / TauL));
end;

function TGLStar.ProbBioneta(AgeVal, TauL, TauB: Double): Double;
var
  fL, fB: Double;
begin
  if AgeVal <= 0 then
    Result := 0.0
  else
  begin
    fL := 1.0 - Exp(-AgeVal / TauL);
    fB := 1.0 - Exp(-AgeVal / TauB);
    Result := FpsBioneta * fL * fB;
  end;
end;

function TGLStar.ProbNooneta(AgeVal, TauL, TauB, TauN: Double): Double;
var
  fL, fB, fN: Double;
begin
  if AgeVal <= 0 then
    Result := 0.0
  else
  begin
    fL := 1.0 - Exp(-AgeVal / TauL);
    fB := 1.0 - Exp(-AgeVal / TauB);
    fN := 1.0 - Exp(-AgeVal / TauN);
    Result := FpsNooneta * fL * fB * fN;
  end;
end;

function TGLStar.ProbBionetaGivenLitoneta(AgeVal, TauB: Double): Double;
begin
  if (FpsLitoneta > 0) and (AgeVal > 0) then
    Result := (FpsBioneta / FpsLitoneta) * (1.0 - Exp(-AgeVal / TauB))
  else
    Result := 0.0;
end;

function TGLStar.ProbNoonetaGivenBioneta(AgeVal, TauN: Double): Double;
begin
  if (FpsBioneta > 0) and (AgeVal > 0) then
    Result := (FpsNooneta / FpsBioneta) * (1.0 - Exp(-AgeVal / TauN))
  else
    Result := 0.0;
end;

procedure TGLStar.ResetPrev;
begin
  FPrevPL := 0.0;
  FPrevPBL := 0.0;
  FPrevPNB := 0.0;
  FPrevAge := 0.0;
end;

procedure TGLStar.MCStep(CurrentTime, dt, TauL, TauB, TauN: Double);
var
  a, PL, PBL, PNB: Double;
  hazard, denom, U: Double;
begin
  if not IsAlive(CurrentTime) then Exit;
  a := Age(CurrentTime);
  if a < 0 then Exit;

  PL  := ProbLitoneta(a, TauL);
  PBL := ProbBionetaGivenLitoneta(a, TauB);
  PNB := ProbNoonetaGivenBioneta(a, TauN);

  { Переход 0 → 1: psNone → psLitoneta }
  if FPlanetState = psNone then
  begin
    denom := 1.0 - FPrevPL;
    if denom < 1e-12 then denom := 1e-12;
    hazard := (PL - FPrevPL) / denom;
    if hazard < 0 then hazard := 0;
    if hazard > 1 then hazard := 1;
    if hazard > 0 then
    begin
      U := Random;
      if U < hazard then
        FPlanetState := psLitoneta;
    end;
  end;

  // Переход 1 → 2: psLitoneta → psBioneta
  if FPlanetState = psLitoneta then
  begin
    denom := 1.0 - FPrevPBL;
    if denom < 1e-12 then denom := 1e-12;
    hazard := (PBL - FPrevPBL) / denom;
    if hazard < 0 then hazard := 0;
    if hazard > 1 then hazard := 1;
    if hazard > 0 then
    begin
      U := Random;
      if U < hazard then
        FPlanetState := psBioneta;
    end;
  end;

  // Переход 2 → 3: psBioneta → psNooneta (≡ техносфера)
  if FPlanetState = psBioneta then
  begin
    denom := 1.0 - FPrevPNB;
    if denom < 1e-12 then denom := 1e-12;
    hazard := (PNB - FPrevPNB) / denom;
    if hazard < 0 then hazard := 0;
    if hazard > 1 then hazard := 1;
    if hazard > 0 then
    begin
      U := Random;
      if U < hazard then
        FPlanetState := psNooneta;
    end;
  end;

  FPrevPL  := PL;
  FPrevPBL := PBL;
  FPrevPNB := PNB;
  FPrevAge := a;
end;

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
