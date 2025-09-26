unit Bio.Link;

interface

uses
  System.Types,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  Bio.BaseObject,
  Bio.Things;

type

// ============================================================================
TaiLinkObject = class(TObject)
private
  fLeftHandle: Int64;
  fRightHandle: Int64;
  fLeftObjectPointer: Pointer;
  fRightObjectPointer: Pointer;
  procedure SetLeftHandle(aValue: Int64);
  procedure SetRightHandle(aValue: Int64);
public
  constructor Create;
  function Valid: boolean;
  function ValidLeft: boolean;
  procedure AssignLeftObject(aObject: TaiBaseObject);
  procedure AssignRightObject(aObject: TaiBaseObject);
  function ValidRight: boolean;
  procedure InvalidateRight;
  procedure InvalidateLeft;
  procedure SaveToFile(var aFile: TextFile);
  procedure LoadFromFile(var aFile: TextFile);
  procedure CopyFrom(aLinkObject: TaiLinkObject); virtual;
  // property
  property LeftHandle: Int64 read fLeftHandle write SetLeftHandle;
  property RightHandle: Int64 read fRightHandle write SetRightHandle;
  property LeftObjectPointer: Pointer read fLeftObjectPointer write fLeftObjectPointer;
  property RightObjectPointer: Pointer read fRightObjectPointer write fRightObjectPointer;
end;

// ============================================================================
TaiLink = class(TaiLinkObject)
private
  function GetOrigin: TaiThing;
  function GetTarget: TaiThing;
  procedure SetOrigin(aThing: TaiThing);
  procedure SetTarget(aThing: TaiThing);
public
  function OriginKind: integer;
  function TargetKind: integer;
  function Connected: boolean;
  function Disconnected: boolean;
  function ValidTarget: boolean;
  function ValidOrigin: boolean;
  procedure InvalidateOrigin;
  procedure InvalidateTarget;
  procedure Disconnect;
  procedure AssignOrigin(aObject: TaiBaseObject);
  procedure AssignTarget(aObject: TaiBaseObject); virtual;
  function OneLineDisplayRight: string;
  function OneLineDisplayBoth: string;
  // property
  property Origin: TaiThing read GetOrigin write SetOrigin;
  property Target: TaiThing read GetTarget write SetTarget;
end;

// ============================================================================
TaiAttachment = class(TaiLink)
public
  procedure Attach(aThing: TaiThing);
  procedure Detach;
  function Holding: boolean;
  function Empty: boolean;
end;

// ============================================================================
TLinkContainer = class(TaiBaseContainer)
protected
  procedure RemoveAllLinksWithRightHandle(aHandle: int64);
  procedure RemoveAllLinksWithLeftHandle(aHandle: int64);
public
  function FirstWithRightHandle(aHandle: int64): boolean;
  function FirstWithLeftHandle(aHandle: int64): boolean;
  function NextWithRightHandle(aHandle: int64): boolean;
  function NextWithLeftHandle(aHandle: int64): boolean;
  procedure SetObjectPointers(aContainer: TaiBaseContainer); virtual;
  procedure SetLeftObjectPointers(aContainer: TaiBaseContainer);
  procedure SetRightObjectPointers(aContainer: TaiBaseContainer);
  procedure NeutralizeAllLinksWithRightHandle(aHandle: int64);
  procedure NeutralizeAllLinksWithLeftHandle(aHandle: int64);
  procedure NeutralizeAllLinksWithHandle(aHandle: int64);
  function NewLink: TaiLink; overload;
  procedure SaveToFile(var aFile: TextFile);
  procedure LoadFromFile(var aFile: TextFile);
end;

// ============================================================================
TaiLinkContainer = class(TLinkContainer)
public
  function NewLink(aLeftObject: TaiBaseObject): TaiLink; overload;
  function NewLink(aLeftObject: TaiBaseObject; aRightObject: TaiBaseObject): TaiLink; overload;
  procedure FullDisplay(aList: TStrings); override;
end;

// ============================================================================
TaiAttachmentContainer = class(TaiLinkContainer)
public
  function NewAttachment(aLeftObject: TaiThing): TaiAttachment;
  procedure DetachAllWithHandle(aHandle: int64);
  procedure SetObjectPointers(aContainer: TaiBaseContainer); override;
end;

implementation //=============================================================

constructor TaiLinkObject.Create;
begin
  inherited Create;
  fLeftHandle := 0;
  fRightHandle := 0;
  fLeftObjectPointer := nil;
  fRightObjectPointer := nil;
