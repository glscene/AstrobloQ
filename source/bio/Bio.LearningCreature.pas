unit Bio.LearningCreature;
(*
  A learning creature.
  Everytime it eats something, it remembers facts about its food.
  It then finds the optimal food from its memory, based on
  how much it liked the food from before.  It finds the food based
  on how much "weight" it gives the food, divided by distance to food.
*)
interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,
  Bio.BaseObject,
  Bio.Things,
  Bio.ThingReferenceList,
  Bio.Position,
  Bio.Life,
  Bio.Link,
  Bio.Creature,
  Bio.ReportCard;

type

// ============================================================================
TaiLearningCreature = class(TaiCreature)
private
  fMemory: TaiReportList;          // memory of eaten things
  fSenses: TaiThingReferenceList;  // list of nearby things
  fTimer: integer;                // timer, measures effort to get food
  fSenseMemory: TStringList;      // text-version of fSenses
protected
  // look for food anywhere
  procedure LookForSomethingToEat; overload;
  // look for food in water, land, air, etc
  procedure LookForSomethingToEat(aBinding: integer); overload;
  // give up on a target
  procedure GiveUp;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  function Eat(const JawSize: integer): boolean; override;
  function FavoriteFood: integer;
  function YuckiestFood: integer;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
  // property
  property Memory: TaiReportList read fMemory;
  property Senses: TaiThingReferenceList read fSenses;
  property SenseMemory: TStringList read fSenseMemory;
  property Timer: integer read fTimer;
end;

implementation //==============================================================

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Vibes;

// ----------------------------------------------------------------------------
constructor TaiLearningCreature.Create(aParent: pointer);
begin
  inherited Create(aParent);

  fMemory := TaiReportList.Create(true);
  fSenses := TaiThingReferenceList.Create(self);
  fSenseMemory := TStringList.Create;
end;

// ----------------------------------------------------------------------------
destructor TaiLearningCreature.Destroy;
begin
  fMemory.Free;
  fSenses.Free;
  fSenseMemory.Free;

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiLearningCreature.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('MEMORY------------------------------');
  fMemory.FullDisplay(aList);
  aList.Add('SENSES------------------------------');
//  aList.AddStrings(fSenseMemory);
end;

// ----------------------------------------------------------------------------
procedure TaiLearningCreature.LookForSomethingToEat;
var
  i: integer;
  myThing: TaiThing;
  myTarget: TaiThing;
  BestWeight, ReportWeight: single;
begin
  fSenses.Clear;
  gThings.Tangibles.NearestNeighbours(Position, 10, fSenses);
  fSenseMemory.Clear;
  fSenses.FullDisplay(fSenseMemory);  // store for display
  myTarget := nil;
  BestWeight := -1;

  for i := 0 to fSenses.Count - 1 do
  begin
    myThing := TaiThing(fSenses.Items[i]);
    // make sure its not the same kind
    if not (myThing.Kind = Kind) then
    begin
      ReportWeight := fMemory.ReportWeight(myThing.Kind) / Position.DistancePlusHeightTo(myThing.Position);
      fTimer := gReality.Time;
      if ReportWeight > BestWeight then
      begin
        BestWeight := ReportWeight;
        myTarget := myThing;
      end;
    end;
  end;

  if myTarget <> nil then
    Eyes.AssignTarget(myTarget);
end;

// ----------------------------------------------------------------------------
procedure TaiLearningCreature.LookForSomethingToEat(aBinding: integer);
var
  i: integer;
  myThing: TaiThing;
  myTarget: TaiThing;
  BestWeight, ReportWeight: single;
begin
  fSenses.Clear;
  gThings.Tangibles.NearestNeighbours(Position, 10, fSenses);
  fSenseMemory.Clear;
  fSenses.FullDisplay(fSenseMemory);  // store for display
  myTarget := nil;
  BestWeight := -1;

  for i := 0 to fSenses.Count - 1 do
  begin
    myThing := TaiThing(fSenses.Items[i]);
    // make sure its not the same kind
    if not (myThing.Kind = Kind) and (myThing.Position.Binding = aBinding) then
    begin
      ReportWeight := fMemory.ReportWeight(myThing.Kind) / Position.DistancePlusHeightTo(myThing.Position);
      fTimer := gReality.Time;
      if ReportWeight > BestWeight then
      begin
        BestWeight := ReportWeight;
        myTarget := myThing;
      end;
    end;
  end;

  if myTarget <> nil then
    Eyes.AssignTarget(myTarget);
end;

// ----------------------------------------------------------------------------
procedure TaiLearningCreature.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fTimer);
  fMemory.LoadFromFile(aFile);
end;

// ----------------------------------------------------------------------------
procedure TaiLearningCreature.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fTimer);
  fMemory.SaveToFile(aFile);
end;

// ----------------------------------------------------------------------------
// try to eat whatever the creature is holding
function TaiLearningCreature.Eat(const JawSize: integer): boolean;
var
  myThing: TaiThing;
  myPreviousHealth: integer;
  myChange: integer;
begin
  myThing := Grabber.Target;
  // remember last health
  myPreviousHealth := Health;

  result := inherited Eat(JawSize);

  myChange := Health - myPreviousHealth;

  if myChange > 0 then
    fMemory.AddReport(myThing.Kind, true, myChange, gReality.Time-fTimer+1)
  else
  begin
    fMemory.AddReport(myThing.Kind, false, myChange, gReality.Time-fTimer+1);
    Talk('"This ' + ThingName(myThing.Kind) + ' is yucky."', 10, 32);
    Drop;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiLearningCreature.GiveUp;
var
  myThing: TaiThing;
begin
  if Eyes.ValidTarget then
  begin
    myThing := Eyes.Target;
    Talk('"I couldnt catch that ' + ThingName(Eyes.Target.Kind) + '."', 10, 32);
    fMemory.AddReport(myThing.Kind, false, 1, gReality.Time-fTimer+1)
  end;
end;

// ----------------------------------------------------------------------------
function TaiLearningCreature.FavoriteFood: integer;
begin
  result := Memory.HighestWeight;
end;

// ----------------------------------------------------------------------------
function TaiLearningCreature.YuckiestFood: integer;
begin
  result := Memory.LowestWeight;
end;

end.

