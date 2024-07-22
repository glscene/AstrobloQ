unit fExoplanets;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  GLS.Material,
  GLS.Cadencer,
  GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,
  Vcl.StdCtrls,
  GLS.Objects,
  GLS.Coordinates;

type
  TFormExoplanets = class(TForm)
    ControlBar: TControlBar;
    StatusBar: TStatusBar;
    PanelLeft: TPanel;
    PanelRight: TPanel;
    tvStellarSystems: TTreeView;
    tvExoplanets: TTreeView;
    GLSceneViewer: TGLSceneViewer;
    GLScene: TGLScene;
    GLCadencer: TGLCadencer;
    GLMaterialLibrary: TGLMaterialLibrary;
    chbTerraplanets: TCheckBox;
    stStellarSystem: TStaticText;
    stExoplanets: TStaticText;
    Camera: TGLCamera;
    DummyCube: TGLDummyCube;
    LightSource: TGLLightSource;
  private
  public
  end;

var
  FormExoplanets: TFormExoplanets;

implementation

{$R *.dfm}

end.
