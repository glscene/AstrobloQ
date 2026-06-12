(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit faAstroScene_en;

interface

uses
  Winapi.OpenGL,
  Winapi.OpenGLext,
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  System.SysUtils,
  System.Classes,
  System.Types,
  System.Math,
  System.ImageList,
  System.IniFiles,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.Imaging.Jpeg,
  Vcl.Imaging.pngimage,
  Vcl.Menus,
  Vcl.ComCtrls,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.CheckLst,
  Vcl.ToolWin,
  Vcl.Grids,
  Vcl.Outline,
  Vcl.Samples.DirOutln,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  Stage.TextureFormat,
  Stage.Utils,

  GLS.Material,
  GLS.Cadencer,
  GLS.LensFlare,
  GLS.Scene,
  GLS.Objects,
  Stage.Coordinates,
  GLS.SceneViewer,
  GLS.Texture,
  GLS.RenderContextInfo,
  Stage.Color,
  GLS.State,
  GLS.FileJPEG,
  GLS.Context,
  GLSL.TextureShaders,
  Stage.BaseClasses,
  GLS.Atmosphere,
  GLS.GeomObjects,
  GLS.VectorFileObjects,
  GLS.File3DS,
  GLS.FileObj,
  GLS.SimpleNavigation,
  GLS.SkyDome,

  dmImages,
  daMaps_en,

  fmFormFirst,
  faAbout_en,

  faOptions_en,
  faMakeStarsys_en,
  faConstAtlas_en,
  faConstBorders_en,
  faGenStarblock_en,
  faStarsys_en

  ;

type
  TFormAstroScene = class(TFormFirst)
    GLScene: TGLScene;
    Camera: TGLCamera;
    sfPlanet: TGLSphere;
    DirectOpenGL: TGLDirectOpenGL;
    Timer: TTimer;
    Moon: TGLSphere;
    dcPlanet: TGLDummyCube;
    dcMoon: TGLDummyCube;
    LensStar: TGLLensFlare;
    GLMatLib: TGLMaterialLibrary;
    CameraControler: TGLCamera;
    SkyDome: TGLSkyDome;
    ConstLines: TGLLines;
    ConstBorders: TGLLines;
    MainMenu: TMainMenu;
    miView: TMenuItem;
    miOpen: TMenuItem;
    N2: TMenuItem;
    miFileExit: TMenuItem;
    miFileOpen: TMenuItem;
    miHelp: TMenuItem;
    OpenDialog: TOpenDialog;
    miFileSaveAs: TMenuItem;
    SaveDialog: TSaveDialog;
    Atmosphere: TGLAtmosphere;
    diskMantle: TGLDisk;
    ffPlanet: TGLFreeForm;
    diskRingUp: TGLDisk;
    miHelpWiki: TMenuItem;
    diskRingDn: TGLDisk;
    N3: TMenuItem;
    StatusBar: TStatusBar;
    miStellarSystem: TMenuItem;
    N4: TMenuItem;
    miToolsOptions: TMenuItem;
    N6: TMenuItem;
    sfCore: TGLSphere;
    ControlBarTop: TControlBar;
    miMakeStarsys: TMenuItem;
    miTools: TMenuItem;
    N7: TMenuItem;
    LensFlare: TGLLensFlare;
    LightStar: TGLLightSource;
    miHelpAbout: TMenuItem;
    PolygonAndromeda: TGLPolygon;
    TorusGreenwich: TGLTorus;
    TorusEquator: TGLTorus;
    dcArrows: TGLDummyCube;
    ArrowLineX: TGLArrowLine;
    Arrow_X: TGLArrowLine;
    ArrowLineY: TGLArrowLine;
    Arrow_Y: TGLArrowLine;
    ArrowLineZ: TGLArrowLine;
    Arrow_Z: TGLArrowLine;
    miHygStars: TMenuItem;
    miHertsRussel: TMenuItem;
    miPointTo: TMenuItem;
    miConstPolygons: TMenuItem;
    miCoordinates: TMenuItem;
    ClearTreeView1: TMenuItem;
    Constellations1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolBar2: TToolBar;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    Model1: TMenuItem;
    dcStar: TGLDummyCube;
    dcAsteroid: TGLDummyCube;
    dcComet: TGLDummyCube;
    SceneViewer1: TGLSceneViewer;
    N1: TMenuItem;
    Solblock1: TMenuItem;
    N5: TMenuItem;
    miNew: TMenuItem;
    PanelLeft: TPanel;
    tvMoons: TTreeView;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    tbPlanets: TToolBar;
    tbnSol: TToolButton;
    tbnMercury: TToolButton;
    tbnVenus: TToolButton;
    tbnEarth: TToolButton;
    tbnMars: TToolButton;
    tbnJupiter: TToolButton;
    tbnSaturn: TToolButton;
    tbnUranus: TToolButton;
    tbnNeptune: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure DirectOpenGLRender(Sender: TObject; var rci: TGLRenderContextInfo);
    procedure TimerTimer(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const deltaTime, newTime: Double);
    procedure SceneViewerMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SceneViewerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure SceneViewerDblClick(Sender: TObject);
    procedure SceneViewerBeforeRender(Sender: TObject);
    procedure miFileExitClick(Sender: TObject);
    procedure miFileOpenClick(Sender: TObject);
    procedure miFileSaveAsClick(Sender: TObject);
    procedure miHelpWikiClick(Sender: TObject);
    procedure miStellarSystemClick(Sender: TObject);
    procedure miToolsOptionsClick(Sender: TObject);
    procedure miMakeStarsysClick(Sender: TObject);
    procedure miHelpAboutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miConstPolygonsClick(Sender: TObject);
    procedure ClearTreeView1Click(Sender: TObject);
    procedure Constellations1Click(Sender: TObject);
    procedure ToolButtonPlanetsClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure miNewClick(Sender: TObject);
    procedure Solblock1Click(Sender: TObject);
  public
    DataDir, StarDir, CurrentStar: TFileName;
    CatalogName, PlanetPath: TFileName;
    ConstLinesAlpha: Single;
    ConstBordersAlpha: Single;
    TimeMultiplier: Single;
    HighResResourcesLoaded: Boolean; // for high res textures
    CameraTimeSteps: Single;
    Radius, invAtmosphereHeight: Single;
    eyePos, lightingVector: TGSVector;
    diskNormal, diskRight, diskUp: TGSVector;
    procedure LoadConstLines(const aDataPath: TFileName);
    procedure LoadConstBorders(const aDataPath: TFileName);
    procedure LoadStarBayers(const aDataPath: TFileName);
  private
    ConstellationsAlpha: Single;
    mx, my,
    dmx, dmy: Integer;
    function AtmosphereColor(const rayStart, rayEnd: TGSVector): TGSColorVector;
    function ComputeColor(var rayDest: TGSVector; mayHitGround: Boolean): TGSColorVector;
    procedure ReadIniFile; override; // from base class
  end;

var
  FormAstroScene: TFormAstroScene;

const
  cOpacity: Single = 5;
  // thicker atmosphere looks better :)
  cAtmosphereRadius: Single = 0.55;
  // smaller radius is taken to eliminate the effect of overlapping lines
  cPlanetRadius: Single = 0.495;
  cLowAtmColor: TGSColorVector = (X:1; Y:1; Z:1; W:1);
  cHighAtmColor: TGSColorVector = (X:0; Y:0; Z:1; W:1);
  cIntDivTable: array[2..20] of Single =
    (1 / 2, 1 / 3, 1 / 4, 1 / 5, 1 / 6, 1 / 7, 1 / 8, 1 / 9, 1 / 10,
    1 / 11, 1 / 12, 1 / 13, 1 / 14, 1 / 15, 1 / 16, 1 / 17, 1 / 18, 1 / 19, 1 / 20);

const
  Plane0: array [0 .. 3] of Double = (0, 0, -1, 0.0);
  Plane1: array [0 .. 3] of Double = (-1, 0, 0, 0.0);
  Plane2: array [0 .. 3] of Double = (0, -1, 0, 0.0);

implementation //=============================================================

{$R *.dfm}

//---------------------- Loading data on FormCreate --------------------------
procedure TFormAstroScene.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('bin', DataDir), Length(DataDir)); // if bin dir for exe
  DataDir := IncludeTrailingPathDelimiter(DataDir) + 'data';
  SetCurrentDir(DataDir) ;
  StarDir := DataDir + '\' + 'starsys';

  // Path to catalogs
  CatalogName := DataDir + '\catalog\hipparcos.stars';
