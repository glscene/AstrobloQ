unit Bio.Tool;

interface

uses
  System.Classes,
  System.SysUtils,

  Stage.VectorGeometry,
  Bio.BaseObject,
  Bio.Things,
  Bio.Position,
  Bio.Life;

const
  cBeaconDrain = 0;
  cBeaconBubble = 1;
  cBeaconOrange = 2;
  cBeaconApple = 3;
  cBeaconAny = 4;
  // cBeaconCloudSummon: sucks in clouds
  // cBeaconCloudRain: zaps clouds to make them start raining
  // cBeaconHeater: heats a square
  // cBeaconCooler: cools a square

type

// ============================================================================
// an individual Tool
TaiTool = class(TaiThing)
private
  fNextUse: integer;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  property NextUse: integer read fNextUse write fNextUse;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

// ============================================================================
// an individual Tool
TaiWeapon = class(TaiTool)
private
  procedure Shoot;
  procedure Flamethrower;
  procedure Bomb;
  procedure Nuke;
public
  constructor Create(aParent: pointer);
  procedure Perform(aActivity: integer); override;
end;

// ============================================================================
// an individual Tool
TaiBall = class(TaiTool)
public
  constructor Create(aParent: pointer);
  procedure Perform(aActivity: integer); override;
  procedure Fuel; override;
end;

// ============================================================================
// an individual Tool
TaiBalloon = class(TaiBall)
public
end;

// ============================================================================
// an item
TaiBeacon = class(TaiTool)
private
  fActive: boolean;
  fUsage: integer;
  fAmount: single;
  fRate: integer;
  fPop: integer;
  procedure SetRate(aValue: integer);
  procedure PopThing(aKind: integer);
  function UsageString: string;
public
  constructor Create(aParent: pointer);
  property Usage: integer read fUsage write fUsage;
  property Pop: integer read fPop write fPop;
  property Rate: integer read fRate write SetRate;
  property Amount: single read fAmount write fAmount;
  procedure Fuel; override;
  procedure Perform(aActivity: integer); override;
  function OneLineDisplay: string; override;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

implementation //-------------------------------------------------------------

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Vibes,
  Bio.Explosions,
  Bio.Utilities,
  Bio.Space;

// ----------------------------------------------------------------------------
constructor TaiTool.Create(aParent: pointer);
begin
  inherited Create(aParent);

  fNextUse := 0;
end;

// ----------------------------------------------------------------------------
destructor TaiTool.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
constructor TaiWeapon.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cWeapon;

  Position.SetPosition(Random(20)-10, Random(20)-10, Random(5)+3);
  Position.Acceleration.SetForce(Random * 1 - 0.5, Random * 1 - 0.5, 0);
  Position.SetSize(2, 2, 0.5, true);
end;

// ----------------------------------------------------------------------------
procedure TaiWeapon.Perform(aActivity: integer);
begin
  if NextUse > Age then
    exit;

  case aActivity of
    0: Shoot;
    1: Flamethrower;
    2: Bomb;
    3: Nuke;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiWeapon.Shoot;
var
  myBomb: TaiBomb;
