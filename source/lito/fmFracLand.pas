unit fmFracLand;
(*
  The FractaLandscape demonstrates the used of the TGLFractalHDS and other functions
  included into the GLS.RandomHDS unit. The dialogbox interfaces almost all object
  properties allowing you to get a feeling about what they are controlling.

  The TGLFractalHDS is used in the same way as the other GLScene HDS. You must
  link it to a TGLTerrainRenderer to see something. But it does much more as it
  actually:
  1) builds its own HDS on the base of a few user-chosen parameters,
  2) computes lighting and
  3) computes its own texture. The user really has not
  much to do apart choosing the parameter combination that fits its needs. Its
  creativity is to be used in the OnDrawtexture event which defines how colors will
  be draped on the heightfield according to coordinates and topography.

  To understand how everything works, give a look at the agGLRandomHDS unit and
  at the following methods of the present unit:
  - FormCreate: How to declare and create the FractalHDS (not a plug-and-play component)
  - btApplyClick: Setting the properties
  - GenerateLandscape: How to load textures, build the landscape and free them
  afterward
  - OnDrawTexture: This function select the right color to display at a particular
  cell on the landscape, depending on its coordinates, elevation and slope. This
  function use the textures loaded in the GenerateLandscape procedure to drape
  them on the height field. Although the Drawtexture allows you to completely
  control the look of your landscape and to produce the most dramatic effects,
  it is not mandatory. If no OnDrawTexture event handler is supplied to the
  TGLFractalHDS, a default function will be used:
  - DummyCube for scaling;
  - Cadencer replaced by an TGLAsyncTimer.

  All the other methods on this form are just maintenance code for the demo;
  they are not related directly to landscape generation.

  The original code of this unit was based on the demo SynthTerr and
  Alexandre Hirzel fractal improvements, 2003
*)
interface

uses
  Winapi.OpenGL,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,
  Vcl.ComCtrls,
  Vcl.Buttons,

  Stage.VectorGeometry,
  Stage.VectorTypes,
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
  GLS.SimpleNavigation;