//  CatalogName := DataDir + '\catalog\hyg.csv';
  if FileExists(CatalogName) then
  begin
    SkyDome.Bands.Clear;
    SkyDome.Stars.Clear;
    SkyDome.Stars.LoadStarsFile(CatalogName);
    SkyDome.StructureChanged;
  end;

  // change currect star dir
  if DirectoryExists('starsys\sun') then
        ChDir('starsys\sun');
  CurrentStar := DataDir + '\starsys\sun\';

  // Enable textured maps
  sfPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');

  // FreeForm Planet, Moon or Asteroid
  ffPlanet.Material.Texture.Disabled := False;
  ffPlanet.Material.Texture.Image.LoadFromFile('deimos.jpg');

end;

//------------------------- Form Show ----------------------------------------
procedure TFormAstroScene.FormShow(Sender: TObject);
begin
  frmStellarSys.Parent := FormAstroScene;
  frmStellarSys.Align := alClient;
  frmStellarSys.BorderStyle := bsNone;
  frmStellarSys.Show;

  //  miHelpWiki.Caption := miItem.Text + ' in ' + 'Wikipedia...';
  TimeMultiplier := Power(1, 3); // 0 - stop, fast ratation - Power(3, 3);
end;


//---------------------------------------------------------------------------
procedure TFormAstroScene.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'e', 'E': // Planet
      begin
        Camera.MoveTo(dcPlanet);
        CameraControler.MoveTo(dcPlanet);
        Camera.TargetObject := dcPlanet;
        CameraControler.TargetObject := dcPlanet;
      end;
    'h':  // HighRes Maps
      if not highResResourcesLoaded then
      begin
