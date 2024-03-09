unit Bio.Cube;

// unused 

interface

uses 
  System.Classes, 
  Bio.BaseObject, 
  Bio.Things,
  Bio.Position, 
  Bio.Life;

type

// ============================================================================
// an individual Cube
AICube = class(AIThing)
private

public

end;

// ============================================================================
// an individual Cube
AINet = class(AIThing)
private
  fScore: integer;
  fNetSize: single;
  fTeamOwner: AIThing;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;

  property Score: integer read fScore write fScore;
  property NetSize: single read fNetSize write fNetSize;
  property TeamOwner: AIThing read fTeamOwner write fTeamOwner;

  procedure Fuel; override; // add time
  procedure Goal;

  procedure Perform(aActivity: integer); override;
end;

implementation

uses
  Bio.Reality, 
  System.SysUtils, 
  Geometry, 
  Bio.Globals, 
  Bio.Creature, 
  Bio.Vibes, 
  cAIGoalBot;

// ----------------------------------------------------------------------------
constructor AINet.Create(aParent: pointer);
begin
  inherited Create(aParent);

end;

// ----------------------------------------------------------------------------
destructor AINet.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure AINet.Fuel;
begin
  if gEnvironment.Things.Existents.HasKindWithinDistance(cBall, Position, NetSize) then
    Goal;
end;

// ----------------------------------------------------------------------------
procedure AINet.Goal;
var
  myBall: AIThing;
begin
  myBall := gEnvironment.Things.Tables[cBall].NearestOfKind(cBall, Position, NetSize);

  if not (myBall = nil) then
  begin
    if myBall.Position.Carried then
      AICreature(myBall.Position.Carrier).Drop;

//    Noise(cNoiseScore, 1);
    Score := Score + 1;
    myBall.Position.SetPosition(Random * 2 - 1, Random * 2 - 1, 10);
    myBall.Position.Velocity.Zero;
    myBall.Position.Acceleration.ApplyForce(0, 0, -0.75);

    gEnvironment.Things.ResetTeams;
  end;
end;

// ----------------------------------------------------------------------------
procedure AINet.Perform(aActivity: integer);
begin
  case aActivity of
    0: Score := 0;
    1: Score := Score + 1;
    2: Score := Score - 1;
  end;
end;

end.

