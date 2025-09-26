unit Bio.Environment;
(*
  Node AIEnvironment
  Patterns:
    Things
    Causes
    Events
    Map
*)
interface

// need function to store list of changes at each round
// this can be used for all sorts of things
//   ex graphics updates

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,
  Bio.Things,
  Bio.BaseObject,
  Bio.EnvironmentStructures,
  Bio.Space,
  Bio.Grid,
  Bio.Link,
  Bio.Position,
  Bio.Force,
  Bio.Creature;

type

// ============================================================================
TaiEnvironment = class(TaiBaseObject)
private
  fName: string;
  fThings: TaiThingList;
  fSpace: TaiSpace;
  fReferences: TaiLinkContainer;
  fAttachments: TaiAttachmentContainer;
  fShadows: boolean;
protected
  function GetGravity: TaiForce;
  function GetAirFriction: TaiForce;
  function GetLandFriction: TaiForce;
  function GetWaterFriction: TaiForce;
public
  constructor Create(aReality: pointer);
  destructor Destroy; override;
  procedure Fuel;
  function RoundStatistics: string;
  procedure EnactGrab(aOriginCreature: TaiCreature; aTarget: TaiThing);
  procedure EnactBonk(aOriginCreature: TaiCreature; aTarget: TaiThing);
  procedure Clean;
  procedure Build(aWidth: integer; aHeight: integer);
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
  procedure Snip(aHandle: integer); overload;
  procedure Snip(aThing: TaiThing); overload;
  procedure FullDisplay(aList: TStrings); override;
  function FindWithHandle(aHandle: integer): TaiBaseObject;
  // property
  property Name: string read fName write fName;
  property Things: TaiThingList read fThings;
  property Space: TaiSpace read fSpace;
  property References: TaiLinkContainer read fReferences;
  property Attachments: TaiAttachmentContainer read fAttachments;
  property Gravity: TaiForce read GetGravity;
  property AirFriction: TaiForce read GetAirFriction;
  property LandFriction: TaiForce read GetLandFriction;
  property WaterFriction: TaiForce read GetWaterFriction;
  property Shadows: boolean read fShadows write fShadows;
end;

implementation // ============================================================

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Utilities,
  Bio.Vibes;

// ----------------------------------------------------------------------------
constructor TaiEnvironment.Create(aReality: pointer);
begin
  inherited Create(aReality);
  gEnvironment := self;
  fSpace := TaiSpace.Create(self, 20, 11);
  // create an empty list of things
  fThings := TaiThingList.Create(self);
  // create an empty list of links (thing <-> thing)
  fReferences := TaiLinkContainer.Create(self);
  fAttachments := TaiAttachmentContainer.Create(self);
  fShadows := false;

  fName := 'New Planet';
  gGravity := TaiForce.Create;
  gGravity.SetForce(0.0, 0.0, -0.0098*1.5);
  gAirFriction := TaiForce.Create;
  gAirFriction.SetForce(0.0005, 0.0005, 0.0005);
  gLandFriction := TaiForce.Create;
  gLandFriction.SetForce(0.05, 0.05, 0.05);
  gWaterFriction := TaiForce.Create;
  gWaterFriction.SetForce(0.25, 0.25, 0.25);
end;

// ----------------------------------------------------------------------------
destructor TaiEnvironment.Destroy;
begin
  fThings.Free;
  fSpace.Free;
  fReferences.Free;
  fAttachments.Free;

  gGravity.Free;
  gAirFriction.Free;
  gLandFriction.Free;
  gWaterFriction.Free;

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.Clean;
begin
  Things.Clean;
  Space.Clean;
  References.Clear;
  Attachments.Clear;
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.Build(aWidth: integer; aHeight: integer);
begin
  gEnvironment := self;
  Space.Build(aWidth, aHeight);
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.Fuel;
begin
  // delete trash
  Things.EmptyTrash;
  // prune dead things
  Things.BringOutYourDead;
  // clean out purgatory
  Things.EmptyPurgatory;
  // fuel space with time
  Space.Fuel;
  // fuel all things
  Things.FuelEverything;
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fName);
  writeFileBoolean(aFile, fShadows);
  fSpace.SaveToFile(aFile);
  fThings.SaveToFile(aFile);
  fReferences.SaveToFile(aFile);
  fAttachments.SaveToFile(aFile);
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fName);
  fShadows := readFileBoolean(aFile);
  fSpace.LoadFromFile(aFile);
  fThings.LoadFromFile(aFile);
  fReferences.LoadFromFile(aFile);
  fAttachments.LoadFromFile(aFile);

  fReferences.SetObjectPointers(fThings);
  fAttachments.SetObjectPointers(fThings);
  fThings.JoinAllCommunities;
