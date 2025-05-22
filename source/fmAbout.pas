unit fmAbout;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellApi,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  Vcl.ComCtrls,
  Vcl.Imaging.pngimage,
  Vcl.Buttons,

  fmFormI;

type
  TFrmAbout = class(TFormI)
    Panel1: TPanel;
    PageControl: TPageControl;
    tsDevelopers: TTabSheet;
    tsTools: TTabSheet;
    ButtonAstrobloQ: TSpeedButton;
    OGLImage: TImage;
    GLSImage: TImage;
    tsTerrasfera: TTabSheet;
    tsBiosphere: TTabSheet;
    tsNoosfera: TTabSheet;
    tsAstroScene: TTabSheet;
    tsGalaktika: TTabSheet;
    tsUniversum: TTabSheet;
    ImageGalaxy: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    MemoTeam: TMemo;
    Image2: TImage;
    ImagePlanets: TImage;
    PanelAllPlanets: TPanel;
    PanelTerrasfera: TPanel;
    PanelBiosfera: TPanel;
    PanelNoosfera: TPanel;
    PanelGalaktika: TPanel;
    PanelUniverse: TPanel;
    procedure ImageGLSClick(Sender: TObject);
    procedure GLSImageClick(Sender: TObject);
    procedure OGLImageClick(Sender: TObject);
    procedure ButtonAstrobloQClick(Sender: TObject);
    procedure ImageGalaxyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FrmAbout: TFrmAbout;

implementation //-------------------------------------------------------------

{$R *.dfm}

procedure TFrmAbout.ButtonAstrobloQClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/AstrobloQ', '', '', SW_SHOW);
end;

procedure TFrmAbout.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmAbout.GLSImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/glscene/', '', '', SW_SHOW);
end;

procedure TFrmAbout.ImageGLSClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/GLScene', '', '', SW_SHOW);
end;

procedure TFrmAbout.ImageGalaxyClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/astrobloq/', '', '', SW_SHOW);
end;

procedure TFrmAbout.OGLImageClick(Sender: TObject);
begin
   ShellExecute(0, 'open',
    'https://www.opengl.org/', '', '', SW_SHOW);
end;

end.