begin
  // bullet
  myBomb := TaiBomb(gEnvironment.Things.NewThing(cBomb));
  if not (myBomb = nil) then
  begin
    Noise(cNoiseWeaponFire, 1);
    myBomb.Position.CopyCoords(Position);
    myBomb.Position.SetSize(0.075, 0.075, 0.075, true);
    myBomb.Position.SetProperties(2.0, 0.1, 0.0);
    myBomb.Position.Height := myBomb.Position.Height + Position.SizeH / 2;
    myBomb.Position.Velocity.CopyFrom(Position.Velocity);
    myBomb.Position.Velocity.ApplyAngularForce(Position.DirectionXY + Random * 0.05 - 0.025, gGravity.DeltaHeight*-5, 1.5+Random*0.1);
    myBomb.Timer := 24;
    myBomb.Strength := 0.0005;
    myBomb.Effect := cEffectBullet;
    myBomb.Diminish := 0.0005;
    myBomb.BlastRadius := 2;
  end;

  // shell
  myBomb := TaiBomb(gEnvironment.Things.NewThing(cBomb));
  if not (myBomb = nil) then
  begin
    myBomb.Position.CopyCoords(Position);
    myBomb.Position.SetSize(0.1, 0.1, 0.1, true);
    myBomb.Position.SetProperties(0.25, 0.75, 0.0);
    myBomb.Position.Height := myBomb.Position.Height + Position.SizeH / 2;
    myBomb.Position.Velocity.CopyFrom(Position.Velocity);
    myBomb.Position.Velocity.ApplyAngularForce(Position.DirectionXY + HalfPi + RandomSwing*QuarterPi, 0.5+Random*0.05, 0.02+Random*0.1);
    myBomb.Position.Velocity.DeltaHeight := myBomb.Position.Velocity.DeltaHeight + 0.15;
    myBomb.Timer := 128;
    myBomb.Strength := 0.0005;
    myBomb.Effect := cEffectShell;
    myBomb.Diminish := 0.0001;
    myBomb.BlastRadius := 0;
  end;

  NextUse := Age + 6;
end;

// ----------------------------------------------------------------------------
procedure TaiWeapon.Flamethrower;
var
  myExplosion: TaiExplosion;
begin
  myExplosion := TaiExplosion(gEnvironment.Things.NewThing(cExplosion));
  if not (myExplosion = nil) then
  begin
    myExplosion.Position.CopyCoords(Position);
    myExplosion.Strength := 0.01;
    myExplosion.Effect := cEffectNapalm;
    myExplosion.Diminish := 0.0001;
    myExplosion.BlastRadius := 1;
    myExplosion.Position.SetSize(1, 1, 1, false);
    myExplosion.Position.SetProperties(1, 1, 1);
    myExplosion.Position.Velocity.ApplyAngularForce(Position.DirectionXY, 1.5);
  end;

  NextUse := Age + 16;
end;

// ----------------------------------------------------------------------------
procedure TaiWeapon.Bomb;
var
  myBomb: TaiBomb;
begin
  myBomb := TaiBomb(gEnvironment.Things.NewThing(cBomb));
  if not (myBomb = nil) then
  begin
    myBomb.Position.CopyCoords(Position);
    myBomb.Position.Height := myBomb.Position.Height + Position.SizeH / 2;
    myBomb.Position.Velocity.CopyFrom(Position.Velocity);
    myBomb.Position.Acceleration.SetAngularForce(Position.DirectionXY + Random * 0.25 - 0.125, 0.3, 1);
    myBomb.Timer := 160;
    myBomb.Strength := 0.15;
    myBomb.Effect := cEffectFire;
    myBomb.Diminish := 0.025;
    myBomb.BlastRadius := 25;
  end;

  NextUse := Age + 16;
end;

// ----------------------------------------------------------------------------
procedure TaiWeapon.Nuke;
var
  myBomb: TaiBomb;
begin
  myBomb := TaiBomb(gEnvironment.Things.NewThing(cBomb));
  if not (myBomb = nil) then
  begin
    myBomb.Position.CopyCoords(Position);
    myBomb.Position.SetSize(1.5, 1.5, 1.5, true);
    myBomb.Position.SetProperties(10, 0.1, 0.0);
    myBomb.Position.Height := myBomb.Position.Height + Position.SizeH / 2;
    myBomb.Position.Velocity.CopyFrom(Position.Velocity);
    myBomb.Position.Acceleration.SetAngularForce(Position.DirectionXY + Random * 0.25 - 0.125, 0.3, 5);
    myBomb.Timer := 256;
    myBomb.Effect := cEffectFire;
    myBomb.Strength := 100000;
    myBomb.Diminish := 500;
    myBomb.BlastRadius := 100.0;
  end;

  NextUse := Age + 32;
end;

// ----------------------------------------------------------------------------
constructor TaiBall.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cBall;

  Position.SetSize(1, 1, 1, true);
  Position.SetProperties(2, 0.9, 1.8);

  Position.Acceleration.ApplyForce(Random * 0.1 - 0.05, Random * 0.1 - 0.05, 0.15);
end;

