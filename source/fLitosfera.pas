unit fLitosfera;

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
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.Imaging.Jpeg,
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

  GLS.FileJPEG,
  GLS.VectorTypes,
  GLS.VectorGeometry,
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
  GLS.Utils,
  GLS.Context,
  GLS.TextureFormat,
  GLSL.TextureShaders,
  GLS.BaseClasses,
  GLS.Atmosphere,
  GLS.GeomObjects,
  GLS.VectorFileObjects,
  GLS.File3DS,
  GLS.FileObj,
  GLS.SimpleNavigation,
  GLS.SkyDome,

  dImages,
  fProjection,
  fSolarSystem,
  fStarSystem,
  fNewExosystem,
  fSettings,
  fGenPlanetsys,

  fAbout;


type
  TFormLitosfera = class(TForm)
    Scene: TGLScene;
    SceneViewer: TGLSceneViewer;
    Camera: TGLCamera;
    sfPlanet: TGLSphere;
    LightStar: TGLLightSource;
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
    Open1: TMenuItem;
    N2: TMenuItem;
    miFileExit: TMenuItem;
    miFileOpen: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    miInnerCore: TMenuItem;
    PanelLeft: TPanel;
    tvPlanets: TTreeView;
    miOptions: TMenuItem;
    miClearTreeView: TMenuItem;
    miViewConstlines: TMenuItem;
    miViewConstborders: TMenuItem;
    OpenDialog: TOpenDialog;
    miFileSaveAs: TMenuItem;
    SaveDialog: TSaveDialog;
    Atmosphere: TGLAtmosphere;
    PlanetSkyDome: TGLEarthSkyDome;
    PlanetMantle: TGLDisk;
    ffPlanet: TGLFreeForm;
    PlanetRingUp: TGLDisk;
    miHelpWiki: TMenuItem;
    PlanetRingDn: TGLDisk;
    miViewHidePanels: TMenuItem;
    miShowHidePlanet: TMenuItem;
    miGoogleEarth: TMenuItem;
    N3: TMenuItem;
    miPlanetSkyDome: TMenuItem;
    StatusBar: TStatusBar;
    miSystemSolar: TMenuItem;
    miSystemProjection: TMenuItem;
    NightLights1: TMenuItem;
    N4: TMenuItem;
    miFileNew: TMenuItem;
    miSystemStar: TMenuItem;
    miSettings: TMenuItem;
    N6: TMenuItem;
    PanelRight: TPanel;
    PanelParameters: TPanel;
    chbInnerCore: TCheckBox;
    CheckBox1: TCheckBox;
    PlanetCore: TGLSphere;
    chbRotate: TCheckBox;
    chbShowAxes: TCheckBox;
    ButtonGrid: TButton;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N1: TMenuItem;
    MemoParams: TMemo;
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
    procedure miViewConstbordersClick(Sender: TObject);
    procedure tvPlanetsClick(Sender: TObject);
    procedure miFileOpenClick(Sender: TObject);
    procedure miFileSaveAsClick(Sender: TObject);
    procedure miClearTreeViewClick(Sender: TObject);
    procedure miInnerCoreClick(Sender: TObject);
    procedure miHelpWikiClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure miViewHidePanelsClick(Sender: TObject);
    procedure miShowHidePlanetClick(Sender: TObject);
    procedure miGoogleEarthClick(Sender: TObject);
    procedure miPlanetSkyDomeClick(Sender: TObject);
    procedure miSystemSolarClick(Sender: TObject);
    procedure miSystemProjectionClick(Sender: TObject);
    procedure miSystemStarClick(Sender: TObject);
    procedure miFileNewClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure ButtonGridClick(Sender: TObject);
    procedure chbShowAxesClick(Sender: TObject);
  public
    ConstLinesAlpha: Single;
    ConstBordersAlpha: Single;
    TimeMultiplier: Single;
    mx, my, dmx, dmy: Integer;
    HighResResourcesLoaded: Boolean;
    CameraTimeSteps: Single;
    Radius, invAtmosphereHeight: Single;
    eyePos, lightingVector: TGLVector;
    diskNormal, diskRight, diskUp: TGLVector;
  private
    DataDir, StarDir, CurrentStar: TFileName;
    CatalogName, FileName: TFileName;
    procedure LoadConstLines;
    procedure LoadConstBounds;
    // Atmosphere Color
    function AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
    // Compute AtmColor
    function ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
    procedure LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
  end;

var
  FormLitosfera: TFormLitosfera;

