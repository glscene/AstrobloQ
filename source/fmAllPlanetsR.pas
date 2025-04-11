unit fmAllPlanetsR;

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

  dmImages,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  Stage.TextureFormat,
  Stage.Utils,

  GLS.Material,
  GLS.Cadencer,
  GLS.LensFlare,
  GLS.Scene,
  GLS.Objects,
  GLS.Coordinates,
  GLS.SceneViewer,
  GLS.Texture,
  GLS.RenderContextInfo,
  GLS.Color,
  GLS.State,
  GLS.Context,
  GLS.FileJPEG,
  GLSL.TextureShaders,
  GLS.BaseClasses,
  GLS.Atmosphere,
  GLS.GeomObjects,
  GLS.VectorFileObjects,
  GLS.File3DS,
  GLS.FileObj,
  GLS.SimpleNavigation,
  GLS.SkyDome,

  fmSolarSystemR,
  fmStarSystemR,
  fmGenExosysR,
  fmOptionsR,
  fmAboutR,

  fmForm
  ;


type
  TfrmAllplanets = class(TFormI) // not translated when TForm
    Scene: TGLScene;
    SceneViewer: TGLSceneViewer;
    Camera: TGLCamera;
    sfPlanet: TGLSphere;
    DirectOpenGL: TGLDirectOpenGL;
    Cadencer: TGLCadencer;
    Timer: TTimer;
    Moon: TGLSphere;
    dcStar: TGLDummyCube;
    dcMoon: TGLDummyCube;
    LensStar: TGLLensFlare;
    MatLib: TGLMaterialLibrary;
    TexCombiner: TGLTexCombineShader;
    CameraControler: TGLCamera;
    StarSkyDome: TGLSkyDome;
    ConstLines: TGLLines;
    ConstBounds: TGLLines;
    MainMenu: TMainMenu;
    miView: TMenuItem;
    miOpen: TMenuItem;
    N2: TMenuItem;
    miFileExit: TMenuItem;
    miFileOpen: TMenuItem;
    miHelp: TMenuItem;
    PanelLeft: TPanel;
    tvPlanets: TTreeView;
    miClearTreeView: TMenuItem;
    miViewConstlines: TMenuItem;
    miViewConstborders: TMenuItem;
    OpenDialog: TOpenDialog;
    miFileSaveAs: TMenuItem;
    SaveDialog: TSaveDialog;
    Atmosphere: TGLAtmosphere;
    diskMantle: TGLDisk;
    ffPlanet: TGLFreeForm;
    diskRingUp: TGLDisk;
    miHelpWiki: TMenuItem;
    diskRingDn: TGLDisk;
    miViewHidePanels: TMenuItem;
    N3: TMenuItem;
    StatusBar: TStatusBar;
    miSolarSystem: TMenuItem;
    NightLights1: TMenuItem;
    N4: TMenuItem;
    miStellarSystem: TMenuItem;
    miOptions: TMenuItem;
    N6: TMenuItem;
    sfCore: TGLSphere;
    ControlBar: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N1: TMenuItem;
    miMonitor: TMenuItem;
    miExogen: TMenuItem;
    acPlanet: TGLActor;
    miTools: TMenuItem;
    N7: TMenuItem;
    LensFlare: TGLLensFlare;
    LightStar: TGLLightSource;
    About1: TMenuItem;
    miSettings: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DirectOpenGLRender(Sender: TObject; var rci: TGLRenderContextInfo);
    procedure TimerTimer(Sender: TObject);
    procedure CadencerProgress(Sender: TObject; const deltaTime, newTime: Double);
    procedure SceneViewerMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SceneViewerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure SceneViewerDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SceneViewerBeforeRender(Sender: TObject);
    procedure miFileExitClick(Sender: TObject);
    procedure miViewConstlinesClick(Sender: TObject);
    procedure miViewConstBordersClick(Sender: TObject);
    procedure tvPlanetsClick(Sender: TObject);
    procedure miFileOpenClick(Sender: TObject);
    procedure miFileSaveAsClick(Sender: TObject);
    procedure miClearTreeViewClick(Sender: TObject);
    procedure miHelpWikiClick(Sender: TObject);
    procedure miViewHidePanelsClick(Sender: TObject);
    procedure miSolarSystemClick(Sender: TObject);
    procedure miStellarSystemClick(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure miExogenClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
  public
    DataDir, StarDir, CurrentStar: TFileName;
    PlanetPath, CatalogName: TFileName;
    ConstLinesAlpha: Single;
    ConstBordersAlpha: Single;
    TimeMultiplier: Single;
    HighResResourcesLoaded: Boolean; // for high res textures
    CameraTimeSteps: Single;
    Radius, invAtmosphereHeight: Single;
    eyePos, lightingVector: TGLVector;
    diskNormal, diskRight, diskUp: TGLVector;
    procedure LoadConstLines;
    procedure LoadConstBorders;
  private
    mx, my,
    dmx, dmy: Integer;
    function AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
    function ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
    procedure LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
  end;

var
  frmAllplanets: TfrmAllplanets;

const
  cOpacity: Single = 5;
  // thicker atmosphere looks better :)
  cAtmosphereRadius: Single = 0.55;
  // smaller radius is taken to eliminate the effect of overlapping lines
  cPlanetRadius: Single = 0.495;
  cLowAtmColor: TGLColorVector = (X:1; Y:1; Z:1; W:1);
  cHighAtmColor: TGLColorVector = (X:0; Y:0; Z:1; W:1);
  cIntDivTable: array[2..20] of Single =
    (1 / 2, 1 / 3, 1 / 4, 1 / 5, 1 / 6, 1 / 7, 1 / 8, 1 / 9, 1 / 10,
    1 / 11, 1 / 12, 1 / 13, 1 / 14, 1 / 15, 1 / 16, 1 / 17, 1 / 18, 1 / 19, 1 / 20);

const
  Plane0: array [0 .. 3] of Double = (0, 0, -1, 0.0);
  Plane1: array [0 .. 3] of Double = (-1, 0, 0, 0.0);
  Plane2: array [0 .. 3] of Double = (0, -1, 0, 0.0);

implementation //-------------------------------------------------------------

{$R *.dfm}

procedure TfrmAllplanets.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('bin', DataDir), Length(DataDir)); // if bin dir for exe
  DataDir := IncludeTrailingPathDelimiter(DataDir) + 'data';
  SetCurrentDir(DataDir) ;
  StarDir := DataDir + 'stars';

  // Path to Hipparcos, Hyg or Gaia DR4
  CatalogName := DataDir + '\catalog\hipparcos.stars';