end;

// ----------------------------------------------------------------------------
function TaiLinkObject.Valid: boolean;
begin
  result := ValidLeft and ValidRight;
end;

// ----------------------------------------------------------------------------
function TaiLinkObject.ValidLeft: boolean;
begin
  result := (fLeftHandle <> 0);
end;

// ----------------------------------------------------------------------------
function TaiLinkObject.ValidRight: boolean;
begin
  result := (fRightHandle <> 0);
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.SetLeftHandle(aValue: Int64);
begin
  if fLeftHandle <> aValue then
    fLeftHandle := aValue;
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.SetRightHandle(aValue: Int64);
begin
  if fRightHandle <> aValue then
    fRightHandle := aValue;
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.AssignLeftObject(aObject: TaiBaseObject);
begin
  fLeftObjectPointer := aObject;
  fLeftHandle := aObject.Handle;
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.AssignRightObject(aObject: TaiBaseObject);
begin
  fRightObjectPointer := aObject;
  fRightHandle := aObject.Handle;
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.InvalidateRight;
begin
  fRightObjectPointer := nil;
  fRightHandle := 0;
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.InvalidateLeft;
begin
  fLeftObjectPointer := nil;
  fLeftHandle := 0;
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.CopyFrom(aLinkObject: TaiLinkObject);
begin
  fLeftHandle := aLinkObject.fLeftHandle;
  fRightHandle := aLinkObject.fRightHandle;
  fLeftObjectPointer := aLinkObject.fLeftObjectPointer;
  fRightObjectPointer := aLinkObject.fRightObjectPointer;
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.SaveToFile(var aFile: TextFile);
begin
  writeln(aFile, fRightHandle);
  writeln(aFile, fLeftHandle);
end;

// ----------------------------------------------------------------------------
procedure TaiLinkObject.LoadFromFile(var aFile: TextFile);
begin
  readln(aFile, fRightHandle);
  readln(aFile, fLeftHandle);
end;

// ----------------------------------------------------------------------------
function TLinkContainer.NextWithRightHandle(aHandle: int64): boolean;
var mySearch: TaiLinkObject;
begin
  result := false;
  if Next then
  repeat
    mySearch := ActiveItem;
    if mySearch.RightHandle = aHandle then
      result := true;
  until (result = true) or (not Next);
end;

// ----------------------------------------------------------------------------
function TLinkContainer.NextWithLeftHandle(aHandle: int64): boolean;
var mySearch: TaiLinkObject;
begin
  result := false;
  if Next then
  repeat
    mySearch := ActiveItem;
    if mySearch.LeftHandle = aHandle then
      result := true;
  until (result = true) or (not Next);
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.RemoveAllLinksWithRightHandle(aHandle: int64);
var mySearch: TaiLinkObject;
begin
  while FirstWithRightHandle(aHandle) do
  begin
    mySearch := ActiveItem;
    Remove(mySearch);
  end;
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.RemoveAllLinksWithLeftHandle(aHandle: int64);
var mySearch: TaiLinkObject;
begin
  while FirstWithLeftHandle(aHandle) do
  begin
    mySearch := ActiveItem;
    Remove(mySearch);
  end;
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.NeutralizeAllLinksWithRightHandle(aHandle: int64);
var mySearch: TaiLinkObject;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    if mySearch.RightHandle = aHandle then
      mySearch.InvalidateRight;
  until (not Next);
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.NeutralizeAllLinksWithLeftHandle(aHandle: int64);
var mySearch: TaiLinkObject;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    if mySearch.LeftHandle = aHandle then
      mySearch.InvalidateLeft;
  until (not Next);
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.NeutralizeAllLinksWithHandle(aHandle: int64);
var mySearch: TaiLinkObject;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    if mySearch.RightHandle = aHandle then
      mySearch.InvalidateRight;
    if mySearch.LeftHandle = aHandle then
      mySearch.InvalidateLeft;
  until (not Next);
end;

// ----------------------------------------------------------------------------
function TLinkContainer.FirstWithRightHandle(aHandle: int64): boolean;
var mySearch: TaiLinkObject;
begin
  result := false;
  if First then
  repeat
    mySearch := ActiveItem;
    if mySearch.RightHandle = aHandle then
      result := true;
  until (result = true) or (not Next);
end;

