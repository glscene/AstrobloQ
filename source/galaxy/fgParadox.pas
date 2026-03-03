unit fgParadox;

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
  fmFormFirst, Vcl.ExtCtrls;

type
  TFormParadox = class(TFormFirst)
    tvThesis: TTreeView;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    VirtualImageFP: TVirtualImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  FormParadox: TFormParadox;

implementation //==============================================================

{$R *.dfm}

procedure TFormParadox.FormCreate(Sender: TObject);
var
  FileName: TFileName;
begin
  // Load Paradox items
///  tvThesis.LoadFromFile(FileName);
end;

procedure TFormParadox.FormShow(Sender: TObject);
begin
  inherited;
  tvThesis.SetFocus;
  tvThesis.FullExpand(); // вначале раскрываем все узлы дерева просмотра
  tvThesis.Select(tvThesis.Items[1]);  // узел по умолчанию
///  tvtvThesisClick(Self);
///  miHelpWiki.Caption := tvThesis.Selected.Text; // + ' in ' + 'Wiki...';

end;

end.
