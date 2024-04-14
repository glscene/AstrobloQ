unit fgAbout;

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
  Vcl.Imaging.jpeg, Vcl.ComCtrls;

type
  TFormAbout = class(TForm)
    Panel1: TPanel;
    PageControl: TPageControl;
    tsInfo: TTabSheet;
    Panel2: TPanel;
    tsContributor: TTabSheet;
    MemoDevelopers: TMemo;
    ImageMoons: TImage;
    procedure ImageGLSClick(Sender: TObject);
    procedure ImageMoonsDblClick(Sender: TObject);
  private
  public
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.ImageGLSClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://github.com/glscene', '', '', SW_SHOW);
end;

procedure TFormAbout.ImageMoonsDblClick(Sender: TObject);
begin
  MemoDevelopers.Visible := not MemoDevelopers.Visible;
end;

end.
