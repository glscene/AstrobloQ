(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fsSkyship_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.Jpeg,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  GLS.Scene,
  GLS.State,
  GLS.TerrainRenderer,
  GLS.BaseClasses,
  GLS.Objects,
  GLS.HeightData,
  GLS.Material,
  GLS.Cadencer,
  GLS.Texture,
  GLS.HUDObjects,
  GLS.BitmapFont,
  GLS.SkyDome,
  GLS.SceneViewer,
  GLS.Mesh,
  GLS.VectorFileObjects,
  GLS.FireFX,
  GLS.Coordinates,

  GLS.File3DS,
  Stage.Keyboard;

type
  TFormSkyship = class(TForm)
    GLSceneViewer: TGLSceneViewer;
    GLBitmapHDS1: TGLBitmapHDS;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    dcViewing: TGLDummyCube;
    TerrainRenderer1: TGLTerrainRenderer;
    Timer1: TTimer;
    GLCadencer1: TGLCadencer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    SkyDome1: TGLSkyDome;
    ffSkyShip: TGLFreeForm;
    GLFireFXManager1: TGLFireFXManager;
    dcFire: TGLDummyCube;
    procedure GLSceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewerMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
    CurrentDir: TFileName;
    mx, my: Integer;
    fullScreen: Boolean;
    FCamHeight: Single;
  end;

var
  FormSkyship: TFormSkyship;

implementation //============================================================

{$R *.DFM}

uses
  fsCrafts_ru;


//-----------------------------------------------------------------------------
procedure TFormSkyship.FormCreate(Sender: TObject);
begin
  FullScreen := false;
  CurrentDir := ExtractFilePath(ParamStr(0)) + '\media\craft';
  SetCurrentDir(CurrentDir);
  // 8 MB height data cache
  // Note this is the data size in terms of elevation samples, it does not
  // take into account all the data required/allocated by the renderer
  GLBitmapHDS1.MaxPoolSize := 8 * 1024 * 1024;
  // specify height map data
  GLBitmapHDS1.Picture.LoadFromFile('terrain.bmp');
  // load the texture maps
  GLMaterialLibrary1.Materials[0].Material.Texture.Image.LoadFromFile
    ('snow512.jpg');
  GLMaterialLibrary1.Materials[1].Material.Texture.Image.LoadFromFile
    ('detailmap.jpg');
  // apply texture map scale (our heightmap size is 256)
  TerrainRenderer1.TilesPerTexture := 256 / TerrainRenderer1.TileSize;
  // Could've been done at design time, but it the, it hurts the eyes ;)
  GLSceneViewer.Buffer.BackgroundColor := clBlack;
  // Move camera starting point to an interesting hand-picked location
  dcViewing.Position.X := 570;
  dcViewing.Position.Z := -385;
  dcViewing.Turn(90);
  // Начальное смещение высоты камеры (контролируется клавишами pgUp/pgDown)
  FCamHeight := 20;
  // небосвод с мигающими звёздами
  with SkyDome1 do
  begin
    Bands[1].StopColor.AsWinColor := RGB(0, 0, 16);
    Bands[1].StartColor.AsWinColor := RGB(0, 0, 8);
    Bands[0].StopColor.AsWinColor := RGB(0, 0, 8);
    Bands[0].StartColor.AsWinColor := RGB(0, 0, 0);
    with Stars do
    begin
      AddRandomStars(700, clWhite, True); // many white stars
      AddRandomStars(100, RGB(255, 200, 200), True); // some redish ones
      AddRandomStars(100, RGB(200, 200, 255), True); // some blueish ones
      AddRandomStars(100, RGB(255, 255, 200), True); // some yellowish ones
    end;
    GLSceneViewer.Buffer.BackgroundColor := clBlack;
    with GLSceneViewer.Buffer.FogEnvironment do
    begin
      FogColor.AsWinColor := clBlack;
      FogStart := -FogStart; // Fog is used to make things darker
    end;
  end;
  ffSkyShip.LoadFromFile('skyship.3ds'); // or patrol.3ds
//  ffSkyShip.Scale.SetVector(5.0, 5.0, 5.0, 0); // scaling for patrol
  ffSkyShip.Material.Texture.Image.LoadFromFile('avion512.jpg');
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.GLCadencer1Progress(Sender: TObject;
  const deltaTime, newTime: Double);
var
  speed: Single;
begin
  // handle keypresses
  (*
  if IsKeyDown(VK_SHIFT) then
    speed := 300*deltaTime
  else *)
    speed := 50 * deltaTime;  // speed of flight
  // with GLCamera1.Position do begin
  dcViewing.Translate(ffSkyShip.direction.Z * speed, - ffSkyShip.direction.Y *
    speed, - ffSkyShip.direction.X * speed);
  if IsKeyDown(VK_UP) then
  begin
    ffSkyShip.Pitch(0.1);
    GLCamera1.Pitch(0.1);
    // GLCamera1.MoveAroundTarget(-1, 0);
  end;
  if IsKeyDown(VK_DOWN) then
  begin
    ffSkyShip.Pitch(-0.1);
    GLCamera1.Pitch(-0.1);
    // GLCamera1.MoveAroundTarget(1, 0);
  end;
  if IsKeyDown(VK_LEFT) then
  begin
    // DummyCube1.Translate(-X*speed, 0, -Z*speed);
    // freeform1.Turn(-1);
    ffSkyShip.Roll(-0.1);
    GLCamera1.Roll(0.1);
    // GLCamera1.MoveAroundTarget(0, 1);
  end;
  if IsKeyDown(VK_RIGHT) then
  begin
    // DummyCube1.Translate(X*speed, 0, Z*speed);
    // freeform1.Turn(1);
    ffSkyShip.Roll(0.1);
    GLCamera1.Roll(-0.1);
    // GLCamera1.MoveAroundTarget(0, -1);
  end;
  (*
  if IsKeyDown(VK_PRIOR) then
    FCamHeight := FCamHeight+10*speed;
    if IsKeyDown(VK_NEXT) then
    FCamHeight := FCamHeight-10*speed;
  *)
  if IsKeyDown('c') or IsKeyDown('с') then  // вид из кабины
  begin
    ffSkyShip.Scale.SetVector(3.0, 3.0, 3.0, 0);
    ffSkyShip.Visible := True;
  end;
  if IsKeyDown('v') or IsKeyDown('м')  then  // вид со стороны
  begin
    ffSkyShip.Scale.SetVector(0.3, 0.2, 0.3, 0);
    ffSkyShip.Visible := True;
  end;
  if IsKeyDown('x') or IsKeyDown('ч') then  // вид из камера впереди
    ffSkyShip.Visible := False;

  // без погружения в террейн
  with dcViewing.Position do
    if (Y < TerrainRenderer1.InterpolatedHeight(AsVector) + 10) then
      Y := TerrainRenderer1.InterpolatedHeight(AsVector) + FCamHeight;

  if IsKeyDown(VK_ESCAPE) then
    FormCrafts.Close; // закрыть главную форму приложения
end;

//-----------------------------------------------------------------------------
// Standard mouse rotation & FPS code below
//-----------------------------------------------------------------------------
procedure TFormSkyship.GLSceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.GLSceneViewerMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssLeft in Shift then
  begin
    // GLCamera1.MoveAroundTarget(my-y, mx-x);
    mx := X;
    my := Y;
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.Timer1Timer(Sender: TObject);
begin
  GLSceneViewer.ResetPerformanceMonitor;
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'w', 'W','ц','Ц':
      with GLMaterialLibrary1.Materials[0].Material do
      begin
        if PolygonMode = pmLines then
          PolygonMode := pmFill
        else
          PolygonMode := pmLines;
      end;
    '+':
      if GLCamera1.DepthOfView < 2000 then
      begin
        GLCamera1.DepthOfView := GLCamera1.DepthOfView * 1.2;
        with GLSceneViewer.Buffer.FogEnvironment do
        begin
          FogEnd := FogEnd * 1.2;
          FogStart := FogStart * 1.2;
        end;
      end;
    '-':
      if GLCamera1.DepthOfView > 300 then
      begin
        GLCamera1.DepthOfView := GLCamera1.DepthOfView / 1.2;
        with GLSceneViewer.Buffer.FogEnvironment do
        begin
          FogEnd := FogEnd / 1.2;
          FogStart := FogStart / 1.2;
        end;
      end;
    '*':
      with TerrainRenderer1 do
        if CLODPrecision > 20 then
          CLODPrecision := Round(CLODPrecision * 0.8);
    '/':
      with TerrainRenderer1 do
        if CLODPrecision < 1000 then
          CLODPrecision := Round(CLODPrecision * 1.2);
    '8':
      with TerrainRenderer1 do
        if QualityDistance > 40 then
          QualityDistance := Round(QualityDistance * 0.8);
    '9':
      with TerrainRenderer1 do
        if QualityDistance < 1000 then
          QualityDistance := Round(QualityDistance * 1.2);
  end;

  Key := #0;
end;

//-----------------------------------------------------------------------------
end.
