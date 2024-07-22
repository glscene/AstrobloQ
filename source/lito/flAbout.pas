unit flAbout;

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
  Vcl.Buttons, GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.SkyDome,
  GLS.Objects,
  GLS.Coordinates,
  fForm;

type
  TFormAbout = class(TFormI)
    Panel1: TPanel;
    ImageLito_en: TImage;
    ImageLito_ru: TImage;
    procedure ImageGLSClick(Sender: TObject);
    procedure GLSImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormAbout: TFormAbout;

//=======================================================================
implementation

{$R *.dfm}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  if FormI.LangID = LANG_ENGLISH then
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

end.