// ----------------------------------------------------------------------------
procedure TaiBall.Perform(aActivity: integer);
begin
  if aActivity = 0 then
    Position.Inflate(0.01);
  if aActivity = 1 then
    if Position.SizeX > 0.1 then
      Position.Deflate(0.05);
end;

// ----------------------------------------------------------------------------
procedure TaiBeacon.Fuel;
begin
  inherited Fuel;

  if fActive then
  case fUsage of
    cBeaconDrain: gSpace.QueueChange(Position.Location, cEventAddWater, -0.1);
    cBeaconBubble: gSpace.QueueChange(Position.Location, cEventAddWater, 0.1);
    cBeaconOrange: if Age mod 64 = 0 then  PopThing(cOrange);
    cBeaconApple: if Age mod 64 = 0 then  PopThing(cApple);
    cBeaconAny: if Age mod fRate = 0 then PopThing(fPop);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiTool.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fNextUse);
end;

// ----------------------------------------------------------------------------
procedure TaiTool.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fNextUse);
end;

// ----------------------------------------------------------------------------
procedure TaiBeacon.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fUsage);
  writeln(aFile, fAmount);
  writeln(aFile, fPop);
  writeln(aFile, fRate);
  writeFileBoolean(aFile, fActive);
end;

// ----------------------------------------------------------------------------
procedure TaiBeacon.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fUsage);
  readln(aFile, fAmount);
  readln(aFile, fPop);
  readln(aFile, fRate);
  fActive := readFileBoolean(aFile);
end;

// ----------------------------------------------------------------------------
procedure TaiBeacon.PopThing(aKind: integer);
var
  myThing: TaiThing;
begin
  if not gThings.CanAdd(aKind) then exit;

  myThing := gThings.NewThing(aKind);
  myThing.Position.CopyCoords(Position);
  myThing.Position.Height := myThing.Position.Height + Position.SizeH;
  myThing.Position.Velocity.CopyFrom(Position.Velocity);
  myThing.Position.Acceleration.SetAngularForce(Random * TwoPi, Random * HalfPi, 0.01 + Random * 0.25);
end;

// ----------------------------------------------------------------------------
procedure TaiBeacon.Perform(aActivity: integer);
begin
  if aActivity = 0 then
    fActive := not fActive;
  if aActivity = 1 then
    fUsage := fUsage - 1;
  if aActivity = 2 then
    fUsage := fUsage + 1;
end;

// ----------------------------------------------------------------------------
constructor TaiBeacon.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cBeacon;

  Position.SetSize(1, 1, 1, true);
  Position.SetProperties(25, 0, 0);
  Position.DirectionH := 0;
  Usage := 0;

  fActive := true;
end;

// ----------------------------------------------------------------------------
procedure TaiBeacon.SetRate(aValue: integer);
begin
  fRate := aValue;
  if fRate < 1 then fRate := 1;
end;

// ----------------------------------------------------------------------------
procedure TaiBall.Fuel;
begin
  inherited Fuel;

  // added so that if user is viewing as a ball, it turns
  // for example if floating down a river, the user will get a nice view
  if not Position.Velocity.Stale then
    Position.TurnTowardsVelocity(ca15);
end;

// ----------------------------------------------------------------------------
procedure TaiBeacon.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('Usage: ' + UsageString);
  aList.Add(Format('Amount: %0.2f', [fAmount]));
  aList.Add('Active: ' + BoolToYesNoStr(fActive));
  aList.Add('Rate: ' + IntToStr(fRate));
  aList.Add('Pop: ' + ThingNamePlural(fPop));
end;

// ----------------------------------------------------------------------------
function TaiBeacon.OneLineDisplay: string;
begin
  result := 'Beacon ' + UsageString + ' ' + inherited OneLineDisplay;
end;

// ----------------------------------------------------------------------------
function TaiBeacon.UsageString: string;
begin
  case fUsage of
    cBeaconDrain: result := 'Drain';
    cBeaconBubble: result := 'Bubble';
    cBeaconOrange: result := 'Orange';
    cBeaconApple: result := 'Apple';
    cBeaconAny: result := 'AnyPop ' + ThingNamePlural(fPop);
  end;
end;

end.