type
  TfrmFracLands = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    GLTerrainRenderer1: TGLTerrainRenderer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    PageControl1: TPageControl;
    Panel1: TPanel;
    lblDebug: TLabel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    tbSeaLevel: TTrackBar;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    seDepth: TSpinEdit;
    tbRoughness: TTrackBar;
    ckSea: TCheckBox;
    GroupBox3: TGroupBox;
    ckLighting: TCheckBox;
    ckShadows: TCheckBox;
    Label1: TLabel;
    tbSunHeight: TTrackBar;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    tbIntensity: TTrackBar;
    Label6: TLabel;
    tbAmbient: TTrackBar;
    Label7: TLabel;
    shColor: TShape;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    ckSeaErosion: TCheckBox;
    tbBeachHeight: TTrackBar;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    ckRainErosion: TCheckBox;
    tbErosionRate: TTrackBar;
    Label10: TLabel;
    tbDepositionRate: TTrackBar;
    Label11: TLabel;
    seSeed: TSpinEdit;
    GroupBox7: TGroupBox;
    ckLifeErosion: TCheckBox;
    Label12: TLabel;
    tbRobustness: TTrackBar;
    Label13: TLabel;
    tbAmplitude: TTrackBar;
    TabSheet4: TTabSheet;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    ckTexture: TCheckBox;
    tbTextureScale: TTrackBar;
    grpStrata: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    tbSnow: TTrackBar;
    tbSteep: TTrackBar;
    TabSheet5: TTabSheet;
    GroupBox11: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    tbFocalLength: TTrackBar;
    tbDepthOfView: TTrackBar;
    GroupBox10: TGroupBox;
    Label17: TLabel;
    ckFog: TCheckBox;
    tbFogStart: TTrackBar;
    GroupBox12: TGroupBox;
    Label18: TLabel;
    tbScaleX: TTrackBar;
    ckCyclic: TCheckBox;
    lblScaleY: TLabel;
    tbScaleY: TTrackBar;
    lblScaleZ: TLabel;
    tbScaleZ: TTrackBar;
    ckIsometric: TCheckBox;
    Label21: TLabel;
    tbTransparency: TTrackBar;
    TabSheet6: TTabSheet;
    Memo1: TMemo;
    GroupBox13: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Label24: TLabel;
    Label25: TLabel;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    DummyTrackbar: TTrackBar;
    Timer1: TTimer;
    AsyncTimer1: TGLAsyncTimer;
    GLDummyCube1: TGLDummyCube;
    rgTextureQuality: TRadioGroup;
    GroupBox14: TGroupBox;
    Label26: TLabel;
    ckStepped: TCheckBox;
    seStepCount: TSpinEdit;
    grpDefaultTexture: TGroupBox;
    Label27: TLabel;
    edDefaultTexture: TEdit;
    btDefaultTexture: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    btApply: TBitBtn;
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnTopographyChanged(Sender: TObject);
    procedure OnLightChanged(Sender: TObject);
    procedure shColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    // Update HDS properties
    procedure btApplyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnCameraChanged(Sender: TObject);
    procedure OnScaleChanged(Sender: TObject);
    procedure ckIsometricClick(Sender: TObject);
    procedure GLSceneViewer1MouseEnter(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure btDefaultTextureClick(Sender: TObject);
  private
    DataPath: TFileName;
    mx, my: Integer;
    FCamHeight: Single;
    LandscapeGenerated: Boolean;
    TopographyChanged: Boolean;
    LightChanged: Boolean;
    Start: cardinal;
    FRendering: boolean;
    procedure SetRendering(const Value: boolean);
   (*
    Select the color to paint depending on height(z) and normal. x and y are used to
    drape a texture. This is here that you play with texture effects and express your artistic mind.
    Here we only used three strata (+sea), but you can't imagine anything.
    The magic numbers here are the result of tweaking, not calculus.
    *)
    function OnDrawTexture(const Sender: tGLBaseRandomHDS; X, Y: Integer;
      z: double; aNormal: TGLVector): TGLColorVector;
    // Flashy version of the regular OnDrawTexture. Helps debugging textures.
    function OnDrawTextureFlashy(const Sender: tGLBaseRandomHDS; X, Y: Integer;
      z: double; aNormal: TGLVector): TGLColorVector;
   (*
    An alternative OnDrawTextureEvent that render slope by a grey scale
    (flat=black, vertical=white )
   *)
    function OnDrawTextureSlope(const Sender: tGLBaseRandomHDS; X, Y: Integer;
      z: double; aNormal: TGLVector): TGLColorVector;
    function OnDrawTextureGrass(const Sender: tGLBaseRandomHDS; X, Y: Integer;
      z: double; aNormal: TGLVector): TGLColorVector;
  public
    FractalHDS: TGLFractalHDS;
    procedure GenerateLandscape;
    procedure ProcessKeyboard(const DeltaTime: double);
    property Rendering: boolean read FRendering write SetRendering;
  end;

var
  frmFracLands: TfrmFracLands;
  covFlat, covSteep: Single; // Slope strata
  covLow, covHigh: Single; // Elevation strata

implementation //=============================================================

{$R *.DFM}

uses
  fmProgress;

var
  Forest, Sea, Beach, Snow, Grass, Cliff, BrownSoil: tBitmap;

function TextureSea(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Sea.Canvas.Pixels[X * 5 mod Sea.Width, Y * 5 mod Sea.Height]);
  // Result:=TextureBlue(x,y);
end;

function TextureForest(const X, Y: Integer): TGLColorVector;
begin
  with Forest do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
  AddVector(Result, 0.2); // Original texture is too dark
  // Result:=TextureDarkGreen(x,y);
end;

function TextureGrass(const X, Y: Integer): TGLColorVector;
begin
  with Grass do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
  AddVector(Result, 0.2); // Original texture is too dark
end;

function TextureSnow(const X, Y: Integer): TGLColorVector;
begin
  with Snow do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
end;

function TextureBeach(const X, Y: Integer): TGLColorVector;
begin
  with Beach do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
end;

function TextureCliff(const X, Y: Integer): TGLColorVector;
begin
  with Cliff do
    Result := ConvertWinColor(Canvas.Pixels[X * 2 mod Width, Y * 2 mod Height]);
end;

function TextureBrownSoil(const X, Y: Integer): TGLColorVector;
begin
  with BrownSoil do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
end;

//----------------------------------------------------------------------------
procedure TfrmFracLands.FormCreate(Sender: TObject);
begin
  DataPath := GetCurrentDir() + '\map'; //
  SetCurrentDir(DataPath);

  // Terrain Renderer initialisation
  GLTerrainRenderer1.MaterialLibrary := GLMaterialLibrary1;
  GLTerrainRenderer1.TileSize := 32;

  TopographyChanged := True;
  LightChanged := True;
end;

function TfrmFracLands.OnDrawTexture(const Sender: tGLBaseRandomHDS;
  X, Y: Integer; z: double; aNormal: TGLVector): TGLColorVector;
const
  f = VerticalScalingFactor;
var
  z1: Single;
  slope: Single;
begin
  with tGLFractalHDS(Sender) do
  begin
    z := z - SeaLevel * f; // we make all elevations relative to sea level
    (*
      Then, we use the vertical component of the normal to compute the slope.
      The other components could be used to differentiate a North face from a
      South face, for instance.
    *)
    slope := RadianToDeg(ArcCosine(aNormal.Y)) + random * 10 - 5;
    z1 := z * (1 + (random * 2 - 1) * 0.001) / f;
    if z <= 0 then
    begin
      Result := TextureSea(X, Y); // Deep water
      (*
      Where sea depth is small and transparency must be faked, the sea surface
      is 1 unit higher, and scaled to what was the sea bottom elevation.
      Although this is not detectable in 3D, you can use it to change water
      colour
      *)
      if z > -1 then
      begin // Shallow water
        Result.Y := Result.Y + (1 + z) * 0.4; // Add some green
        Result.z := Result.z + (1 + z) * 0.3; // Add some blue
      end // if
    end // if
    else if z / f < covLow then // Low altitude
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

//--------------------------------------------------------------------------
function TfrmFracLands.OnDrawTextureFlashy(const Sender: tGLBaseRandomHDS;
  X, Y: Integer; z: double; aNormal: TGLVector): TGLColorVector;
const
  f = VerticalScalingFactor;
var
  z1: Single;
  slope: Single;
begin
  with tGLFractalHDS(Sender) do
  begin
    z := z - SeaLevel * f; // we make all elevations relative to sea level
    { Then, we use the vertical component of the normal to compute the slope.
      The other components could be used to differentiate a North face from a
      South face, for instance. }
    slope := RadianToDeg(ArcCosine(aNormal.Y)) + random * 10 - 5;
    z1 := z * (1 + (random * 2 - 1) * 0.001) / f;
    if z <= 0 then
    begin
      Result := clrBlue;
      if z > -1 then
      begin // Shallow water
        Result.Y := Result.Y + (1 + z) * 0.4; // Add some green
        Result.z := Result.z + (1 + z) * 0.3; // Add some blue
      end; // if
    end // if
    else if z / f < covLow then // Low altitude
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

function TfrmFracLands.OnDrawTextureSlope(const Sender: tGLBaseRandomHDS;
  X, Y: Integer; z: double; aNormal: TGLVector): TGLColorVector;
var
  slope: Single;
begin
  slope := aNormal.Y * pi;
  MakeVector(Result, cos(slope), sin(slope), slope); // False colour
end;

//---------------------------------------------------------------------------
function TfrmFracLands.OnDrawTextureGrass(const Sender: tGLBaseRandomHDS;
  X, Y: Integer; z: double; aNormal: TGLVector): TGLColorVector;
begin
  Result := TextureGrass(X, Y);
end;

//------------------- Movement, mouse handling etc. -------------------------
procedure TfrmFracLands.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

//-----------------------------------------------------------------------
procedure TfrmFracLands.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
// not workable yet !
(*
  if ssLeft in Shift then
    GLCamera1.MoveAroundTarget(my - Y, mx - X);
  mx := X;
  my := Y;
*)
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

//----------------------------------------------------------------------------
procedure TfrmFracLands.Timer1Timer(Sender: TObject);
begin
  Caption := Format('%.1f FPS - %d', [GLSceneViewer1.FramesPerSecond,
    GLTerrainRenderer1.LastTriangleCount]);
  GLSceneViewer1.ResetPerformanceMonitor;
end;

procedure TfrmFracLands.FormActivate(Sender: TObject);
begin
  if not LandscapeGenerated then
  begin
    btApplyClick(Sender);
    Start := GetTickCount;
  end; // if
  LandscapeGenerated := True;
  OnCameraChanged(Sender);
  OnScaleChanged(Sender);
end;

//-----------------------------------------------------------------------------
procedure TfrmFracLands.GenerateLandscape;
begin
  try
    Rendering := False; // No rendering while the landscape is built
    frmProgress.lblTask.Caption := 'Landscape generation';
    frmProgress.Execute;
    Screen.Cursor := crHourGlass;

    // Load temporary textures
    Forest := LoadJPGtexture('Forest.jpg');
    Sea := LoadJPGtexture('Sea.jpg');
    Snow := LoadJPGtexture('Snow.jpg');
    Cliff := LoadJPGtexture('Cliff.jpg');
    BrownSoil := LoadJPGtexture('BrownSoil.jpg');
    Grass := LoadJPGtexture('Grass.jpg');
    Beach := LoadJPGtexture('Beach.jpg');

  {
    Forest := LoadJPGtexture('mousse_1.jpg');
    Sea := LoadJPGtexture('Sea.jpg');
    Snow := LoadJPGtexture('004_neige.jpg');
    Cliff := LoadJPGtexture('017Roche.jpg');
    BrownSoil := LoadJPGtexture('058terresable-sombre.jpg');
    Grass := LoadJPGtexture('nature073-Terre+Herbe.jpg');
    // or Grass:=LoadJPGTexture('nature093-Gazon.jpg');
    Beach := LoadJPGtexture('057terresable-Clair.jpg');
  }

    with FractalHDS do
    begin
      BuildLandscape; // Rebuild everything
      // Camera initial position, in the middle of the tile
      FCamHeight := 10 * Scale.Y;
      // Initial camera height offset (controled with pageUp/pageDown)
      GLCamera1.Position.X := -Size * Scale.X / 2;
      GLCamera1.Position.Y := FCamHeight;
      GLCamera1.Position.z := Size * Scale.z / 2;

      TopographyChanged := False;
      LightChanged := False;
      btApply.Enabled := False;
    end; // with

  finally // Finalisation
    Sea.Free; // The bitmaps are only needed while landscape is being built
    Forest.Free;
    Snow.Free;
    Cliff.Free;
    Grass.Free;
    Beach.Free;
    BrownSoil.Free;

    frmProgress.Close;
    Screen.Cursor := crDefault;
    Rendering := True; // Enable rendering
  end;
end;

//-----------------------------------------------------------------------------
procedure TfrmFracLands.OnTopographyChanged(Sender: TObject);
begin
  if seDepth.Value > 6 then
    seDepth.Value := 6;  // otherwise AV
  DummyTrackbar.SetFocus;
  TopographyChanged := True;
  btApply.Enabled := True;
end;

procedure TfrmFracLands.OnLightChanged(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
  LightChanged := True;
  btApply.Enabled := True;
  grpStrata.Visible := ckTexture.Checked;
  rgTextureQuality.Visible := ckTexture.Checked;
  grpDefaultTexture.Visible := not ckTexture.Checked;
end;

procedure TfrmFracLands.shColorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LightChanged := True;
  btApply.Enabled := True;
end;

//---------------------------------------------------------------------------
procedure TfrmFracLands.btApplyClick(Sender: TObject);
begin
  if FractalHDS <> nil then
    FractalHDS.Free;
  GLMaterialLibrary1.Materials.DeleteUnusedMaterials;
  FractalHDS := TGLFractalHDS.Create(Self);
  FractalHDS.TerrainRenderer := GLTerrainRenderer1;
  // Link the HDS to the Renderer
  FractalHDS.Name := 'Landscape';

  // Update HDS properties
  with FractalHDS do
  begin
    // Topographic properties
    Depth := seDepth.Value;
    Cyclic := ckCyclic.Checked; // Cyclic landscape
    Seed := seSeed.Value;
    Amplitude := tbAmplitude.Position;
    Roughness := tbRoughness.Position / 10;
    Sea := ckSea.Checked;
    SeaLevel := (tbSeaLevel.Position - 5) / 10 * Amplitude;
    if not Cyclic then
      SeaLevel := SeaLevel * 2; // to cope with the larger variance
    SeaTransparency := tbTransparency.Position / 10 *
      (SeaLevel + Amplitude / 2);

    // Erosion properties
    (*
      ErosionByRain.Enabled := ckRainErosion.Checked;
      ErosionByRain.ErosionRate := tbErosionRate.Position / 10;
      ErosionByRain.DepositRate := tbDepositionRate.Position / 10;

      ErosionBySea.Enabled := ckSeaErosion.Checked;
      ErosionBySea.BeachHeight := tbBeachHeight.Position / 100 * Amplitude;

      ErosionByLife.Enabled := ckLifeErosion.Checked;
      ErosionByLife.Robustness := IntPower(10, tbRobustness.Position);

      Steps.Enabled := ckStepped.Checked;
      Steps.Count := seStepCount.Value;
    *)

    // Lighting properties
    /// ? LightColor := ConvertWinColor(shColor.Brush.Color);
    AmbientLight := tbAmbient.Position / 10;
    LightDirection := VectorMake(-tbSunHeight.Position / 10,
      -sqrt(1 - sqr(-tbSunHeight.Position / 10)), -tbSunHeight.Position / 10);
    Lighting := ckLighting.Checked;
    Shadows := ckShadows.Checked;

    // Topographic strata used for land-cover assignation
    covLow := ErosionBySea.BeachHeight * 1.2;
    covHigh := tbSnow.Position / 10 * Amplitude / 2;
    covFlat := 5;
    covSteep := tbSteep.Position;

    // Texture properties
    LandCover := ckTexture.Checked;
    TextureScale := Round(IntPower(2, tbTextureScale.Position));
    // Number of texture pixels by HDS cell
    if LandCover then
    begin
      case rgTextureQuality.ItemIndex of
        0: OnDrawTexture := nil;
        1: OnDrawTexture := OnDrawTextureFlashy;
        2: OnDrawTexture := OnDrawTextureSlope;
        3: OnDrawTexture := Self.OnDrawTexture
          // Function defining the cover to be applied
      end; // case
      // TextureScale:=1;
    end
    else
    begin
      OnDrawTexture := nil; // Revert to the default (basic) OnDrawTexture event
      with TerrainRenderer.MaterialLibrary.AddTextureMaterial('Default',
        edDefaultTexture.Text) do
      begin
      end; // with
      MaterialName := 'Default';
    end; // else
    (*
     // Landscape without a sea
     PrimerLandscape := True;
     PrimerIsland(0, 100, fHeight);
    *)
  end; // with

  GenerateLandscape;
end;

procedure TfrmFracLands.FormDestroy(Sender: TObject);
begin
  FractalHDS.Free;
end;

procedure TfrmFracLands.OnCameraChanged(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
  with GLCamera1 do
  begin
    DepthOfView := FractalHDS.Size * 1.4142 * tbDepthOfView.Position / 10 *
      GLDummyCube1.Scale.X;
    FocalLength := tbFocalLength.Position;
  end; // with
  with GLSceneViewer1.Buffer do
  begin
    FogEnable := ckFog.Checked;
    FogEnvironment.FogStart := GLCamera1.DepthOfView * tbFogStart.Position / 10;
    FogEnvironment.FogEnd := GLCamera1.DepthOfView * 1.2;
  end; // with
  GLTerrainRenderer1.QualityDistance := GLCamera1.DepthOfView / 2;
end;

procedure TfrmFracLands.OnScaleChanged(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
  if ckIsometric.Checked then
  begin
    tbScaleY.Position := tbScaleX.Position;
    tbScaleZ.Position := tbScaleX.Position;
  end; // if
  with GLDummyCube1.Scale do
  begin
    X := tbScaleX.Position;
    Y := tbScaleY.Position;
    z := tbScaleZ.Position;
  end; // with     }
end;

procedure TfrmFracLands.ckIsometricClick(Sender: TObject);
begin
  tbScaleY.Enabled := not ckIsometric.Checked;
  tbScaleZ.Enabled := not ckIsometric.Checked;
  lblScaleY.Enabled := not ckIsometric.Checked;
  lblScaleZ.Enabled := not ckIsometric.Checked;
  if ckIsometric.Checked then
  begin
    tbScaleY.Position := tbScaleX.Position;
    tbScaleZ.Position := tbScaleX.Position;
  end; // if
end;

procedure TfrmFracLands.GLSceneViewer1MouseEnter(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
end;

procedure TfrmFracLands.TrackBar2Change(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
end;

procedure TfrmFracLands.PageControl1Change(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
end;

procedure TfrmFracLands.Button1Click(Sender: TObject);
begin
   AsyncTimer1.Enabled:=True;
  // AsyncTimer1.Enabled:=False;
end;

procedure TfrmFracLands.AsyncTimer1Timer(Sender: TObject);
var
  DeltaTime: double;
begin
  DeltaTime := (GetTickCount - Start) / 1000;
  Start := GetTickCount;

  lblDebug.Caption := Format('%f,%f,%f', [GLCamera1.Position.X,
    GLCamera1.Position.Y, GLCamera1.Position.z]);

  ProcessKeyboard(DeltaTime);
end;

procedure TfrmFracLands.ProcessKeyboard(const DeltaTime: double);
var
  Speed: Single;
begin
  if IsKeyDown(VK_SHIFT) then
    Speed := 5 * DeltaTime
  else
    Speed := DeltaTime;
  with GLCamera1.Position do
  begin
    if IsKeyDown(VK_RIGHT) then
      GLCamera1.Turn(Speed * 10);
    if IsKeyDown(VK_LEFT) then
      GLCamera1.Turn(-Speed * 10);
    if IsKeyDown(VK_UP) then
      GLCamera1.Move(Speed * 10);
    if IsKeyDown(VK_DOWN) then
      GLCamera1.Move(-Speed * 10);
    if IsKeyDown(VK_PRIOR) then
      FCamHeight := FCamHeight + 10 * Speed;
    if IsKeyDown(VK_NEXT) then
      FCamHeight := FCamHeight - 10 * Speed;
    if IsKeyDown(VK_ESCAPE) then
      Close;

    // Don't leave the map
    if not FractalHDS.Cyclic then
    begin
      if X < -FractalHDS.XMoveBoundary * GLDummyCube1.Scale.X then
        X := -FractalHDS.XMoveBoundary * GLDummyCube1.Scale.X;
      if z > FractalHDS.ZMoveBoundary * GLDummyCube1.Scale.z then
        z := FractalHDS.ZMoveBoundary * GLDummyCube1.Scale.z;
      if X > 0 then
        X := 0;
      if z < 0 then
        z := 0;
    end; // if

    // Don't fall through terrain!
    if FCamHeight < 0 then
      FCamHeight := 1;
    Y := (GLTerrainRenderer1.InterpolatedHeight(AsVector) + FCamHeight) *
      GLDummyCube1.Scale.Y;
  end; // with
end;

procedure TfrmFracLands.SetRendering(const Value: boolean);
begin
  FRendering := Value;
  AsyncTimer1.Enabled := FRendering;
  GLSceneViewer1.Enabled := FRendering;
  if FRendering = False then
    GLTerrainRenderer1.HeightDataSource := nil
  else
    GLTerrainRenderer1.HeightDataSource := FractalHDS;
end;

procedure TfrmFracLands.btDefaultTextureClick(Sender: TObject);
begin
  with OpenPictureDialog1 do
  begin
    if not Execute then
      exit;
    edDefaultTexture.Text := FileName;
    LightChanged := True;
  end; // with
end;

procedure TfrmFracLands.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Rendering := False;
end;

end.
