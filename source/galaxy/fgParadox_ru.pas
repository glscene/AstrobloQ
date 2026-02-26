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
  fmFormFirst;

type
  TFormParadox = class(TfrmFirst)
    tvThesis: TTreeView;
    StatusBar1: TStatusBar;
    PanelFP: TPanel;
    VirtualImageFP: TVirtualImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvThesisClick(Sender: TObject);
  private
  public
  end;

var
  FormParadox: TFormParadox;

implementation //==============================================================

{$R *.dfm}

//-----------------------------------------------------------------------------
procedure TFormParadox.FormCreate(Sender: TObject);
var
  FileName: TFileName;
begin
  // Load Paradox items
 /// tvScenariosFP.LoadFromFile(FileName);
///  VirtualImageFP.ImageCollection.UnitName.LowerCase(FileName);
end;

//-----------------------------------------------------------------------------
procedure TFormParadox.FormShow(Sender: TObject);
begin
  inherited;
  tvThesis.SetFocus;
  tvThesis.FullExpand(); // вначале раскрываем все узлы дерева просмотра
  tvThesis.Select(tvThesis.Items[1]);  // узел по умолчанию
///  tvtvThesisClick(Self);
///  miHelpWiki.Caption := tvThesis.Selected.Text; // + ' in ' + 'RuWiki...';
end;

//-----------------------------------------------------------------------------
procedure TFormParadox.tvThesisClick(Sender: TObject);
begin
  inherited;
  ///
end;

end.
