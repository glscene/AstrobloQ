unit fgMonitor;

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
  Vcl.ExtCtrls,
  Vcl.ComCtrls,

  fmFormI,
///  fStarLife,
  fStarProj;

type
  TFormMonitor = class(TfrmI)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    TreeView1: TTreeView;
  private
  public
  end;

var
  FormMonitor: TFormMonitor;

implementation

{$R *.dfm}

end.
