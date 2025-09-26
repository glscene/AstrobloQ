unit Bio.GeneticCreature;
(*
  Genetic creatures
*)

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  Bio.Creature,
  Bio.Things,
  Bio.Life,
  Bio.Link,
  Bio.DNA,
  Bio.MatingSingle;

const
  cDNA = 0;

type

// ============================================================================
TaiGeneticCreature = class(TaiMatingSingleCreature)
private
  fDNA: TaiDNA;
protected
  procedure MateWithPartner; override;
public
  // create and delete
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  // user-interface and bot-interface
  procedure Perform(aActivity: integer); override;
  // DNA access
  function HasDNA: boolean; override;
  function GetDNA: pointer; override;
  // file load/save routines
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
  // display routines
  function OneLineDisplay: string; override;
  procedure FullDisplay(aList: TStrings); override;
  // property
  property DNA: TaiDNA read fDNA;
end;

implementation //=============================================================

uses
  Bio.Utilities,
  Bio.Globals,
  Bio.Vibes,
  Bio.Position,
  Bio.Community;

// ----------------------------------------------------------------------------
constructor TaiGeneticCreature.Create(aParent: pointer);
begin
  inherited Create(aParent);
  fDNA := TaiDNA.Create;
  fDNA.CopyFrom(TaiDNA(gThings.Forms.Items[Kind]));
end;

// ----------------------------------------------------------------------------
destructor TaiGeneticCreature.Destroy;
begin
  fDNA.Free;
  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiGeneticCreature.Perform(aActivity: integer);
begin
  inherited Perform(aActivity);
  case aActivity of
    10: ; //Evolve;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiGeneticCreature.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  DNA.SaveToFile(aFile);
end;

// ----------------------------------------------------------------------------
procedure TaiGeneticCreature.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  DNA.LoadFromFile(aFile);
end;

// ----------------------------------------------------------------------------
function TaiGeneticCreature.OneLineDisplay: string;
begin
  result := inherited OneLineDisplay;
end;

// ----------------------------------------------------------------------------
procedure TaiGeneticCreature.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);
  DNA.FullDisplay(aList);
end;

// ----------------------------------------------------------------------------
// assumes in a community
// assumes has a partner
procedure TaiGeneticCreature.MateWithPartner;
var
  myMate: TaiGeneticCreature;
  myBaby: TaiGeneticCreature;
begin
  if not Partner.ValidTarget then exit;
  myMate := TaiGeneticCreature(Partner.Target);

  // move towards mate
  Position.TurnTowardsTarget(myMate.Position, ca30);

  if not myMate.Alive then begin Partner.InvalidateTarget; exit; end;
  if not Female then exit;
  if not gThings.CanAdd(Kind) then exit;
  if not CloseEnoughToGrab(myMate) then exit;
  if gReality.Time < MatingTimer then exit;

  // close to mate, so make a baby
  myBaby := TaiGeneticCreature(gThings.NewThing(Kind));
  myBaby.Position.FullCopy(Position);
  Health := Health - 512;
  myBaby.Health := 512;
  // inhereit DNA from mother and father
  myBaby.DNA.Combine(myMate.DNA, DNA);
  myBaby.DevelopIntoBaby;
  MatingTimer := gReality.Time + 128;

  Partner.InvalidateTarget;
end;

// ----------------------------------------------------------------------------
function TaiGeneticCreature.HasDNA: boolean;
begin
  result := true;
end;

// ----------------------------------------------------------------------------
function TaiGeneticCreature.GetDNA: pointer;
begin
  result := fDNA;
end;

end.
