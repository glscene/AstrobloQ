unit faTerrascope_ru;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, GLS.Material,
  GLS.Cadencer, GLS.Scene, GLS.Objects, Stage.Coordinates, GLS.SceneViewer,
  Stage.BaseClasses;

type
  TfrmTerrascope = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    GLDummyCube1: TGLDummyCube;
    GLSphere1: TGLSphere;
    GLCadencer1: TGLCadencer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    Timer1: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTerrascope: TfrmTerrascope;

implementation

{$R *.dfm}

end.
