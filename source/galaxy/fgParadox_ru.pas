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
  GLS.Scene;

type
  TfrmParadox = class(TFormFirst)
    StatusBar1: TStatusBar;
    PanelFP: TPanel;
    tvSolutions: TTreeView;
    StaticText1: TStaticText;
    PanelScene: TPanel;
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

//-----------------------------------------------------------------------------
procedure TfrmParadox.tvSolutionsClick(Sender: TObject);
begin
  inherited;
  /// tvSolutions.Items[0].DropHighlighted := False;
  case tvSolutions.Selected.Index of
    0: // Уникальность
      begin // Терранеты редки
        frmSolving := TfrmSolving.Create(frmParadox);
        frmSolving.Parent := PanelScene; //frmParadox;
        frmSolving.Show;
        frmSolving.BorderStyle := bsNone;
        frmSolving.Align := alClient;
      end;
(*
    1:
      begin //
        frmSolving := TfrmSolving.Create(frmParadox);
        frmSolving.Parent := frmParadox;
        frmSolving.Align := alClient;
        frmSolving.BorderStyle := bsNone;
        frmSolving.Show;
      end;
    2:
      begin //
        frmSolving := TfrmSolving.Create(frmParadox);
        frmSolving.Parent := frmParadox;
        frmSolving.Align := alClient;
        frmSolving.BorderStyle := bsNone;
        frmSolving.Show;
      end;
*)
  end;
  //...
end;

end.
