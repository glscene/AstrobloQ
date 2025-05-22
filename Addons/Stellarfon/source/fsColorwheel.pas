unit fsColorwheel;

// The unit is part of the AstrobloQ

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
  GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.Objects,
  GLS.GeomObjects,
  GLS.Coordinates,
  GLS.SimpleNavigation,
  GLS.VectorFileObjects,

  fmFormI;

type
  TFormColorwheel = class(TFormI)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    GLDummyCube1: TGLDummyCube;
    GLIcosahedron1: TGLIcosahedron;
    GLSimpleNavigation1: TGLSimpleNavigation;
  private
  public
  end;

var
  FormColorwheel: TFormColorwheel;

implementation  //----------------------------------------------------------

{$R *.dfm}

end.