const
  cOpacity: Single = 5;
  // unrealistic thick atmospheres look better :)
  cAtmosphereRadius: Single = 0.55;
  // use value slightly lower than actual radius, for antialiasing effect
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

//------------------------------------------------------------------
implementation
//------------------------------------------------------------------

{$R *.dfm}

//------------------------------------------------------------------

procedure TFormLitosfera.FormCreate(Sender: TObject);
begin
  DataDir := ExtractFilePath(ParamStr(0)) + 'data';
  SetCurrentDir(DataDir);
  StarDir := DataDir + '\star';

  CatalogName := DataDir + '\catalog\hipparcos.stars';
//  CatalogName := DataDir + '\catalog\gaia_dr3.stars';

  if FileExists(CatalogName) then
  begin
    StarSkyDome.Bands.Clear;
    StarSkyDome.Stars.Clear;
    StarSkyDome.Stars.LoadStarsFile(CatalogName);
    StarSkyDome.StructureChanged;
  end;

  // change dir to sun directory
  if DirectoryExists('star\sun') then
        ChDir('star\sun');
  CurrentStar := DataDir + '\star\sun\';
  sfPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');

  Atmosphere.PlanetRadius := sfPlanet.Radius;
  Atmosphere.AtmosphereRadius := sfPlanet.Radius + 0.05;
  Atmosphere.MoveTo(dcStar);
  Atmosphere.Opacity := cOpacity;

  tvPlanets.Select(tvPlanets.Items[3]);  // goto to Earth
  miHelpWiki.Caption := tvPlanets.Selected.Text + ' in ' + 'Wikipedia...';

  TimeMultiplier := Power(1, 3); // faster - Power(2, 3);
end;

//------------------------------------------------------------------
// Show Planet
//------------------------------------------------------------------
procedure TFormLitosfera.miShowHidePlanetClick(Sender: TObject);
begin
  miShowHidePlanet.Checked := not miShowHidePlanet.Checked;
  if miShowHidePlanet.Checked then
  begin
    miShowHidePlanet.Caption := 'Показать планету';
    sfPlanet.Visible := False;
    ffPlanet.Visible := False;
    DirectOpenGL.Visible := False;
  end
  else
  begin
    miShowHidePlanet.Caption := 'Скрыть планету';
    sfPlanet.Visible := True;
    ffPlanet.Visible := True;
    DirectOpenGL.Visible := True;
  end;
end;

//------------------------------------------------------------------
// Show Inner Core
//------------------------------------------------------------------
procedure TFormLitosfera.miInnerCoreClick(Sender: TObject);
begin
  miInnerCore.Checked := not miInnerCore.Checked;
  if miInnerCore.Checked then
  begin
    FileName := CurrentStar + tvPlanets.Selected.Text;
    if FileExists(FileName + '_core.jpg') then
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName + '_core.jpg')
    else
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName + '.jpg');
    sfPlanet.Stop := 180;
    Atmosphere.Visible := False;
  end
  else
  begin
    sfPlanet.Stop := 360;
    Atmosphere.Visible := True;
  end;
end;

//------------------------------------------------------------------
// ShowHide tvPlanets
//------------------------------------------------------------------
procedure TFormLitosfera.miViewHidePanelsClick(Sender: TObject);
begin
  miViewHidePanels.Checked := not miViewHidePanels.Checked;
  if miViewHidePanels.Checked then
  begin
    miViewHidePanels.Caption := 'Показать панели';
    PanelLeft.Visible := False;
    PanelRight.Visible := False;
    StatusBar.Visible := False;
  end
  else
  begin
    miViewHidePanels.Caption := 'Скрыть панели';
    PanelLeft.Visible := True;
    PanelRight.Visible := True;
    StatusBar.Visible := True;
  end;
//  frmTerraplanet.BorderStyle := bsNone;
end;

//------------------------------------------------------------------
// tvPlanetsClick
//------------------------------------------------------------------
procedure TFormLitosfera.tvPlanetsClick(Sender: TObject);
begin
  FileName := CurrentStar + tvPlanets.Selected.Text;

  if tvPlanets.Selected.StateIndex = -1 then    // Planet as TGLSphere
  begin
