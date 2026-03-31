(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit faAstroScene_ru;

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
  Stage.Keyboard,
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

  fmSettings_ru,
  fmAbout_ru,

  fmFormFirst,
  faOptions_ru,
  faSkyPolygons_ru,
  faConstAtlas_ru,

  Astro.ReadCSV
  ;


type
  TFormAstroScene = class(TFormFirst)
    GLScene: TGLScene;
    SceneViewer: TGLSceneViewer;
    Camera: TGLCamera;
    sfPlanet: TGLSphere;
    DirectOpenGL: TGLDirectOpenGL;
    GLCadencer: TGLCadencer;
    Timer: TTimer;
    sfMoon: TGLSphere;
    dcStar: TGLDummyCube;
    dcMoon: TGLDummyCube;
    LensStar: TGLLensFlare;
    GLTexCombiner: TGLTexCombineShader;
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
    PanelLeft: TPanel;
    tvMoons: TTreeView;
    miClearTreeView: TMenuItem;
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
    miPlanetSystem: TMenuItem;
    N4: TMenuItem;
    miOptions: TMenuItem;
    sfCore: TGLSphere;
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
    tbnSol: TToolButton;
    tbnMercury: TToolButton;
    tbnVenus: TToolButton;
    tbnEarth: TToolButton;
    tbnMars: TToolButton;
    tbnJupiter: TToolButton;
    tbnSaturn: TToolButton;
    tbnUranus: TToolButton;
    tbnNeptune: TToolButton;
    ToolBar2: TToolBar;
    ToolButtonReset: TToolButton;
    ToolButton19: TToolButton;
    ToolButton21: TToolButton;
    dcPlanet: TGLDummyCube;
    dcAsteroid: TGLDummyCube;
    dcComet: TGLDummyCube;
    ffMoon: TGLFreeForm;
    ffAsteroid: TGLFreeForm;
    sfAsteroid: TGLSphere;
    sfComet: TGLSphere;
    ffComet: TGLFreeForm;
    miConstAtlas: TMenuItem;
    miConstPolygons: TMenuItem;
    sfClouds: TGLSphere;
    dcClouds: TGLDummyCube;
    GLMatLib: TGLMaterialLibrary;
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
    procedure tvMoonsClick(Sender: TObject);
    procedure miFileOpenClick(Sender: TObject);
    procedure miFileSaveAsClick(Sender: TObject);
    procedure miClearTreeViewClick(Sender: TObject);
    procedure miHelpWikiClick(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure ToolButtonPlanetsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvAsteroidsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miPlanetSystemClick(Sender: TObject);
    procedure miConstPolygonsClick(Sender: TObject);
    procedure miMapClick(Sender: TObject);
    procedure miConstAtlasClick(Sender: TObject);
  public
    DataDir, StarDir, CurrentStellar: TFileName;
    CatalogName: TFileName;
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
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  private
    mx, my,
    dmx, dmy: Integer;
    function AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
    function ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
    procedure LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
  end;

var
  FormAstroScene: TFormAstroScene;

const
  cOpacity: Single = 5;
  // более толстая атмосфера чем в действительности
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


uses faStellarSys_ru;
{$R *.dfm}

// --------------------------- Главная форма ----------------------------------
procedure TFormAstroScene.FormCreate(Sender: TObject);
begin
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('bin', DataDir), Length(DataDir)); // if bin dir for exe
  DataDir := IncludeTrailingPathDelimiter(DataDir) + 'data';
  SetCurrentDir(DataDir) ;
  StarDir := DataDir + '\starsys';

  // путь к каталогам
  CatalogName := DataDir + '\catalog\hipparcos.stars';
// д.б.  CatalogName := DataDir + '\catalog\hyg.csv';
  if FileExists(CatalogName) then
  begin
    SkyDome.Bands.Clear;
    SkyDome.Stars.Clear;
    SkyDome.Stars.LoadStarsFile(CatalogName);
    SkyDome.StructureChanged;
  end;

  // переход по умолчанию в директорию солнечной системы
  if DirectoryExists('starsys\sun') then
        ChDir('starsys\sun');
  CurrentStellar := DataDir + '\starsys\sun\';

  // разрешенo текстурирования планет
  sfPlanet.Material.Texture.Disabled := False;
  ffPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');
//  ffPlanet.Scale.Scale(1); // масштаб фриформ планет

  // разрешенo текстурирование лун
  sfMoon.Material.Texture.Disabled := False;
  ffMoon.Material.Texture.Disabled := False;
  ffMoon.Material.Texture.Image.LoadFromFile('deimos.jpg');
// ffMoon.Scale.Scale(0.5); // масштаб фриформ лун

  // разрешенo текстурирования астероидов
  sfAsteroid.Material.Texture.Disabled := False;
  ffAsteroid.Material.Texture.Disabled := False;
// ffAsteroid.Scale.Scale(0.5); // масштаб фриформ астероидов

  // разрешенo текстурирования комет
  sfComet.Material.Texture.Disabled := False;
  ffComet.Material.Texture.Disabled := False;

  // Текстура облаков д.б. загружена в MatLib
  if FileExists(CurrentStellar + 'earth_clouds_360.jpg') then
  begin
    GLMatLib.Materials[3].Material.Texture.Compression := tcStandard;
    GLMatLib.Materials[3].Material.Texture.Image.LoadFromFile(CurrentStellar + 'earth_clouds_360.jpg');
  end
  else
  begin
    sfClouds.Visible := False;
  end;


end;

//----------------------------------------------------------------------------
//--------------------------- Шоу --------------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.FormShow(Sender: TObject);
var
  I: Integer;

begin
  tbPlanets.SetFocus;
  tbnEarth.ImageIndex := 3;
  tbPlanets.Buttons[tbnEarth.ImageIndex].Click;

  // Справка - показываем Землю, имя 3-й планеты на кириллице
  miHelpWiki.Caption := tbPlanets.Buttons[3].Hint; // + ' в ' + 'RuWiki...';

  // Луны cмена фокуса
(*
  tvMoons.SetFocus;
  tvMoons.Select(tvMoons.Items[0]);  // по умолчанию Луна
  tvMoons.FullExpand;  // раскрываем все узлы дерева просмотра
  TimeMultiplier := Power(1, 3); // 0 - stop, fast ratation - Power(3, 3);
  tvMoonsClick(Self);
  miHelpWiki.Caption := tvMoons.Selected.Text; // + ' in ' + 'RuWiki...';
*)
  // индексируем узлы дерева компонент TreeView
  for I := 0 to tvMoons.Items.Count - 1 do
  begin
//    tvMoons.Items[I].ImageIndex := I;
//    tvMoons.Items[I].SelectedIndex := I;
//    tvMoons.Items[I].StateIndex := I;
    tvMoons.Items[I].ExpandedImageIndex := I;
  end;
  (**)

  //  Астероиды
  //  Открыть файл sol_asteroids.csv и загрузить в tvAsteroids
  //  tvAsteroids.SetFocus;
  //  tvAsteroids.Select(tvAsteroids.Items[0]); // show Pluto by default
  TimeMultiplier := Power(1, 3); // 0 - стоп, ускорение вращения - Power(3, 3);
end;

//----------------------------------------------------------------------------
//--------------------------- Планеты   --------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.ToolButtonPlanetsClick(Sender: TObject);
var
  PlanetName: TFileName;

begin
  // видимость планет
  sfPlanet.Visible := True;
  ffPlanet.Visible := False;
  // луны, астероиды и кометы не видны
  dcMoon.Visible := False;
  dcAsteroid.Visible := False;
  dcComet.Visible := False;

  PlanetName := CurrentStellar + TToolButton(Sender).ImageName;
  sfPlanet.Material.Texture.Image.LoadFromFile(PlanetName + '.jpg');

  // Показать атмосферы планет, заменить на case, толщина атмосфер разная
  if (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Earth') or
     (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Venus') or
     (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Jupiter') or
     (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Saturn') or
     (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Uranus') or
     (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Neptune')
  then
    DirectOpenGL.Visible := True
  else
    DirectOpenGL.Visible := False;
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
  // Кольца Сатурна
  if (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint = 'Сатурн') then
  (* or (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint = 'Уран') *)
  begin
    diskRingUp.Material.Texture.Image.LoadFromFile(CurrentStellar  + 'saturn_ring.png');
    diskRingUp.Visible := True;
    diskRingDn.Material.Texture.Image.LoadFromFile(CurrentStellar  + 'saturn_ring.png');
    diskRingDn.Visible := True;
  end
  else
  begin
    diskRingUp.Visible := False;
    diskRingDn.Visible := False;
  end;

  if (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint = 'Солнце') then
  begin
    // корона с протуберанцами
  end;

  // Справка + ' в ' + 'RuWiki...';
  miHelpWiki.Caption := tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint;
end;

//----------------------------------------------------------------------------
//----------------------------- Луны -----------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.tvMoonsClick(Sender: TObject);
var
  Moon: string;
  MoonFile, FileCSV, FileJpg: TFileName;
  NLine: Integer;

begin
  // включаем видимость лун
  dcMoon.Visible := True;
  // планеты, астероиды и кометы не видны
  sfPlanet.Visible := False;
  ffPlanet.Visible := False;

  dcAsteroid.Visible := False;
  dcComet.Visible := False;

  // чтение CSV файла трансляции и загрузки карты луны
  FileCSV := CurrentStellar + 'sol_moons.csv';
  Moon := tvMoons.Selected.Text;  // находим имя луны в поле name_ru

  // передача индекса узла дерева просмотра в CSV
  NLine := tvMoons.Selected.Index;
  MoonFile := GetMoonFromCSV(FileCSV, NLine, Moon (*Radous*));
  FileJpg := CurrentStellar + LowerCase(MoonFile) + '.jpg';
  if FileExists(FileJpg, True) then
  begin
//    sfMoon.Radius := Radius; // считывается из csv файла
    sfMoon.Material.Texture.Image.LoadFromFile(FileJpg);  // сфера
    ffMoon.Material.Texture.Image.LoadFromFile(FileJpg);  // фриформа
    // ffMoon.LoadFromFile(DataDir + '\model\object.3ds'); // модель
  end
  else
  begin
    sfMoon.Radius := 0.3; // Radius;
    FileJpg := CurrentStellar + 'aMoon.jpg';
    sfMoon.Material.Texture.Image.LoadFromFile(FileJpg);
    ffMoon.Material.Texture.Image.LoadFromFile(FileJpg);
    // ffMoon.LoadFromFile(DataDir + '\model\object.3ds');
  end;

(*
  если карты из VirtPlanetMaps
  ffMoon.Material.Texture.Image.Assign(dmImages.VirtPlanetMaps.Images.Items[?]);
  Camera.TagObject := ffPlanet;
*)

  // Показать атмосферу Титана
  if tvMoons.Selected.Text = 'Титан' then
  begin
    sfMoon.Radius := 0.5;
    DirectOpenGL.Visible := True
  end
  else
  begin
    sfMoon.Radius := 0.3;
    DirectOpenGL.Visible := False;
  end;

  // Имя луны или спутника для веб-справки ruwiki
  // miHelpWiki->Caption = tvMoons->Selected->Text + "_(спутник)";
  miHelpWiki.Caption := tvMoons.Selected.Text + '_(спутник)';
end;

//----------------------------------------------------------------------------
//------------------------------ Астероиды -----------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.tvAsteroidsClick(Sender: TObject);
begin
  // видимости пока нет, отладка sol_asteroids.csv
(*
  dcAsteroid.Visible := True;
  dcMoon.Visible := False;
  dcPlanet.Visible := False;
*)
///  AsteroidPath := CurrentStar + tvAsteroids.Selected.Text;

  // Название астероида для веб-справки ruwiki
  // miHelpWiki->Caption = tvAsteroids->Selected->Text + "_(астероид)";
  miHelpWiki.Caption := tvAsteroids.Selected.Text + '_(астероид)';
end;


//-------------------------- Меню справки Wiki -------------------------------
procedure TFormAstroScene.miHelpWikiClick(Sender: TObject);
var
  S: String;

begin
/// Планеты, иногда S + '_(planet)' e.g. ../Mercury_(planet)
/// но, однако, некоторые названия звёзд остаются на латинице,
/// например, https://ru.ruwiki.ru/wiki/GJ_1002. Что делать?
/// S :=  'https://ru.ruwiki.ru/wiki/' + tvMoons.Selected.Text + _('Earth')
  S :=  'https://ru.ruwiki.ru/wiki/' + miHelpWiki.Caption;
  ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
end;

//------------------- Перед рендером включение огней городов -----------------
procedure TFormAstroScene.SceneViewerBeforeRender(Sender: TObject);
begin
  LensStar.PreRender(Sender as TGLSceneBuffer);
  // если нет мультитекстурирования и combiner то без света городов
  GLMatLib.Materials[0].Shader := GLTexCombiner;
  GLMatLib.Materials[0].Texture2Name := 'earthNight';
end;

//----------------------------- Цвет атмосферы -------------------------------
function TFormAstroScene.AtmosphereColor(const rayStart, rayEnd: TGLVector): TGLColorVector;
var
  i, n: Integer;
  atmPoint, normal: TGLVector;
  altColor: TGLColorVector;
  alt, RayLength, Contrib, Decay, Intensity, invN: Single;

begin
  Result := clrTransparent;
  RayLength := VectorDistance(RayStart, RayEnd);
  n := Round(3 * RayLength * invAtmosphereHeight) + 2;
  if (n > 10) then
    n := 10;
  invN := cIntDivTable[n]; // 1/n;
  contrib := rayLength * invN * cOpacity;
  Decay := 1 - contrib * 0.5;
  Contrib := contrib * (1 / 1.1);
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
function TFormAstroScene.ComputeColor(var rayDest: TGLVector; mayHitGround: Boolean): TGLColorVector;
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
procedure TFormAstroScene.LoadConstLines;
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

(*
procedure TFormLithoneta.miViewConstlinesClick(Sender: TObject);
begin
  ConstLines.Nodes.Clear;
  miViewConstlines.Checked := not miViewConstlines.Checked;
  if miViewConstLines.Checked then
  begin
    ConstLinesAlpha := 0.5 - ConstLinesAlpha;
    LoadConstLines;
  end;
end;
*)

//------------------- Загрузка границ созвездий ------------------------------
procedure TFormAstroScene.LoadConstBorders;
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

//------------------------- Прогресс каденсера --------------------------------
procedure TFormAstroScene.GLCadencerProgress(Sender: TObject; const deltaTime,
  newTime: Double);
var
  S: String;
  d: Double;
  p: TAffineVector;
begin
  d := GMTDateTimeToJulianDay(Now - 2 + newTime * TimeMultiplier);

  p := ComputePlanetPosition(cSunOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));
 /// LSSun.Position.AsAffineVector := p; //остановка движения Солнца

  // вращение Луны вокруг себя и Земли, направление вращения можно менять
  p := ComputePlanetPosition(cMoonOrbitalElements, d);
  ScaleVector(p, 0.5 * cAUToKilometers * (1 / cEarthRadius));

  (*
  dcMoon.TurnAngle := dcMoon.TurnAngle + deltaTime * timeMultiplier / 29.5;
  sfMoon.TurnAngle := 180 - dcMoon.TurnAngle;
  *)

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

  // вращение небесных тел для демонстрации
  if FormOptions.CheckBoxRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + deltaTime * TimeMultiplier;
    ffPlanet.TurnAngle := ffPlanet.TurnAngle + deltaTime * TimeMultiplier;

    sfMoon.TurnAngle := sfMoon.TurnAngle + deltaTime * TimeMultiplier;
    ffMoon.TurnAngle := ffMoon.TurnAngle + deltaTime * TimeMultiplier;

    sfAsteroid.TurnAngle := sfAsteroid.TurnAngle + deltaTime * TimeMultiplier;
    ffAsteroid.TurnAngle := ffAsteroid.TurnAngle + deltaTime * TimeMultiplier;

  end;
end;

//------------------------ Опускаем курсор мыши ------------------------------
procedure TFormAstroScene.SceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := x;
  my := y;
end;

//------------------------ Движение мыши -------------------------------------
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

//--------------------- Загрузка текстуры высокого разрешения -----------------
procedure TFormAstroScene.LoadHighResTexture(LibMat: TGLLibMaterial; const FileName: string);
begin
  if FileExists(FileName) then
  begin
    LibMat.Material.Texture.Compression := tcStandard;
    LibMat.Material.Texture.Image.LoadFromFile(fileName);
  end;
end;

//------------------------ Обработка нажатия клавиш ---------------------------
procedure TFormAstroScene.FormKeyPress(Sender: TObject; var Key: Char);
var
  S: String;
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
          if DirectoryExists(CurrentStellar) then
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
    'w','W','ц','Ц': // Выход на WIKI по клавише
      begin
         S :=  'https://ru.ruwiki.ru/wiki/' + miHelpWiki.Caption;
         ShellExecute(0, 'open', PWideChar(S), '', '', SW_SHOW);
      end;
    '0'..'9': timeMultiplier := Power(Integer(Key) - Integer('0'), 3);
    #27: Close;
  end;
end;

//-------------------------- Колесо мыши -------------------------------------
procedure TFormAstroScene.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  F: Single;
begin
  if (WheelDelta > 0) or (CameraControler.Position.VectorLength > 0.90) then
  begin
    F := Power(1.05, WheelDelta * (1 / 120));
    CameraControler.AdjustDistanceToTarget(F);
  end;
  Handled := True;
end;

//------------------------- Двойной клик мыши ---------------------------------
procedure TFormAstroScene.SceneViewerDblClick(Sender: TObject);
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

//---------------- Таймер с частотой кадров FPS в статус строке ---------------
procedure TFormAstroScene.TimerTimer(Sender: TObject);
begin
//Caption := Format('Terrasfera ' + '%.1f FPS', [SceneViewer.FramesPerSecond]);
  StatusBar.Panels[0].Text:= SceneViewer.FramesPerSecondText(0);
  SceneViewer.ResetPerformanceMonitor;
end;


//-------------------------- Очистить дерево просмотра -------------------------
procedure TFormAstroScene.miClearTreeViewClick(Sender: TObject);
begin
  tvMoons.Items.Clear;
end;

//---------------------- Открыть файл планетной системы -----------------
procedure TFormAstroScene.miFileOpenClick(Sender: TObject);
var
  I, J: Integer;
begin
  OpenDialog.Filter := '(*.star)|*.star';
  OpenDialog.InitialDir := StarDir;
  OpenDialog.DefaultExt := '*.star';
  if OpenDialog.Execute then
  begin  // новая звезда
    tvMoons.LoadFromFile(OpenDialog.FileName, TEncoding.UTF8);
    // tvMoons.Images := dfImages.ImgVirtPlanets; // не загружаются символы
    CurrentStellar := ExtractFilePath(OpenDialog.FileName);

    // Присвоение индексов
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
procedure TFormAstroScene.miFileSaveAsClick(Sender: TObject);
begin
  SaveDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
  SaveDialog.InitialDir := StarDir;
  SaveDialog.DefaultExt := '*.star';
  if SaveDialog.Execute then
  begin
    tvMoons.SaveToFile(SaveDialog.FileName);
    CurrentStellar := GetCurrentDir();
  end;
end;

//----------------------------------------------------------------------------
//---------------------------- Вид -------------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.miPlanetSystemClick(Sender: TObject);
begin
  inherited;
///  frmStellarSys.Show;    // иначе FormSolarSys
  with TfrmStellarSys.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//--------------------------------------------------------------------------- -

procedure TFormAstroScene.miMapClick(Sender: TObject);
begin
  inherited;
//
end;

//----------------------------------------------------------------------------

procedure TFormAstroScene.miConstAtlasClick(Sender: TObject);
begin
  with TfrmConstAtlas.Create(Self) do
  try
    ShowModal
  finally
    Free
  end;
end;

procedure TFormAstroScene.miConstPolygonsClick(Sender: TObject);
begin
  with TfrmSkyPolygons.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;


//------------------------- Показать опции ------------------------------------
procedure TFormAstroScene.miOptionsClick(Sender: TObject);
begin
  FormOptions.Show;
end;

//------------------------ Показать настройки --------------------------------
procedure TFormAstroScene.miSettingsClick(Sender: TObject);
begin
  FormSettings.Show;
end;

//------------------------- ReadIniFile ---------------------------------------
procedure TFormAstroScene.ReadIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    // ToolBar Planets
    // ...
///  tvMoons. ? Selected.Index := IniFile.ReadInteger(frmAstroScene.Name, tvMoons.Name, 4);
  finally
    IniFile.Free;
  end;
end;

//------------------------- WriteIniFile --------------------------------------
procedure TFormAstroScene.WriteIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    // ToolBar Planets
    // ...
    // tvMoons
    IniFile.WriteInteger(FormAstroScene.Name, tvMoons.Name, tvMoons.Selected.Index);
    // tvAsteroids
    IniFile.WriteInteger(FormAstroScene.Name, tvAsteroids.Name, tvAsteroids.Selected.Index);
  finally
    IniFile.Free;
  end;
end;


//----------------------- О программе -----------------------------------------
procedure TFormAstroScene.About1Click(Sender: TObject);
begin
  with TfrmAbout.Create(Self) do
  try
    PageControl.ActivePageIndex := 0;
    ShowModal;
  finally
    Free;
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormAstroScene.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  WriteIniFile;   // запись установок в ini файл
end;


//-----------------------------------------------------------------------------
procedure TFormAstroScene.miFileExitClick(Sender: TObject);
begin
  Close;
end;

initialization //==============================================================

  FormatSettings.DecimalSeparator := '.';

finalization

end.
