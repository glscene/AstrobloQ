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
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.Jpeg,
  Vcl.Imaging.GIFImg,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  Stage.Keyboard,
  GLS.Scene,
  GLS.State,
  GLS.TerrainRenderer,
  Stage.BaseClasses,
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
  Stage.Coordinates,
  Stage.Color,

  GLS.File3DS, GLS.GeomObjects;

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
    SkyDome: TGLSkyDome;
    ffSkyShip: TGLFreeForm;
    GLFireFXManager1: TGLFireFXManager;
    dcFire: TGLDummyCube;
    linesSkyGrid: TGLLines;
    polyMark: TGLPolygon;
    procedure GLSceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewerMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GLSceneViewerMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
  public
    CurrentDir: TFileName;
    mx, my: Integer;
    fullScreen: Boolean;
    CameraHeight: Single;
    Color: TGIFColor;
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
  // загрузка карты высот террейна
  GLBitmapHDS1.Picture.LoadFromFile('terrain.bmp');
  // загрузка текстуры карты
  GLMaterialLibrary1.Materials[0].Material.Texture.Image.LoadFromFile
    ('snow512.jpg');
  GLMaterialLibrary1.Materials[1].Material.Texture.Image.LoadFromFile
    ('detailmap.jpg');
  // apply texture map scale (размер нашей карты высот 256)
  TerrainRenderer1.TilesPerTexture := 256 / TerrainRenderer1.TileSize;
  // Could've been done at design time, but it hurts the eyes ;)
  GLSceneViewer.Buffer.BackgroundColor := clBlack;
  // начальное положение камеры над рельефом
  dcViewing.Position.X := 570;
  dcViewing.Position.Y := 50;
  dcViewing.Position.Z := -385;
  dcViewing.Turn(90);
  // Начальное смещение высоты камеры (контролируется клавишами pgUp/pgDown)
  CameraHeight := 50;
  ffSkyShip.LoadFromFile('skyship.3ds'); // или модель patrol.3ds
//  ffSkyShip.Scale.SetVector(1.0, 1.0, 3.0, 0); // scaling for patrol ship
  ffSkyShip.Material.Texture.Image.LoadFromFile('avion512.jpg');
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.FormShow(Sender: TObject);
var
  I: Integer;

begin
  // небосвод с мигающими звёздами
  with SkyDome do
  begin
    Bands[0].StopColor.AsWinColor := RGB(0, 0, 8);
    Bands[0].StartColor.AsWinColor := RGB(0, 0, 0);
    Bands[1].StopColor.AsWinColor := RGB(0, 0, 16);
    Bands[1].StartColor.AsWinColor := RGB(0, 0, 8);

    // белые звёзды
    Stars.AddRandomStars(100, clWhite, False);
    // синие звёзды
    Stars.AddRandomStars(400, clBlue, False);
    // жёлтые звёзды
    Stars.AddRandomStars(500, clYellow, False);
    // красные звёзды
    Stars.AddRandomStars(1000, clRed, False);

    // задание светимости (магнитуты), для классов звёзд
    for I := 0 to Stars.Count -1 do
    begin
      if Stars[I].Color = clWhite then
        Stars[I].Magnitude := -3;
      if Stars[I].Color = clBlue then
        Stars[I].Magnitude := -2;
      if Stars[I].Color = clYellow then
        Stars[I].Magnitude := -1;
      if Stars[I].Color = clRed then
        Stars[I].Magnitude := 0;
    end;

    GLSceneViewer.Buffer.BackgroundColor := clBlack;
    with GLSceneViewer.Buffer.FogEnvironment do
    begin
      FogColor.AsWinColor := clBlack;
      FogStart := -FogStart; // Fog is used to make things darker
    end;
  end;
end;


//-----------------------------------------------------------------------------
procedure TFormSkyship.GLCadencer1Progress(Sender: TObject;
  const deltaTime, newTime: Double);