// ----------------------------------------------------------------------------
function TLinkContainer.FirstWithLeftHandle(aHandle: int64): boolean;
var mySearch: TaiLinkObject;
begin
  result := false;
  if First then
  repeat
    mySearch := ActiveItem;
    if mySearch.LeftHandle = aHandle then
      result := true;
  until (result = true) or (not Next);
end;

// ----------------------------------------------------------------------------
function TLinkContainer.NewLink: TaiLink;
begin
  result := TaiLink.Create;
  Add(result);
end;

// ----------------------------------------------------------------------------
function TaiLinkContainer.NewLink(aLeftObject: TaiBaseObject; aRightObject: TaiBaseObject): TaiLink;
begin
  result := TaiLink.Create;
  result.LeftObjectPointer := aLeftObject;
  result.RightObjectPointer := aRightObject;
  result.LeftHandle := aLeftObject.Handle;
  result.RightHandle := aRightObject.Handle;
  Add(result);
end;

// ----------------------------------------------------------------------------
function TaiLinkContainer.NewLink(aLeftObject: TaiBaseObject): TaiLink;
begin
  result := TaiLink.Create;
  result.LeftObjectPointer := aLeftObject;
  result.LeftHandle := aLeftObject.Handle;
  Add(result);
end;

// ----------------------------------------------------------------------------
function TaiLink.Connected: boolean;
begin
  result := (fRightHandle <> 0);
end;

// ----------------------------------------------------------------------------
function TaiLink.Disconnected: boolean;
begin
  result := not ValidRight;
end;

// ----------------------------------------------------------------------------
procedure TaiLink.Disconnect;
begin
  InvalidateRight;
end;

// ----------------------------------------------------------------------------
function TaiLink.GetOrigin: TaiThing;
begin
  result := fLeftObjectPointer;
end;

// ----------------------------------------------------------------------------
function TaiLink.GetTarget: TaiThing;
begin
  result := fRightObjectPointer;
end;

// ----------------------------------------------------------------------------
procedure TaiLink.SetOrigin(aThing: TaiThing);
begin
  AssignLeftObject(aThing);
end;

// ----------------------------------------------------------------------------
procedure TaiLink.SetTarget(aThing: TaiThing);
begin
  AssignRightObject(aThing);
end;

// ----------------------------------------------------------------------------
procedure TaiLink.AssignOrigin(aObject: TaiBaseObject);
begin
  if not (aObject = nil) then
    AssignLeftObject(aObject);
end;

// ----------------------------------------------------------------------------
procedure TaiLink.AssignTarget(aObject: TaiBaseObject);
begin
  if not (aObject = nil) then
    AssignRightObject(aObject);
end;

// ----------------------------------------------------------------------------
function TaiLink.OriginKind: integer;
begin
  result := cNothing;
  if ValidLeft then
    result := TaiThing(LeftObjectPointer).Kind;
end;

// ----------------------------------------------------------------------------
function TaiLink.TargetKind: integer;
begin
  result := cNothing;
  if ValidRight then
    result := TaiThing(RightObjectPointer).Kind;
end;

// ----------------------------------------------------------------------------
procedure TaiAttachment.Attach(aThing: TaiThing);
begin
  if aThing.Position.Carried then
    exit;

  AssignTarget(aThing);

  if ValidRight then
  begin
    aThing.Position.Carried := true;
    aThing.Position.Carrier := Origin;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiAttachment.Detach;
begin
  if ValidTarget then
  begin
    Target.Position.Carried := false;
    Target.Position.Carrier := nil;
    InvalidateTarget;
  end;
end;

// ----------------------------------------------------------------------------
function TaiAttachment.Holding: boolean;
begin
  // CRASHED
  result := (fRightHandle <> 0);
end;

// ----------------------------------------------------------------------------
function TaiAttachment.Empty: boolean;
begin
  result := not ValidRight;
end;

// ----------------------------------------------------------------------------
function TaiAttachmentContainer.NewAttachment(aLeftObject: TaiThing): TaiAttachment;
begin
  result := TaiAttachment.Create;
  result.LeftObjectPointer := aLeftObject;
  result.LeftHandle := aLeftObject.Handle;
  Add(result);
end;

