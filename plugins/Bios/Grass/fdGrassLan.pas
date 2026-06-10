(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fdGrassLan;

interface

uses
  Winapi.Windows,
  Messages,
  System.SysUtils,
  Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Imaging.Jpeg,
  Vcl.ExtCtrls,

  GLS.Scene,
  GLS.Objects,
  GLS.SceneViewer,
  GLS.VectorFileObjects,
  GLS.FileSMD,
  GLS.Cadencer,
  GLS.ShadowPlane,
  GLS.Coordinates,
  GLS.BaseClasses;

type
  TForm1 = class(TForm)
    SceneViewer: TGLSceneViewer;
    GLScene1: TGLScene;
    focus: TGLDummyCube;
    cam: TGLCamera;
    grassland: TGLDummyCube;
    grass: TGLActor;
    GLCadencer1: TGLCadencer;
    GLLightSource1: TGLLightSource;
    shadows: TGLShadowPlane;
    grass_90: TGLProxyObject;
    grassland_90: TGLProxyObject;
    grassland_180: TGLProxyObject;
    grassland_270: TGLProxyObject;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure SceneViewerMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  mx,my: integer;

implementation //=============================================================

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  a: integer;
begin
  //load mesh
  grass.LoadFromFile('.\media\model\grass_.smd');
  grass.AddDataFromFile('.\media\model\grass_w.smd');
  grass.animationmode:=aambounceforward; grass.SwitchToAnimation(1); // you can switch
  //grass.animationmode:=aamnone; grass.currentframe:=18;            // between them

  for a:=0 to 20 do // or more if wanted
  begin
    with tglproxyobject(grassland.AddNewChild(tglproxyobject)) do
    begin
      masterobject:=grass;
      //turnangle:=random(360); // optional
      scale.Y:=random(5)/10+0.5;
      with position do
      begin
        z:=random(10)*((-1)*exp(random(2)));
        x:=random(10)*((-1)*exp(random(2)));
      end;
    end;
  end;
end;

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
  Sceneviewer.Invalidate;
end;

procedure TForm1.SceneViewerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then cam.MoveAroundTarget(my-y,mx-x);
  mx:=x;  my:=y;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Caption := Format('%.1f FPS', [Sceneviewer.FramesPerSecond]);
  Sceneviewer.ResetPerformanceMonitor;
end;

end.
