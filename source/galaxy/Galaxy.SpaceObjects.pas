(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit Galaxy.SpaceObjects;
(*
  Implementation of basic scene objects plus some management routines.
  The registered classes are:
    [TGLStar, TGLStars, TGLStellars]

  All objects declared in this unit are only simple objects
  and should be kept simple and lightweight.
  More complex or more specialized versions should be placed in dedicated
  units where they can grow and prosper untammed.
  "Generic" geometrical objects can be found in GeometryObjects unit.
*)
interface

{$I Stage.Defines.inc}

uses
  Winapi.OpenGL,
  Winapi.OpenGLext,
  System.Types,
  System.Classes,
  System.SysUtils,
  System.Math,
  System.Generics.Collections,

  Stage.OpenGLTokens,
  Stage.VectorGeometry,
  Stage.VectorTypes,
  Stage.Spline,
  Stage.PipelineTransform,
  Stage.PersistentClasses,
  Stage.OpenGLAdapter,
  Stage.BaseClasses,
  Stage.Coordinates,
  Stage.VectorLists,
  Stage.Silhouette,
  Stage.Color,

  GLS.Scene,
  GLS.Context,
  GLS.RenderContextInfo,
  GLS.Objects,
  GLS.Nodes,
  GLS.Material,
  GLS.Texture,
  GLS.State;

type
  TSpectralClass = (scO, scB, scA, scF, scG, scK, scM);
  TPlanetState = (psNone, psLitoneta, psBioneta, psNooneta);

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


  // -- TGLStar: звезда как объект 3D-сцены --

  TGLStar = class(TGLSphere)
  private
    FSpectralClass: TSpectralClass;
    FPlanetState: TPlanetState;
    FDangerLevel: Double;
    FBirthTime: Double;
    FLifetime: Double;
    FLuminosity: Double;
    FMagnitude: Double;
    FpsLitoneta: Double; //TPlanetState;
    FpsBioneta: Double; //TPlanetState;
    FpsNooneta: Double; //TPlanetState;
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
    procedure DoRender(var ARci: TGLRenderContextInfo;
      ARenderSelf, ARenderChildren: Boolean); override;
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
    property psLitoneta: Double read FpsLitoneta; // TPlanetState
    property psBioneta: Double read FpsBioneta; // TPlanetState
    property psNooneta: Double read FpsNooneta; // TPlanetState
  published
  end;

// Вспомогательные функции

function SpectralClassName(AClass: TSpectralClass): string;
function GetClassInitProbs(AClass: TSpectralClass;
  out pL, pB, pN: Double {TPlanetState}): Boolean;
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


implementation //============================================================

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

//---------------------------------------------------------------------------
// ── Вспомогательные функции ──
//---------------------------------------------------------------------------
function SpectralClassName(AClass: TSpectralClass): string;
begin
  Result := SpecNames[AClass];
end;

//---------------------------------------------------------------------------
function GetClassInitProbs(AClass: TSpectralClass;
  out pL, pB, pN: Double): Boolean;
begin
  pL := ClassInitProbs[AClass, 0]; //psLitoneta
  pB := ClassInitProbs[AClass, 1]; //psBioneta
  pN := ClassInitProbs[AClass, 2]; //psNooneta
  Result := True;
end;

//---------------------------------------------------------------------------
function GetClassLifetime(AClass: TSpectralClass): Double;
begin
  Result := ClassLifetimes[AClass];
end;

//---------------------------------------------------------------------------
function GetClassLuminosity(AClass: TSpectralClass): Double;
begin
  Result := ClassLuminosities[AClass];
end;

//---------------------------------------------------------------------------
function GetClassMagnitude(AClass: TSpectralClass): Double;
begin
  Result := ClassMagnitudes[AClass];
end;

//---------------------------------------------------------------------------
function GetClassRadius(AClass: TSpectralClass): Single;
begin
  Result := ClassRadii[AClass];
end;

//---------------------------------------------------------------------------
function GetClassDanger(AClass: TSpectralClass): Double;
begin
  Result := ClassDanger[AClass];
end;

//---------------------------------------------------------------------------
procedure GetClassColor(AClass: TSpectralClass; out R, G, B: Single);
begin
  R := ClassColors[AClass, 0];
  G := ClassColors[AClass, 1];
  B := ClassColors[AClass, 2];
end;

//---------------------------------------------------------------------------
function GetClassShininess(AClass: TSpectralClass): Byte;
begin
  Result := ClassShininess[AClass];
end;

//---------------------------------------------------------------------------
// TGLStar
//---------------------------------------------------------------------------
constructor TGLStar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSpectralClass := scG;        // по умолчанию — солнцеподобная
  FDangerLevel := 0.30;
  FBirthTime := 0.0;
  FLifetime := 10.0;
  FLuminosity := 1.0;
  FMagnitude := 5.0;

  FPlanetState := psNone;
  FpsLitoneta := psLitoneta; // 0.2;
  FpsBioneta := psBioneta; // 0.02;
  FpsNooneta := psNooneta; // 0.002;
  FPrevPL := 0.0;
  FPrevPBL := 0.0;
  FPrevPNB := 0.0;
  FPrevAge := 0.0;
  Slices := 16;
  Stacks := 16;
  ApplyVisualProperties;
end;

//----------------------------------------------------------------------------
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

//----------------------------------------------------------------------------
procedure TGLStar.SetPlanetState(const Value: TPlanetState);
begin
  if FPlanetState <> Value then
  begin
    FPlanetState := Value;
    NotifyChange(Self);
  end;
end;

//----------------------------------------------------------------------------
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

//----------------------------------------------------------------------------
procedure TGLStar.AssignSpectralClass(AClass: TSpectralClass);
begin
  SetSpectralClass(AClass);
end;

//----------------------------------------------------------------------------
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

//----------------------------------------------------------------------------
procedure TGLStar.SetStarColor(R, G, B: Single);
var
  Vec: TGSVector;
begin
  // Настройка материала — диффузный и эмиссионный цвет
  with Material.FrontProperties do
  begin
    Diffuse.Color := Vec;
    // Определить цвет
///    Emission.Color := Vec(R * 0.6, G * 0.6, B * 0.6, 1.0);
///    Ambient.Color := Vec(R * 0.2, G * 0.2, B * 0.2);
///    Specular.Color := Vec(1.0, 1.0, 1.0);
  end;
  Material.BlendingMode := bmOpaque;
  Material.MaterialOptions := [moNoLighting];
  // Emission даёт самосвечение — звезда светится без внешнего источника
end;

//----------------------------------------------------------------------------
function TGLStar.Age(CurrentTime: Double): Double;
begin
  Result := CurrentTime - FBirthTime;
end;

//----------------------------------------------------------------------------
destructor TGLStar.Destroy;
begin
  inherited;
end;

//----------------------------------------------------------------------------
procedure TGLStar.DoRender(var ARci: TGLRenderContextInfo; ARenderSelf,
  ARenderChildren: Boolean);
begin

end;

//----------------------------------------------------------------------------
procedure TGLStar.InitBirth(ABirthTime: Double);
begin
  FBirthTime := ABirthTime;
  FPlanetState := psNone;
  ResetPrev;
end;

//----------------------------------------------------------------------------
function TGLStar.IsAlive(CurrentTime: Double): Boolean;
var
  a: Double;
begin
  a := Age(CurrentTime);
  Result := (a >= 0.0) and (a < FLifetime);
end;

//----------------------------------------------------------------------------
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
///        FPlanetState := psLitoneta;
    end;
  end;

  // Переход 1 → 2: psLitoneta → psBioneta
///  if FPlanetState = psLitoneta then
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
///        PlanetState := psBioneta;
    end;
  end;

  // Переход 2 → 3: psBioneta → psNooneta (≡ техносфера)
///  if FPlanetState = psBioneta then
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
///        FPlanetState := psNooneta;
    end;
  end;

  FPrevPL  := PL;
  FPrevPBL := PBL;
  FPrevPNB := PNB;
  FPrevAge := a;
end;

//----------------------------------------------------------------------------
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

//----------------------------------------------------------------------------
function TGLStar.ProbBionetaGivenLitoneta(AgeVal, TauB: Double): Double;
begin
  if (FpsLitoneta > 0) and (AgeVal > 0) then
    Result := (FpsBioneta / FpsLitoneta) * (1.0 - Exp(-AgeVal / TauB))
  else
    Result := 0.0;
end;

//----------------------------------------------------------------------------
function TGLStar.ProbLitoneta(AgeVal, TauL: Double): Double;
begin
  if AgeVal <= 0 then
    Result := 0.0
  else
    Result := FpsLitoneta * (1.0 - Exp(-AgeVal / TauL));
end;

//----------------------------------------------------------------------------
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

//----------------------------------------------------------------------------
function TGLStar.ProbNoonetaGivenBioneta(AgeVal, TauN: Double): Double;
begin
  if (FpsBioneta > 0) and (AgeVal > 0) then
    Result := (FpsNooneta / FpsBioneta) * (1.0 - Exp(-AgeVal / TauN))
  else
    Result := 0.0;
end;

//----------------------------------------------------------------------------
procedure TGLStar.ResetPrev;
begin
  FPrevPL := 0.0;
  FPrevPBL := 0.0;
  FPrevPNB := 0.0;
  FPrevAge := 0.0;
end;


initialization //==============================================================

RegisterClasses([TGLStar]);

end.
