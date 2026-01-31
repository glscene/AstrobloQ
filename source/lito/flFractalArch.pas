unit flFractalArch;

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
  Vcl.Samples.Spin,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  Stage.Keyboard,

  GLS.Scene,
  GLS.TerrainRenderer,
  GLS.Objects,
  GLS.HeightData,
  GLS.Texture,
  GLS.SceneViewer,

  GLS.AsyncTimer,
  GLS.Material,
  GLS.Coordinates,

  GLS.BaseClasses,
  GLS.Color,
  GLS.RandomHDS,
  GLS.SimpleNavigation,
  GLS.Cadencer;

type
  TfrmFracArchip = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    GLTerrainRenderer1: TGLTerrainRenderer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    Panel1: TPanel;
    lblDebug: TLabel;
    Timer1: TTimer;
    GLAsyncTimer1: TGLAsyncTimer;
    GLDummyCube1: TGLDummyCube;
    Label1: TLabel;
    GLCadencer1: TGLCadencer;
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure GLAsyncTimer1Timer(Sender: TObject);
  private
    MediaPath, FileJpg: TFileName;
    mx, my: Integer;
    FCamHeight: Single;
    Start: Cardinal;
    FRendering: Boolean;
    LastUpdate: Cardinal;
    procedure SetRendering(const Value: Boolean);
    (*
      Select the color to paint depending on height(z) and normal. x and y are used to
      drape a texture.
      This is here that you play with texture effects and express your artistic mind.
      Here, we only used three strata (+sea), but you can't imagine anything.
      The magic numbers here are the result of tweaking, not calculus.
     *)
    function OnDrawTexture(const Sender: TGLBaseRandomHDS; X, Y: Integer; z: double;
      aNormal: TGLVector): TGLColorVector;
    function OnDrawTextureFlashy(const Sender: TGLBaseRandomHDS; X, Y: Integer; z: double;
      aNormal: TGLVector): TGLColorVector;
    (*
      An alternative OnDrawTextureEvent that render slope by a grey scale (flat=black,
      vertical = white
    *)
    function OnDrawTextureSlope(const Sender: TGLBaseRandomHDS; X, Y: Integer; z: double;
      aNormal: TGLVector): TGLColorVector;
  public
    FractalArchip: TGLFractalArchipelago;
    procedure ProcessKeyboard(const DeltaTime: double);
    property Rendering: boolean read FRendering write SetRendering;
  end;

var
  frmFracArchip: TfrmFracArchip;
  covFlat, covSteep: Single; // Slope strata
  covLow, covHigh: Single; // Elevation strata


implementation // =============================================================

{$R *.DFM}

var
  Forest, Sea, Beach, Snow, Grass, Cliff, BrownSoil: TBitmap;

function TextureSea(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Sea.Canvas.Pixels[X * 5 mod Sea.Width, Y * 5 mod Sea.Height]);
  // Result:=TextureBlue(x,y);
end;

function TextureForest(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Forest.Canvas.Pixels[X mod Forest.Width, Y mod Forest.Height]);
  AddVector(Result, 0.2); // Original texture is too dark
  // Result:=TextureDarkGreen(x,y);
end;

function TextureGrass(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Grass.Canvas.Pixels[X mod Grass.Width, Y mod Grass.Height]);
  AddVector(Result, 0.2); // Original texture is too dark
end;

function TextureSnow(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Snow.Canvas.Pixels[X mod Snow.Width, Y mod Snow.Height]);
end;

function TextureBeach(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Beach.Canvas.Pixels[X mod Beach.Width, Y mod Beach.Height]);
end;

function TextureCliff(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Cliff.Canvas.Pixels[X * 2 mod Cliff.Width, Y * 2 mod Cliff.Height]);
end;

function TextureBrownSoil(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(BrownSoil.Canvas.Pixels[X mod BrownSoil.Width, Y mod BrownSoil.Height]);
end;

//----------------------------------------------------------------------------
procedure TfrmFracArchip.FormCreate(Sender: TObject);
begin
  MediaPath := LowerCase(ExtractFilePath(ParamStr(0)));
  MediaPath := IncludeTrailingPathDelimiter(MediaPath); // + '\media';
  Delete(MediaPath, Pos('litosfera', MediaPath), Length(MediaPath)); // if litosfera dir for exe
  MediaPath := MediaPath + 'litosfera\media\';
  SetCurrentDir(MediaPath) ;

  FileJpg := MediaPath + '004_neige.jpg';
  if FileExists(FileJpg, True) then
    GLMaterialLibrary1.AddTextureMaterial('DefaultTexture', '004_neige.jpg')
  else
    Exit;

  // Terrain Renderer initialisation
  GLTerrainRenderer1.MaterialLibrary := GLMaterialLibrary1;
  GLTerrainRenderer1.Material.LibMaterialName := '004_neige.jpg';
  FractalArchip := TGLFractalArchipelago.Create(Self);
  FractalArchip.TerrainRenderer := GLTerrainRenderer1; // Link the HDS to the Renderer
  FractalArchip.MaterialName := 'DefaultTexture';
  FractalArchip.Depth := 7;
  Rendering := False;

  // Load textures that are used by the OnDrawTexture event handler
  Forest := LoadJPGtexture('mousse_1.jpg');
  Sea := LoadJPGtexture('Sea.jpg');
  Snow := LoadJPGtexture('004_neige.jpg');
  Cliff := LoadJPGtexture('017Roche.jpg');
  BrownSoil := LoadJPGtexture('058terresable-sombre.jpg');
  Grass := LoadJPGtexture('nature073-Terre+Herbe.jpg');
  // Grass:=LoadJPGTexture('nature093-Gazon.jpg');
  Beach := LoadJPGtexture('057terresable-Clair.jpg');

  FCamHeight := 6;
end;

//--------------------------------------------------------------------------------

function TfrmFracArchip.OnDrawTexture(const Sender: TGLBaseRandomHDS; X, Y: Integer; z: double;
  aNormal: TGLVector): TGLColorVector;
const
  f = VerticalScalingFactor;
var
  z1: Single;
  slope: Single;
begin
  with TGLFractalArchipelago(Sender) do
  begin
    z := z - SeaLevel * f; // we make all elevations relative to sea level
    { Then, we use the vertical component of the normal to compute the slope.
      The other components could be used to differentiate a North face from a
      South face, for instance. }
    slope := RadToDeg(ArcCos(aNormal.Y)) + random * 10 - 5;
    z1 := z * (1 + (random * 2 - 1) * 0.001) / f;
    if z / f < covLow then // Low altitude
      if slope < covSteep then
        Result := TextureSand(X, Y)
      else
        Result := TextureBrownSoil(X, Y)
    else if z1 < covHigh then // Medium altitude (fuzzy)
      if slope < covFlat then
        Result := TextureGrass(X, Y)
      else if slope < covSteep then
        Result := TextureForest(X, Y)
      else
        Result := TextureCliff(X, Y)
    else
    begin // High altitude
      if slope < covSteep then
        Result := TextureSnow(X, Y)
      else
        Result := TextureCliff(X, Y)
    end; // else
  end; // with
end;

// Flashy version of the regular OnDrawTexture. Helps debugging textures.
function TfrmFracArchip.OnDrawTextureFlashy(const Sender: TGLBaseRandomHDS; X, Y: Integer;
  z: double; aNormal: TGLVector): TGLColorVector;
const
  f = VerticalScalingFactor;
var
  z1: Single;
  slope: Single;
begin
  with TGLFractalArchipelago(Sender) do
  begin
    z := z - SeaLevel * f; // we make all elevations relative to sea level
    { Then, we use the vertical component of the normal to compute the slope.
      The other components could be used to differentiate a North face from a
      South face, for instance. }
    slope := RadToDeg(ArcCos(aNormal.Y)) + random * 10 - 5;
    z1 := z * (1 + (random * 2 - 1) * 0.001) / f;
    if z / f < covLow then // Low altitude
      if slope < covSteep then
        Result := clrYellow
      else
        Result := clrBrown
    else if z1 < covHigh then // Medium altitude (fuzzy)
      if slope < covFlat then
        Result := clrGreenYellow
      else if slope < covSteep then
        Result := clrGreen
      else
        Result := clrGray75
    else
    begin // High altitude
      if slope < covSteep then
        Result := clrWhite
      else
        Result := clrBlack
    end; // else
  end; // with
end;

// Movement, mouse handling etc.
procedure TfrmFracArchip.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

procedure TfrmFracArchip.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssLeft in Shift then
  begin
    if abs(X - mx) > abs(my - Y) then
    begin
      GLCamera1.Turn(X - mx);
      // GLCamera1.Up.SetVector(0,1,0);
    end
    else
      GLCamera1.Pitch(my - Y);
    mx := X;
    my := Y;
  end;
end;

procedure TfrmFracArchip.Timer1Timer(Sender: TObject);
begin
  Caption := Format('%.1f FPS - %d  %s: %d%%', [GLSceneViewer1.FramesPerSecond,
    GLTerrainRenderer1.LastTriangleCount, FractalArchip.Task, FractalArchip.TaskProgress]);
  GLSceneViewer1.ResetPerformanceMonitor;
end;

(*
  In this procedure we define all the parameters of the landscape and then
  initialize it. Try the FractalLandscape demo to play with these parameters
  and understand what they are controlling.
*)
procedure TfrmFracArchip.FormActivate(Sender: TObject);
begin
  with FractalArchip do
  begin
    // Topographic properties
    ExtentX := 10000; // Extent of the whole landscape
    ExtentZ := 10000;
    Depth := 7; // Depth of the fractal algorithm
    Cyclic := True; // Cyclic landscape (torus topology)
    IslandDensity := 0.4; // Probability to get an island in a given landtile
    Seed := 1; // Set another value here to get a different archipelago
    AmplitudeMin := 10;
    AmplitudeMax := 50;
    RoughnessMin := 0.4;
    RoughnessMax := 0.7;

    // Sea parameters
    SeaLevel := 0;
    SeaTransparency := 10;
    // A low value or seams between landtiles could be seen
    with GLMaterialLibrary1.AddTextureMaterial('Sea', 'Sea.jpg').Material do
    begin
      //BlendingMode := bmTransparency; // Uncomment to get a transparent sea
    end;
    FractalArchip.SeaMaterialName := 'Sea';
    SeaDynamic := True;
    WaveAmplitude := AmplitudeMax * 0.005;
    WaveSpeed := 20;

    // Erosion properties
    FErosionByRain.Enabled := True;
    FErosionByRain.ErosionRate := 0.7;
    FErosionByRain.DepositRate := 0.3;
    FErosionBySea.Enabled := True;
    FErosionBySea.BeachHeight := WaveAmplitude * 4;

    FErosionByLife.Enabled := True;
    FErosionByLife.Robustness := 2;

    // Lighting properties
    AmbientLight := 0.4;
    LightDirection := VectorMake(-sqrt(1 - sqr(-0.5)), -0.5, -sqrt(1 - sqr(-0.5)));
    Lighting := True;
    Shadows := False;

    (*
      Topographic strata used for land-cover assignation
      These variables are used in the OnDrawTexture event handler. They are not
      directly related to the TGLFractalArchipelago.
    *)
    covLow := ErosionBySea.BeachHeight * 1;
    covHigh := AmplitudeMax * 0.9;
    covFlat := 2;
    covSteep := 65;

    // Texture properties
    LandCover := True;
    TextureScale := 1; // Number of texture pixels by HDS cell < 5
    FractalArchip.OnDrawTexture := Self.OnDrawTexture;
    // Function defining the cover to be applied
    FractalArchip.OnDrawTexture := Self.OnDrawTextureFlashy;
    // Function defining the cover to be applied
    FractalArchip.OnDrawTexture := nil;
    /// Revert to the default (basic) OnDrawTexture event

    // Viewing parameters
    Camera := GLCamera1;
    Camera.DepthOfView := LandTileSize * GLDummyCube1.Scale.X * 1.5;
    TerrainRenderer.QualityDistance := Camera.DepthOfView / 2;
    with GLSceneViewer1.Buffer.FogEnvironment do
    begin
      FogEnd := Camera.DepthOfView;
      FogStart := Camera.DepthOfView / 2;
    end;

    // Let's go!
   /// BuildLandscape;  todo
   /// Initialize(10, 10); // todo < = Start position failed
    Rendering := True;
    Start := GetTickCount;
    LastUpdate := Start;
  end; // with
end;

procedure TfrmFracArchip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Rendering := False;
end;

procedure TfrmFracArchip.FormDestroy(Sender: TObject);
begin
  FractalArchip.Free;
end;

procedure TfrmFracArchip.GLAsyncTimer1Timer(Sender: TObject);
var
  DeltaTime: double;
begin
  DeltaTime := (GetTickCount - Start) / 1000;
  Start := GetTickCount;

  lblDebug.Caption := Format('%.3f,%.3f,%.3f', [GLCamera1.Position.X, GLCamera1.Position.Y,
    GLCamera1.Position.z]);

  if GetTickCount - LastUpdate > 250 then
  begin
 //   FractalArchip.Update; // Check if new landtiles must be generated
    LastUpdate := GetTickCount;
  end; // if

  ProcessKeyboard(DeltaTime);
  GLSceneViewer1.Invalidate;
  GLSceneViewer1.Update;
end;

procedure TfrmFracArchip.ProcessKeyboard(const DeltaTime: double);
var
  Speed: Single;
begin
  if IsKeyDown(VK_SHIFT) then
    Speed := 5 * DeltaTime
  else
    Speed := DeltaTime;
  if IsKeyDown(VK_RIGHT) then
    GLCamera1.Turn(Speed * 50);
  if IsKeyDown(VK_LEFT) then
    GLCamera1.Turn(-Speed * 50);
  if IsKeyDown(VK_UP) then
    GLCamera1.Move(Speed * 10);
  if IsKeyDown(VK_DOWN) then
    GLCamera1.Move(-Speed * 10);
  if IsKeyDown(VK_PRIOR) then
    FCamHeight := FCamHeight + 10 * Speed;
  if IsKeyDown(VK_NEXT) then
    FCamHeight := FCamHeight - 10 * Speed;
  if IsKeyDown(VK_ESCAPE) then
  begin
    Application.Terminate;
    Exit;
  end;

  with GLCamera1 do
  begin
    // Don't fall through terrain!
    if FCamHeight < 1 then
      FCamHeight := 1;
    Position.Y := GLTerrainRenderer1.InterpolatedHeight(AbsolutePosition);
    if Position.Y < FractalArchip.SeaLevel then
      Position.Y := FractalArchip.SeaLevel;
    Position.Y := (Position.Y + FCamHeight) * GLTerrainRenderer1.Scale.Y;
  end; // with
end;

//--------------------------------------------------------------------

procedure TfrmFracArchip.SetRendering(const Value: boolean);
begin
  FRendering := Value;
  GLAsyncTimer1.Enabled := FRendering;
  GLSceneViewer1.Enabled := FRendering;
  GLSceneViewer1.Visible := FRendering;

  if FRendering = False then
    GLTerrainRenderer1.HeightDataSource := nil
  else
    GLTerrainRenderer1.HeightDataSource := FractalArchip;

end;

function TfrmFracArchip.OnDrawTextureSlope(const Sender: TGLBaseRandomHDS; X, Y: Integer; z: double;
  aNormal: TGLVector): TGLColorVector;
var
  slope: Single;
begin
  slope := aNormal.Y * pi;
  MakeVector(Result, cos(slope), sin(slope), slope); // False colour
end;

initialization //=============================================================

finalization

Sea.Free;
Forest.Free;
Snow.Free;
Cliff.Free;
Grass.Free;
Beach.Free;
BrownSoil.Free;

end.
