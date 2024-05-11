unit flLitosfera;

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
  flSolarSystem,
  flStarSystem,
  fGenPlanetsys,
  fAbout,
  fSettings,

  flNewLitosystem;


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
    diskMantle: TGLDisk;
    ffPlanet: TGLFreeForm;
    diskRingUp: TGLDisk;
    miHelpWiki: TMenuItem;
    diskRingDn: TGLDisk;
    miViewHidePanels: TMenuItem;
    miShowHidePlanet: TMenuItem;
    N3: TMenuItem;
    miPlanetSkyDome: TMenuItem;
    StatusBar: TStatusBar;
    miSolarSystem: TMenuItem;
    NightLights1: TMenuItem;
    N4: TMenuItem;
    miPlanetSystem: TMenuItem;
    miSettings: TMenuItem;
    N6: TMenuItem;
    sfCore: TGLSphere;
    ControlBar: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N1: TMenuItem;
    miMonitor: TMenuItem;
    miExosystemCreator: TMenuItem;
    acPlanet: TGLActor;
    N5: TMenuItem;
    miGoogleEarth: TMenuItem;
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
    procedure miHelpWikiClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure miViewHidePanelsClick(Sender: TObject);
    procedure miShowHidePlanetClick(Sender: TObject);
    procedure miPlanetSkyDomeClick(Sender: TObject);
    procedure miSolarSystemClick(Sender: TObject);
    procedure miPlanetSystemClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miExosystemCreatorClick(Sender: TObject);
    procedure miGoogleEarthClick(Sender: TObject);
  public
    ConstLinesAlpha: Single;
    ConstBordersAlpha: Single;
    TimeMultiplier: Single;
    HighResResourcesLoaded: Boolean;// для карт текстур высокого разрешения
    CameraTimeSteps: Single;
    Radius, invAtmosphereHeight: Single;
    eyePos, lightingVector: TGLVector;
    diskNormal, diskRight, diskUp: TGLVector;
    procedure PlanetCore;
  private
    mx, my,
    dmx, dmy: Integer;
    DataDir, StarDir, CurrentStar: TFileName;
    FileName, CatalogName: TFileName;
    procedure LoadConstLines;
    procedure LoadConstBounds;
    // Цвет атмосферы
    function AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
    // Расчёт цвета атмосферы
    function ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
    procedure LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
  end;

var
  FormLitosfera: TFormLitosfera;

const
  cOpacity: Single = 5;
  // более толстая астмосфера выглядит лучше :)
  cAtmosphereRadius: Single = 0.55;
  // берётся чуть меньший радиус для устранения эффекта наложения линий
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
var
  I: Integer;

begin
  DataDir := ExtractFilePath(ParamStr(0)) + 'data\';
  SetCurrentDir(DataDir);
  StarDir := DataDir + 'star';

  // путь к звёздному каталогу Гиппарха или Hyg
  CatalogName := DataDir + '\catalog\hipparcos.stars';
  // более полный каталог звёзд обзора Gaia имеет большой объём
//  CatalogName := DataDir + '\catalog\gaia_dr3.stars';

  // загрузка каталога в скайдом
  if FileExists(CatalogName) then
  begin
    StarSkyDome.Bands.Clear;
    StarSkyDome.Stars.Clear;
    StarSkyDome.Stars.LoadStarsFile(CatalogName);
    StarSkyDome.StructureChanged;
  end;

  // смена текущего директория на нашу звезду sun
  if DirectoryExists('star\sun') then
        ChDir('star\sun');
  CurrentStar := DataDir + '\star\sun\';

  // планетосфера, разрешение текстурирования и наложения карт
  sfPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');

  // планетоглыба
  acPlanet.Material.Texture.Disabled := False;
  acPlanet.Material.Texture.Image.LoadFromFile('deimos.jpg');
  acPlanet.Scale.Scale(0.1);

  // Заполнение индексов узлов дерева планет
  for I := 0 to tvPlanets.Items.Count - 1 do
  begin
//    tvPlanets.Items[I].ImageIndex := I;
//    tvPlanets.Items[I].SelectedIndex := I;
//    tvPlanets.Items[I].StateIndex := I;
  end;
  (**)
  tvPlanets.Select(tvPlanets.Items[3]);  // goto to Earth
  tvPlanets.FullExpand;
  miHelpWiki.Caption := tvPlanets.Selected.Text + ' in ' + 'Wikipedia...';


  TimeMultiplier := Power(1, 3); // 0 - стоп, быстрое вращение - Power(3, 3);
end;

