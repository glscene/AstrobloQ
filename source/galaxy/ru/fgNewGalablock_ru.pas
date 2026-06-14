(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fgNewGalablock_ru;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus,

  Stage.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.Cadencer,
  GLS.AsyncTimer,
  GLS.Objects,
  Stage.Coordinates,
  GLS.SimpleNavigation,

  fgOptions_ru
  ;

type
  TfrmNewStarblock = class(TForm)
    PanelRight: TPanel;
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCadencer1: TGLCadencer;
    GLAsyncTimer1: TGLAsyncTimer;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miSaveAs: TMenuItem;
    Camera: TGLCamera;
    LightSource: TGLLightSource;
    dcStarblock: TGLDummyCube;
    ñubeStarblock: TGLCube;
    sphereStarblock: TGLSphere;
    pntStars: TGLPoints;
    GLSimpleNavigation1: TGLSimpleNavigation;
    pntCube: TGLPoints;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmNewStarblock: TfrmNewStarblock;

implementation //=============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TfrmNewStarblock.FormCreate(Sender: TObject);
begin
  //
end;

end.
