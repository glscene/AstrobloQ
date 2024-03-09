unit Bio.Ant;
(*
  An individual Ant
*)
interface

uses
  System.Classes,
  System.SysUtils,
  Bio.BaseObject,
  Bio.Things,
  Bio.Position,
  Bio.Life,
  Bio.Link,
  Bio.Creature,
  Bio.Community;

type

// ============================================================================
AIAnt = class(AICommunityCreature)
private
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure Fuel; override;
  function IsPrey: boolean; override;
end;

implementation

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Trees,
  Bio.Bird,
  Bio.Vibes,
  Bio.Utilities;

// ----------------------------------------------------------------------------
constructor AIAnt.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cAnt;
  Health := 4000;
  Desire := cDesireWander;
  Position.SetSize(0.2, 0.2, 0.2);
  Position.SetProperties(1, 0.3, 0.9);
end;

// ----------------------------------------------------------------------------
destructor AIAnt.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure AIAnt.Fuel;
begin
  inherited Fuel;

  // example code to eat grass
  Forage(0.02);
  if Grabber.Holding then
    if Eat(128) then Noise(cNoiseEat, 1);
end;

// ----------------------------------------------------------------------------
function AIAnt.IsPrey: boolean;
begin
  result := true;
end;

end.

