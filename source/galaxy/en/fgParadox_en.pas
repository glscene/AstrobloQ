unit fgParadox_en;

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
  Vcl.ComCtrls,
  Vcl.VirtualImage,

  dmImages,
  fmFormFirst, Vcl.ExtCtrls, Vcl.StdCtrls, GLS.SceneViewer;

type
  TfrmParadox = class(TFormFirst)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    tvSolutions: TTreeView;
    StaticText1: TStaticText;
    glsViewer: TGLSceneViewer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  frmParadox: TfrmParadox;

implementation //==============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TfrmParadox.FormCreate(Sender: TObject);
var
  FileName: TFileName;
begin
  // Load Paradox items
  tvSolutions.FullExpand();
  tvSolutions.Select(tvSolutions.Items[1]);
end;

//-----------------------------------------------------------------------------
procedure TfrmParadox.FormShow(Sender: TObject);
begin
  inherited;
  tvSolutions.SetFocus;
///  tvSolutionsClick(Self);
///  miHelpWiki.Caption := tvThesis.Selected.Text; // + ' in ' + 'Wiki...';

end;

//-----------------------------------------------------------------------------
end.
