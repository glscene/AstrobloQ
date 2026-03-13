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
  GLS.Coordinates,
  GLS.BaseClasses, GLS.SimpleNavigation;

type
  TfrmSolving = class(TForm)
    glsViewer: TGLSceneViewer;
    GLScene: TGLScene;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    GLDummyCube1: TGLDummyCube;
    GLSphere1: TGLSphere;
    GLSimpleNavigation1: TGLSimpleNavigation;
  private
  public
  end;

var
  frmSolving: TfrmSolving;

implementation //=============================================================

{$R *.dfm}

end.