//        SceneViewer.Cursor := crHourGlass;
        try
          if DirectoryExists(CurrentStar) then
          begin
//            LoadHighResTexture(GLMatLib.Materials[0], 'earth_4096.jpg');
//            LoadHighResTexture(GLMatLib.Materials[1], 'earth_night_4096.jpg');
//            LoadHighResTexture(GLMatLib.Materials[2], 'moon.jpg');  //need moon_4096
          end;
//          SceneViewer.Buffer.AntiAliasing := aa2x;
        finally
//          SceneViewer.Cursor := crDefault;
        end;
        highResResourcesLoaded := True;
      end;
    '0'..'9': timeMultiplier := Power(Integer(Key) - Integer('0'), 3);
    #27: Close;
  end;
end;

//------------------ Atmosphere rim ------------------------------------------
function TFormAstroScene.AtmosphereColor(const rayStart, rayEnd: TGSVector): TGSColorVector;
var
  i, n: Integer;
  atmPoint, normal: TGSVector;
  altColor: TGSColorVector;
  alt, rayLength, contrib, decay, intensity, invN: Single;

begin
  Result := clrTransparent;
  rayLength := VectorDistance(rayStart, rayEnd);
  n := Round(3 * rayLength * invAtmosphereHeight) + 2;
  if (n > 10) then
    n := 10;
  invN := cIntDivTable[n]; // 1/n;
  contrib := rayLength * invN * cOpacity;
  decay := 1 - contrib * 0.5;
  contrib := contrib * (1 / 1.1);
  for i := n - 1 downto 0 do
  begin
    VectorLerp(rayStart, rayEnd, i * invN, atmPoint);
    // diffuse lighting normal
    normal := VectorNormalize(atmPoint);
    // diffuse lighting intensity
    intensity := VectorDotProduct(normal, lightingVector) + 0.1;
    if (PInteger(@intensity)^ > 0) then
    begin
      // sample on a day side
      intensity := intensity * contrib;
      alt := (VectorLength(atmPoint) - cPlanetRadius) * invAtmosphereHeight;
      VectorLerp(cLowAtmColor, cHighAtmColor, alt, altColor);
      Result.X := Result.X * decay + altColor.X * intensity;
      Result.Y := Result.Y * decay + altColor.Y * intensity;
      Result.Z := Result.Z * decay + altColor.Z * intensity;
    end
    else
    begin
      Result.X := Result.X * decay;
      Result.Y := Result.Y * decay;
      Result.Z := Result.Z * decay;
    end;
  end;
  Result.W := n * contrib * cOpacity * 0.1;
end;

