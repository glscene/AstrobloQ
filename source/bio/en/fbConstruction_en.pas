unit fbConstruction_en;

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
  TFormConstruction = class(TForm)
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
  FormConstruction: TFormConstruction;

implementation //------------------------------------------------------------

uses
  fbFirstForm_en;

{$R *.dfm}

procedure TFormConstruction.FormCreate(Sender: TObject);
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

procedure TFormConstruction.FormDestroy(Sender: TObject);
begin
  if logfile then
    CloseFile(DebugFile);

  StopWatch.Free;
end;

procedure TFormConstruction.AddEvent(aString: string);
begin
  redStatus.Lines.Add(aString);
  if logfile then writeln(DebugFile, aString);
end;

procedure TFormConstruction.AddUnderlinedEvent(aString: string);
begin
  redStatus.Lines.Add('');
  if logfile then writeln(DebugFile, '');
  AddEvent(aString);
  redStatus.Lines.Add('---------------------------------');
  if logfile then writeln(DebugFile, '---------------------------------');
end;

procedure TFormConstruction.AppendToLastEvent(aString: string);
begin
  redStatus.Lines.Strings[redStatus.Lines.Count - 1] :=
    redStatus.Lines.Strings[redStatus.Lines.Count - 1] + aString;
  if logfile then writeln(DebugFile, aString);
end;

procedure TFormConstruction.AddEventSuccess(aString: string);
begin
  AppendToLastEvent(aString);
end;

procedure TFormConstruction.AddEventFailure(aString: string);
begin
  AppendToLastEvent(aString);
end;

procedure TFormConstruction.TimedEventStart(aString: string);
begin
  StopWatch.Go;
  redStatus.Lines.Add(aString);
end;

procedure TFormConstruction.TimedEventEnd(aString: string);
begin
  StopWatch.Stop;
  AppendToLastEvent(aString + ' ' + IntToStr(Variant(StopWatch.Timer)) + 'ms');
end;

procedure TFormConstruction.BitBtn1Click(Sender: TObject);
begin
  FormFirst.RealityForm.ManagerForm.DropConstruction;
end;

procedure TFormConstruction.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := false;
  FormFirst.RealityForm.ManagerForm.DropConstruction;
end;

end.
