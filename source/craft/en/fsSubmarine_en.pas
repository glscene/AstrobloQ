(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fsSubmarine_en;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Imaging.Jpeg,
  Vcl.ExtCtrls,

  Stage.VectorTypes,
  Stage.Keyboard,

  GLS.Scene,
  GLS.State,
  GLS.TerrainRenderer,
  GLS.FireFX,
  GLS.Texture,
  GLS.Cadencer,
  GLS.VectorFileObjects,
  GLS.Objects,
  GLS.SkyDome,
  GLS.HeightData,
  GLS.Material,
  GLS.SceneViewer,
  GLS.File3DS,
  GLS.Coordinates,
  GLS.BaseClasses;

type
  TSubmarine = record
    x, y, z, dx, dy, dz: single;
    Behaviour: (moving, waiting);
  end;

  TFormSubmarine = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLBitmapHDS1: TGLBitmapHDS;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    dcSubmarine: TGLDummyCube;
    TerrainRenderer1: TGLTerrainRenderer;
    Timer1: TTimer;
    GLCadencer1: TGLCadencer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    ffSubmarine: TGLFreeForm;
    GLFireFXManager1: TGLFireFXManager;
    DummyCube2: TGLDummyCube;
    GLCamera2: TGLCamera;
    ffPropeller: TGLFreeForm;
    ffKokpit: TGLFreeForm;
    GLFireFXManager2: TGLFireFXManager;
    DummyCube3: TGLDummyCube;
    GLFireFXManager3: TGLFireFXManager;
    dcTower1: TGLDummyCube;
    ffGlass1: TGLFreeForm;
    ffTower1: TGLFreeForm;
    dcTower2: TGLDummyCube;
    ffGlass2: TGLFreeForm;
    ffTower2: TGLFreeForm;
    dcFatsub: TGLDummyCube;
    ffFatsub: TGLFreeForm;
    ffKokpit2: TGLFreeForm;
    ffPropeller1: TGLFreeForm;
    ffPropeller2: TGLFreeForm;
    ffPropeller3: TGLFreeForm;
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      x, y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckAI;
  private
  public
    CurrentDir: TFileName;
    mx, my: Integer;
    fullScreen: Boolean;
    FCamHeight: single;
  end;

var
  FormSubmarine: TFormSubmarine;
  sub, fatsub: TSubmarine;
  dspeed: single;

implementation //==============================================================

uses
  fsCrafts_en;

{$R *.DFM}

//-----------------------------------------------------------------------------
procedure TFormSubmarine.FormCreate(Sender: TObject);
begin
  FullScreen := false;
  dspeed := 0;  // othewise it will float away
  CurrentDir := ExtractFilePath(ParamStr(0)) + '\media\craft';
  SetCurrentDir(CurrentDir);
  ffFatsub.LoadFromFile('fatsub.3ds');
  ffKokpit2.LoadFromFile('kokpit2.3ds');
  ffFatsub.Material.Texture.Image.LoadFromFile('submarine.jpg');
  ffKokpit2.Material.Texture.Image.LoadFromFile('submarine.jpg');

  ffSubmarine.LoadFromFile('submarine.3ds');  // flagman submarine
  ffPropeller.LoadFromFile('propeller.3ds');
  ffKokpit.LoadFromFile('kokpit.3ds');
  ffSubmarine.Material.Texture.Image.LoadFromFile('submarine.jpg');
  ffPropeller.Material.Texture.Image.LoadFromFile('submarine.jpg');
  ffKokpit.Material.Texture.Image.LoadFromFile('submarine.jpg');

  ffGlass1.LoadFromFile('glass.3ds');
  ffGlass1.Material.Texture.Image.LoadFromFile('snow512.jpg');
  ffTower1.LoadFromFile('tower.3ds');
  ffTower1.Material.Texture.Image.LoadFromFile('tower.jpg');

  ffGlass2.LoadFromFile('glass.3ds');
  ffGlass2.Material.Texture.Image.LoadFromFile('snow512.jpg');
  ffTower2.LoadFromFile('tower.3ds');
  ffTower2.Material.Texture.Image.LoadFromFile('tower.jpg');

  ffPropeller1.LoadFromFile('propeller.3ds');
  ffPropeller1.Material.Texture.Image.LoadFromFile('submarine.jpg');
  ffPropeller2.LoadFromFile('propeller.3ds');
  ffPropeller2.Material.Texture.Image.LoadFromFile('submarine.jpg');
  ffPropeller3.LoadFromFile('propeller.3ds');
  ffPropeller3.Material.Texture.Image.LoadFromFile('submarine.jpg');

  // 8 MB height data cache
  // Note this is the data size in terms of elevation samples, it does not
  // take into account all the data required/allocated by the renderer
  GLBitmapHDS1.MaxPoolSize := 8 * 1024 * 1024; // bilo 8
  // specify height map data
  GLBitmapHDS1.Picture.LoadFromFile('terrain.bmp');
  // load the texture maps
  GLMaterialLibrary1.Materials[0].Material.Texture.Image.LoadFromFile
    ('snow512.jpg');
  GLMaterialLibrary1.Materials[1].Material.Texture.Image.LoadFromFile
    ('detailmap.jpg');
  // apply texture map scale (our heightmap size is 256)
  TerrainRenderer1.TilesPerTexture := 256 / TerrainRenderer1.TileSize;
  // Could've been done at design time, but it hurts the eyes ;)
  GLSceneViewer1.Buffer.BackgroundColor := clBlack;
  // Move camera starting point to an interesting hand-picked location
  (*
    dcUnderwater.Position.X:=570;
    dcUnderwater.Position.Z:=-385;
  *)
  dcSubmarine.Turn(90);
  // Initial camera height offset (controled with pageUp/pageDown)
  FCamHeight := 10;
  (*
  with skydome1 do 
  begin
    Bands[1].StopColor.AsWinColor:=RGB(0, 0, 16);
    Bands[1].StartColor.AsWinColor:=RGB(0, 0, 8);
    Bands[0].StopColor.AsWinColor:=RGB(0, 0, 8);
    Bands[0].StartColor.AsWinColor:=RGB(0, 0, 0);
    with Stars do 
	begin
    AddRandomStars(700, clWhite, True);   // many white stars
    AddRandomStars(100, RGB(255, 200, 200), True);  // some redish ones
    AddRandomStars(100, RGB(200, 200, 255), True);  // some blueish ones
    AddRandomStars(100, RGB(255, 255, 200), True);  // some yellowish ones
    end;
  *)
  GLSceneViewer1.Buffer.BackgroundColor := rgb(0, 0, 160);
  with GLSceneViewer1.Buffer.FogEnvironment do
  begin
    FogColor.AsWinColor := rgb(0, 0, 160);
    FogStart := -FogStart; // Fog is used to make things darker
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormSubmarine.GLCadencer1Progress(Sender: TObject;
  const deltaTime, newTime: Double);
var
  speed: single;
begin
  // handle keypresses

  (*
  if IsKeyDown(VK_SHIFT) then
    speed:=300*deltaTime
  else
  *)
  speed := dspeed * 30 * deltaTime + dspeed;
  ffPropeller.Roll(speed * 20);
  ffPropeller1.Roll(20);
  ffPropeller2.Roll(20);
  ffPropeller3.Roll(20);
  DummyCube2.Roll(speed * 20);
  ffFatsub.Turn(0.08);
  ffFatsub.Move(-0.2);
  // zoom on the fly
  GLCamera1.FocalLength := 50 - dspeed * 7;
  if GLCamera1.FocalLength < 20 then
    GLCamera1.FocalLength := 20;

  // with GLCamera1.Position do begin
  dcSubmarine.Translate(ffSubmarine.direction.z * speed, 
    -ffSubmarine.direction.y * speed, - ffSubmarine.direction.x * speed);
  // upward Pitch of the nose
  if IsKeyDown(VK_UP) then
  begin
    ffSubmarine.Pitch(1.0);
    /// GLCamera1.Pitch(0.1);  // GLCamera1.MoveAroundTarget(-1, 0);
  end;
  // downward Pitch of the nose
  if IsKeyDown(VK_DOWN) then
  begin
    ffSubmarine.Pitch(-1.0);
    /// GLCamera1.Pitch(-0.1); // GLCamera1.MoveAroundTarget(1, 0);
  end;
  // turning the submarine's bow to the left
  if IsKeyDown(VK_LEFT) then
  begin
    // DummyCube1.Translate(-X*speed, 0, -Z*speed);
    ffSubmarine.Turn(-1.0);
    GLCamera1.Turn(1.0);
    // GLCamera1.MoveAroundTarget(0, 1);
  end;
  // turning the submarine's bow to the right
  if IsKeyDown(VK_RIGHT) then
  begin
    // DummyCube1.Translate(X*speed, 0, Z*speed);
    // ffSubmarine.Turn(1);
    ffSubmarine.Turn(1.0);
    GLCamera1.Turn(-1.0);
    // GLCamera1.MoveAroundTarget(0, -1);
  end;
  // clockwise rotation
  if IsKeyDown(',') or IsKeyDown('б') then
  begin
    ffSubmarine.Roll(-1.0);
  end;
  // counterclockwise rotation
  if IsKeyDown('.') or IsKeyDown('ю') then
  begin
    ffSubmarine.Roll(1.0);
  end;
  //  moving forward
  if IsKeyDown('a') or IsKeyDown('ф') then
    if dspeed < 2 then
    // speed increment after pressing a key
      dspeed := dspeed + 0.01;
  //  backward movement
  if IsKeyDown('z') or IsKeyDown('я') then
    if dspeed > -0.5 then
    // speed increment after pressing a key
      dspeed := dspeed - 0.01;

  (*
   if IsKeyDown(VK_PRIOR) then
     FCamHeight := FCamHeight+10*speed;
   if IsKeyDown(VK_NEXT) then
    FCamHeight := FCamHeight-10*speed;
  *)
  // 
  if IsKeyDown('c') or IsKeyDown('с') then
  begin
    ffSubmarine.Visible := True;
    ffSubmarine.NormalsOrientation := mnoInvert;
    GLSceneViewer1.camera := GLCamera2;
    // ffSubmarine.visible := false;
    // glFireFxManager1.Disabled :=true;
  end;
  // 
  if IsKeyDown('v') or IsKeyDown('м') then
  begin
    ffSubmarine.Visible := True;
    ffSubmarine.NormalsOrientation := mnoDefault;
    GLSceneViewer1.camera := GLCamera1;
    // ffSubmarine.visible := true;
    // glFireFxManager1.Disabled :=false;
  end;
  // 
  if IsKeyDown('x') or IsKeyDown('ч') then
    ffSubmarine.Visible := False;
  // don't drop through terrain!
  with dcSubmarine.Position do
    if y < TerrainRenderer1.InterpolatedHeight(AsVector) then
      y := TerrainRenderer1.InterpolatedHeight(AsVector) + FCamHeight;
  if IsKeyDown(VK_ESCAPE) then
    FormCrafts.Close;
end;

//-----------------------------------------------------------------------------
procedure TFormSubmarine.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'm','ь':
      begin
        if ffSubmarine.Material.Texture.MappingMode = tmmuser then
          ffSubmarine.Material.Texture.MappingMode := tmmCubeMapNormal
        else
          ffSubmarine.Material.Texture.MappingMode := tmmuser;
      end;
    'w','W', 'ц', 'Ц':  // текстура или каркас
      with GLMaterialLibrary1.Materials[0].Material do
      begin
        if PolygonMode = pmLines then
          PolygonMode := pmFill
        else
          PolygonMode := pmLines;
      end;
    '+':  // delete for with shift
      if GLCamera1.DepthOfView < 2000 then
      begin
        GLCamera1.DepthOfView := GLCamera1.DepthOfView * 1.2;
        with GLSceneViewer1.Buffer.FogEnvironment do
        begin
          FogEnd := FogEnd * 1.2;
          FogStart := FogStart * 1.2;
        end;
      end;
    '-':  // добавить туман без шифта
      if GLCamera1.DepthOfView > 300 then
      begin
        GLCamera1.DepthOfView := GLCamera1.DepthOfView / 1.2;
        with GLSceneViewer1.Buffer.FogEnvironment do
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
// Standard mouse rotation & FPS code below
//-----------------------------------------------------------------------------
procedure TFormSubmarine.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: Integer);
begin
  mx := x;
  my := y;