//------------------------------------------------------------------
// Показать или скрыть планету
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


//---------------------------------------------------
// Показать разрез планеты с корой, мантией и ядром
//---------------------------------------------------
procedure TFormLitosfera.PlanetCore;
begin
  if FormSettings.chbPlanetCore.Checked then
  begin
    FileName := CurrentStar + tvPlanets.Selected.Text;
    if FileExists(FileName + '_core.jpg') then
      diskMantle.Material.Texture.Image.LoadFromFile(FileName + '_core.jpg')
    else
      diskMantle.Material.Texture.Image.LoadFromFile(FileName + '.jpg');
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
// Показать или скрыть все панели с контрольными элементами
//------------------------------------------------------------------
procedure TFormLitosfera.miViewHidePanelsClick(Sender: TObject);
begin
  miViewHidePanels.Checked := not miViewHidePanels.Checked;
  if miViewHidePanels.Checked then
  begin
    miViewHidePanels.Caption := 'Показать панели';
    PanelLeft.Visible := False;
    StatusBar.Visible := False;
    ControlBar.Visible := False;
    // Скрыть кайму формы
    FormLitosfera.BorderStyle := bsNone;
  end
  else
  begin
    miViewHidePanels.Caption := 'Скрыть панели';
    PanelLeft.Visible := True;
    StatusBar.Visible := True;
    ControlBar.Visible := True;
    // Показать кайму формы
    FormLitosfera.BorderStyle := bsSizeable;
  end;
end;


//------------------------------------------------------------------
//   Выбор узла дерева tvPlanetsClick
//------------------------------------------------------------------
procedure TFormLitosfera.tvPlanetsClick(Sender: TObject);
begin
  FileName := CurrentStar + tvPlanets.Selected.Text;

//  В случае загрузки текстурной карты из компонента коллекции
//  tvPlanets.Images := dfImages.ImgVirtPlanets;

  // Выбор и загрузка модели сферической планеты planet.3ds
  if tvPlanets.Selected.StateIndex = -1 then
  begin
    sfPlanet.Visible := True;
    sfPlanet.Material.Texture.Image.LoadFromFile(FileName + '.jpg');

    // Aктор модель с поддержкой октодеревьев !
    acPlanet.LoadFromFile(DataDir + 'model\planet.3ds');
    acPlanet.Material.Texture.Image.LoadFromFile(FileName + '.jpg');
    // изменяем масштаб отображения планеты
    end
  else  // StateIndex = 1
  // Выбор и загрузка модели планетоида произвольной формы
  begin
    sfPlanet.Visible := False;

    acPlanet.LoadFromFile(FileName + '.3ds');
    acPlanet.Material.Texture.Image.LoadFromFile(FileName + '.jpg');
    // уменьшение масштаба
    Camera.TagObject := acPlanet;

  end;

 (*
  // Недра планет - planet entrails
  if miInnerCore.Checked then
  begin
    if FileExists(FileName  + '_core.jpg') then
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '_core.jpg')
    else
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '.jpg');
  end;

*)
  // Кольца планет - planet rings
  if (tvPlanets.Selected.Text = 'Saturn') or (tvPlanets.Selected.Text = 'Uranus') then
  begin
    diskRingUp.Material.Texture.Image.LoadFromFile(FileName  + '_ring.png');
    diskRingUp.Visible := True;
    diskRingDn.Material.Texture.Image.LoadFromFile(FileName  + '_ring.png');
    diskRingDn.Visible := True;
  end
  else
  begin
    diskRingUp.Visible := False;
    diskRingDn.Visible := False;
  end;

  miHelpWiki.Caption := tvPlanets.Selected.Text + ' в ' + 'Рувики...';

  // Земная атмосфера
  if (tvPlanets.Selected.Text = 'Earth') then
    DirectOpenGL.Visible := True
  else
    DirectOpenGL.Visible := False;
end;


//----------------------------------------------------------------------

procedure TFormLitosfera.miExosystemCreatorClick(Sender: TObject);
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
// Включение ночных огней городов до рендеринга
//------------------------------------------------------------------
procedure TFormLitosfera.SceneViewerBeforeRender(Sender: TObject);
begin
  LensStar.PreRender(Sender as TGLSceneBuffer);
  // если нет мультитекстурирования и combiner то без света городов
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
// Рендер атмосферы DirectOpenGLRender
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
// Показать линии созвездий
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
// Загрузка линий созвездий из файла
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
// Загрузка границ созвездий из файла
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
// Показать границы созвездий
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
// Прогресс каденсера
//------------------------------------------------------------------
procedure TFormLitosfera.CadencerProgress(Sender: TObject; const deltaTime,
  newTime: Double);