//  CatalogName := DataDir + '\catalog\hyg.csv';
  if FileExists(CatalogName) then
  begin
    StarSkyDome.Bands.Clear;
    StarSkyDome.Stars.Clear;
    StarSkyDome.Stars.LoadStarsFile(CatalogName);
    StarSkyDome.StructureChanged;
  end;

  // change currect star dir
  if DirectoryExists('Stars\sun') then
        ChDir('Stars\sun');
  CurrentStar := DataDir + '\Stars\sun\';

  // Enable textured maps
  sfPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');

  // Planetoid
  acPlanet.Material.Texture.Disabled := False;
  acPlanet.Material.Texture.Image.LoadFromFile('deimos.jpg');
  acPlanet.Scale.Scale(0.1);

  // Image indices for TreeView
  for I := 0 to tvPlanets.Items.Count - 1 do
  begin
//    tvPlanets.Items[I].ImageIndex := I;
//    tvPlanets.Items[I].SelectedIndex := I;
//    tvPlanets.Items[I].StateIndex := I;
    tvPlanets.Items[I].ExpandedImageIndex := I;
  end;
  (**)
  tvPlanets.Select(tvPlanets.Items[3]);  // Earth
  tvPlanets.FullExpand;
  miHelpWiki.Caption := tvPlanets.Selected.Text + ' in ' + 'Wikipedia...';

  TimeMultiplier := Power(1, 3); // 0 - stop, fast ratation - Power(3, 3);
  inherited;   // should be inheritance for translation
