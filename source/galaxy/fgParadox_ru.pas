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
    tvScenariosFP: TTreeView;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
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
  tvScenariosFP.FullExpand();
end;

end.
