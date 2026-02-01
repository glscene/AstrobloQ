unit fdDolphin;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.Imaging.Jpeg,

  GLS.Scene,
  GLS.VectorFileObjects,
  GLS.Objects,
  GLS.SceneViewer,
  GLS.Cadencer,
  GLS.Texture,
  GLS.VectorLists,
  Stage.VectorGeometry,
  GLS.TerrainRenderer,
  GLS.HeightData,
  GLS.FireFX,
  GLS.Coordinates,

  GLS.File3DS,
  GLS.BaseClasses;

type
  TForm1 = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLFreeForm1: TGLFreeForm;
    GLLightSource1: TGLLightSource;
    GLCadencer1: TGLCadencer;
    Timer1: TTimer;
    GLTerrainRenderer1: TGLTerrainRenderer;
    GLBitmapHDS1: TGLBitmapHDS;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime, newTime: Double);
    procedure GLSceneViewer1AfterRender(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GLDummyCube1Progress(Sender: TObject; const deltaTime, newTime: Double);
  private
  public
    mx, my, mx2, my2: Integer;
  end;

var
  Form1: TForm1;
  angulo: Single;
  Fig: TGLAffineVectorList;

implementation //============================================================

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  Count: Integer;
begin
  GLFreeForm1.LoadFromFile('.\media\model\dolphin.3ds');
  // We save the initial state of the dolphin
  Fig := TGLAffineVectorList.Create;
  Fig.Assign(GLFreeForm1.MeshObjects.Items[0].Vertices);
  Count := Fig.Count; // the number of vertices
  // we load the seabed ...
  GLBitmapHDS1.MaxPoolSize := 8 * 1024 * 1024;
  GLBitmapHDS1.Picture.LoadFromFile('.\media\texture\terrain.bmp');
  GLTerrainRenderer1.TilesPerTexture := 256 / GLTerrainRenderer1.TileSize;
  GLTerrainRenderer1.Material.Texture.Image.LoadFromFile('.\media\texture\tex.jpg');
  GLTerrainRenderer1.Material.Texture.Disabled := False;

  GLSceneViewer1.Buffer.BackgroundColor := rgb(0, 0, 160);
  GLSceneViewer1.Buffer.FogEnvironment.FogColor.AsWinColor := rgb(0, 0, 110 { 160 } );
  GLSceneViewer1.Buffer.FogEnvironment.FogStart := -GLSceneViewer1.Buffer.FogEnvironment.FogStart;
end;

procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  mx := X;
  my := Y;
  mx2 := X;
  my2 := Y;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
  begin
    mx2 := X;
    my2 := Y;
  end;
end;

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime, newTime: Double);
const
  AMPLITUDE = 20;
  FREQUENCY_KICK = 15;
var
  j: Integer;
  v: TAffineVector;
  f: Single;
begin
  // Permission to move around target...
  if ((mx <> mx2) or (my <> my2)) then
  begin
    GLCamera1.MoveAroundTarget(my - my2, mx - mx2);
    mx := mx2;
    my := my2;
  end;

  if CheckBox1.Checked then
  begin
    angulo := newTime;
    // Application of animation for Dolfin...
    for j := 0 to GLFreeForm1.MeshObjects.Items[0].Vertices.Count - 1 do
      with GLFreeForm1.MeshObjects.Items[0].Vertices do
      begin
        f := sin(angulo * FREQUENCY_KICK) * (sqr(Items[j].X) / AMPLITUDE);
        v.X := 0;
        v.Y := 0;
        v.Z := f;
        TranslateItem(j, v);
      end;
    GLFreeForm1.StructureChanged;
  end;
end;

procedure TForm1.GLSceneViewer1AfterRender(Sender: TObject);
var
  j: Integer;
  v: TAffineVector;
  f: Single;
begin
  // After drawing we return to the initial state dolphin
  GLFreeForm1.MeshObjects.Items[0].Vertices.Assign(Fig);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Fig.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Caption := Format('%.2f FPS  Dolphin animation', [GLSceneViewer1.FramesPerSecond]);
  GLSceneViewer1.ResetPerformanceMonitor;
end;

procedure TForm1.GLDummyCube1Progress(Sender: TObject; const deltaTime, newTime: Double);
begin
  GLDummyCube1.Move(3);
end;

end.