end;

//------------------------------------------------------------------
// Show/Hide panels
//------------------------------------------------------------------
procedure TfrmAllplanets.miViewHidePanelsClick(Sender: TObject);
begin
  miViewHidePanels.Checked := not miViewHidePanels.Checked;
  if miViewHidePanels.Checked then
  begin
    miViewHidePanels.Caption := 'Show panels';
    PanelLeft.Visible := False;
    StatusBar.Visible := False;
    ControlBar.Visible := False;
    frmAllplanets.BorderStyle := bsNone;
  end
  else
  begin
    miViewHidePanels.Caption := 'Hide panels';
    PanelLeft.Visible := True;
    StatusBar.Visible := True;
    ControlBar.Visible := True;
    frmAllplanets.BorderStyle := bsSizeable;
  end;
end;

//------------------------------------------------------------------
//   Select nodes of tvPlanetsClick
//------------------------------------------------------------------
procedure TfrmAllplanets.tvPlanetsClick(Sender: TObject);
begin
  PlanetPath := CurrentStar + tvPlanets.Selected.Text;

//  From LibMaterial or virtualimage collection
///  tvPlanets.Images := dfImages.ImgVirtPlanets;

  // Selection planet.3ds
  if tvPlanets.Selected.StateIndex = -1 then
  begin
    sfPlanet.Visible := True;
    sfPlanet.Material.Texture.Image.LoadFromFile(PlanetPath + '.jpg');

    // actor model to support octotrees !
    acPlanet.LoadFromFile(DataDir + '\model\planet.3ds');

    // loading maps from VirtPlanetMaps
//    acPlanet.Material.Texture.Image.Assign(dmImages.VirtPlanetMaps.Images.Items[4]);
    acPlanet.Material.Texture.Image.LoadFromFile(PlanetPath + '.jpg');
    end
  else  // StateIndex = 1
  // Planetoid of freeform
  begin
    sfPlanet.Visible := False;

    acPlanet.LoadFromFile(PlanetPath + '.3ds');
    acPlanet.Material.Texture.Image.LoadFromFile(PlanetPath + '.jpg');
    Camera.TagObject := acPlanet;
  end;

 (*
  // planet entrails
  if miInnerCore.Checked then
  begin
    if FileExists(FileName  + '_core.jpg') then
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '_core.jpg')
    else
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '.jpg');
  end;

*)
  // Planet rings
  if (tvPlanets.Selected.Text = 'Saturn') or (tvPlanets.Selected.Text = 'Uranus') then
  begin
    diskRingUp.Material.Texture.Image.LoadFromFile(PlanetPath  + '_ring.png');
    diskRingUp.Visible := True;
    diskRingDn.Material.Texture.Image.LoadFromFile(PlanetPath  + '_ring.png');
    diskRingDn.Visible := True;
  end
  else
  begin
    diskRingUp.Visible := False;
    diskRingDn.Visible := False;
  end;

  miHelpWiki.Caption := tvPlanets.Selected.Text + 'in Ruwiki';

  // Show atmosphere
  if tvPlanets.Selected.Text = 'Earth' then
    DirectOpenGL.Visible := True
  else
    DirectOpenGL.Visible := False;
end;


//---------------------------------------------------------------------
// Generator of exoplanet systems
//----------------------------------------------------------------------
procedure TfrmAllplanets.miExogenClick(Sender: TObject);
begin
  Timer.Enabled := False;
  Cadencer.Enabled := False;
(*
  if FileExists(AppPath + 'EarthAbcde.exe') then
    ShellExecute(0, 'open', PChar(AppPath + 'EarthAbcde.exe'), '', '', SW_SHOW);
*)
  with TFormGenPlanetsys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
 (*
  // New exoplanet system
  with TFormNewSystem.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
*)
  Timer.Enabled := True;
  Cadencer.Enabled := True;
end;


