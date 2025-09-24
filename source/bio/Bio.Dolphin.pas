unit Bio.Dolphin;
(*
  The dolphin of different sizes jumping in the water
*)

interface

uses
  System.Classes,
  System.SysUtils,
  Bio.BaseObject,
  Bio.Space,
  Bio.Things,
  Bio.Life,
  Bio.Creature,
  Bio.Community,
  Bio.Position;

const
  cDolphinBaby = 0;
  cDolphinAdult = 512;

  // animations
  cFlipperUp = 0;
  cFlipperFlat = 1;
  cFlipperDown = 2;
  cFlipperJump = 3;

type

// ============================================================================
TaiDolphin = class(TaiCommunityCreature)
private
  fSensor: TaiPosition;  // used to detect land/water
  fFlipper: integer;    // animation state
protected
  procedure Swim;
  procedure Flop;
  procedure FindFood;
  procedure Jump;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  property Sensor: TaiPosition read fSensor;
  property Flipper: integer read fFlipper;
  procedure Fuel; override;
  procedure FullDisplay(aList: TStrings); override;
end;

implementation //-------------------------------------------------------------

uses
  Bio.Reality,
  Bio.Environment,
  Bio.Grid,
  Bio.Globals,
  Bio.Vibes,
  Bio.Utilities,
  Bio.Flora;

// ----------------------------------------------------------------------------
constructor TaiDolphin.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cDolphin;

  fSensor := TaiPosition.Create(self);
  fFlipper := cFlipperFlat;

  Kind := cDolphin;
  Desire := cDesireWander;

  Size := 16;
  Health := 4100;
  Position.SetSize(2, 2, 1, true);
  Position.SetProperties(3, 0.25, 0);
end;

// ----------------------------------------------------------------------------
destructor TaiDolphin.Destroy;
begin
  fSensor.Free;

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiDolphin.Fuel;
begin
  inherited Fuel;

  case desire of
    cDesireFood: if Health > 4000 then Desire := cDesireWander;
    cDesireWander: if Health < 2048 then Desire := cDesireFood;
  end;

{  desire := cDesireNone;
  if (Health < 2048) and not Grabber.Holding then
    desire := cDesireFood
  else
    desire := cDesireWander;}

  // find food
  case desire of
    cDesireFood:    FindFood;
    cDesireWander:  if Position.UnderWater then
    begin
      Position.DirectionXY := 0;
      if Position.Height < (Position.Water - 2) then
        Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.05;
      Swim;
//      if Bump then AvoidNeighbour;
    end;
    //if Position.UnderWater then SwimWithCommunity;
  end;

  Sensor.FullCopy(Position);
  Sensor.ApplyForce(Position.DirectionXY, 6);
  Sensor.Height := 0;
  Sensor.Fuel;
  if Sensor.Land >= Sensor.Water then
//  if not Sensor.UnderWater then
    if Position.UnderWater then
      Jump;

  if not Position.UnderWater then
  begin
    if Position.Binding = bindLand then
      Flop;
  end;

  // eat
  if Grabber.Holding then
  begin
    Eat(32);
    if Grabber.Empty and (Size < 1024) then
    begin
      Size := Size + 1;
      Noise(cNoiseEat, 1);
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiDolphin.Swim;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.075);
  if Age mod 8 = 0 then
  begin
    fFlipper := fFlipper + 1;
    if fFlipper >= 3 then fFlipper := 0;
  end;
  Position.Velocity.LimitSpeed(0.4);
end;

// ----------------------------------------------------------------------------
procedure TaiDolphin.Jump;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.3, 2.2);
  fFlipper := cFlipperJump;
end;

// ----------------------------------------------------------------------------
procedure TaiDolphin.Flop;
begin
  Position.Acceleration.ApplyAngularForce(Random*TwoPi, 0.9, 0.1);
end;

// ----------------------------------------------------------------------------
procedure TaiDolphin.FindFood;
var
  myThing: TaiThing;
  targetHeight: single;
begin
  targetHeight := Position.Water - 2;
    // has food in sight
    if Eyes.ValidTarget then
    begin
      myThing := Eyes.Target;
      // turn towards food
      Position.TurnTowardsTarget(myThing.Position, ca30);
      // stay under water until close to food
      if Position.DistanceTo(myThing.Position) < 5 then
        targetHeight := myThing.Position.Height;
      // if close to food, then pick it up
      if (Position.DistancePlusHeightTo(myThing.Position) < 1.5) then
      begin
        // put food in mouth
        if not myThing.Position.Carried then
          Grab(myThing)
        else
          Bonk;
      end;
    end
    else
    begin
      // find a fruit
      myThing := gThings.Fruits.NearestThing(Position);
      if myThing <> nil then
      begin
        if myThing.Position.UnderWater then
          Eyes.AssignTarget(myThing);
      end;
      Position.DirectionXY := Position.DirectionXY + RandomSwing * QuarterPi;
    end;
  // move
  if Position.UnderWater then
  begin
    if Position.Height > targetHeight then
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight - 0.1
    else
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.1;
    Swim;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiDolphin.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('Flipper: ' + IntToStr(fFlipper));
  aList.Add('Sensor--------------------------');
  fSensor.FullDisplay(aList);
end;

end.

