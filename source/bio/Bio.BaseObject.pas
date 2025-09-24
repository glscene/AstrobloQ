unit Bio.BaseObject;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Contnrs,
  Bio.Utilities;

type

  TaiBaseObject = class;
  TaiBaseClass = class of TaiBaseObject;

  // -------------------------------------------------------------------------
  TaiActiveList = class(TObjectList)
  private
    fActiveItem: Pointer;
  public
    constructor Create(aValue: boolean);
    destructor Destroy; override;
    property ActiveItem: Pointer read fActiveItem write fActiveItem;
    function Next: boolean;
    function First: boolean;
    function SetNextActive: boolean;
    function SetFirstActive: boolean;
    function SetPriorActive: boolean;
    function SetLastActive: boolean;
    function SetNextOrFirstActive: boolean;
    function SetPriorOrLastActive: boolean;
    function OneLineDisplay: string; virtual;
    function PositionAtIndex(anIndex: LongInt): boolean;
    function ActiveItemIndex: LongInt;
    function IndexOfActiveItem: LongInt;
  end;

  // ============================================================================

  TaiBaseObject = class(TObject)
  private
    fHandle: integer;
    fParentHandle: integer;
    fParentPointer: Pointer;
    fCrossover: Pointer; // assigned at runtime, for visual links
  public
    constructor Create(aParent: Pointer);
    destructor Destroy; override;
    property Handle: integer read fHandle write fHandle;
    property ParentHandle: integer read fParentHandle write fParentHandle;
    property ParentPointer: Pointer read fParentPointer write fParentPointer;
    property Crossover: Pointer read fCrossover write fCrossover;
    function OneLineDisplay: string; virtual;
    procedure FullDisplay(aList: TStrings); virtual;
    procedure SaveToFile(var aFile: TextFile); virtual;
    procedure LoadFromFile(var aFile: TextFile); virtual;
  end;

  // ============================================================================

  TaiBaseContainer = class(TaiActiveList)
  private
    fParentHandle: integer;
    fParentPointer: Pointer;
  public
    constructor Create(aParent: Pointer);
    destructor Destroy; override;
    property ParentHandle: integer read fParentHandle;
    property ParentPointer: Pointer read fParentPointer write fParentPointer;
    function FindWithHandle(aHandle: integer): TaiBaseObject;
    procedure FullDisplay(aStrings: TStrings); virtual;
  end;

  // ============================================================================

  TaiReferenceList = class(TaiActiveList)
  private
    fParentPointer: Pointer;
  public
    constructor Create(aParent: Pointer);
    destructor Destroy; override;
    property ParentPointer: Pointer read fParentPointer write fParentPointer;
    procedure FullDisplay(aStrings: TStrings); virtual;
  end;

  TaiKind = class of TaiBaseObject;

implementation // -------------------------------------------------------------

constructor TaiActiveList.Create(aValue: boolean);
begin
  inherited Create(aValue);
end;

// ----------------------------------------------------------------------------
destructor TaiActiveList.Destroy;
begin
  inherited Destroy;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.Next: boolean;
var
  myIndex: integer;
begin
  result := False;
  myIndex := IndexOf(fActiveItem);
  if (myIndex > -2) and (myIndex < (Count - 1)) then
  begin
    fActiveItem := Items[myIndex + 1];
    result := True;
  end;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.First: boolean;
begin
  if Count > 0 then
  begin
    fActiveItem := Items[0];
    result := True;
  end
  else
  begin
    fActiveItem := nil;
    result := False;
  end;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.SetFirstActive: boolean;
begin
  if Count > 0 then
  begin
    fActiveItem := Items[0];
    result := True;
  end
  else
  begin
    fActiveItem := nil;
    result := False;
  end;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.SetNextActive: boolean;
var
  myIndex: integer;
begin
  result := False;
  myIndex := IndexOf(fActiveItem);
  if (myIndex > -2) and (myIndex < (Count - 1)) then
  begin
    fActiveItem := Items[myIndex + 1];
    result := True;
  end;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.SetLastActive: boolean;