end;

//-----------------------------------------------------------------------------
procedure TFormSubmarine.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
  x, y: Integer);
begin
  if ssLeft in Shift then
  begin
    GLCamera1.MoveAroundTarget(my - y, mx - x);
    mx := x;
    my := y;
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormSubmarine.Timer1Timer(Sender: TObject);
begin
  GLSceneViewer1.ResetPerformanceMonitor;
end;

//-----------------------------------------------------------------------------
procedure TFormSubmarine.CheckAI;
begin
  sub.x := ffSubmarine.Position.x;
  sub.y := ffSubmarine.Position.y;
  sub.z := ffSubmarine.Position.z;
  sub.dx := ffSubmarine.Direction.x;
  sub.dy := ffSubmarine.Direction.y;
  sub.dz := ffSubmarine.Direction.z;

  fatsub.x := ffFatsub.Position.x;
  fatsub.y := ffFatsub.Position.y;
  fatsub.z := ffFatsub.Position.z;
  fatsub.dx := ffFatsub.Direction.x;
  fatsub.dy := ffFatsub.Direction.y;
  fatsub.dz := ffFatsub.Direction.z;
end;

//-----------------------------------------------------------------------------
procedure TFormSubmarine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GLCadencer1.Enabled := false;
  Timer1.Enabled := false;
end;

end.
