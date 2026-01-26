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

  fmFormFirst;

type
  TFormAbout = class(TfrmFirst)
    Panel1: TPanel;
    PageControl: TPageControl;
    tsDevelopers: TTabSheet;
    tsTools: TTabSheet;
    ButtonAstrobloQ: TSpeedButton;
    OGLImage: TImage;
    GLSImage: TImage;
    tsLitosfera: TTabSheet;
    tsBiosphere: TTabSheet;
    tsTehnosfera: TTabSheet;
    tsAstroScene: TTabSheet;
    tsGalaqtium: TTabSheet;
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
  FormAbout: TFormAbout;

implementation //=============================================================

{$R *.dfm}

procedure TFormAbout.ButtonAstrobloQClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/AstrobloQ', '', '', SW_SHOW);
end;

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFormAbout.GLSImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/glscene/', '', '', SW_SHOW);
end;

procedure TFormAbout.ImageGLSClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/GLScene', '', '', SW_SHOW);
end;

procedure TFormAbout.ImageGalaxyClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/astrobloq/', '', '', SW_SHOW);
end;

procedure TFormAbout.OGLImageClick(Sender: TObject);
begin
   ShellExecute(0, 'open',
    'https://www.opengl.org/', '', '', SW_SHOW);
end;

end.
