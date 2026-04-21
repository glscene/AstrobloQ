(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
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
  Vcl.Imaging.jpeg,
  Vcl.StdCtrls,

  dmImages,
  fmFormFirst,
  fgSolving_ru,

  GLS.SceneViewer,
  GLS.BaseClasses,
  GLS.Scene, GLS.SimpleNavigation, GLS.Material, GLS.Cadencer,
  GLS.VectorFileObjects, GLS.Objects, GLS.Coordinates;

type
  TfrmParadox = class(TFormFirst)
    StatusBar1: TStatusBar;
    PanelFP: TPanel;
    tvSolutions: TTreeView;
    StaticText1: TStaticText;
    PanelSolvings: TPanel;
    ParadoxViewer: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCadencer1: TGLCadencer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    GLSimpleNavigation1: TGLSimpleNavigation;
    GLCameraPar: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLFreeForm1: TGLFreeForm;
    GLLightSourcePar: TGLLightSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvSolutionsClick(Sender: TObject);
    procedure PanelSolvingsDblClick(Sender: TObject);
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

  // создание формы решений парадокса
  frmSolving := TfrmSolving.Create(frmParadox);
  frmSolving.Parent := PanelSolvings; //frmParadox;
  frmSolving.Show;
  frmSolving.BorderStyle := bsNone;
  frmSolving.Align := alClient;

  tvSolutions.FullExpand(); // раскрываем все узлы дерева просмотра
  tvSolutions.Select(tvSolutions.Items[0]);  // узел по умолчанию
  tvSolutionsClick(Sender);
end;

//-----------------------------------------------------------------------------
procedure TfrmParadox.FormShow(Sender: TObject);
begin
  inherited;
  tvSolutions.SetFocus;

///  tvSolutionsClick(Self);
///  miHelpWiki.Caption := tvThesis.Selected.Text; // + ' in ' + 'RuWiki...';
end;

procedure TfrmParadox.PanelSolvingsDblClick(Sender: TObject);
begin
  inherited;
end;

//-----------------------------------------------------------------------------
procedure TfrmParadox.tvSolutionsClick(Sender: TObject);
begin
  inherited;
  /// tvSolutions.Items[0].DropHighlighted := False;

  case tvSolutions.Selected.Index of
    0: // ”никальность
      begin // “ерранеты редки
        frmSolving.Visible := False;
        ParadoxViewer.Visible := True;
      end;
    1:
      begin //
        ParadoxViewer.Visible := False;
        frmSolving.Visible := True;
      end;
(*
    2:
      begin //
        frmSolving := TfrmSolving.Create(frmParadox);
        frmSolving.Parent := frmParadox;
        frmSolving.Align := alClient;
        frmSolving.BorderStyle := bsNone;
        frmSolving.Show;
      end;
  end;
  //...
  *)
   end;
end;

end.
