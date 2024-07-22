unit fParadox;

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

  fForm;

type
  TFormParadox = class(TFormI)
    tvParadox: TTreeView;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormParadox: TFormParadox;

implementation

{$R *.dfm}

procedure TFormParadox.FormCreate(Sender: TObject);
var
  FileName: TFileName;
begin
  // Load Paradox items
  case LangID of
    LANG_ENGLISH:
      begin
        // en file
        tvParadox.LoadFromFile(FileName);
      end;
    LANG_RUSSIAN:
      begin
        // ru file
        tvParadox.LoadFromFile(FileName);
        //
      end;
  end;
  tvParadox.FullExpand();
end;

end.
