unit fdGalaxy;

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

  fdForm,
  fdAbout,
  fdSettings,
  fdAstrogen
  ;

type
  TFormGalaxy = class(TFormO)
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
    miAstrogen: TMenuItem;
    miDivider1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miAstrogenClick(Sender: TObject);
  private
  public
  end;

var
  FormGalaxy: TFormGalaxy;

implementation //-------------------------------------------------------------

{$R *.fmx}

procedure TFormGalaxy.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  ReadInifile;
  inherited;
end;

//---------------------------------------------------------------------------

procedure TFormGalaxy.miAstrogenClick(Sender: TObject);
begin
  inherited;
  // Load astrogenerator and exoplanet constructor
  with TFormAstrogen.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxy.miAboutClick(Sender: TObject);
begin
  inherited;
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxy.miSettingsClick(Sender: TObject);
begin
  inherited;
  FormSettings.Show;
end;

//---------------------------------------------------------------------------

procedure TFormGalaxy.miExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