// ----------------------------------------------------------------------------
procedure TaiAttachmentContainer.DetachAllWithHandle(aHandle: int64);
var mySearch: TaiAttachment;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    if mySearch.RightHandle = aHandle then
    begin
      mySearch.Detach;
{      AIThing(mySearch.RightObjectPointer).Position.Carried := false;
      AIThing(mySearch.RightObjectPointer).Position.Carrier := nil;
      mySearch.InvalidateRight;}
    end;
  until (not Next);
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.SetLeftObjectPointers(aContainer: TaiBaseContainer);
var mySearch: TaiLinkObject;
    myPointer: pointer;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    myPointer := aContainer.FindWithHandle(mySearch.LeftHandle);
    if myPointer <> nil then
      mySearch.LeftObjectPointer := myPointer;
    ActiveItem := mySearch;
  until not Next;
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.SetRightObjectPointers(aContainer: TaiBaseContainer);
var mySearch: TaiLinkObject;
    myPointer: pointer;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    myPointer := aContainer.FindWithHandle(mySearch.RightHandle);
    if myPointer <> nil then
      mySearch.RightObjectPointer := myPointer;
    ActiveItem := mySearch;
  until not Next;
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.SetObjectPointers(aContainer: TaiBaseContainer);
var
  mySearch: TaiLinkObject;
  myPointer: pointer;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    // find left
    myPointer := aContainer.FindWithHandle(mySearch.LeftHandle);
    if myPointer <> nil then
      mySearch.LeftObjectPointer := myPointer;
    // find right
    myPointer := aContainer.FindWithHandle(mySearch.RightHandle);
    if myPointer <> nil then
      mySearch.RightObjectPointer := myPointer;
    ActiveItem := mySearch;
  until not Next;
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.SaveToFile(var aFile: TextFile);
var
  i: integer;
  myLink: TaiLinkObject;
begin
  writeln(aFile, Count);
  for i := 0 to Count - 1 do
  begin
    myLink := TaiLinkObject(Items[i]);
    myLink.SaveToFile(aFile);
  end;
end;

// ----------------------------------------------------------------------------
procedure TLinkContainer.LoadFromFile(var aFile: TextFile);
var
  i, aCount: integer;
  myLink: TaiLinkObject;
begin
  readln(aFile, aCount);
  for i := 0 to aCount - 1 do
  begin
    myLink := TaiLink.Create;
    myLink.LoadFromFile(aFile);
    // do not load dead links
    if myLink.LeftHandle <> 0 then
      Add(myLink)
    else
      myLink.Free;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiLink.InvalidateTarget;
begin
  fRightObjectPointer := nil;
  fRightHandle := 0;
end;

// ----------------------------------------------------------------------------
procedure TaiLink.InvalidateOrigin;
begin
  fLeftObjectPointer := nil;
  fLeftHandle := 0;
end;

// ----------------------------------------------------------------------------
function TaiLink.ValidTarget: boolean;
begin
  result := (fRightHandle <> 0);
end;

// ----------------------------------------------------------------------------
function TaiLink.ValidOrigin: boolean;
begin
  result := ValidLeft;
end;

// ----------------------------------------------------------------------------
function TaiLink.OneLineDisplayRight: string;
begin
  if ValidRight then
    result := TaiBaseObject(RightObjectPointer).OneLineDisplay
  else
    result := 'Empty';
end;

// ----------------------------------------------------------------------------
function TaiLink.OneLineDisplayBoth: string;
begin
  result := IntToStr(LeftHandle) + '<->' + IntToStr(RightHandle);
end;

// ----------------------------------------------------------------------------
procedure TaiLinkContainer.FullDisplay(aList: TStrings);
var
  i: integer;
  myLink: TaiLink;
begin
  aList.Add('LINK CONTAINER');
  aList.Add('----------------------');
  for i := 0 to Count - 1 do
  begin
    myLink := TaiLink(Items[i]);
    aList.Add(myLink.OneLineDisplayBoth + ' ' + myLink.OneLineDisplayRight);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiAttachmentContainer.SetObjectPointers(aContainer: TaiBaseContainer);
var
  mySearch: TaiAttachment;
  myPointer: pointer;
begin
  if First then
  repeat
    mySearch := ActiveItem;
    // find left
    myPointer := aContainer.FindWithHandle(mySearch.LeftHandle);
    if myPointer <> nil then
      mySearch.LeftObjectPointer := myPointer;
    // find right
    myPointer := aContainer.FindWithHandle(mySearch.RightHandle);
    if myPointer <> nil then
    begin
      // have to set this to false, because .Attach exits if true
      TaiThing(myPointer).Position.Carried := false;
      // now attach
      mySearch.Attach(myPointer);
    end;
    ActiveItem := mySearch;
  until not Next;
end;

end.
