unit fbGrassLand;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Types,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.Jpeg,

  Stage.VectorTypes,
  Stage.Keyboard,
  Stage.VectorGeometry,

  GLS.Scene,
  GLS.Cadencer,
  GLS.SceneViewer,

  GLS.BaseClasses,
  GLS.TerrainRenderer,
  GLS.Coordinates,
  GLS.HeightData,
  GLS.Objects,
  GLS.AsyncTimer,
  GLS.Material,
  GLS.Context,
  GLS.Texture,
  GLS.Skydome;

type
  TfrmTexland = class(TForm)
    GLScene1: TGLScene;
    SceneViewer: TGLSceneViewer;
    Cadencer: TGLCadencer;
    BitmapHDS: TGLBitmapHDS;
    Camera: TGLCamera;
    Light: TGLLightSource;
    dcCamera: TGLDummyCube;
    AsyncTimer: TGLAsyncTimer;
    Terrain: TGLTerrainRenderer;
    GLEarthSkyDome1: TGLEarthSkyDome;
    procedure FormCreate(Sender: TObject);
    procedure CadencerProgress(Sender: TObject; const deltaTime, newTime: Double);
    procedure AsyncTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    procedure handleMouse(dt: single);
    procedure handleKeyboard(dt: single);
  private
    DataPath, MediaPath, FileBmp: TFileName;
  end;

var
  frmTexland: TfrmTexland;

implementation //============================================================

{$R *.dfm}

//---------------------------------------------------------------------------
procedure TfrmTexland.FormCreate;
begin
  MediaPath := LowerCase(ExtractFilePath(ParamStr(0)));
  MediaPath := IncludeTrailingPathDelimiter(MediaPath); // + '\media';
//  Delete(MediaPath, Pos('litosfera', MediaPath), Length(MediaPath)); // if litosfera dir for exe
  MediaPath := MediaPath + 'media\';
  SetCurrentDir(MediaPath) ;

  FileBmp := MediaPath + 'heightmap.bmp';
  if FileExists(FileBmp, true) then
    BitmapHDS.Picture.LoadFromFile('heightmap.bmp')
  else
    Close;

  // diffuse
  with Terrain.Material.TextureEx.Add do
  begin
    TextureScale.SetPoint(8, 8, 1);
    Texture.Image.LoadFromFile('grass.jpg');
    Texture.Disabled := false;
  end;
  // + lightmap
  with Terrain.Material.TextureEx.Add do
  begin
    Texture.Image.LoadFromFile('lmap.jpg');
    Texture.TextureMode := tmModulate;
    Texture.Disabled := false;
  end;
  ShowCursor(false);
end;

//----------------------------------------------------------------------------
procedure TfrmTexland.CadencerProgress;
begin
  if not Active then
    exit;
  handleMouse(deltaTime);
  handleKeyboard(deltaTime);
  SceneViewer.Invalidate;
end;

// ---------------------------- handleMouse ----------------------------------
procedure TfrmTexland.handleMouse;
begin
  with Mouse.CursorPos do
  begin
    dcCamera.TurnAngle := dcCamera.TurnAngle - (x - Screen.Width div 2) * 0.2;
    Camera.PitchAngle := Camera.PitchAngle - (y - Screen.Height div 2) * 0.2;
  end;
  Mouse.CursorPos := Point(Screen.Width div 2, Screen.Height div 2);
end;

//---------------------------------- handleKeyboard ---------------------------
procedure TfrmTexland.handleKeyboard;
var
  spd, f: single;
begin
  spd := 30 * dt;
  if IsKeyDown(VK_SHIFT) then
    spd := spd * 5;
  f := 0;
  if IsKeyDown(VK_UP) or IsKeyDown(ord('W')) then
    f := f + spd;
  if IsKeyDown(VK_DOWN) or IsKeyDown(ord('S')) then
    f := f - spd;
  dcCamera.Position.Translate(VectorScale(Camera.AbsoluteVectorToTarget, f));

  f := 0;
  if IsKeyDown(VK_LEFT) or IsKeyDown(ord('A')) then
    f := f + spd;
  if IsKeyDown(VK_RIGHT) or IsKeyDown(ord('D')) then
    f := f - spd;
  dcCamera.Position.Translate(VectorScale(Camera.AbsoluteRight, f));

  if IsKeyDown(VK_ESCAPE) then
    Close;
end;

//------------------------------ FormShow ----------------------------------------
procedure TfrmTexland.FormShow;
begin
  Mouse.CursorPos := Point(Screen.Width div 2, Screen.Height div 2);
  Cadencer.Enabled := true;
end;

//--------------------------- AsyncTimer -------------------------------------
procedure TfrmTexland.AsyncTimerTimer;
begin
  Caption := 'Land: ' + SceneViewer.FramesPerSecondText(2);
  SceneViewer.ResetPerformanceMonitor;
end;

end.
