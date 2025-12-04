unit fmAstroScene_ru;

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

  fmFormFirst,

  fmSolarsys_ru,
  fmStarsys_ru,
  fmGenStarsys_ru,
  fmSettings_ru,
  fmAbout_ru,

  faOptions_ru,
  faConstells_ru,
  faSkyAreas_ru
  ;


type
  TfrmAstroScene = class(TfrmFirst)
    GLScene: TGLScene;
    SceneViewer: TGLSceneViewer;
    Camera: TGLCamera;
    sfPlanet: TGLSphere;
    DirectOpenGL: TGLDirectOpenGL;
    GLCadencer: TGLCadencer;
    Timer: TTimer;
    Moon: TGLSphere;
    dcStar: TGLDummyCube;
    dcMoon: TGLDummyCube;
    LensStar: TGLLensFlare;
    GLMatLib: TGLMaterialLibrary;
    GLTexCombiner: TGLTexCombineShader;
    CameraControler: TGLCamera;
    StarSkyDome: TGLSkyDome;
    ConstLines: TGLLines;
    ConstBorders: TGLLines;
    MainMenu: TMainMenu;
    miView: TMenuItem;
    miOpen: TMenuItem;
    N2: TMenuItem;
    miFileExit: TMenuItem;
    miFileOpen: TMenuItem;
    miHelp: TMenuItem;
    PanelLeft: TPanel;
    tvMoons: TTreeView;
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
    N1: TMenuItem;
    miMonitor: TMenuItem;
    miGenExosys: TMenuItem;
    acPlanet: TGLActor;
    miTools: TMenuItem;
    N7: TMenuItem;
    LensFlare: TGLLensFlare;
    LightStar: TGLLightSource;
    About1: TMenuItem;
    miSettings: TMenuItem;
    PanelRight: TPanel;
    tvAsteroids: TTreeView;
    ControlBarTop: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    tbPlanets: TToolBar;
    ToolButtonSun: TToolButton;
    ToolButtonMercury: TToolButton;
    ToolButtonVenus: TToolButton;
    ToolButtonEarth: TToolButton;
    ToolButtonMars: TToolButton;
    ToolButtonJupiter: TToolButton;
    ToolButtonSaturn: TToolButton;
    ToolButtonUranus: TToolButton;
    ToolButtonNeptune: TToolButton;
    ToolBar2: TToolBar;
    ToolButton17: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    N5: TMenuItem;
    miConstAtlas: TMenuItem;
    miMoonMap: TMenuItem;
    miSkyAreas: TMenuItem;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SceneViewerBeforeRender(Sender: TObject);
    procedure miFileExitClick(Sender: TObject);
    procedure miViewConstlinesClick(Sender: TObject);
    procedure miViewConstBordersClick(Sender: TObject);
    procedure tvMoonsClick(Sender: TObject);
    procedure miFileOpenClick(Sender: TObject);
    procedure miFileSaveAsClick(Sender: TObject);
    procedure miClearTreeViewClick(Sender: TObject);
    procedure miHelpWikiClick(Sender: TObject);
    procedure miViewHidePanelsClick(Sender: TObject);
    procedure miSolarSystemClick(Sender: TObject);
    procedure miStellarSystemClick(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure miGenExosysClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure ToolButtonPlanetsClick(Sender: TObject);
    procedure miConstAtlasClick(Sender: TObject);
    procedure miSkyAreasClick(Sender: TObject);
  public
    DataDir, StarDir, CurrentStar: TFileName;
    PlanetPath, CatalogName: TFileName;
    ConstLinesAlpha: Single;
    ConstBordersAlpha: Single;
    TimeMultiplier: Single;
    HighResResourcesLoaded: Boolean; // для текстур высокого разрешения
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
  frmAstroScene: TfrmAstroScene;

const
  cOpacity: Single = 5;
  // более толстая атмосфера лучше выглядит
  cAtmosphereRadius: Single = 0.55;
  // небольшой радиус взят чтобы исключить эффект наложения линий друг на друга
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

implementation // =============================================================

{$R *.dfm}

// -------------------- Создание главной формы --------------------------------
procedure TfrmAstroScene.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('bin', DataDir), Length(DataDir)); // if bin dir for exe
  DataDir := IncludeTrailingPathDelimiter(DataDir) + 'data';
  SetCurrentDir(DataDir) ;
  StarDir := DataDir + 'stars';

  // указываем путь к каталогам Hipparcos, Hyg и Gaia DR4
  CatalogName := DataDir + '\catalog\hipparcos.stars';
