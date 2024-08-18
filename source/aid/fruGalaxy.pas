unit fruGalaxy;

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

  fruAbout,
  fruSettings,
  fruForm
  ;

type
  TFormGalaqtiqa = class(TFormI)
    MainMenu: TMainMenu;
    MenuItemFile: TMenuItem;
    MenuItemOpen: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemView: TMenuItem;
    MenuItemTools: TMenuItem;
    MenuItemSettings: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemWiki: TMenuItem;
    MenuItemAbout: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemSettingsClick(Sender: TObject);
  private
  public
  end;

var
  FormGalaqtiqa: TFormGalaqtiqa;

implementation

{$R *.fmx}

procedure TFormGalaqtiqa.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  ReadInifile;
  inherited;
end;

procedure TFormGalaqtiqa.MenuItemAboutClick(Sender: TObject);
begin
  inherited;
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaqtiqa.MenuItemExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormGalaqtiqa.MenuItemSettingsClick(Sender: TObject);
begin
  inherited;
  FormSettings.Show;
end;

end.
