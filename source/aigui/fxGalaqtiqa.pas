unit fxGalaqtiqa;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs, FMX.Menus;

type
  TFormGalaktis = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miView: TMenuItem;
    miOptions: TMenuItem;
    miHelp: TMenuItem;
    miOpen: TMenuItem;
    miSettings: TMenuItem;
    miWiki: TMenuItem;
    miAbout: TMenuItem;
    miExit: TMenuItem;
    procedure miExitClick(Sender: TObject);
  private
  public
  end;

var
  FormGalaktis: TFormGalaktis;

implementation

{$R *.fmx}

procedure TFormGalaktis.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