//  CatalogName := DataDir + '\catalog\hyg.csv';
  if FileExists(CatalogName) then
  begin
    StarSkyDome.Bands.Clear;
    StarSkyDome.Stars.Clear;
    StarSkyDome.Stars.LoadStarsFile(CatalogName);
    StarSkyDome.StructureChanged;
  end;

  // переходим в директорию солнечной системы
  if DirectoryExists('starsys\sun') then
        ChDir('starsys\sun');
  CurrentStar := DataDir + '\starsys\sun\';

  // разрешаем текстурирование планеты
  sfPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');

  // разрешаем текстурирование планетоида
  acPlanet.Material.Texture.Disabled := False;
  acPlanet.Material.Texture.Image.LoadFromFile('deimos.jpg');
  acPlanet.Scale.Scale(0.1);

  // индексируем узлы дерева компонент TreeView
  for I := 0 to tvMoons.Items.Count - 1 do
  begin
//    tvMoons.Items[I].ImageIndex := I;
//    tvMoons.Items[I].SelectedIndex := I;
//    tvMoons.Items[I].StateIndex := I;
    tvMoons.Items[I].ExpandedImageIndex := I;
  end;
  (**)
  tvMoons.Select(tvMoons.Items[0]);  // по умолчанию Луна
  tvMoons.FullExpand;  // раскрываем все узлы дерева просмотра
  miHelpWiki.Caption := tvMoons.Selected.Text + ' in ' + 'Wikipedia...';

  TimeMultiplier := Power(1, 3); // 0 - stop, fast ratation - Power(3, 3);

  ///tvMoons.LoadFromFile(CurrentStar + 'sun_moons.csv');
end;

//------------------  Скрыть или показать панели и тулбары -------------------
procedure TfrmAstroScene.miViewHidePanelsClick(Sender: TObject);
begin
  miViewHidePanels.Checked := not miViewHidePanels.Checked;
  if miViewHidePanels.Checked then
  begin
    miViewHidePanels.Caption := 'Показать панели';
    PanelLeft.Visible := False;
    PanelRight.Visible := False;
    StatusBar.Visible := False;
    ControlBarTop.Visible := False;
    frmAstroScene.BorderStyle := bsNone;
  end
  else
  begin
    miViewHidePanels.Caption := 'Скрыть панели';
    PanelLeft.Visible := True;
    PanelRight.Visible := True;
    StatusBar.Visible := True;
    StatusBar.Align := alBottom;
    ControlBarTop.Visible := True;
    frmAstroScene.BorderStyle := bsSizeable;
  end;
end;

//---------------------------- Выбор планет в тулбаре ------------------------
procedure TfrmAstroScene.ToolButtonPlanetsClick(Sender: TObject);
var
  PlanetName: TFileName;
begin
  PlanetName := CurrentStar + TToolButton(Sender).ImageName;
  sfPlanet.Material.Texture.Image.LoadFromFile(PlanetName + '.jpg');
end;


//------------------ Выбор лун в дереве просмотра  ----------------------------
procedure TfrmAstroScene.tvMoonsClick(Sender: TObject);
begin
  PlanetPath := CurrentStar + tvMoons.Selected.Text;

  //  From LibMaterial or virtualimage collection
///  tvMoons.Images := dmImages.ImgVirtPlanets;

  if tvMoons.Selected.StateIndex = -1 then   // planet.3ds
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
  // Недра планет
  if miInnerCore.Checked then
  begin
    if FileExists(FileName  + '_core.jpg') then
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '_core.jpg')
    else
      PlanetMantle.Material.Texture.Image.LoadFromFile(FileName  + '.jpg');
  end;

