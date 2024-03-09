unit Bio.Grass;

interface

uses 
  System.Classes, 
  System.SysUtils,
  Bio.BaseObject, 
  Bio.Space, 
  Bio.Things, 
  Bio.Life, 
  Bio.Trees;

type

// ============================================================================
AIGrass = class(AIPlant)
private
public
  constructor Create(aParent: pointer);

  procedure Fuel; override;
  procedure Grow;
  function IsFruit: boolean; override;
end;

implementation

uses
  Bio.Reality, 
  Bio.Environment, 
  Bio.Grid, 
  Bio.Utilities,
  Bio.Vibes, 
  Bio.Globals,
  Bio.Position;

// ----------------------------------------------------------------------------
constructor AIGrass.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cGrass;
  Health := 5024;
  Position.SetSize(1, 0.2, 0.2, true);
  Position.SetProperties(1, 0.1, 0.25);
  Position.Collider := false;

  Water := 0.05;
  Health := 64;
end;

// ----------------------------------------------------------------------------
procedure AIGrass.Fuel;
begin
  inherited Fuel;

  if (Age mod 128 = 0) then
    Grow;

  if Water < 0.5 then
    Water := Water + 0.01;

  if (Position.Binding = bindLand) and not Position.UnderWater then
    Health := Health + 1;
end;

// ----------------------------------------------------------------------------
procedure AIGrass.Grow;
var
  myGrass: AIGrass;
begin
//  if gThings.Existents.HasKindWithinDistance(cGrass, Position, 1) then
//    exit;
  if not gThings.CanAdd(cGrass) then
    exit;

  myGrass := AIGrass(gThings.NewThing(cGrass));
  myGrass.Position.FullCopy(Position);
  myGrass.Position.DirectionXY := Random * TwoPi;
  myGrass.Position.MoveBy(1);
  myGrass.Position.Height := 0;
end;

// ----------------------------------------------------------------------------
function AIGrass.IsFruit: boolean;
begin
  result := true;
end;

end.

