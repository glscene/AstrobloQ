unit Bio.Mating;
(*
 For a living organism to mate with another organism of the same species,
 they must be in the same community.
*)
interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,
  System.Types,
  Bio.BaseObject,
  Bio.Things,
  Bio.Position,
  Bio.Life,
  Bio.Link,
  Bio.Creature,
  Bio.Community;

const
  cCreatureBaby = 0;
  cCreatureAdult = 1;
  cCreatureElder = 2;

type

// ============================================================================
TaiMatingCreature = class(TaiCommunityCreature)
private
  fPartner: TaiLink;     // potential reproductive partner
  fFemale: boolean;      // true for femail, false для mail
  fStage: integer;       // stage of sexual reproduction
  fMatingTimer: integer; // timer to delay mating
protected
  procedure MatingBehaviour;
  procedure FindMate;
  procedure MateWithPartner; virtual;
  procedure DevelopIntoBaby; virtual; abstract;
  procedure FindMateNoRestraints;
  procedure MatingBehaviourNoRestraints;
  procedure MateWithPartnerNoRestraints; virtual; abstract;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure Fuel; override;
  procedure Die; override;
  procedure Cease; override;
  function OneLineDisplay: string; override;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
  // property
  property Partner: TaiLink read fPartner;
  property Female: boolean read fFemale write fFemale;
  property Stage: integer read fStage write fStage;
  property MatingTimer: integer read fMatingTimer write fMatingTimer;
end;

implementation // ============================================================

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Flora,
  Bio.Vibes,
  Bio.Utilities,
  Bio.Pisces;

// ----------------------------------------------------------------------------
constructor TaiMatingCreature.Create(aParent: pointer);
begin
  inherited Create(aParent);

  fPartner := gEnvironment.References.NewLink(self);
  // random gender
  if Random(2) = 0 then
    fFemale := false
  else
    fFemale := true;
  fStage := cCreatureBaby;
  fMatingTimer := 0;
end;

// ----------------------------------------------------------------------------
destructor TaiMatingCreature.Destroy;
begin
  gEnvironment.References.Remove(fPartner);
  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.Fuel;
begin
  inherited Fuel;
  case fStage of
    cCreatureBaby:  if Age > 1024 then fStage := cCreatureAdult;
    cCreatureAdult: if Age > 9500 then fStage := cCreatureElder;
    cCreatureElder: if Age > 10000 then Die;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.Die;
begin
  inherited Die;

  fPartner.InvalidateTarget;
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.Cease;
begin
  fPartner.InvalidateTarget;
  inherited Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  fPartner.SaveToFile(aFile);
  writeFileBoolean(aFile, fFemale);
  writeln(aFile, fStage);
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  fPartner.LoadFromFile(aFile);
  fFemale := readFileBoolean(aFile);
  readln(aFile, fStage);
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.MatingBehaviour;
begin
  // must be in a community
  if not Community.ValidTarget then
    exit;
  // must be room in the community for a baby
  if TaiCommunity(Community.Target).Full then
  begin
    Partner.InvalidateTarget;
    exit;
  end;

  // Search of a partner
  if not Partner.ValidTarget then
    FindMate
  else
    // if female, mate with partner
    if (Health >= 1024) then
      MateWithPartner;
end;

// ----------------------------------------------------------------------------
// assumes in a community
procedure TaiMatingCreature.FindMate;
var
  myCommunity: TaiCommunity;
  i: integer;
  myMate: TaiMatingCreature;
begin
  myCommunity := TaiCommunity(Community.Target);
  // if too many in this community, dont breed
  if myCommunity.Full then exit;
  // find a mate
  for i := 0 to myCommunity.Members.Count - 1 do
  begin
    myMate := TaiMatingCreature(myCommunity.Members[i]);
    if (Female <> myMate.Female)
    and (myMate.Stage = cCreatureAdult)
    and ((myMate.Partner.Target = nil) or (myMate.Partner.Target = self)) 
    then
      Partner.AssignTarget(myMate);
  end;