begin
  if Count > 0 then
  begin
    fActiveItem := Items[Count - 1];
    result := True;
  end
  else
  begin
    fActiveItem := nil;
    result := False;
  end;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.SetPriorActive: boolean;
var
  myIndex: LongInt;
begin
  result := False;
  myIndex := IndexOf(fActiveItem);
  if (myIndex > 0) and (myIndex < Count) then
  begin
    fActiveItem := Items[myIndex - 1];
    result := True;
  end;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.SetNextOrFirstActive: boolean;
begin
  result := SetNextActive;

  if not result then
    result := SetFirstActive;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.SetPriorOrLastActive: boolean;
begin
  result := SetPriorActive;

  if not result then
    result := SetLastActive;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.PositionAtIndex(anIndex: LongInt): boolean;
begin
  result := False;
  if ((anIndex > -1) and (anIndex < Count)) then
  begin
    fActiveItem := Items[anIndex];
    result := True;
  end;
end;

// ----------------------------------------------------------------------------
function TaiActiveList.IndexOfActiveItem: LongInt;
begin
  result := IndexOf(fActiveItem);
end;

// ----------------------------------------------------------------------------
function TaiActiveList.ActiveItemIndex: LongInt;
begin
  result := IndexOf(ActiveItem);
end;

// ----------------------------------------------------------------------------
constructor TaiBaseObject.Create(aParent: Pointer);
begin
  inherited Create;

  fParentPointer := aParent;
  fHandle := 0;
  fParentHandle := 0;
end;

// ----------------------------------------------------------------------------
destructor TaiBaseObject.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
function TaiBaseObject.OneLineDisplay: string;
begin
  result := 'UNDEFINED';
end;

// ----------------------------------------------------------------------------
procedure TaiBaseObject.SaveToFile(var aFile: TextFile);
begin
  writeln(aFile, fHandle);
  writeln(aFile, fParentHandle);
end;

// ----------------------------------------------------------------------------
procedure TaiBaseObject.LoadFromFile(var aFile: TextFile);
begin
  readln(aFile, fHandle);
  readln(aFile, fParentHandle);
end;

// ----------------------------------------------------------------------------
constructor TaiBaseContainer.Create(aParent: Pointer);
begin
  inherited Create(True); // does own objects

  ParentPointer := aParent;
end;

// ----------------------------------------------------------------------------
destructor TaiBaseContainer.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiBaseContainer.FullDisplay(aStrings: TStrings);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    aStrings.AddObject(TaiBaseObject(Items[i]).OneLineDisplay, Items[i]);
end;

// ----------------------------------------------------------------------------
constructor TaiReferenceList.Create(aParent: Pointer);
begin
  inherited Create(False); // doesnt own objects

  ParentPointer := aParent;
end;

// ----------------------------------------------------------------------------
destructor TaiReferenceList.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiReferenceList.FullDisplay(aStrings: TStrings);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    aStrings.AddObject(TaiBaseObject(Items[i]).OneLineDisplay, Items[i]);
end;

// ----------------------------------------------------------------------------
function TaiActiveList.OneLineDisplay: string;
var
  i: integer;
begin
  result := '';
  for i := 0 to Count - 1 do
  begin
    result := result + TaiBaseObject(Items[i]).OneLineDisplay + #13#10;
  end;
end;

// ----------------------------------------------------------------------------
function TaiBaseContainer.FindWithHandle(aHandle: integer): TaiBaseObject;
var
  i: integer;
begin
  result := nil;
  for i := 0 to Count - 1 do
  begin
    if TaiBaseObject(Items[i]).Handle = aHandle then
    begin
      result := TaiBaseObject(Items[i]);
      break;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiBaseObject.FullDisplay(aList: TStrings);
begin
  aList.Add('Handle: ' + IntToStr(Handle));
  aList.Add('Pointer: ' + PtrToStr(self));
  aList.Add('ParentHandle: ' + IntToStr(fParentHandle));
  aList.Add('Crossover: ' + PtrToStr(fCrossover));
end;

end.
