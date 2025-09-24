unit Bio.Satellites;

interface

uses
  System.Classes,
  System.SysUtils,
  Bio.Things,
  Bio.Grid,
  Bio.Coordinates,
  Bio.Life,
  Bio.Position,
  Bio.Force;

type

// ============================================================================
TaiSatellite = class(TaiThing)
private
  fSize: single;       // size of object; radius
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  property Size: single read fSize write fSize;
  procedure Fuel; override;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

// ============================================================================
TaiOrbiter = class(TaiSatellite)
private
  fRadius: integer;     // how many squares the sun shines on
  fRate: single;       // qualitative rate of effect
public
  property Rate: single read fRate write fRate;
  property Radius: integer read fRadius write fRadius;
  procedure Fuel; override;
  procedure Explode; virtual; abstract; // when collide, explode into smaller, falling pieces
  procedure OnCollide(aCollider: TaiThing); override;
  procedure Perform(aActivity: integer); override;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

// ============================================================================
TaiSun = class(TaiOrbiter)
private
  fSwing: boolean;
public
  constructor Create(aParent: pointer);
  property Swing: boolean read fSwing;
  procedure Explode; override;
  procedure Fuel; override;
  procedure FullDisplay(aList: TStrings); override;
end;

// ============================================================================
TaiMoon = class(TaiOrbiter)
public
  constructor Create(aParent: pointer);
  procedure Explode; override;
  procedure Fuel; override;
end;

// ============================================================================
TaiAsteroid = class(TaiThing)
private
  fEnergy: integer;
  fBurning: boolean;
  fSize: single;
  fMarkers: integer;
public
  constructor Create(aParent: pointer);
  property Energy: integer read fEnergy write fEnergy;
  property Burning: boolean read fBurning write fBurning;
  property Size: single read fSize write fSize;
  property Markers: integer read fMarkers write fMarkers;
  procedure Smash;
  procedure Burn;
  procedure Fuel; override;
  procedure Mark;
  procedure UnMark;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

implementation //--------------------------------------------------------------

uses
  Bio.Reality,
  Bio.Environment,
  Bio.Space,
  Bio.Explosions,
  Bio.Globals,
  Bio.Utilities,
  Bio.Vibes,
  Bio.Weather;

// ----------------------------------------------------------------------------
constructor TaiSatellite.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Position.Binding := bindSpace;
  Position.DirectionH := Pi;
end;

// ----------------------------------------------------------------------------
destructor TaiSatellite.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiSatellite.Fuel;
begin
  inherited Fuel;

  // counteract gravity
  Position.Velocity.DeltaHeight := 0;
end;

// ----------------------------------------------------------------------------
constructor TaiSun.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cSun;
  Rate := 0.3;
  Radius := 5;
  Size := 2.0;
  Position.SetPosition(Random*gWorldWidth, gHalfWorldHeight, 420);
  Position.Velocity.SetForce(0.05, 0.0, 0.0);
  Position.Mass := 1000;
end;

// ----------------------------------------------------------------------------
procedure TaiSun.Fuel;
var
  myReach: integer;
  myExtend: TaiGrid;
begin
  inherited Fuel;

{  if Position.Y < gOneQuarterWorldHeight then
    Position.Velocity.DeltaY := 0.01;
  if Position.Y > gThreeQuartersWorldHeight then
    Position.Velocity.DeltaY := -0.01;
 }
  // find random square by radius
  myExtend := TaiGrid(Position.Location);
  for myReach := 0 to Radius - 1 do
  begin
    case Random(4) of
      cDirectionUp:     myExtend := myExtend.ConnectionUp;
      cDirectionDown:   myExtend := myExtend.ConnectionDown;
      cDirectionLeft:   myExtend := myExtend.ConnectionLeft;
      cDirectionRight:  myExtend := myExtend.ConnectionRight;
    end;
  end;

  // heat the square, unless there are clouds
  myExtend.AlterTemperature(Rate);
end;

// ----------------------------------------------------------------------------
procedure TaiSun.Explode;
var
  myAsteroid: TaiAsteroid;
  i: integer;
begin
  for i := 0 to 25 do
  begin
    myAsteroid := TaiAsteroid(gThings.NewThing(cAsteroid));
    if Assigned(myAsteroid) then
    begin
      myAsteroid.Energy := 20;
      myAsteroid.Position.CopyCoords(Position);
      myAsteroid.Position.Velocity.ApplyForce(RandomSwing * 1, RandomSwing * 1, 0);
      myAsteroid.Position.Velocity.DeltaHeight := RandomSwing * 0.4;
    end;
  end;

  Cease;
end;

// ----------------------------------------------------------------------------
constructor TaiMoon.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cMoon;
  Rate := 0.2;
  Radius := 1;
  Size := 0.75;
  Position.SetPosition(Random*gWorldWidth, Random*gWorldHeight, 200);
  Position.Velocity.SetForce(0.01, 0.1, 0.0);
  Position.Mass := 100;
end;

// ----------------------------------------------------------------------------
procedure TaiMoon.Fuel;
var
//  myReach: integer;
  myExtend: TaiGrid;
begin
  inherited Fuel;

  // find random square by radius
  myExtend := TaiGrid(Position.Location);
  // cause a tide
  myExtend.SuckWater(0.1);

