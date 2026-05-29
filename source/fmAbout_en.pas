(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fmAbout_en;

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
    Panel1: TPanel;
    PageControl: TPageControl;
    tsDevelopers: TTabSheet;
    tsTools: TTabSheet;
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
    AGCImage: TImage;
    tsCertificates: TTabSheet;
    ImageGLXE: TImage;
    procedure GLSImageClick(Sender: TObject);
    procedure AGCImageClick(Sender: TObject);
    procedure ImageGalaxyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
  private
  public
  end;

var
  frmAbout: TfrmAbout;

implementation //=============================================================

{$R *.dfm}

//-----------------------------------------------------------------------------
procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

//-----------------------------------------------------------------------------
procedure TfrmAbout.Panel1DblClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/astrogeoscenter/AstrobloQ', '', '', SW_SHOW);
end;

//-----------------------------------------------------------------------------
procedure TfrmAbout.AGCImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/GLScene', '', '', SW_SHOW);
end;

procedure TfrmAbout.GLSImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/glscene/', '', '', SW_SHOW);
end;

procedure TfrmAbout.ImageGalaxyClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/astrobloq/', '', '', SW_SHOW);
end;

end.