//  sfPlanet.LoadFromFile(FileName + '.3ds'); // Sphere.3ds as TGLFreeForms
    sfPlanet.Material.Texture.Image.LoadFromFile(FileName + '.jpg');
    sfPlanet.Visible := True;
    ffPlanet.Visible := False;
  end
  else    // StateIndex = 1 for Planetoid as TGLFreeForm
  begin
    ffPlanet.LoadFromFile(FileName + '.3ds');
    ffPlanet.Scale.X := 0.01; ffPlanet.Scale.Y := 0.01; ffPlanet.Scale.Z := 0.01;
    sfPlanet.Visible := False;
    ffPlanet.Visible := True;
    ffPlanet.Material.Texture.Disabled := False;
    ffPlanet.Material.Texture.Image.LoadFromFile(FileName + '.jpg');
  end;

  // Cores of Planets
  if miInnerCore.Checked then
  begin
    if FileExists(FileName  + '_core.jpg') then
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '_core.jpg')
    else
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '.jpg');
  end;

  // Rings
  if tvPlanets.Selected.Text = 'Saturn' then
  begin
    PlanetRingUp.Material.Texture.Image.LoadFromFile(FileName  + '_ring.jpg');
    PlanetRingDn.Material.Texture.Image.LoadFromFile(FileName  + '_ring.jpg');
    PlanetRingUp.Visible := True; PlanetRingDn.Visible := True;
  end
  else
  begin
    PlanetRingUp.Visible := False;
    PlanetRingDn.Visible := False;
  end;

  miHelpWiki.Caption := tvPlanets.Selected.Text + ' в ' + 'Рувики...';

  // Atmospheres
  if (tvPlanets.Selected.Text = 'Earth') then
    DirectOpenGL.Visible := True
  else
    DirectOpenGL.Visible := False;
end;

//------------------------------------------------------------------
// SceneViewerBeforeRender
//------------------------------------------------------------------
procedure TFormLitosfera.SceneViewerBeforeRender(Sender: TObject);
begin
  LensStar.PreRender(Sender as TGLSceneBuffer);
  // if no multitexturing or no combiner support, turn off city lights
  MatLib.Materials[0].Shader := TexCombiner;
  MatLib.Materials[0].Texture2Name := 'earthNight';
end;

//------------------------------------------------------------------

function TFormLitosfera.AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
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
      // sample on the lit side
      intensity := intensity * contrib;
      alt := (VectorLength(atmPoint) - cPlanetRadius) * invAtmosphereHeight;
      VectorLerp(cLowAtmColor, cHighAtmColor, alt, altColor);
      Result.X := Result.X * decay + altColor.X * intensity;
      Result.Y := Result.Y * decay + altColor.Y * intensity;
      Result.Z := Result.Z * decay + altColor.Z * intensity;
    end
    else
    begin
      // sample on the dark side
      Result.X := Result.X * decay;
      Result.Y := Result.Y * decay;
      Result.Z := Result.Z * decay;
    end;
  end;
  Result.W := n * contrib * cOpacity * 0.1;
end;

//------------------------------------------------------------------
procedure TFormLitosfera.ButtonGridClick(Sender: TObject);
begin
  ButtonGrid.Enabled := not ButtonGrid.Enabled;
end;

//------------------------------------------------------------------

function TFormLitosfera.ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
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
// Atmosphere with DirectOpenGLRender
//------------------------------------------------------------------
procedure TFormLitosfera.DirectOpenGLRender(Sender: TObject; var rci: TGLRenderContextInfo);
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
// Show Constellation Lines
//------------------------------------------------------------------
procedure TFormLitosfera.miViewConstlinesClick(Sender: TObject);
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
// Constellation Lines
//------------------------------------------------------------------
procedure TFormLitosfera.LoadConstLines;
var
  sl, line: TStrings;
  pos1, pos2: TAffineVector;
  i: Integer;
begin
  sl := TStringList.Create;
  line := TStringList.Create;
  sl.LoadFromFile(DataDir + '\constellation\ConstLinesRey.dat'); // Rey
//  sl.LoadFromFile(DataDir + '\constellation\ConstLines.dat'); //  SkyChart
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
// Constellation Bounds
//------------------------------------------------------------------
procedure TFormLitosfera.LoadConstBounds;
var
  sl, line: TStrings;
  skypos: TAffineVector;
  i: Integer;
begin
  sl := TStringList.Create;
  line := TStringList.Create;
//  sl.LoadFromFile(DataDir + '\constellation\ConstB.cby');  // GaiaSky
  sl.LoadFromFile(DataDir + '\constellation\ConstBounds.csv');
//  sl.LoadFromFile(DataDir + '\constellation\Constellations.csv'); // Eleanor
///  sl.LoadFromFile(DataDir + '\constellation\and.txt');  // IAU for Andromeda
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
// Show Constellation Bounds
//------------------------------------------------------------------
procedure TFormLitosfera.miViewConstbordersClick(Sender: TObject);
begin
  ConstBounds.Nodes.Clear;
  miViewConstborders.Checked := not miViewConstborders.Checked;
  if miViewConstborders.Checked then
  begin
    ConstBordersAlpha := 0.5 - ConstBordersAlpha;
    LoadConstBounds;
  end;
 // ConstLines.Nodes.Clear;
