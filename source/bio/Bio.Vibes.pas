unit Bio.Vibes;

interface

uses
  System.Classes,
  Bio.BaseObject,
  Bio.Things,
  Bio.Position,
  Bio.Life,
  Stage.VectorGeometry;

const
  cEffectNoise = 0;
  cEffectShake = 1;
  cEffectStopShake = 2;
  cEffectSpeech = 3;

  cNoisePing = 0;
  cNoiseFire = 1;
  cNoiseQuake = 2;
  cNoiseRain = 3;
  cNoiseBirdChirp = 4;
  cNoisePop = 5;
  cNoiseSquawk = 6;
  cNoiseFall = 7;
  cNoiseCricket = 8;
  cNoiseEat = 9;
  cNoiseExplode = 10;
  cNoiseForest = 11;
  cNoiseHawk = 12;
  cNoiseRoar = 13;
  cNoiseBirdHungry = 16;
  cNoiseBirdHappy = 17;
  cNoiseKick = 18;
  cNoiseGrab = 19;
  cNoiseDrop = 22;
  cNoiseWeaponFire = 20;
  cNoiseSmash = 21;
  cNoiseThrow = 22;
  cNoiseUproot = 23;
  cNoiseSploosh = 24;
  cNoiseMouseLow = 25;
  cNoiseMouseHigh = 26;
  cNoiseYowl = 27;
  cNoiseQuack = 28;
  cNoiseDuckling = 29;

type

// ============================================================================
// an individual vibe
TaiVibe = class(TaiThing)
private
  fEffectType: integer;
  fEffectIndex: integer;
  fSensoryType: integer;
  fTimerDeath: integer;
public
  constructor Create(aParent: pointer);
  property EffectType: integer read fEffectType write fEffectType;
  property EffectIndex: integer read fEffectIndex write fEffectIndex;
  property SensoryType: integer read fSensoryType write fSensoryType;
  property TimerDeath: integer read fTimerDeath write fTimerDeath;
  procedure SetVibe(aEffectType, aEffectIndex, aTimerDeath: integer);
  procedure Fuel; override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

// ============================================================================
// an visible string of text
TaiSpeech = class(TaiThing)
private
  fText: string;          // text to communicate
  fRadius: single;        // how widely can it be "heard"
  fTimerDeath: integer;   // how long will this stick around?
public
  constructor Create(aParent: pointer);
  property Text: string read fText write fText;
  property Radius: single read fRadius write fRadius;
  property TimerDeath: integer read fTimerDeath write fTimerDeath;
  procedure Fuel; override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

implementation //=============================================================

constructor TaiVibe.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cVibe;

  Position.SetPosition(0, 0, 0);
  Position.SetSize(0, 0, 0, false);
  Position.SetProperties(100000, 0, 0);
  Position.Collider := false;
  Position.Tangible := false;
end;

// ----------------------------------------------------------------------------
procedure TaiVibe.Fuel;
begin
  inherited Fuel;

  if Age >= TimerDeath then
    Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiVibe.SetVibe(aEffectType, aEffectIndex, aTimerDeath: integer);
begin
  fEffectType := aEffectType;
  fEffectIndex := aEffectIndex;
  fTimerDeath := aTimerDeath;
end;

// ----------------------------------------------------------------------------
procedure TaiVibe.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fEffectType);
  writeln(aFile, fEffectIndex);
  writeln(aFile, fSensoryType);
  writeln(aFile, fTimerDeath);
end;

// ----------------------------------------------------------------------------
procedure TaiVibe.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fEffectType);
  readln(aFile, fEffectIndex);
  readln(aFile, fSensoryType);
  readln(aFile, fTimerDeath);
end;

// ----------------------------------------------------------------------------
constructor TaiSpeech.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cSpeech;

  Position.SetSize(0, 0, 0, false);
  Position.SetProperties(100000, 0, 0);
  Position.Collider := false;
  Position.Tangible := false;
  Radius := 10.0;
end;

// ----------------------------------------------------------------------------
procedure TaiSpeech.Fuel;
begin
  inherited Fuel;

  if Age >= TimerDeath then
    Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiSpeech.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fText);
  writeln(aFile, fRadius);
  writeln(aFile, fTimerDeath);
end;

// ----------------------------------------------------------------------------
procedure TaiSpeech.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fText);
  readln(aFile, fRadius);
  readln(aFile, fTimerDeath);
end;

end.
