unit Bio.Fish;
(*
  The unit for fishes
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
  Bio.Mating;

const
  cFishBaby = 0;
  cFishAdult = 512;

type

// ============================================================================
TaiFish = class(AIMatingCreature)
protected
  procedure Swim;
  procedure Flop;
  procedure FindFood;
  procedure DevelopIntoBaby; override;
  procedure Grow(aAmount: single); override;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure Die; override;
  function IsPrey: boolean; override;
  procedure Fuel; override;
end;

implementation //--------------------------------------------------------------

uses
  Bio.Reality, Bio.Environment,
  Bio.Grid,
  Bio.Position,
  Bio.Globals,
  Bio.Vibes,
  Bio.Utilities,
  Bio.Flora;

// ----------------------------------------------------------------------------
constructor TaiFish.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cFish;

  Size := Random * 0.3 + 0.3;
  Health := 3100;
  Position.SetSize(Size, Size/4, Size/4, true);
  Position.SetProperties(1, 0.5, 0.5);
end;

// ----------------------------------------------------------------------------
destructor TaiFish.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiFish.Fuel;
begin
  inherited Fuel;

  if (Size < 1) and (Health > 1536) then
  begin
    Grow(0.0002);
  end;

  desire := cDesireNone;
  if (Health < 2048) and not Grabber.Holding then
    desire := cDesireFood
  else
  begin
    case Stage of
      cCreatureBaby:  desire := cDesireWander;
      cCreatureAdult: desire := cDesireMate;
      cCreatureElder: desire := cDesireWander;
    end;
  end;

  // eat
  if Grabber.Holding then
  begin
    Eat(16);
    if Grabber.Empty then
    begin
      if (Size < 1) then
        Grow(0.001);
      Noise(cNoiseEat, 1);
    end;
  end;

  // if not underwater, try to get in water, and quit
  if not Position.UnderWater then
  begin
    if Position.Binding = bindLand then
      Flop;
    exit;
  end;

  // find food
  case desire of
    cDesireFood:    FindFood;
    cDesireWander:  SwimWithCommunity;
    cDesireMate:
    begin
      SwimWithCommunity;
      MatingBehaviour;
      if Partner.ValidTarget then
        Swim;
      Position.TurnTowardsVelocity(ca30);
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiFish.Swim;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.075);
  Position.Velocity.LimitSpeed(0.1);
end;

// ----------------------------------------------------------------------------
procedure TaiFish.Flop;
begin
  Position.Acceleration.ApplyAngularForce(Random*TwoPi, 0.9, 0.1);
end;

// ----------------------------------------------------------------------------
procedure TaiFish.FindFood;
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
      Position.TurnTowardsTarget(myThing.Position, ca45);
      // stay under water until close to food
      if Position.SimpleDistanceToXY(myThing.Position) < 5 then
//      if Position.DistanceTo(myThing.Position) < 5 then
        targetHeight := myThing.Position.Height;
      // if close to food, then pick it up
      if CloseEnoughToGrab(myThing) then
      begin
        // put food in mouth
        if not myThing.Position.Carried then
          Grab(myThing)
        else
          if Age mod 16 = 0 then
          begin
            Bonk(TaiThing(myThing.Position.Carrier));
            Eyes.InvalidateTarget;
          end;
      end;
    end
    else
    begin
      // find a fruit
      if Random(8) <> 0 then
        myThing := gThings.Fruits.NearestAvailableUnderwaterThing(Position, cFish)
      else
        myThing := gThings.Prey.NearestAvailableUnderwaterThing(Position, cFish);

      if myThing <> nil then
      begin
        if myThing.Position.UnderWater then
          Eyes.AssignTarget(myThing);
      end;
      Position.DirectionXY := Position.DirectionXY + RandomSwing * QuarterPi;
    end;

  // move
  if Position.UnderWater and (Age mod 4 = 0) then
  begin
    if Position.Height > targetHeight then
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight - 0.1
    else
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.1;

    if Bump then
      AvoidNeighbour;
    Swim;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiFish.Die;
begin
  inherited Die;

  // when the fish dies, it floats
  Position.Buoyancy := 0.6;
end;

// ----------------------------------------------------------------------------
procedure TaiFish.DevelopIntoBaby;
begin
  Size := 0.1;
  Position.SetSize(Size, Size, Size/4);
end;

// ----------------------------------------------------------------------------
procedure TaiFish.Grow(aAmount: single);
begin
  Size := Size + aAmount;
  Position.SetSize(Size, Size/4, Size/4);
end;

// ----------------------------------------------------------------------------
function TaiFish.IsPrey: boolean;
begin
  result := true;
end;

end.