*)
  // Кольца планет

  if (tvMoons.Selected.Text = 'Сатурн') or (tvMoons.Selected.Text = 'Уран') then
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

  miHelpWiki.Caption := tvMoons.Selected.Text + 'in Ruwiki';

  // Показать атмосферу
  if tvMoons.Selected.Text = 'Earth' then
    DirectOpenGL.Visible := True
  else
    DirectOpenGL.Visible := False;
end;


//--------------------- Генератор экзопланетной системы -----------------------
procedure TfrmAstroScene.miGenExosysClick(Sender: TObject);
begin
  Timer.Enabled := False;
  GLCadencer.Enabled := False;
(*
  if FileExists(AppPath + 'EarthAbcde.exe') then
    ShellExecute(0, 'open', PChar(AppPath + 'EarthAbcde.exe'), '', '', SW_SHOW);
*)
  with TfrmGenStarsys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;

  Timer.Enabled := True;
  GLCadencer.Enabled := True;
end;


//------------------- Перед рендером включение огней городов -----------------
procedure TfrmAstroScene.SceneViewerBeforeRender(Sender: TObject);
begin
  LensStar.PreRender(Sender as TGLSceneBuffer);
  // если нет мультитекстурирования и combiner то без света городов
  GLMatLib.Materials[0].Shader := GLTexCombiner;
  GLMatLib.Materials[0].Texture2Name := 'earthNight';
end;

//----------------------------- Цвет атмосферы -------------------------------
function TfrmAstroScene.AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
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
    // нормаль диффузного света
    normal := VectorNormalize(atmPoint);
    // интенсивность диффузного света
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

//--------------------- Вычисление цвета атмосферы ----------------------------
function TfrmAstroScene.ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
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

//---------------- Атмосфера DirectOpenGLRender ------------------------------
procedure TfrmAstroScene.DirectOpenGLRender(Sender: TObject; var rci: TGLRenderContextInfo);
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

//------------------- Загрузка линий созвездий --------------------------------
procedure TfrmAstroScene.LoadConstLines;
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

//---------------------- Меню линий созвездий --------------------------------
procedure TfrmAstroScene.miViewConstlinesClick(Sender: TObject);
begin
  ConstLines.Nodes.Clear;
  miViewConstlines.Checked := not miViewConstlines.Checked;
  if miViewConstLines.Checked then
  begin
    ConstLinesAlpha := 0.5 - ConstLinesAlpha;
    LoadConstLines;
  end;
end;

//------------------- Загрузка границ созвездий ------------------------------
procedure TfrmAstroScene.LoadConstBorders;
var
  sl, line: TStrings;
  skypos: TAffineVector;
  i: Integer;
begin
  sl := TStringList.Create;
  line := TStringList.Create;
//  sl.LoadFromFile(DataDir + '\constellation\ConstB.cby');  // GaiaSky
//  sl.LoadFromFile(DataDir + '\constellation\ConstBorders.csv'); // Lutz
  sl.LoadFromFile(DataDir + '\constellation\borders\ant.txt');  // Polygon of Antlia
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i];
    skypos := LonLatToPos(StrToFloatDef(line[0], 0), StrToFloatDef(line[1], 0));
    ConstBorders.AddNode(skypos);
  end;
  sl.Free;
  line.Free;
end;

//---------------------- Меню границ созвездий --------------------------------
procedure TfrmAstroScene.miViewConstBordersClick(Sender: TObject);
begin
  ConstBorders.Nodes.Clear;
  miViewConstBorders.Checked := not miViewConstBorders.Checked;
  if miViewConstborders.Checked then
  begin
    ConstBordersAlpha := 0.5 - ConstBordersAlpha;
    LoadConstBorders;
  end;
 // ConstLines.Nodes.Clear;
end;


//------------------------- Процесс каденсера --------------------------------
procedure TfrmAstroScene.GLCadencerProgress(Sender: TObject; const deltaTime,
  newTime: Double);
var
  d : Double;
  p : TAffineVector;
