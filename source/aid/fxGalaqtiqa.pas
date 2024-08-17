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
  FMX.Dialogs,
  FMX.Menus,

  fxAbout,
  fxSettings;

type
  TFormGalaqtiqa = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miExit: TMenuItem;
    miView: TMenuItem;
    miTools: TMenuItem;
    miSettings: TMenuItem;
    miHelp: TMenuItem;
    miWiki: TMenuItem;
    miAbout: TMenuItem;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
  private
  public
  end;

var
  FormGalaqtiqa: TFormGalaqtiqa;

implementation

{$R *.fmx}

procedure TFormGalaqtiqa.miAboutClick(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaqtiqa.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormGalaqtiqa.miSettingsClick(Sender: TObject);
begin
  FormSettings.Show;
end;

end.
