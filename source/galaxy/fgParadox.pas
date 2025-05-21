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

  fmFormI;

type
  TFormParadox = class(TfrmI)
    tvParadox: TTreeView;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormParadox: TFormParadox;

implementation //------------------------------------------------------------

{$R *.dfm}

procedure TFormParadox.FormCreate(Sender: TObject);
var
  FileName: TFileName;
begin
  // Load Paradox items
  tvParadox.LoadFromFile(FileName);
  tvParadox.FullExpand();
end;

end.
