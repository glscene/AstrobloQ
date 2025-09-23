unit Bio.Life;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Contnrs,
  System.Types,
  Bio.Things,
  Bio.ThingReferenceList;

type

  TaiLivingThing = class(TaiThing)
  private
    fWater: single;
    fRot: integer;
    fHealth: integer;
    fAlive: boolean;
    procedure SetAlive(aValue: boolean);
    procedure SetHealth(aValue: integer);
  public
    constructor Create(aParent: pointer);
    property Water: single read fWater write fWater;
    property Health: integer read fHealth write SetHealth;
    property Rot: integer read fRot write fRot;
    property Alive: boolean read fAlive write SetAlive;
    // Modify
    procedure HealthIncrease(aAmount: integer);
    function Dead: boolean;
    function Rotten: boolean;
    function Digest(const aAmount: integer): integer; override;
    procedure Fuel; override;
    procedure Die; virtual;
    procedure Cease; override;
    procedure Decompose;
    procedure Damage(aAmount: integer); override;
    function OneLineDisplay: string; override;
    procedure FullDisplay(aList: TStrings); override;
    procedure SaveToFile(var aFile: TextFile); override;
    procedure LoadFromFile(var aFile: TextFile); override;
  end;

  // ============================================================================

  TaiLivingGroup = class(TaiThing)
  private
    fMembers: TaiThingReferenceList;
    fMaximum: integer;
    fFull: boolean;
  protected
    procedure CalculateFull;
  public
    constructor Create(aParent: pointer);
    destructor Destroy; override;
    property Members: TaiThingReferenceList read fMembers;
    property Maximum: integer read fMaximum write fMaximum;
    property Full: boolean read fFull;
    function AddMember(aMember: TaiThing): boolean; virtual;
    procedure RemoveMember(aMember: TaiThing);
    function Vacancy: boolean;
    procedure Fuel; override;
    function OneLineDisplay: string; override;
    procedure FullDisplay(aList: TStrings); override;
    procedure SaveToFile(var aFile: TextFile); override;
    procedure LoadFromFile(var aFile: TextFile); override;
  end;

implementation // ============================================================

uses
  Bio.Utilities;

// ----------------------------------------------------------------------------
constructor TaiLivingThing.Create(aParent: pointer);
begin
  inherited Create(aParent);

  fHealth := 1024;
  fRot := 0;
  fAlive := true;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.Die;
begin
  fAlive := false;
  fHealth := 0;
  fRot := 1;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.Fuel;
begin
  inherited Fuel;

  // decrease health every round
  if fHealth > 0 then
  begin
    fHealth := fHealth - 1;
    // if fHealth > 10000 then
    // fHealth := 10000;
  end
  else
  // if health is < 0 then begin rotting
  begin
    if Alive then
      Die;
    Decompose;
  end;
end;

// ----------------------------------------------------------------------------
function TaiLivingThing.Dead: boolean;
begin
  result := not(Alive);
end;

// ----------------------------------------------------------------------------
function TaiLivingThing.Rotten: boolean;
begin
  result := (Rot >= 512);
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.Decompose;
begin
  fRot := fRot + 1;
  if Rotten then
    Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.Damage(aAmount: integer);
begin
  inherited Damage(aAmount);

  fHealth := fHealth - aAmount;
end;

// ----------------------------------------------------------------------------
constructor TaiLivingGroup.Create(aParent: pointer);
begin
  inherited Create(aParent);

  fMembers := TaiThingReferenceList.Create(self);
  fMaximum := 64;
  CalculateFull;
end;

// ----------------------------------------------------------------------------
destructor TaiLivingGroup.Destroy;
begin
  fMembers.Free;

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingGroup.Fuel;
begin
  inherited Fuel;

  if Members.Count = 0 then
    Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fWater);
  writeln(aFile, fHealth);
  writeln(aFile, fRot);
  // writeFileBoolean(aFile, fEdible);
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fWater);
  readln(aFile, fHealth);
  readln(aFile, fRot);
  // fEdible := readFileBoolean(aFile);
end;

// ----------------------------------------------------------------------------
function TaiLivingThing.OneLineDisplay: string;
begin
  result := GetName + ' ' + IntToStr(Handle) + ' Health=' + IntToStr(fHealth) +
    Position.OneLineDisplay;
end;

// ----------------------------------------------------------------------------
// returns true if the member was added,
// returns false if group is full
function TaiLivingGroup.AddMember(aMember: TaiThing): boolean;
begin
  result := false;
  if not fFull and (Members.IndexOf(aMember) = -1) then
  begin
    Members.Add(aMember);
    result := true;
    CalculateFull;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingGroup.RemoveMember(aMember: TaiThing);
begin
  Members.Remove(aMember);
  CalculateFull;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingGroup.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fMaximum);
end;

// ----------------------------------------------------------------------------
procedure TaiLivingGroup.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fMaximum);
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('Alive: ' + BoolToYesNoStr(Alive));
  aList.Add('Health: ' + IntToStr(fHealth));
  aList.Add(Format('Water: %0.2f', [fWater]));
  aList.Add('Rot: ' + IntToStr(fRot));
end;

// ----------------------------------------------------------------------------
procedure TaiLivingGroup.FullDisplay(aList: TStrings);
var
  i: integer;
  myMember: TaiThing;
begin
  inherited FullDisplay(aList);

  aList.Add('Count: ' + IntToStr(Members.Count));
  aList.Add('Maximum: ' + IntToStr(fMaximum));
  aList.Add('Full: ' + BoolToYesNoStr(fFull));
  for i := 0 to fMembers.Count - 1 do
  begin
    myMember := TaiThing(fMembers[i]);
    aList.AddObject(IntToStr(i + 1) + ': ' + myMember.OneLineDisplay, myMember);
  end;
end;

// ----------------------------------------------------------------------------
function TaiLivingGroup.OneLineDisplay: string;
begin
  result := GetName + Format(' %d Members=%d/%d ',
    [Handle, Members.Count, fMaximum]);
end;

// ----------------------------------------------------------------------------
procedure TaiLivingGroup.CalculateFull;
begin
  fFull := (fMembers.Count >= fMaximum);
end;

// ----------------------------------------------------------------------------
function TaiLivingGroup.Vacancy: boolean;
begin
  result := not fFull;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.SetAlive(aValue: boolean);
begin
  if aValue = fAlive then
    exit;
  fAlive := aValue;

  // kill
  if fAlive = false then
  begin
    Die;
  end
  else // revive
  begin
    fRot := 0;
    if fHealth <= 0 then
      fHealth := 1;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.Cease;
begin
  if Exists and Alive then
    Die;

  inherited Cease;
end;

// ----------------------------------------------------------------------------
function TaiLivingThing.Digest(const aAmount: integer): integer;
begin
  result := aAmount;
  if aAmount > Health then
    result := Health;
  Health := Health - result;
  if not Alive then
    Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.SetHealth(aValue: integer);
begin
  fHealth := aValue;
  if fHealth <= 0 then
    Die;
end;

// ----------------------------------------------------------------------------
procedure TaiLivingThing.HealthIncrease(aAmount: integer);
begin
  Health := Health + aAmount;
end;

end.
