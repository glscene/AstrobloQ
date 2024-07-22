unit fMonitor;

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

  fForm,
///  fStarLife,
  fStarProj;

type
  TFormMonitor = class(TFormI)
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