end;

// ----------------------------------------------------------------------------
function TaiEnvironment.RoundStatistics: string;
var
  i: integer;
begin
  result := '';

  if Things.Cradle.Count > 0 then
    for i := 0 to Things.Cradle.Count - 1 do
      result := result + #13#10 + 'Born: ' + TaiBaseObject(Things.Cradle.Items[i]).OneLineDisplay;

  if Things.Purgatory.Count > 0 then
    for i := 0 to Things.Purgatory.Count - 1 do
      result := result + #13#10 + 'Died: ' + TaiBaseObject(Things.Purgatory.Items[i]).OneLineDisplay;
end;

// ----------------------------------------------------------------------------
function TaiEnvironment.GetGravity: TaiForce;
begin
  result := gGravity;
end;

// ----------------------------------------------------------------------------
function TaiEnvironment.GetAirFriction: TaiForce;
begin
  result := gAirFriction;
end;

// ----------------------------------------------------------------------------
function TaiEnvironment.GetLandFriction: TaiForce;
begin
  result := gLandFriction;
end;

// ----------------------------------------------------------------------------
function TaiEnvironment.GetWaterFriction: TaiForce;
begin
  result := gWaterFriction;
end;

// ----------------------------------------------------------------------------
// cleans all references to this thing
procedure TaiEnvironment.Snip(aThing: TaiThing);
begin
  Snip(aThing.Handle);
end;

// ----------------------------------------------------------------------------
// cleans all references to this thing
procedure TaiEnvironment.Snip(aHandle: integer);
begin
  fReferences.NeutralizeAllLinksWithRightHandle(aHandle);
  fAttachments.DetachAllWithHandle(aHandle);
end;

// ----------------------------------------------------------------------------
function TaiEnvironment.FindWithHandle(aHandle: integer): TaiBaseObject;
begin
  result := gThings.FindWithHandle(aHandle);
  if not Assigned(result) then
    result := gSpace.FindWithHandle(aHandle);
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.FullDisplay(aList: TStrings);
begin
  {
  aList.Add('='+IntToStr());
  aList.Add('='+PtrToStr());
  aList.Add('='+Format('%0.2f', []));
  }
  aList.Add('ENVIRONMENT');
  aList.Add('-------------');
  inherited FullDisplay(aList);
  aList.Add(Name);
  aList.Add('Things='+PtrToStr(fThings));
  aList.Add('Space='+PtrToStr(fSpace));
  aList.Add('References='+PtrToStr(fReferences));
  aList.Add('Attachments='+PtrToStr(fAttachments));
  aList.Add('Gravity: ' + GetGravity.OneLineDisplay);
  aList.Add('AirFriction: ' + GetAirFriction.OneLineDisplay);
  aList.Add('LandFriction: ' + GetLandFriction.OneLineDisplay);
  aList.Add('WaterFriction: ' + GetWaterFriction.OneLineDisplay);
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.EnactGrab(aOriginCreature: TaiCreature; aTarget: TaiThing);
begin
  // already holding something?
  if aOriginCreature.Grabber.Holding then exit;
  // grabbing itself?
  if (aTarget = aOriginCreature) then exit;
  // grabbing a sound?
  if (aTarget.Kind = cVibe) then exit;
  // check to see if the target is grabbing me already (cancel if so);
  if aTarget is TaiCreature then
    if TaiCreature(aTarget).Grabber.Holding and
      (TaiCreature(aTarget).Grabber.Target = aOriginCreature) then
        exit;
  // is it already carried?
  if aTarget.Position.Carried then exit;
  // is it close enough?
  if not aOriginCreature.CloseEnoughToGrab(aTarget) then exit;
  if not aTarget.Position.Carried then
  begin
    aOriginCreature.Grabber.Attach(aTarget);
    aTarget.Noise(cNoiseGrab, 1);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiEnvironment.EnactBonk(aOriginCreature: TaiCreature; aTarget: TaiThing);
var
  myTargetCreature: TaiCreature;
  myThing: TaiThing;
begin
  if aOriginCreature.CloseEnoughToGrab(aTarget) then
  begin
    if aTarget is TaiCreature then
    begin
      myTargetCreature := TaiCreature(aTarget);
      if myTargetCreature.Grabber.Holding then
      begin
        myThing := myTargetCreature.Grabber.Target;
        myTargetCreature.Grabber.Detach;
        myThing.Position.Acceleration.ApplyForce(Random*0.2-0.1, Random*0.2-0.1, Random*0.2);
      end;
    end;
  end;
end;

end.
