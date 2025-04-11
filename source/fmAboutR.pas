unit fmAboutR;

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

  fmForm;

type
  TFormAbout = class(TFormI)
    Panel1: TPanel;
    PageControl: TPageControl;
    tsStars: TTabSheet;
    tsDevelopers: TTabSheet;
    tsTools: TTabSheet;
    ButtonAstrobloQ: TSpeedButton;
    OGLImage: TImage;
    GLSImage: TImage;
    tsLitosfera: TTabSheet;
    tsBiosphere: TTabSheet;
    tsTehnosfera: TTabSheet;
    tsNoosfera: TTabSheet;
    tsGalaktika: TTabSheet;
    tsUniversum: TTabSheet;
    ImageGalaxy: TImage;
    ImageAstro: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ImagePlanets: TImage;
    Memo1: TMemo;
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

implementation

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