//--------------------- ComputeColor ------------------------------------------
function TFormAstroScene.ComputeColor(var rayDest: TGSVector; mayHitGround: Boolean): TGSColorVector;
var
  ai1, ai2, pi1, pi2: TGSVector;
  rayVector: TGSVector;
begin
  rayVector := VectorNormalize(VectorSubtract(rayDest, eyePos));
  if (RayCastSphereIntersect(eyePos, rayVector, NullHmgPoint, cAtmosphereRadius,
      ai1, ai2) > 1) then
  begin
    // atmosphere hit
    if mayHitGround and
      (RayCastSphereIntersect(eyePos, rayVector, NullHmgPoint, cPlanetRadius,
       pi1, pi2) > 0) then
    begin
      // hit ground
      Result := AtmosphereColor(ai1, pi1);
    end
    else
    begin
      // through atmosphere only
      Result := AtmosphereColor(ai1, ai2);
    end;
    rayDest := ai1;
  end
  else
    Result := clrTransparent;
end;

//------------------- DirectOpenGLRender for atmosphere rim -------------------
procedure TFormAstroScene.DirectOpenGLRender(Sender: TObject; var rci: TGLRenderContextInfo);
const
  cSlices = 60;
var
  i, j, k0, k1: Integer;
  cosCache, sinCache: array[0..cSlices] of Single;
  pVertex, pColor: PVectorArray;
begin
  eyepos := Camera.AbsolutePosition;

  diskNormal := VectorNegate(eyePos);
  NormalizeVector(diskNormal);
  diskRight := VectorCrossProduct(Camera.AbsoluteUp, diskNormal);
  NormalizeVector(diskRight);
  diskUp := VectorCrossProduct(diskNormal, diskRight);
  NormalizeVector(diskUp);

  invAtmosphereHeight := 1 / (cAtmosphereRadius - cPlanetRadius);
  lightingVector := VectorNormalize(LightStar.AbsolutePosition); // Star at infinity
  PrepareSinCosCache(sinCache, cosCache, 0, 360);

  GetMem(pVertex, 2 * (cSlices + 1) * SizeOf(TGSVector));
  GetMem(pColor, 2 * (cSlices + 1) * SizeOf(TGSVector));

  rci.GLStates.DepthWriteMask := False;
  rci.GLStates.Disable(stLighting);
  rci.GLStates.Enable(stBlend);
  rci.GLStates.SetBlendFunc(bfSrcAlpha, bfOneMinusSrcAlpha);
  for i := 0 to 13 do
  begin
    if (i < 5) then
      radius := cPlanetRadius * Sqrt(i * (1 / 5))
    else
      radius := cPlanetRadius + (i - 5.1) * (cAtmosphereRadius - cPlanetRadius) * (1 / 6.9);
    radius := SphereVisibleRadius(VectorLength(eyePos), radius);
    k0 := (i and 1) * (cSlices + 1);
    k1 := (cSlices + 1) - k0;
    for j := 0 to cSlices do
    begin
      VectorCombine(diskRight, diskUp, cosCache[j] * radius, sinCache[j] * radius,
        pVertex[k0 + j]);
      if (i < 13) then
        pColor[k0 + j] := ComputeColor(pVertex[k0 + j], i <= 7);
      if (i = 0) then
        Break;
    end;
    if (i > 1) then
    begin
      if (i = 13) then
      begin
        glBegin(GL_QUAD_STRIP);
        for j := cSlices downto 0 do
        begin
          glColor4fv(@pColor[k1 + j]);
          glVertex3fv(@pVertex[k1 + j]);
          glColor4fv(@clrTransparent);
          glVertex3fv(@pVertex[k0 + j]);
        end;
        glEnd;
      end
      else
      begin
        glBegin(GL_QUAD_STRIP);
        for j := cSlices downto 0 do
        begin
          glColor4fv(@pColor[k1 + j]);
          glVertex3fv(@pVertex[k1 + j]);
          glColor4fv(@pColor[k0 + j]);
          glVertex3fv(@pVertex[k0 + j]);
        end;
        glEnd;
      end;
    end
    else if (i = 1) then
    begin
      glBegin(GL_TRIANGLE_FAN);
      glColor4fv(@pColor[k1]);
      glVertex3fv(@pVertex[k1]);
      for j := k0 + cSlices downto k0 do
      begin
        glColor4fv(@pColor[j]);
        glVertex3fv(@pVertex[j]);
      end;
      glEnd;
    end;
  end;
  rci.GLStates.DepthWriteMask := True;
  FreeMem(pVertex);
  FreeMem(pColor);
