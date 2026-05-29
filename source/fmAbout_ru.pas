(*****************************************************************************
                           AstrobloQ System
******************************************************************************)
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
    MemoDevelopers: TMemo;
    Image2: TImage;
    ImagePlanets: TImage;
    PanelAllPlanets: TPanel;
    PanelLitosfera: TPanel;
    PanelTehnosfera: TPanel;
    PanelGalaktika: TPanel;
    PanelUniverse: TPanel;
    PanelBiosfera: TPanel;
    AGCImage: TImage;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    procedure AGCImageClick(Sender: TObject);
    procedure GLSImageClick(Sender: TObject);
    procedure PanelAstrobloQDblClick(Sender: TObject);
  private
  public
  end;

var
  frmAbout: TfrmAbout;

implementation //==============================================================

{$R *.dfm}

//-----------------------------------------------------------------------------
procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

//-----------------------------------------------------------------------------
procedure TfrmAbout.PanelAstrobloQDblClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/astrogeoscenter/AstrobloQ', '', '', SW_SHOW);
end;

//-----------------------------------------------------------------------------
procedure TfrmAbout.AGCImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
    'https://gitverse.ru/glscene/GLXEngine', '', '', SW_SHOW);
end;


//-----------------------------------------------------------------------------
procedure TfrmAbout.GLSImageClick(Sender: TObject);
begin
  ShellExecute(0, 'open',
   'https://gitflic.ru/project/glscene/glxengine', '', '', SW_SHOW);
end;



//-----------------------------------------------------------------------------
end.
