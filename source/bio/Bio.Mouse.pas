unit Bio.Mouse;

interface

uses
  System.Classes,
  System.SysUtils,

  Bio.BaseObject,
  Bio.Space,
  Bio.Things,
  Bio.Life,
  Bio.Creature;

const
  cMouseBaby = 0;
  cMouseAdult = 512;

type

// ============================================================================
AIMouse = class(TaiCreature)
protected
public
  constructor Create(aParent: pointer);
  procedure Fuel; override;
  function IsPrey: boolean; override;
end;

implementation //==============================================================

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
constructor AIMouse.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cMouse;
  Position.SetSize(0.5, 0.5, 0.5);
  Position.SetProperties(1, 0.5, 0.6);
end;

// ----------------------------------------------------------------------------
procedure AIMouse.Fuel;
begin
  inherited Fuel;

  if Random(512)=0 then
    Noise(cNoiseMouseHigh, 1);

  // example code to eat
  Forage(0.15);
  if Grabber.Holding then
    if Eat(128) then Noise(cNoiseMouseLow, 1);
end;

// ----------------------------------------------------------------------------
function AIMouse.IsPrey: boolean;
begin
  result := true;
end;

end.

