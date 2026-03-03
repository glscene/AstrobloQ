unit fmAbout_ru;

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
  TfrmAbout = class(TFormFirst)
    PanelAstrobloQ: TPanel;
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
    Memo1: TMemo;
    Image2: TImage;
    ImagePlanets: TImage;
    PanelAllPlanets: TPanel;
    PanelLitosfera: TPanel;
    PanelTehnosfera: TPanel;
    PanelGalaktika: TPanel;
    PanelUniverse: TPanel;
    PanelBiosfera: TPanel;
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
  frmAbout: TfrmAbout;

implementation //==============================================================

{$R *.dfm}

procedure TfrmAbout.ButtonAstrobloQClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/AstrobloQ', '', '', SW_SHOW);
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmAbout.GLSImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/glscene/', '', '', SW_SHOW);
end;

procedure TfrmAbout.ImageGLSClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/GLScene', '', '', SW_SHOW);
end;

procedure TfrmAbout.ImageGalaxyClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/astrobloq/', '', '', SW_SHOW);
end;

procedure TfrmAbout.OGLImageClick(Sender: TObject);
begin
   ShellExecute(0, 'open',
    'https://www.opengl.org/', '', '', SW_SHOW);
end;

end.
