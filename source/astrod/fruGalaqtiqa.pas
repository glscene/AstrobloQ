unit fruGalaqtiqa;

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
  fruForm,
  fruAstrogen
  ;

type
  TFormGalaqtiqa = class(TFormI)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    MenuItemOpen: TMenuItem;
    MenuItemExit: TMenuItem;
    miView: TMenuItem;
    miTools: TMenuItem;
    miSettings: TMenuItem;
    miHelp: TMenuItem;
    miWiki: TMenuItem;
    miAbout: TMenuItem;
    miDivider1: TMenuItem;
    miAstrogen: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miAstrogenClick(Sender: TObject);
  private
  public
  end;

var
  FormGalaqtiqa: TFormGalaqtiqa;

implementation  //------------------------------------------------------------

{$R *.fmx}

procedure TFormGalaqtiqa.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  ReadInifile;
  inherited;
end;

procedure TFormGalaqtiqa.miAboutClick(Sender: TObject);
begin
  inherited;
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaqtiqa.miAstrogenClick(Sender: TObject);
begin
  inherited;
  // Загрузка генератора звёзд и конструктора экзопланет
  with TFormAstrogen.Create(Self) do
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

procedure TFormGalaqtiqa.miSettingsClick(Sender: TObject);
begin
  inherited;
  FormSettings.Show;
end;

end.
