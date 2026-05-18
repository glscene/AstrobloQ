(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit flProgress_ru;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Samples.Gauges;

type
  TFormProgress = class(TForm)
    ggTaskProgress: TGauge;
    lblTask: TLabel;
    timTask: TTimer;
    procedure timTaskTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
     
  public
    procedure Execute;
  end;

var
  FormProgress: TFormProgress;

implementation //=============================================================

uses
  flLithoneta_ru;

{$R *.dfm}

//---------------------------------------------------------------------------
procedure TFormProgress.Execute;
begin
  Show;
  timTask.Enabled:= True;
end;

//---------------------------------------------------------------------------
procedure TFormProgress.timTaskTimer(Sender: TObject);
begin
  lblTask.Caption:= FormLithoneta.FractalHDS.Task;
  ggTaskProgress.Progress:= FormLithoneta.FractalHDS.TaskProgress;
end;

//---------------------------------------------------------------------------
procedure TFormProgress.FormHide(Sender: TObject);
begin
  timTask.Enabled:= False;
  lblTask.Caption:= '';
  ggTaskProgress.Progress:= 0;
end;

end.