//  for myReach := 0 to Radius - 1 do
//    myExtend := myExtend.RandomConnection;

  // cool the square
  myExtend.AlterTemperature(-0.01);

end;

// ----------------------------------------------------------------------------
procedure TaiMoon.Explode;
var
  myAsteroid: TaiAsteroid;
  i: integer;
begin
  for i := 0 to 10 do
  begin
    myAsteroid := TaiGrid(Position.Location).NewThing(cAsteroid);
    if Assigned(myAsteroid) then
    begin
      myAsteroid.Energy := -15;
      myAsteroid.Position.CopyCoords(Position);
      myAsteroid.Position.Velocity.ApplyForce(RandomSwing * 1, RandomSwing * 1, 0);
      myAsteroid.Position.Velocity.DeltaHeight := RandomSwing * 0.4;
    end;
  end;

  Cease;
end;

// ----------------------------------------------------------------------------
constructor TaiAsteroid.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cAsteroid;

  Energy := 0;
  Size := Random(20);

  Position.Height := 750 + gThings.Counters[cAsteroid]*20.0;
  Position.Velocity.SetForce(0.0, 0.0, -1.0);
  Position.SetSize(2, 2, 2, true);
  Position.SetProperties(15, 0, 0);
  Position.DirectionH := Pi;
  Markers := 0;
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.Fuel;
begin
  inherited Fuel;

  if Position.Height <= Position.Land then
    Smash;

  if (Position.Height < 100) then
  begin
    if not Burning then
      Noise(cNoiseFall, 1);
    Burn;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiOrbiter.Fuel;
begin
  inherited Fuel;

  if (Position.Binding = bindLand) then Explode;
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.Smash;
var
  myExplosion: TaiExplosion;
  myEarthquake: TaiEarthquake;
  myLand: single;
  Location: TaiGrid;
begin
  Location := TaiGrid(Position.Location);

  // change temp
  Location.AlterTemperature(Energy+2);
  // make a crater
  myLand := Min(Location.Height, Size/2);
  if myLand > 0 then
  begin
    Location.AlterHeight(-1 * myLand);
    Location.RaiseSurroundingHeightsBy(myLand/5);
  end;
  // splash water
  if Location.UnderWater then
    Location.Splash(Location.SeaWater/2);

  myExplosion := nil;
  if (Energy >= 0) or (not Position.UnderWater) then
    myExplosion := TaiExplosion(Location.NewThing(cExplosion));
  Noise(cNoiseSmash, 1);
  if Assigned(myExplosion) then
  begin
    myExplosion.Position.CopyCoords(Position);
    myExplosion.Position.Velocity.Zero;
    myExplosion.Position.Acceleration.Zero;
    myExplosion.Effect := cEffectBlast;
    myExplosion.BlastRadius := 10;
    myExplosion.Strength := 0.0100;
    myExplosion.Diminish := 0.0001;
    myExplosion.Position.Fuel;
  end;

  // create or add to earthquake
  if gThings.Counters[cEarthquake] > 0 then
    myEarthquake := gThings.Tables[cEarthquake].FirstOfKind(cEarthquake)
  else
    myEarthquake := TaiEarthquake(Location.NewThing(cEarthquake));
  if Assigned(myEarthquake) then
  begin
    myEarthquake.Rumble := myEarthquake.Rumble + 0.2;
  end;

  Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.Burn;
begin
  fBurning := true;
  Size := Size - 0.1;
  if Size <= 0 then
    Cease; 
end;

// ----------------------------------------------------------------------------
procedure TaiSatellite.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fSize);
end;

// ----------------------------------------------------------------------------
procedure TaiSatellite.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fSize);
end;

// ----------------------------------------------------------------------------
procedure TaiOrbiter.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fRate);
  writeln(aFile, fRadius);
end;

// ----------------------------------------------------------------------------
procedure TaiOrbiter.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fRate);
  readln(aFile, fRadius);
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fEnergy);
  writeln(aFile, fSize);
  writeFileBoolean(aFile, fBurning);
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fEnergy);
  readln(aFile, fSize);
  fBurning := readFileBoolean(aFile);
end;

// ----------------------------------------------------------------------------
procedure TaiSatellite.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);
  aList.Add(Format('Size: %0.2f', [fSize]));
end;

// ----------------------------------------------------------------------------
procedure TaiOrbiter.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);
  aList.Add('Radius: ' + IntToStr(fRadius));
  aList.Add(Format('Rate: %0.2f', [fRate]));
end;

// ----------------------------------------------------------------------------
procedure TaiSun.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('Swing: ' + BoolToYesNoStr(fSwing));
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);
  aList.Add('Energy: ' + IntToStr(fEnergy));
  aList.Add(Format('Size: %0.2f', [fSize]));
  aList.Add('Burning: ' + BoolToYesNoStr(fBurning));
end;

// ----------------------------------------------------------------------------
procedure TaiOrbiter.Perform(aActivity: integer);
begin
  case aActivity of
    0: Explode;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiOrbiter.OnCollide(aCollider: TaiThing);
begin
  if aCollider is TaiSatellite then
    Explode;
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.Mark;
begin
  fMarkers := fMarkers + 1;
end;

// ----------------------------------------------------------------------------
procedure TaiAsteroid.UnMark;
begin
  fMarkers := fMarkers - 1;
end;

end.

