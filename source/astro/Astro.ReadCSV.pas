unit Astro.ReadCSV;
(*
  CSV parser for Free. Fields as String, Integer or Extended.

  Usage:
  begin
  var
    Source: TspDataSourceCSV;

  Source := TspDataSourceCSV.Create;
  try
    Source.SetDelimiter(Char(59));  // this is ;
    Source.LoadFromFile(FileName);
    while not Source.Eof do
    begin
      ShowMessage(Source.FieldByNameAsString('RA'));
      Source.Next;
    end;
  finally
    Source.Free;
  end;
  end;
*)
interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  Vcl.Dialogs;

type
  TspDataSourceCSV = class(TObject)
  protected
    _columns: TStringList;
    _rows: TStringList;
    _delimiter: Char;
    _index: Integer;
    _feof: Boolean;
    _date_separator: Char;
  public
    constructor Create();
    procedure LoadFromFile(const FileName: ShortString);
    procedure SetDelimiter(const Character: Char);
    procedure SetDateSeparator(const Separator: Char);
    procedure First;
    function GetTotal(): Integer;
    function GetRowString(): string;
    function FieldByNameAsString(Column: ShortString): string;
    function FieldByNameAsInteger(Column: ShortString): Integer;
    function FieldByNameAsFloat(Column: ShortString): Extended;
    function FieldByNameAsDate(Column: ShortString): TDate;
    function FieldByNameAsTime(Column: ShortString): TTime;
    function FieldByNameAsDateTime(Column: ShortString): TDateTime;
    procedure Next;
    property Eof: Boolean read _feof;
    property Count: Integer read GetTotal;
  private
    function GetColumnIndex(Column: ShortString): Integer;
  published
  end;

function GetFileNameFromCSV(const FileName: TFileName; var Name: string; const Index: Integer): TFileName;

implementation //=============================================================


//-----------------------------------------------------------------------------
function GetFileNameFromCSV(const FileName: TFileName; var Name: string; const Index: Integer): TFileName;
var
  Source: TspDataSourceCSV;
  Number: Integer;
  S, S1 : string;

begin
  Source := TspDataSourceCSV.Create;
  try
///    Source.SetDelimiter(Char(59));  // this is ';'
    Source.SetDelimiter(',');  // this is ','
    Source.LoadFromFile(FileName);
    while not Source.Eof do
    begin
      S:= IntToStr(Index);
      S1 := Source.FieldByNameAsString(S);
      ShowMessage(S1);
//      Number := Source.FieldByNameAsInteger(IntToStr(Index));
//      if (Name = Name + '_ru') then
//      if Number = Index  then Break;
      Source.Next;
    end;
  finally
    Source.Free;
  end;
  Result := Name;
end;

//-----------------------------------------------------------------------------
constructor TspDataSourceCSV.Create;
begin
  Self._columns := TStringList.Create;
  Self._rows := TStringList.Create;
  Self._columns.Clear;
  Self._rows.Clear;
  Self._index := -1;
  Self._date_separator := '-';
end;

//----------------------------------------------------------------------------
procedure TspDataSourceCSV.LoadFromFile(const FileName: ShortString);
var
  loadedFile, Row: TStringList;
  I: Integer;
begin
  loadedFile := TStringList.Create;
  loadedFile.LoadFromFile(FileName);

  // load columns
  Row := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter := Self._delimiter;
  Row.DelimitedText := loadedFile.Strings[0]; // first row is column names

  for I := 0 to Row.Count - 1 do
  begin
    Self._columns.Add(Row.Strings[I]);
  end;
  // load rows
  for I := 1 to loadedFile.Count - 1 do
  begin
    Self._rows.Add(loadedFile.Strings[I]);
  end;

  Self._index := 0;
  Self._feof := False;
end;

//----------------------------------------------------------------------------
procedure TspDataSourceCSV.SetDelimiter(const Character: Char);
begin
  Self._delimiter := Character;
end;

//----------------------------------------------------------------------------
procedure TspDataSourceCSV.SetDateSeparator(const Separator: Char);
begin
  Self._date_separator := Separator;
end;

procedure TspDataSourceCSV.First;
begin
  Self._index := 0;
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.GetTotal: Integer;
begin
  Result := Self._rows.Count;
end;

function TspDataSourceCSV.GetRowString: String;
begin
  Result := Self._rows.Strings[Self._index];
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.GetColumnIndex(Column: ShortString): Integer;
var
  ColumnIndex: Integer;
begin
  ColumnIndex := Self._columns.IndexOf(Column);
  if ColumnIndex <> -1 then
    Result := ColumnIndex
  else
    raise Exception.Create('Error: Column "' + Column + '" not found !');
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.FieldByNameAsString(Column: ShortString): String;
var
  ColumnIndex: Integer;
  Row: TStringList;
begin
  ColumnIndex := Self.GetColumnIndex(Column);
  Row := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter := Self._delimiter;
  Row.DelimitedText := Self._rows.Strings[Self._index];
  Result := Row.Strings[ColumnIndex];
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.FieldByNameAsInteger(Column: ShortString): Integer;
var
  ColumnIndex: Integer;
  Row: TStringList;
begin
  ColumnIndex := Self.GetColumnIndex(Column);
  Row := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter := Self._delimiter;
  Row.DelimitedText := Self._rows.Strings[Self._index];
  Result := StrToIntDef(Row.Strings[ColumnIndex], 0);
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.FieldByNameAsFloat(Column: ShortString): Extended;
var
  ColumnIndex: Integer;
  Row: TStringList;
begin
  ColumnIndex := Self.GetColumnIndex(Column);
  Row := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter := Self._delimiter;
  Row.DelimitedText := Self._rows.Strings[Self._index];
  Result := StrToFloatDef(Row.Strings[ColumnIndex], 0);
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.FieldByNameAsDate(Column: ShortString): TDate;
var
  ColumnIndex: Integer;
  Row: TStringList;
  MySettings: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, MySettings);
  MySettings.DateSeparator := Self._date_separator;

  ColumnIndex := Self.GetColumnIndex(Column);
  Row := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter := Self._delimiter;
  Row.DelimitedText := Self._rows.Strings[Self._index];
  Result := StrToDate(Row.Strings[ColumnIndex], MySettings);
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.FieldByNameAsTime(Column: ShortString): TTime;
var
  ColumnIndex: Integer;
  Row: TStringList;
begin
  ColumnIndex := Self.GetColumnIndex(Column);
  Row := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter := Self._delimiter;
  Row.DelimitedText := Self._rows.Strings[Self._index];
  Result := StrToTime(Row.Strings[ColumnIndex]);
end;

//----------------------------------------------------------------------------
function TspDataSourceCSV.FieldByNameAsDateTime(Column: ShortString): TDateTime;
var
  ColumnIndex: Integer;
  Row: TStringList;
  MySettings: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, MySettings);
  MySettings.DateSeparator := Self._date_separator;

  ColumnIndex := Self.GetColumnIndex(Column);
  Row := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter := Self._delimiter;
  Row.DelimitedText := Self._rows.Strings[Self._index];
  Result := StrToDateTime(Row.Strings[ColumnIndex], MySettings);
end;

//----------------------------------------------------------------------------
procedure TspDataSourceCSV.Next;
begin
  Inc(Self._index);
  if Self._index = Self._rows.Count then
    Self._feof := True;
end;

end.
