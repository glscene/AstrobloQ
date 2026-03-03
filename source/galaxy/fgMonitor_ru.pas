unit fgMonitor_ru;

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
  Vcl.Imaging.jpeg,

  fmFormFirst,
///  fmStarLife,
  fgStarProj;

type
  TFormMonitor = class(TFormFirst)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    TreeView1: TTreeView;
  private
  public
  end;

var
  FormMonitor: TFormMonitor;

implementation //=============================================================

{$R *.dfm}

end.