var
  d : Double;
  p : TAffineVector;
begin
  d := GMTDateTimeToJulianDay(Now - 2 + newTime * TimeMultiplier);

  // задание вращения вланеты
  if FormSettings.chbRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + deltaTime * TimeMultiplier;
    ffPlanet.TurnAngle := ffPlanet.TurnAngle + deltaTime * TimeMultiplier;
  end;

  p := ComputePlanetPosition(cSunOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
 /// LSSun.Position.AsAffineVector := p;   //стоп движения солнца

  // создание вращения Луны вокруг себя и вокруг Земли
  // направление вращения можно изменить!
  p := ComputePlanetPosition(cMoonOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
  dcMoon.TurnAngle := dcMoon.TurnAngle + deltaTime * timeMultiplier / 29.5;
  Moon.TurnAngle := 180 - dcMoon.TurnAngle;

  // обработка перемещения камеры
  if (dmy <> 0) or (dmx <> 0) then
  begin
    CameraControler.MoveAroundTarget(ClampValue(dmy * 0.3, -5, 5),
      ClampValue(dmx * 0.3, -5, 5));
    dmx := 0;
    dmy := 0;
  end;
  // это даёт более плавное перемещение камеры
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
end;

//------------------------------------------------------------------
// Присвоение экранных координат при нажатии правой кнопки мышки
//------------------------------------------------------------------
procedure TFormLitosfera.SceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := x;
  my := y;
end;

//-----------------------------------------------------------------
// Изменение экранных координат при перемещении мышки
//-----------------------------------------------------------------
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
// Зум при вращении колеса мышки
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
// Двойной щелчок мыши скрывает панели
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
// Загрузка текстурной карты более высокого разрешения
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
// Обработка нажатия клавиш
//------------------------------------------------------------------
procedure TFormLitosfera.FormKeyPress(Sender: TObject; var Key: Char);

begin
  case Key of
    'e', 'E': // планета
      begin
        Camera.MoveTo(dcStar);
        CameraControler.MoveTo(dcStar);
        Camera.TargetObject := dcStar;
        CameraControler.TargetObject := dcStar;
      end;
    'h':  // высокое разрешение
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
//  Вывод FPS по таймеру
//------------------------------------------------------------------
procedure TFormLitosfera.TimerTimer(Sender: TObject);
begin
//  Caption := Format('Geosfera ' + '%.1f FPS', [SceneViewer.FramesPerSecond]);
  StatusBar.Panels[0].Text:= SceneViewer.FramesPerSecondText(0);
  SceneViewer.ResetPerformanceMonitor;
end;


//------------------------------------------------------------------
// Вся солнечная система с движением планет по орбитам
//------------------------------------------------------------------
procedure TFormLitosfera.miSolarSystemClick(Sender: TObject);
begin
  with TFormSolarSys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormLitosfera.miPlanetSystemClick(Sender: TObject);
begin
  with TFormStarSys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


//------------------------------------------------------------------
// О программе
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
// Очистить дерево просмотра tvPlanets
//------------------------------------------------------------------
procedure TFormLitosfera.miClearTreeViewClick(Sender: TObject);
begin
  tvPlanets.Items.Clear;
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
  begin  // переход к новой звезде Star
    tvPlanets.LoadFromFile(OpenDialog.FileName);
    // tvPlanets.Images := dfImages.ImgVirtPlanets; // не загружаются символы
    CurrentStar := ExtractFilePath(OpenDialog.FileName);
    tvPlanets.Select(tvPlanets.Items[0]);
    tvPlanetsClick(Sender);
  end;
end;

//------------------------------------------------------------------
procedure TFormLitosfera.miSettingsClick(Sender: TObject);
begin
  FormSettings.Show;
end;

//------------------------------------------------------------------
// Сохранение системы как exosystem
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
// Справка в вики
//------------------------------------------------------------------
procedure TFormLitosfera.miHelpWikiClick(Sender: TObject);
var
  S: String;
begin
  // сделать переход с Вики на Рувики
  if (tvPlanets.Selected.Level = 0)   then
    // Планеты или астероиды, иногда S + '_(planet)' like for ../Mercury_(planet)
    S :=  'https://en.wikipedia.org/wiki/' + tvPlanets.Selected.Text
  else
    // Луны
    S :=  'https://en.wikipedia.org/wiki/' + tvPlanets.Selected.Text + '_(moon)';
  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
end;

//------------------------------------------------------------------
// Запуск программы GoogleEarth
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
