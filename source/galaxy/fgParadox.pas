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

  fmFormFirst;

type
  TFormParadox = class(TfrmFirst)
    tvThesis: TTreeView;
    StatusBar1: TStatusBar;
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
