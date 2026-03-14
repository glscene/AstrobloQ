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

  fmFormFirst,
///  fgStarLife,
  fgGlobulars;

type
  TfrmMonitor = class(TFormFirst)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    TreeView1: TTreeView;
  private
  public
  end;

var
  frmMonitor: TfrmMonitor;

implementation //==============================================================

{$R *.dfm}

end.