end;


//------------------------------------------------------------------
// CadencerProgress
//------------------------------------------------------------------
procedure TFormLitosfera.CadencerProgress(Sender: TObject; const deltaTime,
  newTime: Double);
var
  d : Double;
  p : TAffineVector;
begin
  d := GMTDateTimeToJulianDay(Now - 2 + newTime * TimeMultiplier);

  // make rotate
  if chbRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + deltaTime * TimeMultiplier;
    ffPlanet.TurnAngle := ffPlanet.TurnAngle + deltaTime * TimeMultiplier;
  end;

  p := ComputePlanetPosition(cSunOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
 /// LSSun.Position.AsAffineVector := p;      //stop sun motion

  // make moon rotate on itself and around earth (not sure about the rotation direction!)
  p := ComputePlanetPosition(cMoonOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
  dcMoon.TurnAngle := dcMoon.TurnAngle + deltaTime * timeMultiplier / 29.5;
  Moon.TurnAngle := 180 - dcMoon.TurnAngle;

  // honour camera movements
  if (dmy <> 0) or (dmx <> 0) then
  begin
    CameraControler.MoveAroundTarget(ClampValue(dmy * 0.3, -5, 5),
      ClampValue(dmx * 0.3, -5, 5));
    dmx := 0;
    dmy := 0;
  end;
  // this gives us smoother camera movements
  cameraTimeSteps := cameraTimeSteps + deltaTime;
  while cameraTimeSteps > 0.005 do
  begin
    Camera.Position.AsVector := VectorLerp(Camera.Position.AsVector,
      CameraControler.Position.AsVector, 0.05);
    cameraTimeSteps := cameraTimeSteps - 0.005;
  end;
  // smooth constellation lines appearance/disappearance
  if ConstLines.LineColor.Alpha <> ConstLinesAlpha then
  begin
    ConstLines.LineColor.Alpha :=
      ClampValue(ConstLines.LineColor.Alpha + Sign(ConstLinesAlpha -
                 ConstLines.LineColor.Alpha) * deltaTime, 0, 0.5);
    ConstLines.Visible := (ConstLines.LineColor.Alpha > 0);
  end;
  // smooth constellation bounds appearance/disappearance
  if ConstBounds.LineColor.Alpha <> ConstBordersAlpha then
  begin
    ConstBounds.LineColor.Alpha :=
      ClampValue(ConstBounds.LineColor.Alpha + Sign(ConstBordersAlpha -
                 ConstBounds.LineColor.Alpha) * deltaTime, 0, 0.5);
    ConstBounds.Visible := (ConstBounds.LineColor.Alpha > 0);
  end;
end;

procedure TFormLitosfera.chbShowAxesClick(Sender: TObject);
begin
  sfPlanet.ShowAxes := chbShowAxes.Checked;

end;

//------------------------------------------------------------------
// SceneViewerMouseDown
//------------------------------------------------------------------
procedure TFormLitosfera.SceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := x;
  my := y;
end;

//------------------------------------------------------------------
// SceneViewerMouseMove
//------------------------------------------------------------------
procedure TFormLitosfera.SceneViewerMouseMove(Sender: TObject;
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
// FormMouseWheel
//------------------------------------------------------------------
procedure TFormLitosfera.FormMouseWheel(Sender: TObject; Shift: TShiftState;
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
// Click to Show Planet SkyDome
//------------------------------------------------------------------
procedure TFormLitosfera.miPlanetSkyDomeClick(Sender: TObject);
begin
  miPlanetSkyDome.Checked := not miPlanetSkyDome.Checked;
  if miPlanetSkyDome.Checked then
  begin
    PlanetSkyDome.Visible := True;
    StarSkyDome.Visible := False;
  end
  else
  begin
    PlanetSkyDome.Visible := False;
    StarSkyDome.Visible := True;
//    StarSkyDome.Stars.Items[0].Magnitude := -1.0;
  end;
end;

//------------------------------------------------------------------
// DblClick to ShowHide Panels
//------------------------------------------------------------------
procedure TFormLitosfera.SceneViewerDblClick(Sender: TObject);
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
// LoadHighResTexture
//------------------------------------------------------------------
procedure TFormLitosfera.LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
begin
  if FileExists(FileName) then
  begin
    LibMat.Material.Texture.Compression := tcStandard;
    LibMat.Material.Texture.Image.LoadFromFile(fileName);
  end;
end;

//------------------------------------------------------------------
// FormKeyPress
//------------------------------------------------------------------
procedure TFormLitosfera.FormKeyPress(Sender: TObject; var Key: Char);

begin
  case Key of
    'e', 'E':    // Planet
      begin
        Camera.MoveTo(dcStar);
        CameraControler.MoveTo(dcStar);
        Camera.TargetObject := dcStar;
        CameraControler.TargetObject := dcStar;
      end;

    'h':
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
//  Timer1Timer
//------------------------------------------------------------------
procedure TFormLitosfera.TimerTimer(Sender: TObject);
begin
//  Caption := Format('Geosfera ' + '%.1f FPS', [SceneViewer.FramesPerSecond]);
   StatusBar.Panels[0].Text:= SceneViewer.FramesPerSecondText(0);
  SceneViewer.ResetPerformanceMonitor;
end;

//------------------------------------------------------------------

procedure TFormLitosfera.miSystemSolarClick(Sender: TObject);
begin
  with TFormSolarSys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormLitosfera.miSystemStarClick(Sender: TObject);
begin
  with TFormStarSys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormLitosfera.miFileNewClick(Sender: TObject);
begin
  Timer.Enabled := False;
  Cadencer.Enabled := False;
(*
  if FileExists(AppPath + 'EarthAbcde.exe') then
    ShellExecute(0, 'open', PChar(AppPath + 'EarthAbcde.exe'), '', '', SW_SHOW);
*)
  with TFormGenPlanetsys.Create(Self) do  // not   FormABCreator.ShowModal;
    try
      ShowModal;
    finally
      Free;
    end;
 (*
  // Новая экзопланетная система с известными параметрами
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

procedure TFormLitosfera.About1Click(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//------------------------------------------------------------------
// miClear tvPlanets
//------------------------------------------------------------------
procedure TFormLitosfera.miClearTreeViewClick(Sender: TObject);
begin
  tvPlanets.Items.Clear;
end;

procedure TFormLitosfera.miHelpWikiClick(Sender: TObject);
var
  S: String;
begin
  if (tvPlanets.Selected.Level = 0)   then
    // Planets or Asteroids, sometimes with S + '_(planet)' like for ../Mercury_(planet)
    S :=  'https://en.wikipedia.org/wiki/' + tvPlanets.Selected.Text
  else
    // Moons
    S :=  'https://en.wikipedia.org/wiki/' + tvPlanets.Selected.Text + '_(moon)';
  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
end;


//------------------------------------------------------------------

procedure TFormLitosfera.miSystemProjectionClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//------------------------------------------------------------------
//  miOpenFile with exoplanets
//------------------------------------------------------------------
procedure TFormLitosfera.miFileOpenClick(Sender: TObject);
begin
  OpenDialog.Filter := 'Экзосистема (*.star)|*.star';
  OpenDialog.InitialDir := StarDir;
  OpenDialog.DefaultExt := '*.star';
  if OpenDialog.Execute then
  begin
    tvPlanets.LoadFromFile(OpenDialog.FileName);
    CurrentStar := ExtractFilePath(OpenDialog.FileName);
    tvPlanets.Select(tvPlanets.Items[0]);  // goto to new Star
    tvPlanetsClick(Sender);
  end;
end;

//------------------------------------------------------------------
procedure TFormLitosfera.miSettingsClick(Sender: TObject);
begin
  with TFormSettings.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;

end;

//------------------------------------------------------------------
// miSaveAs exosystem
//------------------------------------------------------------------
procedure TFormLitosfera.miFileSaveAsClick(Sender: TObject);
begin
  SaveDialog.Filter := 'Экзосистема (*.star)|*.star';
  SaveDialog.InitialDir := StarDir;
  SaveDialog.DefaultExt := '*.star';
  if SaveDialog.Execute then
  begin
    tvPlanets.SaveToFile(SaveDialog.FileName);
    CurrentStar := GetCurrentDir();
  end;
end;


//------------------------------------------------------------------
// miGoogleEarth
//------------------------------------------------------------------
procedure TFormLitosfera.miGoogleEarthClick(Sender: TObject);
var
  S: String;
begin
  S := 'https://earth.google.com/';
  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
end;

//------------------------------------------------------------------

procedure TFormLitosfera.miFileExitClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------
initialization
//------------------------------------------------------------------
  FormatSettings.DecimalSeparator := '.';

//------------------------------------------------------------------
finalization
//------------------------------------------------------------------
//  return to FormatSettings.DecimalSeparator := ',';

end.
