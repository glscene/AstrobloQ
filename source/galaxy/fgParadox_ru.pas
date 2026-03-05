unit fgParadox_ru;

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
  Vcl.ExtCtrls,
  Vcl.VirtualImage,

  dmImages,
  fmFormFirst, Vcl.Imaging.jpeg, Vcl.StdCtrls, GLS.SceneViewer, GLS.BaseClasses,
  GLS.Scene;

type
  TfrmParadox = class(TFormFirst)
    StatusBar1: TStatusBar;
    PanelFP: TPanel;
    tvSolutions: TTreeView;
    StaticText1: TStaticText;
    GLScene: TGLScene;
    glsViewer: TGLSceneViewer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvSolutionsClick(Sender: TObject);
  private
  public
  end;

var
  frmParadox: TfrmParadox;

implementation //==============================================================

{$R *.dfm}

//-----------------------------------------------------------------------------
procedure TfrmParadox.FormCreate(Sender: TObject);
var
  FileName: TFileName;
begin
  // Load Paradox items
 /// tvScenariosFP.LoadFromFile(FileName);
///  VirtualImageFP.ImageCollection.UnitName.LowerCase(FileName);
  tvSolutions.FullExpand(); // раскрываем все узлы дерева просмотра
  tvSolutions.Select(tvSolutions.Items[1]);  // узел по умолчанию
end;

//-----------------------------------------------------------------------------
procedure TfrmParadox.FormShow(Sender: TObject);
begin
  inherited;
  tvSolutions.SetFocus;
///  tvSolutionsClick(Self);
///  miHelpWiki.Caption := tvThesis.Selected.Text; // + ' in ' + 'RuWiki...';
end;

//-----------------------------------------------------------------------------
procedure TfrmParadox.tvSolutionsClick(Sender: TObject);
begin
  inherited;
  ///
end;

end.