var
  speed: Single;
begin
  // обработка нажатия клавиш навигации
  (*
  if IsKeyDown(VK_SHIFT) then
    speed := 300*deltaTime
  else *)
    speed := 50 * deltaTime;  // скорость полёта
  // полёт над террейной со скоростью speed
  dcViewing.Translate(ffSkyShip.direction.Z * speed, - ffSkyShip.direction.Y *
    speed, - ffSkyShip.direction.X * speed);

  if IsKeyDown('w') or IsKeyDown('ц') or IsKeyDown(VK_UP) then
  begin
    ffSkyShip.Pitch(1.0);
    // GLCamera1.Pitch(0.1);
    // GLCamera1.MoveAroundTarget(-1, 0);
  end;

  if IsKeyDown('s') or IsKeyDown('ы') or IsKeyDown(VK_DOWN) then
  begin
    ffSkyShip.Pitch(-1.0);
    // GLCamera1.Pitch(-0.1);
    // GLCamera1.MoveAroundTarget(1, 0);
  end;
  if IsKeyDown('a') or IsKeyDown('ф') or IsKeyDown(VK_LEFT) then
  begin
    // DummyCube1.Translate(-X*speed, 0, -Z*speed);
    ffSkyShip.Turn(-1.0);
    // GLCamera1.Turn(0.1);
  end;
  if IsKeyDown('d') or IsKeyDown('в') or IsKeyDown(VK_RIGHT) then
  begin
    // DummyCube1.Translate(X*speed, 0, Z*speed);
    ffSkyShip.Turn(1.0);
    // GLCamera1.Turn(-0.1);
    // GLCamera1.MoveAroundTarget(0, -1);
  end;
  (*
  if IsKeyDown(VK_PRIOR) then
    CameraHeight := CameraHeight+10*speed;
    if IsKeyDown(VK_NEXT) then
    CameraHeight := CameraHeight-10*speed;
  *)
  // вращение корпуса по часовой стрелке
  if IsKeyDown(',') or IsKeyDown('б') then
  begin
    ffSkyShip.Roll(-1.0);
  end;
  // вращение корпуса против часовой стрелки
  if IsKeyDown('.') or IsKeyDown('ю') then
  begin
    ffSkyShip.Roll(1.0);
  end;
  // 'c' вид из кабины
  if IsKeyDown(#67) or IsKeyDown('с') then
  begin
    ffSkyShip.Scale.SetVector(3.0, 3.0, 3.0, 0);
    ffSkyShip.Visible := True;
  end;
  // 'м' вид со стороны
  if IsKeyDown(#86)  or IsKeyDown('м') then
  begin
    ffSkyShip.Scale.SetVector(0.3, 0.2, 0.3, 0);
    ffSkyShip.Visible := True;
  end;
  // 'ч' вид из камера впереди
  if IsKeyDown(#80)  or IsKeyDown('ч') then
    ffSkyShip.Visible := False;

  // запрет погружения в террейн
  with dcViewing.Position do
    if (Y < TerrainRenderer1.InterpolatedHeight(AsVector) + 10) then
      Y := TerrainRenderer1.InterpolatedHeight(AsVector) + CameraHeight;

  // выход по клавише эскейп
  if IsKeyDown(VK_ESCAPE) then
    FormCrafts.Close; // закрыть главную форму приложения
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    // текстура или сетка
    'f', 'F','а','А':
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
    GLCamera1.MoveAroundTarget(my-y, mx-x);
    mx := X;
    my := Y;
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.GLSceneViewerMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  GLCamera1.AdjustDistanceToTarget(Power(1.03, WheelDelta/120));
end;

//-----------------------------------------------------------------------------
procedure TFormSkyship.Timer1Timer(Sender: TObject);
begin
  GLSceneViewer.ResetPerformanceMonitor;
end;

//-----------------------------------------------------------------------------
end.
