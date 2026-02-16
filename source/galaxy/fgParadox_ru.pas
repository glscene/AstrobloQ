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

  fmFormFirst;

type
  TFormParadox = class(TfrmFirst)
    tvSolutions: TTreeView;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvSolutionsClick(Sender: TObject);
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
 /// tvScenariosFP.LoadFromFile(FileName);


end;

procedure TFormParadox.FormShow(Sender: TObject);
begin
  inherited;
  tvSolutions.SetFocus;
  tvSolutions.FullExpand(); // вначале раскрываем все узлы дерева просмотра
  tvSolutions.Select(tvSolutions.Items[1]);  // узел по умолчанию
///  tvSolutionsClick(Self);
///  miHelpWiki.Caption := tvSolutions.Selected.Text; // + ' in ' + 'RuWiki...';
end;

procedure TFormParadox.tvSolutionsClick(Sender: TObject);
begin
  inherited;
  ///
end;

end.