//------------------------------------------------------------------
// City lights
//------------------------------------------------------------------
procedure TfrmAllplanets.SceneViewerBeforeRender(Sender: TObject);
begin
  LensStar.PreRender(Sender as TGLSceneBuffer);
  // если нет мультитекстурирования и combiner то без света городов
  MatLib.Materials[0].Shader := TexCombiner;
  MatLib.Materials[0].Texture2Name := 'earthNight';
end;

//------------------------------------------------------------------

procedure TfrmAllplanets.About1Click(Sender: TObject);
begin
  inherited;
  with TFormAbout.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

function TfrmAllplanets.AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
var
  i, n: Integer;
  atmPoint, normal: TGLVector;
  altColor: TGLColorVector;
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
      // sample на дневной стороне
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

//------------------------------------------------------------------

function TfrmAllplanets.ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
var
  ai1, ai2, pi1, pi2: TGLVector;
  rayVector: TGLVector;
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

//------------------------------------------------------------------
// DirectOpenGLRender for atmosphere
//------------------------------------------------------------------
procedure TfrmAllplanets.DirectOpenGLRender(Sender: TObject; var rci: TGLRenderContextInfo);
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

  GetMem(pVertex, 2 * (cSlices + 1) * SizeOf(TGLVector));
  GetMem(pColor, 2 * (cSlices + 1) * SizeOf(TGLVector));

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

//--------------------------- Menu Items ---------------------------
// Show constellation lines
//------------------------------------------------------------------
procedure TfrmAllplanets.miViewConstlinesClick(Sender: TObject);
begin
  ConstLines.Nodes.Clear;
  miViewConstlines.Checked := not miViewConstlines.Checked;
  if miViewConstLines.Checked then
  begin
    ConstLinesAlpha := 0.5 - ConstLinesAlpha;
    LoadConstLines;
  end;
end;

//------------------------------------------------------------------

procedure TfrmAllplanets.LoadConstLines;
var
  sl, line: TStrings;
  pos1, pos2: TAffineVector;
  i: Integer;
begin
  sl := TStringList.Create;
  line := TStringList.Create;
  sl.LoadFromFile(DataDir + '\constellation\ConstLines.dat'); // Rey
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

//------------------------------------------------------------------
// Load constellation borders
//------------------------------------------------------------------
procedure TfrmAllplanets.LoadConstBorders;
var
  sl, line: TStrings;
  skypos: TAffineVector;
  i: Integer;
begin
  sl := TStringList.Create;
  line := TStringList.Create;
//  sl.LoadFromFile(DataDir + '\constellation\ConstB.cby');  // GaiaSky
  sl.LoadFromFile(DataDir + '\constellation\ConstBorders.csv');
//  sl.LoadFromFile(DataDir + '\constellation\Constellations.csv'); // Eleanor
///  sl.LoadFromFile(DataDir + '\constellation\and.txt');  // Polygon of Andromeda
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i];
    skypos := LonLatToPos(StrToFloatDef(line[0], 0), StrToFloatDef(line[1], 0));
    ConstBounds.AddNode(skypos);
  end;
  sl.Free;
  line.Free;
end;

//------------------------------------------------------------------
// Show constallation borders
//------------------------------------------------------------------
procedure TfrmAllplanets.miViewConstBordersClick(Sender: TObject);
begin
  ConstBounds.Nodes.Clear;
  miViewConstBorders.Checked := not miViewConstBorders.Checked;
  if miViewConstborders.Checked then
  begin
    ConstBordersAlpha := 0.5 - ConstBordersAlpha;
    LoadConstBorders;
  end;
 // ConstLines.Nodes.Clear;
end;


//------------------------------------------------------------------
// Cadencer
//------------------------------------------------------------------
procedure TfrmAllplanets.CadencerProgress(Sender: TObject; const deltaTime,
  newTime: Double);
var
  d : Double;
  p : TAffineVector;