end;

// ----------------------------------------------------------------------------
// assumes in a community
// assumes has a partner
procedure TaiMatingCreature.MateWithPartner;
var
  myMate: TaiMatingCreature;
  myBaby: TaiMatingCreature;
  myCommunity: TaiCommunity;
begin
  if not Partner.ValidTarget then exit;
  if not Community.ValidTarget then exit;

  myMate := TaiMatingCreature(Partner.Target);

  // turn towards mate
  Position.TurnTowardsTarget(myMate.Position, ca30);

  myCommunity := TaiCommunity(Community.Target);
  if myCommunity.Full then exit;

  if not myMate.Alive then begin Partner.InvalidateTarget; exit; end;
  if not gThings.CanAdd(Kind) then exit;
  if not Female then exit;
  if not CloseEnoughToGrab(myMate) then exit;
  if gReality.Time < MatingTimer then exit;

  // close to mate, so make a baby
  myBaby := TaiMatingCreature(gThings.NewThing(Kind));
  myBaby.Position.FullCopy(Position);
  myBaby.Position.Y := myBaby.Position.Y + Position.SizeY;
  Health := Health - 512;
  myBaby.Health := 512;
  myBaby.DevelopIntoBaby;
  MatingTimer := gReality.Time + 128;
  TaiCommunity(Community.Target).AddMember(myBaby);
  Partner.InvalidateTarget;
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('Partner: ' + Partner.OneLineDisplayRight);
  aList.Add('Female/Male: ' + BoolToGender(fFemale));
  case fStage of
    cCreatureBaby:  aList.Add('Стадия: Юный');
    cCreatureAdult: aList.Add('Стадия: Взрослый');
    cCreatureElder: aList.Add('Стадия: Старый');
  end;

end;

// ----------------------------------------------------------------------------
function TaiMatingCreature.OneLineDisplay: string;
begin
  result := GetName + ' ' + IntToStr(Handle) + ' ';

  if Female then
    result := result + 'Female'
  else
    result := result + 'Male';

  case fStage of
    cCreatureBaby: result := result + ' Young';
    cCreatureAdult: result := result + ' Adult';
    cCreatureElder: result := result + ' Elder';
  end;

  if Dead then
    result := result + ' Dead Rot=' + IntToStr(Rot);

  result := result
    + Format(' Health=%d Age=%0d Desire=%d-', [Health, Age, Desire]);

  case Desire of
    cDesireNone: result := result + 'None ';
    cDesireFood: result := result + 'Food ';
    cDesireWander: result := result + 'Wander ';
    cDesireMate: result := result + 'Mate ';
    cDesireEat: result := result + 'Eat ';
    cDesireLand: result := result + 'Land ';
    cDesireRetire: result := result + 'Retire ';
  end;

  result := result + Position.OneLineDisplay;
end;

// ----------------------------------------------------------------------------
procedure TaiMatingCreature.MatingBehaviourNoRestraints;
begin
  // look for a partner
  if not Partner.ValidTarget then
    FindMateNoRestraints
  else
    // if female, mate with partner
    if (Health >= 1024) then
      MateWithPartnerNoRestraints;
end;

// ----------------------------------------------------------------------------
// find nearest possible mate
procedure TaiMatingCreature.FindMateNoRestraints;
var
  i: integer;
  myMate: TaiMatingCreature;
  closest: single;
  distance: single;
begin
  // find a mate
  closest := 1000000;
  for i := 0 to gThings.Tables[Kind].Count - 1 do
  begin
    myMate := TaiMatingCreature(gThings.Tables[Kind].Items[i]);
    distance := Position.DistancePlusHeightTo(myMate.Position);
    if (distance < closest) and (Female <> myMate.Female) and myMate.Alive then
    begin
//    and ((myMate.Partner.Target = nil) or (myMate.Partner.Target = self))
//    then
      closest := distance;
      Partner.AssignTarget(myMate);
    end;
  end;
end;

end.

