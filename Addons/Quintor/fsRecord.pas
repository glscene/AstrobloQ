unit fsRecord;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  System.IniFiles;

type
  TFormRecord = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cls1: TLabel;
    cls2: TLabel;
    cls3: TLabel;
    cls4: TLabel;
    cls5: TLabel;
    nm1: TLabel;
    nm2: TLabel;
    nm3: TLabel;
    nm4: TLabel;
    nm5: TLabel;
    pt1: TLabel;
    pt2: TLabel;
    pt3: TLabel;
    pt4: TLabel;
    pt5: TLabel;
    btnOK: TButton;
    btnClear: TButton;
    procedure SaveRecord;
    procedure btnOKClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    function TestaRecorde(aNumber: String): Boolean;
    procedure AddRecord(ptrecorde: string; nmrecorde: string);
    procedure LoadRecord;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  FormRecord: TFormRecord;

implementation

{$R *.dfm}

procedure TFormRecord.FormCreate(Sender: TObject);
begin
  LoadRecord;
  KeyPreview := true;
end;

procedure TFormRecord.SaveRecord;
Var
  IniFile: TIniFile;
  dir: string;
begin
  GetDir(0, dir);
  if Length(dir) = 3 then // to avoid the bug in c:
    IniFile := TIniFile.Create(dir + 'Records.ini')
  else
    IniFile := TIniFile.Create(dir + '\Records.ini');
  with IniFile do
  begin
    WriteString('Prima', 'Name', nm1.Caption);
    WriteString('Prima', 'Score', pt1.Caption);

    WriteString('Second', 'Name', nm2.Caption);
    WriteString('Second', 'Score', pt2.Caption);

    WriteString('Third', 'Name', nm3.Caption);
    WriteString('Third', 'Score', pt3.Caption);

    WriteString('Quarto', 'Name', nm4.Caption);
    WriteString('Quarto', 'Score', pt4.Caption);

    WriteString('Quinto', 'Name', nm5.Caption);
    WriteString('Quinto', 'Score', pt5.Caption);
    Free;
  end;
end;

procedure TFormRecord.Button3Click(Sender: TObject);
begin
  SaveRecord;
end;

function TFormRecord.TestaRecorde(aNumber: string): Boolean;
begin
  if (pt1.Caption = '') or (pt2.Caption = '') or (pt3.Caption = '') or (pt4.Caption = '') or
    (pt5.Caption = '') then
  begin
    Result := true;
    exit
  end
  else if (StrToInt(aNumber) > StrToInt(pt1.Caption)) or (StrToInt(aNumber) > StrToInt(pt2.Caption))
    or (StrToInt(aNumber) > StrToInt(pt3.Caption)) or (StrToInt(aNumber) > StrToInt(pt4.Caption)) or
    (StrToInt(aNumber) > StrToInt(pt5.Caption)) then
  begin
    Result := true;
  end
  else
    Result := false;
end;

procedure TFormRecord.AddRecord(ptrecorde: string; nmrecorde: string);
var
  aList: TStringList;
begin
  // ptrecorde:=edit2.Text;
  // nmrecorde:=edit1.Text;
  if TestaRecorde(ptrecorde) then
  begin
    aList := TStringList.Create;
    aList.Add(formatFloat('000', StrToInt(pt1.Caption)) + nm1.Caption);
    aList.Add(formatFloat('000', StrToInt(pt2.Caption)) + nm2.Caption);
    aList.Add(formatFloat('000', StrToInt(pt3.Caption)) + nm3.Caption);
    aList.Add(formatFloat('000', StrToInt(pt4.Caption)) + nm4.Caption);
    aList.Add(formatFloat('000', StrToInt(pt5.Caption)) + nm5.Caption);
    aList.Add(formatFloat('000', StrToInt(ptrecorde)) + nmrecorde);
    aList.sort;
    aList.Delete(0);
    nm1.Caption := copy(aList[4], 4, 255);
    nm2.Caption := copy(aList[3], 4, 255);
    nm3.Caption := copy(aList[2], 4, 255);
    nm4.Caption := copy(aList[1], 4, 255);
    nm5.Caption := copy(aList[0], 4, 255);
    pt1.Caption := InttoStr(StrToInt(copy(aList[4], 0, 3)));
    pt2.Caption := InttoStr(StrToInt(copy(aList[3], 0, 3)));
    pt3.Caption := InttoStr(StrToInt(copy(aList[2], 0, 3)));
    pt4.Caption := InttoStr(StrToInt(copy(aList[1], 0, 3)));
    pt5.Caption := InttoStr(StrToInt(copy(aList[0], 0, 3)));
  end
  else
    InputBox('Input Box', 'Prompt', 'Default string');
end;

procedure TFormRecord.LoadRecord;
Var
  IniFile: TIniFile;
  dir: string;
begin
  // block that reads the sound information
  GetDir(0, dir);
  if Length(dir) = 3 then // to avoid the bug in c:\
    IniFile := TIniFile.Create(dir + 'Records.ini')
  else
    IniFile := TIniFile.Create(dir + '\Records.ini');
  nm1.Caption := IniFile.ReadString('Prima', 'Name', '');
  pt1.Caption := IniFile.ReadString('Prima', 'Score', '');

  nm2.Caption := IniFile.ReadString('Second', 'Name', '');
  pt2.Caption := IniFile.ReadString('Second', 'Score', '');

  nm3.Caption := IniFile.ReadString('Third', 'Name', '');
  pt3.Caption := IniFile.ReadString('Third', 'Score', '');

  nm4.Caption := IniFile.ReadString('Quarto', 'Name', '');
  pt4.Caption := IniFile.ReadString('Quarto', 'Score', '');

  nm5.Caption := IniFile.ReadString('Quinto', 'Name', '');
  pt5.Caption := IniFile.ReadString('Quinto', 'Score', '');
  // fixes bug
  if nm1.Caption = '' then
    nm1.Caption := 'Empty';
  if pt1.Caption = '' then
    pt1.Caption := '0';
  if nm2.Caption = '' then
    nm2.Caption := 'Empty';
  if pt2.Caption = '' then
    pt2.Caption := '0';
  if nm3.Caption = '' then
    nm3.Caption := 'Empty';
  if pt3.Caption = '' then
    pt3.Caption := '0';
  if nm4.Caption = '' then
    nm4.Caption := 'Empty';
  if pt4.Caption = '' then
    pt4.Caption := '0';
  if nm5.Caption = '' then
    nm5.Caption := 'Empty';
  if pt5.Caption = '' then
    pt5.Caption := '0';

  IniFile.Free;
end;

procedure TFormRecord.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveRecord;
  Action := caFree;
end;

procedure TFormRecord.btnClearClick(Sender: TObject);
begin
  pt1.Caption := '0';
  pt2.Caption := '0';
  pt3.Caption := '0';
  pt4.Caption := '0';
  pt5.Caption := '0';
  nm1.Caption := 'Empty';
  nm2.Caption := 'Empty';
  nm3.Caption := 'Empty';
  nm4.Caption := 'Empty';
  nm5.Caption := 'Empty';
end;

procedure TFormRecord.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
end;

procedure TFormRecord.btnOKClick(Sender: TObject);
begin
  Close;
end;

end.
