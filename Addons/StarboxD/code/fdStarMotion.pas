// FreeForm Planets
unit fdStarMotion;

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
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ComCtrls,

  GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.Objects,
  GLS.Coordinates,
  GLS.SimpleNavigation,
  GLS.Cadencer,
  GLS.VectorFileObjects;

type
  TfrmPlanetFF = class(TForm)
    GLSceneViewer: TGLSceneViewer;
    GLScene1: TGLScene;
    StatusBar1: TStatusBar;
    GLCamera1: TGLCamera;
    dcSceneAI: TGLDummyCube;
    CubeTop: TGLCube;
    CubeBottom: TGLCube;
    RedLight: TGLLightSource;
    GLSimpleNavigation1: TGLSimpleNavigation;
    CubeFront: TGLCube;
    CubeBack: TGLCube;
    CubeLeft: TGLCube;
    CubeRight: TGLCube;
    RedSphere: TGLSphere;
    dcRedLight: TGLDummyCube;
    GLCadencer1: TGLCadencer;
    dcBlueLight: TGLDummyCube;
    dcGreenLight: TGLDummyCube;
    BlueLight: TGLLightSource;
    GreenLight: TGLLightSource;
    BlueSphere: TGLSphere;
    GreenSphere: TGLSphere;
    dcCubeParts: TGLDummyCube;
    WhiteLight: TGLLightSource;
    ffPlanet: TGLFreeForm;
    procedure GLCadencer1Progress(Sender: TObject; const DeltaTime, NewTime: Double);
    procedure miExitClick(Sender: TObject);
  private
  public
  end;

var
  frmPlanetFF: TfrmPlanetFF;

implementation //=============================================================

{$R *.dfm}

procedure TfrmPlanetFF.GLCadencer1Progress(Sender: TObject; const DeltaTime, NewTime: Double);
begin
  dcBlueLight.RollAngle := newTime * 60;
  dcGreenLight.PitchAngle := newTime * 60;
  dcRedLight.TurnAngle := newTime * 60;
  GLSceneViewer.Invalidate;
end;

procedure TfrmPlanetFF.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