end;

//------------------- Loading constellation lines ----------------------------
procedure TFormAstroScene.LoadConstLines(const aDataPath: TFileName);
var
  sl, line: TStrings;
  pos1, pos2: TAffineVector;
  i: Integer;
begin
  ConstLines.Nodes.Clear;
  ConstLinesAlpha := 0.5 - ConstLinesAlpha;
  sl := TStringList.Create;
  line := TStringList.Create;
  sl.LoadFromFile(aDataPath + 'ConstLines.dat'); // Rey
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i];
    pos1 := LonLatToPos(StrToFloatDef(line[0], 0), StrToFloatDef(line[1], 0));
    ConstLines.AddNode(pos1);
    pos2 := LonLatToPos(StrToFloatDef(line[2], 0), StrToFloatDef(line[3], 0));
    ConstLines.AddNode(pos2);
  end;
  sl.Free;
  line.Free;
end;

//----------------------------------------------------------------------------
//----------------------- Loading constellation borders ----------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.LoadConstBorders(const aDataPath: TFileName);
var
  sl,                        // all string lines in A file
  line: TStrings;            // a line of strings
  skypos: TAffineVector;     // position of star on skydome
  i: Integer;
begin
  ConstBorders.Nodes.Clear;
  ConstBordersAlpha := 0.5 - ConstBordersAlpha;

  sl := TStringList.Create;
  line := TStringList.Create;
//  sl.LoadFromFile(aDataPath + 'ConstB.cby');  // GaiaSky
  sl.LoadFromFile(aDataPath + 'ConstBorders.csv');
//  sl.LoadFromFile(aDataPath + 'Constellations.csv'); // Eleanor
///  sl.LoadFromFile(aDataPath + 'and.txt');  // Polygon of Andromeda
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i + 1];
    skypos := LonLatToPos(StrToFloat(line[0]), StrToFloat(line[1]));
    ConstBorders.AddNode(skypos);
  end;
  sl.Free;
  line.Free;
 // ConstLines.Nodes.Clear;
end;

//----------------------------------------------------------------------------
procedure TFormAstroScene.LoadStarBayers(const aDataPath: TFileName);
begin
  //
end;

//-----------------------  Cadencer ------------------------------------------
procedure TFormAstroScene.GLCadencerProgress(Sender: TObject; const deltaTime,
  newTime: Double);
var
  d : Double;
  p : TAffineVector;
