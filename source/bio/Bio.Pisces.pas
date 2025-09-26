unit Bio.Pisces;
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

  cSharkBaby = 0;
  cSharkAdult = 512;

type

(* The fish *)
TaiFish = class(TaiMatingCreature)
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

(* The shark *)
TaiShark = class(TaiCreature)
protected
  procedure Swim;
  procedure Dart;
public
  constructor Create(aParent: pointer);
  procedure Fuel; override;
  function IsPredator: boolean; override;
end;

implementation // =============================================================

uses
  Bio.Reality,
  Bio.Environment,
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
  //
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

// ========================== TaiShark =======================================
constructor TaiShark.Create(aParent: pointer);
begin
  inherited Create(aParent);
  Kind := cShark;

  Size := 32;
  Health := 5024;
  Position.SetSize(2.5, 0.75, 0.5, true);
  Position.SetProperties(1, 0.5, 0.5);
end;

// ----------------------------------------------------------------------------
procedure TaiShark.Fuel;
var
  myThing: TaiThing;
  targetHeight: single;
begin
  inherited Fuel;

  desire := cDesireNone;
  if (Health < 4096) and not Grabber.Holding then
    desire := cDesireFood
  else
    desire := cDesireWander;

  targetHeight := Position.Water - 4;

  // find food
  if desire = cDesireFood then
  begin
    // has food in sight
    if Eyes.ValidTarget then
    begin
      myThing := Eyes.Target;
      // turn towards food
      Position.TurnTowardsTarget(myThing.Position, ca30);
//      Position.FaceTarget(myThing.Position);
      // stay under water until close to food
      if Position.DistanceTo(myThing.Position) < 5 then
        targetHeight := myThing.Position.Height;
      // if close to food, then pick it up
      if (Position.DistancePlusHeightTo(myThing.Position) < 2) then
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
      // find a fish, or a duck
      if Random(16) <> 0 then
        Eyes.AssignTarget(gThings.Tables[cFish].NearestAvailableUnderwaterThing(Position, cShark))
      else
        Eyes.AssignTarget(gThings.Tables[cDuck].NearestAvailableUnderwaterThing(Position, cShark));
    end;
  end;

  if desire = cDesireWander then
  begin
    if Age mod 16 = 0 then
      Position.DirectionXY := Position.DirectionXY + RandomSwing * SixteenthPi;
  end;

  // move
  if Position.UnderWater and (Age mod 4 = 0) then
  begin
    if targetHeight < Position.Land + 1 then
      targetHeight := Position.Land + 1;

    if Position.Height > targetHeight then
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight - 0.1
    else
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.1;

    if Desire = cDesireFood then Dart;
    Swim;
  end;

  if not Position.UnderWater then
  begin
    Health := Health - 32;
    Position.DirectionXY := Position.DirectionXY + RandomSwing * QuarterPi/2;
    if Position.Binding = bindLand then
      Position.Acceleration.ApplyForce(0, 0, 0.05);
  end;

  // eat
  if Grabber.Holding then
  begin
    Eat(64);
    if Grabber.Empty and (Size < 1024) then
    begin
//      Size := Size + 1;
      Noise(cNoiseEat, 1);
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiShark.Swim;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.09);
end;

// ----------------------------------------------------------------------------
procedure TaiShark.Dart;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.12);
end;

// ----------------------------------------------------------------------------
function TaiShark.IsPredator: boolean;
begin
  result := true;
end;


end.

