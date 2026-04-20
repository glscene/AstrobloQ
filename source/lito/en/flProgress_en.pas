unit flProgress_en;

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
  TfrmProgress = class(TForm)
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
  frmProgress: TfrmProgress;

implementation //=============================================================

uses
  flFracLand_en;

{$R *.dfm}

procedure TfrmProgress.Execute;
begin
  Show;
  timTask.Enabled:= True;
end;

procedure TfrmProgress.timTaskTimer(Sender: TObject);
begin
  lblTask.Caption:= frmFracLands.FractalHDS.Task;
  ggTaskProgress.Progress:= frmFracLands.FractalHDS.TaskProgress;
end;

procedure TfrmProgress.FormHide(Sender: TObject);
begin
  timTask.Enabled:= False;
  lblTask.Caption:= '';
  ggTaskProgress.Progress:= 0;
end;

end.
