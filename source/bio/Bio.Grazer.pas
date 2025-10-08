unit Bio.Grazer;
(*
  The grazers and cows
*)
interface

uses
  System.Classes,
  System.SysUtils,

  Stage.VectorGeometry,
  Bio.BaseObject,
  Bio.Things,
  Bio.Community,
  Bio.Position,
  Bio.Life,
  Bio.Link,
  Bio.Creature,
  Bio.Mating;

type

// ============================================================================
// an individual Grazer
TaiGrazer = class(TaiMatingCreature)
protected
  procedure WalkWithCommunity;
  procedure FindFood;
  procedure DevelopIntoBaby; override;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure Fuel; override;
end;

implementation // ============================================================

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Vibes,
  Bio.Utilities;

// ----------------------------------------------------------------------------
constructor TaiGrazer.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cGrazer;
  Health := 1000;
  DevelopIntoBaby;
end;

// ----------------------------------------------------------------------------
destructor TaiGrazer.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiGrazer.Fuel;
begin
  inherited Fuel;

  // determine desire
  desire := cDesireNone;
  if (Health < 4000) then
    desire := cDesireFood
  else
  begin
    case Sexstage of
      cCreatureBaby:  desire := cDesireWander;
      cCreatureAdult: desire := cDesireMate;
      cCreatureElder: desire := cDesireWander;
    end;
  end;

  case desire of
    cDesireFood: FindFood;
    cDesireWander: WalkWithCommunity;
    cDesireMate:
    begin
      MatingBehaviour;
      WalkWithCommunity;
    end;
  end;

  if Grabber.Holding then
  begin
    if Eat(64) then
    begin
      Noise(cNoiseEat, 1);
      if Size < 2 then
        Size := Size + 0.03;
      Position.SetSize(Size*2.5, Size*2.5, Size*2.5);
      Position.Mass := Position.SizeY;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiGrazer.FindFood;
var
  myThing: TaiThing;
begin
  if (desire = cDesireFood) and not Grabber.Holding then
  begin
    // apple is in sight
    if Eyes.ValidTarget then
    begin
      myThing := Eyes.Target;

      if myThing.Position.Carried then
        Eyes.InvalidateTarget;

      if myThing.Position.Underwater then
        Eyes.InvalidateTarget;
    end;

    if Eyes.ValidTarget then
    begin
      myThing := Eyes.Target;
      Position.TurnTowardsTarget(myThing.Position, ca30);
      if Position.Velocity.XYStrength < 0.075 then
        Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.075);
      if (Position.DistancePlusHeightTo(myThing.Position) < 1.5) then
        Grab(myThing);
    end
    else // find apple
    begin
      myThing := gEnvironment.Things.Fruits.NearestAvailableNotUnderWaterThing(Position);
      if not (myThing = nil) then
        Eyes.AssignTarget(myThing);
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiGrazer.WalkWithCommunity;
var
  myCommunity: TaiCommunity;
  myForce: TAffineVector;
begin
  // in a Community?
  if Community.ValidTarget then
  begin
    myCommunity := TaiCommunity(Community.Target);

    if myCommunity.Position.UnderWater then
      exit;
    // Boids
    // http://www.vergenet.net/~conrad/boids/pseudocode.html
    // Rule 1: Boids try to fly towards the centre of mass of neighbouring boids.
    myForce.X := (myCommunity.Center.X - Position.X) / 400;
    myForce.Y := (myCommunity.Center.Y - Position.Y) / 400;
    myForce.Z := 0;
    // Rule 3: Boids try to match velocity with near boids.
    myForce.X := myForce.X + myCommunity.Velocity.X;
    myForce.Y := myForce.Y + myCommunity.Velocity.Y;
    myForce.Z := myForce.Z + myCommunity.Velocity.Z;
    // Limiting the speed
    LimitVector(myForce, 0.1);
    // Face direction of velocity
    Position.TurnTowardsVector(myForce, ca15);
    // move
    Position.Acceleration.ApplyAngularForce(Position.DirectionXY, VectorLength(myForce));
  end
  else // not in a Community
    JoinCommunity;
end;

// ----------------------------------------------------------------------------
procedure TaiGrazer.DevelopIntoBaby;
begin
  Size := 0.4;
  Position.SetSize(Size*2.5, Size*2.5, Size*2.5);
  Position.Mass := Position.SizeY;
end;

end.

