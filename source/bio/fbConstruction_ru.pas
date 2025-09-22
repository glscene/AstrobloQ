unit fbConstruction_ru;

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
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,

  Bio.Utilities;

type
  TfrmConstruction = class(TForm)
    Panel1: TPanel;
    redStatus: TRichEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
     
  public
    StopWatch: TaiStopWatch;
    DebugFile: TextFile;
    Logfile: boolean;
    procedure AddEvent(aString: string);
    procedure AddUnderlinedEvent(aString: string);
    procedure AppendToLastEvent(aString: string);
    procedure AddEventSuccess(aString: string);
    procedure AddEventFailure(aString: string);
    procedure TimedEventStart(aString: string);
    procedure TimedEventEnd(aString: string);
  end;

var
  frmConstruction: TfrmConstruction;

implementation //------------------------------------------------------------

uses
  fbFirstForm_ru;

{$R *.dfm}

procedure TfrmConstruction.FormCreate(Sender: TObject);
begin
  StopWatch := TaiStopWatch.Create;

  // open a logfile, if possible
  logfile := true;
  if FileExists('construction.log') then
    logfile := DeleteFile('construction.log');

  if logfile then
  begin
    AssignFile(DebugFile, 'construction.log');
    logfile := (IOResult = 0);
    if logfile then
    begin
      Rewrite(DebugFile);
      logfile := (IOResult = 0);
    end;
  end;
end;

procedure TfrmConstruction.FormDestroy(Sender: TObject);
begin
  if logfile then
    CloseFile(DebugFile);

  StopWatch.Free;
end;

procedure TfrmConstruction.AddEvent(aString: string);
begin
  redStatus.Lines.Add(aString);
  if logfile then writeln(DebugFile, aString);
end;

procedure TfrmConstruction.AddUnderlinedEvent(aString: string);
begin
  redStatus.Lines.Add('');
  if logfile then writeln(DebugFile, '');
  AddEvent(aString);
  redStatus.Lines.Add('---------------------------------');
  if logfile then writeln(DebugFile, '---------------------------------');
end;

procedure TfrmConstruction.AppendToLastEvent(aString: string);
begin
  redStatus.Lines.Strings[redStatus.Lines.Count - 1] :=
    redStatus.Lines.Strings[redStatus.Lines.Count - 1] + aString;
  if logfile then writeln(DebugFile, aString);
end;

procedure TfrmConstruction.AddEventSuccess(aString: string);
begin
  AppendToLastEvent(aString);
end;

procedure TfrmConstruction.AddEventFailure(aString: string);
begin
  AppendToLastEvent(aString);
end;

procedure TfrmConstruction.TimedEventStart(aString: string);
begin
  StopWatch.Go;
  redStatus.Lines.Add(aString);
end;

procedure TfrmConstruction.TimedEventEnd(aString: string);
begin
  StopWatch.Stop;
  AppendToLastEvent(aString + ' ' + IntToStr(Variant(StopWatch.Timer)) + 'ms');
end;

procedure TfrmConstruction.BitBtn1Click(Sender: TObject);
begin
  frmFirst.RealityForm.ManagerForm.DropConstruction;
end;

procedure TfrmConstruction.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := false;
  frmFirst.RealityForm.ManagerForm.DropConstruction;
end;

end.