begin
  d := GMTDateTimeToJulianDay(Now - 2 + newTime * TimeMultiplier);

  p := ComputePlanetPosition(cSunOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
 /// LSSun.Position.AsAffineVector := p;   //стоп движения солнца

  // вращение Луны вокруг себя и Земли
  // направление вращения можно изменить!
  p := ComputePlanetPosition(cMoonOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
  dcMoon.TurnAngle := dcMoon.TurnAngle + deltaTime * timeMultiplier / 29.5;
  Moon.TurnAngle := 180 - dcMoon.TurnAngle;

  // плавное перемещение камеры
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
  if ConstBorders.LineColor.Alpha <> ConstBordersAlpha then
  begin
    ConstBorders.LineColor.Alpha :=
      ClampValue(ConstBorders.LineColor.Alpha + Sign(ConstBordersAlpha -
                 ConstBorders.LineColor.Alpha) * deltaTime, 0, 0.5);
    ConstBorders.Visible := (ConstBorders.LineColor.Alpha > 0);
  end;

  if frmOptions.CheckBoxRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + deltaTime * TimeMultiplier;
    ffPlanet.TurnAngle := ffPlanet.TurnAngle + deltaTime * TimeMultiplier;
  end;
end;

//------------------------ Опускаем мышь -------------------------------------
procedure TfrmAstroScene.SceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := x;
  my := y;
end;

//------------------------ Движение мыши ------------------------------------
procedure TfrmAstroScene.SceneViewerMouseMove(Sender: TObject;
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

//-------------------------- Колесо мыши -------------------------------------
procedure TfrmAstroScene.FormMouseWheel(Sender: TObject; Shift: TShiftState;
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


//------------------------- Двойной клик мыши ---------------------------------
procedure TfrmAstroScene.SceneViewerDblClick(Sender: TObject);
begin
  SceneViewer.OnMouseMove := nil;
  if WindowState = wsMaximized then
  begin
    WindowState := wsNormal;
    PanelLeft.Visible := True;
    PanelRight.Visible := True;
    ControlBarTop.Visible := True;
    BorderStyle := bsSizeable;
  end
  else
  begin
    WindowState := wsMaximized;
    PanelLeft.Visible := False;
    PanelRight.Visible := False;
    ControlBarTop.Visible := False;
    BorderStyle := bsNone;
  end;
  SceneViewer.OnMouseMove := SceneViewerMouseMove;
end;

//--------------------- Загрузка текстуры высокого разрешения -----------------
procedure TfrmAstroScene.LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
begin
  if FileExists(FileName) then
  begin
    LibMat.Material.Texture.Compression := tcStandard;
    LibMat.Material.Texture.Image.LoadFromFile(fileName);
  end;
end;

//-------------------------- Обработка клавиш --------------------------------
procedure TfrmAstroScene.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'e', 'E': // Планета
      begin
        Camera.MoveTo(dcStar);
        CameraControler.MoveTo(dcStar);
        Camera.TargetObject := dcStar;
        CameraControler.TargetObject := dcStar;
      end;
    'h':  // Высокое разрешение
      if not highResResourcesLoaded then
      begin
        SceneViewer.Cursor := crHourGlass;
        try
          if DirectoryExists(CurrentStar) then
          begin
            LoadHighResTexture(GLMatLib.Materials[0], 'earth_4096.jpg');
            LoadHighResTexture(GLMatLib.Materials[1], 'earth_night_4096.jpg');
            LoadHighResTexture(GLMatLib.Materials[2], 'moon.jpg');  //need moon_4096
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

//---------------- Таймер с частотой кадров FPS в статус строке ---------------
procedure TfrmAstroScene.TimerTimer(Sender: TObject);
begin
//Caption := Format('Terrasfera ' + '%.1f FPS', [SceneViewer.FramesPerSecond]);
  StatusBar.Panels[0].Text:= SceneViewer.FramesPerSecondText(0); // FPS
  SceneViewer.ResetPerformanceMonitor;
end;


//-------------------------- Солнечная система -------------------------------
procedure TfrmAstroScene.miSolarSystemClick(Sender: TObject);
begin
  with TFormSolarsys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// ------------------ Экзопланетная система звезды ===-------------------------
procedure TfrmAstroScene.miStellarSystemClick(Sender: TObject);
begin
  with TFormStarsys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//-------------------------- Очистить дерево просмотра -------------------------
procedure TfrmAstroScene.miClearTreeViewClick(Sender: TObject);
begin
  tvMoons.Items.Clear;
end;

//---------------------- Открыть файл экзопланетной системы -----------------
procedure TfrmAstroScene.miFileOpenClick(Sender: TObject);
var
  I, J: Integer;
begin
  OpenDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
  OpenDialog.InitialDir := StarDir;
  OpenDialog.DefaultExt := '*.star';
  if OpenDialog.Execute then
  begin  // new star
    tvMoons.LoadFromFile(OpenDialog.FileName, TEncoding.UTF8);
    // tvMoons.Images := dfImages.ImgVirtPlanets; // не загружаются символы
    CurrentStar := ExtractFilePath(OpenDialog.FileName);

    // Assigning indices
    for I := 0 to tvMoons.Items.Count - 1 do
    begin
      tvMoons.Items[I].ImageIndex := I; // and may be .Item[J] ?
      tvMoons.Items[I].SelectedIndex := I;
      tvMoons.Items[I].StateIndex := -1;
    end;
    (**)
    tvMoons.Select(tvMoons.Items[0]);
    tvMoonsClick(Sender);
  end;
end;

//-------------------- Меню FileSaveAs экзопланетной системы ------------------
procedure TfrmAstroScene.miFileSaveAsClick(Sender: TObject);
begin
  SaveDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
  SaveDialog.InitialDir := StarDir;
  SaveDialog.DefaultExt := '*.star';
  if SaveDialog.Execute then
  begin
    tvMoons.SaveToFile(SaveDialog.FileName);
    CurrentStar := GetCurrentDir();
  end;
end;

//------------------------- Показать опции ------------------------------------
procedure TfrmAstroScene.miOptionsClick(Sender: TObject);
begin
  frmOptions.Show;
end;

//------------------------ Показать настройки --------------------------------
procedure TfrmAstroScene.miSettingsClick(Sender: TObject);
begin
  frmSettings.Show;
end;

procedure TfrmAstroScene.miSkyAreasClick(Sender: TObject);
begin
  with TFormSkyAreas.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//------------------------ Атлас созвездий -----------------------------------
procedure TfrmAstroScene.miConstAtlasClick(Sender: TObject);
begin
  with TFormConstells.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------- О программе -----------------------------------------
procedure TfrmAstroScene.About1Click(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//-------------------------- Справка в Wiki ----------------------------------
procedure TfrmAstroScene.miHelpWikiClick(Sender: TObject);
var
  S: String;
begin
/// Планеты, иногда S + '_(planet)' e.g. ../Mercury_(planet)
/// tvMoons.Selected.Text надо перевести на русский язык для ruwiki
/// но, однако, некоторые названия звёзд остаются на латинице,
/// например, https://ru.ruwiki.ru/wiki/GJ_1002. Что делать?
/// S :=  'https://ru.ruwiki.ru/wiki/' + tvMoons.Selected.Text + _('Earth')
  if (tvMoons.Selected.Level = 0)   then
  begin
(*
    if ActiveLang = LANG_RUSSIAN then
      S :=  'https://ru.ruwiki.ru/wiki/Земля'
    else
*)
//      S :=  'https://en.wikipedia.org/wiki/Earth';
      S :=  'https://en.wikipedia.org/wiki/' + tvMoons.Selected.Text;
  end
  else  // Moons
  begin
    S :=  'https://en.wikipedia.org/wiki/' + tvMoons.Selected.Text + '_(moon)';
/// S :=  'https://ru.ruwiki.ru/wiki/' + tvMoons.Selected.Text;
  end;
//  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
end;


//------------------------------------------------------------------

procedure TfrmAstroScene.miFileExitClick(Sender: TObject);
begin
  Close;
end;

initialization //==============================================================

  FormatSettings.DecimalSeparator := '.';

finalization

end.
