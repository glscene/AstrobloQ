(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fgSolving_ru;

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
  GLS.SceneViewer,
  GLS.Scene,
  GLS.Objects,
  Stage.Coordinates,
  Stage.BaseClasses, GLS.SimpleNavigation;

type
  TfrmSolving = class(TForm)
    SolvingViewer: TGLSceneViewer;
    GLSceneSolvings: TGLScene;
    GLCameraSol: TGLCamera;
    GLLightSource1: TGLLightSource;
    GLDummyCubeSol: TGLDummyCube;
    GLSphereSol: TGLSphere;
    GLSimpleNavigation1: TGLSimpleNavigation;
    GLLightSourceSol: TGLLightSource;
  private
  public
  end;

var
  frmSolving: TfrmSolving;

implementation //=============================================================

{$R *.dfm}

end.