begin
  d := GMTDateTimeToJulianDay(Now - 2 + newTime * TimeMultiplier);

  p := ComputePlanetPosition(cSunOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
 /// LSSun.Position.AsAffineVector := p;   //стоп движения солнца

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
  // постепенное появление/исчезновение линий созвездий
  if ConstLines.LineColor.Alpha <> ConstLinesAlpha then
  begin
    ConstLines.LineColor.Alpha :=
      ClampValue(ConstLines.LineColor.Alpha + Sign(ConstLinesAlpha -
                 ConstLines.LineColor.Alpha) * deltaTime, 0, 0.5);
    ConstLines.Visible := (ConstLines.LineColor.Alpha > 0);
  end;
  // постепенное появление/исчезновение границ созвездий
  if ConstBounds.LineColor.Alpha <> ConstBordersAlpha then
  begin
    ConstBounds.LineColor.Alpha :=
      ClampValue(ConstBounds.LineColor.Alpha + Sign(ConstBordersAlpha -
                 ConstBounds.LineColor.Alpha) * deltaTime, 0, 0.5);
    ConstBounds.Visible := (ConstBounds.LineColor.Alpha > 0);
  end;

 // Rotations
  if frmOptions.CheckBoxRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + deltaTime * TimeMultiplier;
    ffPlanet.TurnAngle := ffPlanet.TurnAngle + deltaTime * TimeMultiplier;
  end;
end;

//------------------------------------------------------------------

procedure TfrmAllplanets.SceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := x;
  my := y;
end;

//-----------------------------------------------------------------

procedure TfrmAllplanets.SceneViewerMouseMove(Sender: TObject;
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

//------------------------------------------------------------------

procedure TfrmAllplanets.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  f: Single;
begin
  if (WheelDelta > 0) or (CameraControler.Position.VectorLength > 0.90) then
  begin
    f := Power(1.05, WheelDelta * (1 / 120));
    CameraControler.AdjustDistanceToTarget(f);
  end;
  Handled := True;
end;


//------------------------------------------------------------------

procedure TfrmAllplanets.SceneViewerDblClick(Sender: TObject);
begin
  SceneViewer.OnMouseMove := nil;
  if WindowState = wsMaximized then
  begin
    WindowState := wsNormal;
    PanelLeft.Visible := True;
  end
  else
  begin
    WindowState := wsMaximized;
    PanelLeft.Visible := False;
  end;
  SceneViewer.OnMouseMove := SceneViewerMouseMove;
end;

//------------------------------------------------------------------

procedure TfrmAllplanets.LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
begin
  if FileExists(FileName) then
  begin
    LibMat.Material.Texture.Compression := tcStandard;
    LibMat.Material.Texture.Image.LoadFromFile(fileName);
  end;
end;

//------------------------------------------------------------------

procedure TfrmAllplanets.FormKeyPress(Sender: TObject; var Key: Char);

begin
  case Key of
    'e', 'E': // Planet
      begin
        Camera.MoveTo(dcStar);
        CameraControler.MoveTo(dcStar);
        Camera.TargetObject := dcStar;
        CameraControler.TargetObject := dcStar;
      end;
    'h':  // High resolution
      if not highResResourcesLoaded then
      begin
        SceneViewer.Cursor := crHourGlass;
        try
          if DirectoryExists(CurrentStar) then
          begin
            LoadHighResTexture(MatLib.Materials[0], 'earth_4096.jpg');
            LoadHighResTexture(MatLib.Materials[1], 'earth_night_4096.jpg');
            LoadHighResTexture(MatLib.Materials[2], 'moon.jpg');  //need moon_4096
          end;
          SceneViewer.Buffer.AntiAliasing := aa2x;
        finally
          SceneViewer.Cursor := crDefault;
        end;
        highResResourcesLoaded := True;
      end;
    '0'..'9': timeMultiplier := Power(Integer(Key) - Integer('0'), 3);
    #27: Close;
  end;
end;

//------------------------------------------------------------------
//  FPS
//------------------------------------------------------------------
procedure TfrmAllplanets.TimerTimer(Sender: TObject);
begin
//  Caption := Format('Terrasfera ' + '%.1f FPS', [SceneViewer.FramesPerSecond]);
  StatusBar.Panels[0].Text:= SceneViewer.FramesPerSecondText(0);
  SceneViewer.ResetPerformanceMonitor;
end;

//------------------------------------------------------------------
// Solar system
//------------------------------------------------------------------
procedure TfrmAllplanets.miSolarSystemClick(Sender: TObject);
begin
  with TFormSolarSys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// -----------------------------------------------------------------
// Exosolar system
// -----------------------------------------------------------------
procedure TfrmAllplanets.miStellarSystemClick(Sender: TObject);
begin
  with TFormStarSys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//------------------------------------------------------------------
// Clear tvPlanets
//------------------------------------------------------------------
procedure TfrmAllplanets.miClearTreeViewClick(Sender: TObject);
begin
  tvPlanets.Items.Clear;
end;

//------------------------------------------------------------------
//  Open miOpenFile
//------------------------------------------------------------------
procedure TfrmAllplanets.miFileOpenClick(Sender: TObject);
var
  I, J: Integer;
begin
  OpenDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
  OpenDialog.InitialDir := StarDir;
  OpenDialog.DefaultExt := '*.star';
  if OpenDialog.Execute then
  begin  // new star
    tvPlanets.LoadFromFile(OpenDialog.FileName, TEncoding.UTF8);
    // tvPlanets.Images := dfImages.ImgVirtPlanets; // не загружаются символы
    CurrentStar := ExtractFilePath(OpenDialog.FileName);

    // Assigning indices
    for I := 0 to tvPlanets.Items.Count - 1 do
    begin
      tvPlanets.Items[I].ImageIndex := I; // and may be .Item[J] ?
      tvPlanets.Items[I].SelectedIndex := I;
      tvPlanets.Items[I].StateIndex := -1;
    end;
    (**)
    tvPlanets.Select(tvPlanets.Items[0]);
    tvPlanetsClick(Sender);
  end;
end;

//------------------------------------------------------------------
// miFileSaveAs Planet system
//------------------------------------------------------------------
procedure TfrmAllplanets.miFileSaveAsClick(Sender: TObject);
begin
  SaveDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
  SaveDialog.InitialDir := StarDir;
  SaveDialog.DefaultExt := '*.star';
  if SaveDialog.Execute then
  begin
    tvPlanets.SaveToFile(SaveDialog.FileName);
    CurrentStar := GetCurrentDir();
  end;
end;

//------------------------------------------------------------------
procedure TfrmAllplanets.miOptionsClick(Sender: TObject);
begin
  frmOptions.Show;
end;


//------------------------------------------------------------------
// Help in wiki
//------------------------------------------------------------------
procedure TfrmAllplanets.miHelpWikiClick(Sender: TObject);
var
  S: String;
begin
/// Планеты, иногда S + '_(planet)' e.g. ../Mercury_(planet)
/// tvPlanets.Selected.Text надо перевести на русский язык для ruwiki
/// но, однако, некоторые названия звёзд остаются на латинице,
/// например, https://ru.ruwiki.ru/wiki/GJ_1002. Что делать?
/// S :=  'https://ru.ruwiki.ru/wiki/' + tvPlanets.Selected.Text + _('Earth')
  if (tvPlanets.Selected.Level = 0)   then
  begin
(*
    if ActiveLang = LANG_RUSSIAN then
      S :=  'https://ru.ruwiki.ru/wiki/Земля'
    else
*)
//      S :=  'https://en.wikipedia.org/wiki/Earth';
      S :=  'https://en.wikipedia.org/wiki/' + tvPlanets.Selected.Text;
  end
  else  // Moons
  begin
    S :=  'https://en.wikipedia.org/wiki/' + tvPlanets.Selected.Text + '_(moon)';
/// S :=  'https://ru.ruwiki.ru/wiki/' + tvPlanets.Selected.Text;
  end;
//  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
end;


//------------------------------------------------------------------

procedure TfrmAllplanets.miFileExitClick(Sender: TObject);
begin
  Close;
end;

initialization //-----------------------------------------------------------

  FormatSettings.DecimalSeparator := '.';

finalization

end.
