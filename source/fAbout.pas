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
  Vcl.Buttons;

type
  TFormAbout = class(TForm)
    Panel1: TPanel;
    PageControl: TPageControl;
    tsInfo: TTabSheet;
    Panel2: TPanel;
    tsDevelopers: TTabSheet;
    MemoDevelopers: TMemo;
    ImageMoons: TImage;
    tsTools: TTabSheet;
    DelphiButton: TSpeedButton;
    OGLImage: TImage;
    GLSImage: TImage;
    procedure ImageGLSClick(Sender: TObject);
    procedure ImageMoonsDblClick(Sender: TObject);
    procedure GLSImageClick(Sender: TObject);
    procedure OGLImageClick(Sender: TObject);
    procedure DelphiButtonClick(Sender: TObject);
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

procedure TFormAbout.GLSImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://www.glscene.org/', '', '', SW_SHOW);
end;

procedure TFormAbout.ImageGLSClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://github.com/glscene', '', '', SW_SHOW);
end;

procedure TFormAbout.ImageMoonsDblClick(Sender: TObject);
begin
  MemoDevelopers.Visible := not MemoDevelopers.Visible;
end;

procedure TFormAbout.OGLImageClick(Sender: TObject);
begin
   ShellExecute(0, 'open',
    'https://www.opengl.org/', '', '', SW_SHOW);
end;

end.
