unit fAbout;

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

  fForm;

type
  TFormAbout = class(TFormI)
    Panel1: TPanel;
    PageControl: TPageControl;
    tsStars: TTabSheet;
    tsDevelopers: TTabSheet;
    tsTools: TTabSheet;
    DelphiButton: TSpeedButton;
    OGLImage: TImage;
    GLSImage: TImage;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    ImageGalaxy: TImage;
    Label1: TLabel;
    StaticText4: TStaticText;
    tsLithosphere: TTabSheet;
    tsBiosphere: TTabSheet;
    tsTechnosphere: TTabSheet;
    ImageLito_ru: TImage;
    ImageLito_en: TImage;
    procedure ImageGLSClick(Sender: TObject);
    procedure GLSImageClick(Sender: TObject);
    procedure OGLImageClick(Sender: TObject);
    procedure DelphiButtonClick(Sender: TObject);
    procedure ImageGalaxyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.DelphiButtonClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://github.com/glscene', '', '', SW_SHOW);
end;

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  if FormI.ActiveLang = LANG_ENGLISH then
  begin
    ImageLito_en.Visible := True;
    ImageLito_ru.Visible := False;
    ImageLito_en.Align := alClient;
  end
  else
  begin
    ImageLito_en.Visible := False;
    ImageLito_ru.Visible := True;
    ImageLito_ru.Align := alClient;
  end;
  inherited;
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