begin
  d := GMTDateTimeToJulianDay(Now - 2 + newTime * TimeMultiplier);
  p := ComputePlanetPosition(cSunOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
  /// LSSun.Position.AsAffineVector := p;   //stop sun motion

  // rotation of the Moon around self and Earth
  // direction could be changed!
  p := ComputePlanetPosition(cMoonOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
  dcMoon.TurnAngle := dcMoon.TurnAngle + deltaTime * timeMultiplier / 29.5;
  Moon.TurnAngle := 180 - dcMoon.TurnAngle;
  // smooth moving for camera
  if (dmy <> 0) or (dmx <> 0) then
  begin
    CameraControler.MoveAroundTarget(ClampValue(dmy * 0.3, -5, 5),
      ClampValue(dmx * 0.3, -5, 5));
    dmx := 0;
    dmy := 0;
  end;
  cameraTimeSteps := cameraTimeSteps + deltaTime;
  while cameraTimeSteps > 0.005 do
  begin
    Camera.Position.AsVector := VectorLerp(Camera.Position.AsVector,
      CameraControler.Position.AsVector, 0.05);
    cameraTimeSteps := cameraTimeSteps - 0.005;
  end;

  // Show constellation lines
  if ConstLines.LineColor.Alpha <> ConstLinesAlpha then
  begin
    ConstLines.LineColor.Alpha :=
      ClampValue(ConstLines.LineColor.Alpha + Sign(ConstLinesAlpha -
                 ConstLines.LineColor.Alpha) * deltaTime, 0, 0.5);
    ConstLines.Visible := (ConstLines.LineColor.Alpha > 0);
  end;

  // Show constellation borders
  if ConstBorders.LineColor.Alpha <> ConstBordersAlpha then
  begin
    ConstBorders.LineColor.Alpha :=
      ClampValue(ConstBorders.LineColor.Alpha + Sign(ConstBordersAlpha -
                 ConstBorders.LineColor.Alpha) * deltaTime, 0, 0.5);
    ConstBorders.Visible := (ConstBorders.LineColor.Alpha > 0);
  end;

 // Moving and rotations
 (*
  if frmOptions.chbRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + deltaTime * TimeMultiplier;
    ffPlanet.TurnAngle := ffPlanet.TurnAngle + deltaTime * TimeMultiplier;
  end;
  *)
end;

//---------------------------- Clear tvStarsys ----------------------------------
procedure TFormAstroScene.ClearTreeView1Click(Sender: TObject);
begin
//  tvStarsys.Items.Clear;
end;

//----------------------------------------------------------------------------
procedure TFormAstroScene.SceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := x;
  my := y;
end;

//----------------------------------------------------------------------------
procedure TFormAstroScene.SceneViewerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssLeft] then
  begin
    dmx := dmx + (mx - x);
    dmy := dmy + (my - y);
  end
  else if Shift = [ssRight] then
    Camera.FocalLength := Camera.FocalLength * Power(1.05, (my - y) * 0.1);
  mx := x;
  my := y;
end;


//------------------------  ToolButtonPlanets   -------------------------------
procedure TFormAstroScene.ToolButtonPlanetsClick(Sender: TObject);
var
  PlanetName: TFileName;
begin
  PlanetName := CurrentStar + TToolButton(Sender).ImageName;
  ffPlanet.Material.Texture.Image.LoadFromFile(PlanetName + '.jpg');
end;

//----------------------  FormMouseWheel  ------------------------------------
procedure TFormAstroScene.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  F: single;
begin
  if (WheelDelta > 0) or (CameraControler.Position.VectorLength > 0.90) then
  begin
    F := PowerSingle(1.05, WheelDelta * (1 / 120));
    CameraControler.AdjustDistanceToTarget(F);
  end;
  Handled := True;
end;


procedure TFormAstroScene.SceneViewerBeforeRender(Sender: TObject);
begin
  //
end;

//--------------------- SceneViewer DblClick ----------------------------------
procedure TFormAstroScene.SceneViewerDblClick(Sender: TObject);
begin
  SceneViewer1.OnMouseMove := nil;
  if WindowState = wsMaximized then
  begin
    WindowState := wsNormal;
//    PanelLeft.Visible := True;
//    PanelRight.Visible := True;
    ControlBarTop.Visible := True;
    BorderStyle := bsSizeable;
  end
  else
  begin
    WindowState := wsMaximized;
//    PanelLeft.Visible := False;
//    PanelRight.Visible := False;
    ControlBarTop.Visible := False;
    BorderStyle := bsNone;
  end;
  SceneViewer1.OnMouseMove := SceneViewerMouseMove;
end;


//------------------------- FPS ----------------------------------------------
procedure TFormAstroScene.TimerTimer(Sender: TObject);
begin
  StatusBar.Panels[0].Text:= SceneViewer1.FramesPerSecondText(0);
  SceneViewer1.ResetPerformanceMonitor;
end;

//----------------------------------------------------------------------------
//                            File menu
//----------------------------------------------------------------------------
procedure TFormAstroScene.miNewClick(Sender: TObject);
begin
  inherited;
  with TfrmGenStarblock.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------  Open miOpenFile ------------------------------------
procedure TFormAstroScene.miFileOpenClick(Sender: TObject);
var
  I, J: Integer;
begin
  OpenDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
  OpenDialog.InitialDir := StarDir;
  OpenDialog.DefaultExt := '*.star';
  if OpenDialog.Execute then
  begin  // new star
(*
//    tvStarsys.LoadFromFile(OpenDialog.FileName, TEncoding.UTF8);
    // tvStarsys.Images := dfImages.ImgVirtPlanets;
    CurrentStar := ExtractFilePath(OpenDialog.FileName);

    // Assigning indices
    for I := 0 to tvStarsys.Items.Count - 1 do
    begin
      tvStarsys.Items[I].ImageIndex := I; // and may be .Item[J] ?
      tvStarsys.Items[I].SelectedIndex := I;
      tvStarsys.Items[I].StateIndex := -1;
    end;
    tvStarsys.Select(tvStarsys.Items[0]);
    tvStarsysClick(Sender);
*)
  end;
end;

//---------------------  miFileSaveAs Planet system ---------------------------
procedure TFormAstroScene.miFileSaveAsClick(Sender: TObject);
begin
  SaveDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
  SaveDialog.InitialDir := StarDir;
  SaveDialog.DefaultExt := '*.star';
  if SaveDialog.Execute then
  begin
//    tvStarsys.SaveToFile(SaveDialog.FileName);
    CurrentStar := GetCurrentDir();
  end;
end;

//----------------------------------------------------------------------------
//                            View menu
//----------------------------------------------------------------------------

//-----------------------  Stellar system ------------------------------------
procedure TFormAstroScene.miStellarSystemClick(Sender: TObject);
begin
  with TfrmStellarSys.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------------------------------------------------------------
procedure TFormAstroScene.Solblock1Click(Sender: TObject);
begin
  inherited;
  with TfrmGenStarblock.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;


//--------------------- View Sky Polygons ------------------------------------

procedure TFormAstroScene.miConstPolygonsClick(Sender: TObject);
begin
  with TfrmSkyPolygons.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//------------------------ Maps of Constellations ----------------------------
procedure TFormAstroScene.Constellations1Click(Sender: TObject);
begin
  with TfrmConstells.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------------------------------------------------------------
//                        Tools Menu
//----------------------------------------------------------------------------
procedure TFormAstroScene.miToolsOptionsClick(Sender: TObject);
begin
  FormOptions.Show;
end;

//------------------- Tools - the creator of star systems ------------------
procedure TFormAstroScene.miMakeStarsysClick(Sender: TObject);
begin
  Timer.Enabled := False;
  with TfrmMakeStarsys.Create(Self) do
    try
      GLCadencerA.Enabled := False;
      ShowModal;
    finally
      GLCadencerA.Enabled := True;
      Free;
    end;
  Timer.Enabled := True;
end;

//------------------  Help from wiki ------------------------------------------
procedure TFormAstroScene.miHelpWikiClick(Sender: TObject);
var
  S: String;
begin
(*
///  miHelpWiki.Caption := tvStarsys.Selected.Text + ' in ' + 'Wikipedia...';

/// Planets -> S + '_(planet)' e.g. ../Mercury_(planet)
/// tvStarsys.Selected.Text should translated for ruwiki
/// but some starnames are on english,
/// e.g., https://ru.ruwiki.ru/wiki/GJ_1002. ?
/// S :=  'https://ru.ruwiki.ru/wiki/' + tvMoons.Selected.Text + _('Earth')
  if (tvStarsys.Selected.Level = 0) then
  begin
    if ActiveLang = LANG_RUSSIAN then
      S :=  'https://ru.ruwiki.ru/wiki/Земля'
    else
      S :=  'https://en.wikipedia.org/wiki/Earth';
      S :=  'https://en.wikipedia.org/wiki/' + tvStarsys.Selected.Text;
  end
  else
  begin
    S :=  'https://en.wikipedia.org/wiki/' + tvStarsys.Selected.Text + '_(star)';
    S :=  'https://ru.ruwiki.ru/wiki/' + tvMoons.Selected.Text;
  end;
  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
*)
end;


//------------------------- Help About ----------------------------------------
procedure TFormAstroScene.miHelpAboutClick(Sender: TObject);
begin
  inherited;
  with TfrmAbout.Create(Self) do
  try
    PageControl.ActivePageIndex := 0;
    ShowModal;
  finally
    Free;
  end;
end;

//------------------------ Reading settings from ini file --------------------
procedure TFormAstroScene.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
//    chbAxes.Checked := IniFile.ReadBool(frmOptions.Name, chbAxes.Name, True);
//    chbRotate.Checked := IniFile.ReadBool(frmOptions.Name, chbRotate.Name, True);
  finally
    IniFile.Free;
  end;
end;


//----------------------------------------------------------------------------
procedure TFormAstroScene.miFileExitClick(Sender: TObject);
begin
  Close;
end;

initialization //==============================================================

  FormatSettings.DecimalSeparator := '.';

finalization

end.
