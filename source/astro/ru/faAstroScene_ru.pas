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
  GLS.Particles,

  fmFormFirst,
  fmAbout_ru,
  faOptions_ru,
  faConstBorders_ru,
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
    diskPlanetMantle: TGLDisk;
    diskRingUp: TGLDisk;
    miHelpWiki: TMenuItem;
    diskRingDn: TGLDisk;
    N3: TMenuItem;
    StatusBar: TStatusBar;
    miPlanetSystem: TMenuItem;
    N4: TMenuItem;
    miOptions: TMenuItem;
    sfPlanetCore: TGLSphere;
    miTools: TMenuItem;
    N7: TMenuItem;
    LensFlare: TGLLensFlare;
    LightStar: TGLLightSource;
    miAbout: TMenuItem;
    miSettings: TMenuItem;
    PanelRight: TPanel;
    tvAsteroids: TTreeView;
    ControlBarTop: TControlBar;
    ToolBarMain: TToolBar;
    tbNew: TToolButton;
    tbOpen: TToolButton;
    tbSaveAs: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    tbSave: TToolButton;
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
    ToolBarView: TToolBar;
    tbScene: TToolButton;
    tbCore: TToolButton;
    tbMap: TToolButton;
    dcPlanet: TGLDummyCube;
    dcAsteroid: TGLDummyCube;
    dcComet: TGLDummyCube;
    ffMoon: TGLFreeForm;
    sfAsteroid: TGLSphere;
    ffComet: TGLFreeForm;
    miConstAtlas: TMenuItem;
    miConstPolygons: TMenuItem;
    sfPlanetClouds: TGLSphere;
    GLMatLib: TGLMaterialLibrary;
    diskPlanetCrust: TGLDisk;
    dcDebris: TGLDummyCube;
    ffAsteroid: TGLFreeForm;
    ffPlanet: TGLFreeForm;
    diskMoonMantle: TGLDisk;
    diskMoonCrust: TGLDisk;
    sfMoonCore: TGLSphere;
    sfPlanetGrid: TGLSphere;
    sfAsteroidCore: TGLSphere;
    diskAsteroidMantle: TGLDisk;
    diskAsteroidCrust: TGLDisk;
    particlesDebris: TGLParticles;
    tbTable: TToolButton;
    tbGraph: TToolButton;
    tbGrid: TToolButton;
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
    procedure miAboutClick(Sender: TObject);
    procedure ToolButtonPlanetsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvAsteroidsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miPlanetSystemClick(Sender: TObject);
    procedure miConstPolygonsClick(Sender: TObject);
    procedure miMapClick(Sender: TObject);
    procedure miConstAtlasClick(Sender: TObject);
    procedure tbCoreClick(Sender: TObject);
    procedure tbSceneClick(Sender: TObject);
    procedure tbGridClick(Sender: TObject);
  public
    DataDir, StarDir, CurrentStar: TFileName;
    CatalogName: TFileName;
    BodyType: Byte; // t
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
  FileCSV, FileJpg: TFileName;
  vBodyType: Byte = 1; // звёзды 0, планеты 1, луны 2, астероиды 3, кометы 4

const
  cOpacity: Single = 5;
  // толщина атмосферы
  cAtmosphereRadius: Single = 0.55;
  // меньший радиус взят для исключения наложения линий
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

uses
  faStarsys_ru;

{$R *.dfm}

// --------------------------- Главная форма ----------------------------------
procedure TFormAstroScene.FormCreate(Sender: TObject);
begin
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('bin', DataDir), Length(DataDir));
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

  CurrentStar := DataDir + '\starsys\sun\';

  // разрешаем текстурирование
  sfPlanet.Material.Texture.Disabled := False; // сферическая форма
//  ffPlanet.Material.Texture.Disabled := False; // фри форма
//  ffPlanet.Scale.Scale(1); // масштаб фриформ планеты

  // разрешаем текстурирование лун
  sfMoon.Material.Texture.Disabled := False;
//  ffMoon.Material.Texture.Disabled := False;
//  ffMoon.Material.Texture.Image.LoadFromFile('deimos.jpg');
// ffMoon.Scale.Scale(0.5); // масштаб фриформ лун

  // разрешение текстурирования астероидов
  sfAsteroid.Material.Texture.Disabled := False;
// ffAsteroid.Material.Texture.Disabled := False;
// ffAsteroid.Scale.Scale(0.5); // масштаб фриформ астероидов

  // Текстура облаков д.б. загружена в 3й материал GLMatLib
  FileJpg := CurrentStar + 'clouds_rare.jpg';
  if FileExists(FileJpg) then // or clouds_dense
  begin
    GLMatLib.Materials[3].Material.Texture.Compression := tcStandard;
    GLMatLib.Materials[3].Material.Texture.Image.LoadFromFile(FileJpg);
  end;
//  sfGrid.Material.Texture.Image.LoadFromFile('map\unigrid.jpg');
  GLMatLib.Materials[5].Material.Texture.Compression := tcStandard;
//  GLMatLib.Materials[5].Material.Texture.Image.LoadFromFile('map\unigrid.jpg');
end;

//----------------------------------------------------------------------------
//------------------------ Показать форму ------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.FormShow(Sender: TObject);
var
  I: Integer;
  Node: TTreeNode;
  Tl: TStringList;
  S: String;
begin
  tbPlanets.SetFocus;
  // показываем Землю для которой tbnEarth.ImageIndex := 3;
  tbPlanets.Buttons[tbnEarth.ImageIndex].Click;
  // По умолчанию справка - Земля, имя 3-й планеты на кириллице
  miHelpWiki.Caption := tbPlanets.Buttons[3].Hint; // + ' в ' + 'RuWiki...';

  // Луны
  // индексация узлов дерева tvMoons
  for I := 0 to tvMoons.Items.Count - 1 do
  begin
    tvMoons.Items[I].ExpandedImageIndex := I;
  end;

  // Астероиды
  // загрузка имён из файла csv
  FileCSV := CurrentStar + 'sol_asteroids.csv';
  if FileExists(FileCSV) then // or clouds_dense
  begin
    tvAsteroids.Items.BeginUpdate;
    try
      Tl := TStringList.Create;
      tvAsteroids.LoadFromFile(FileCSV);

      for I := 0 to tvAsteroids.Items.Count - 1 do
      begin
        Tl.CommaText := tvAsteroids.Items[I].Text; //sl[i];
        S := Tl[2]; // читаем поле 2 name_ru в стринг
        tvAsteroids.Items[I].Text := S; // новое имя узла
      end;
    finally
      Tl.Free;
    end;
    tvAsteroids.Items[0].Delete; // удаление титульной строки с именами полей
    tvAsteroids.Items.EndUpdate; // обновляем дерево
  end;

  TimeMultiplier := Power(1, 3); // 0 - стоп, ускорение вращения - Power(3, 3);

  // скрываем планеты, луны и астероиды при показе небосвода
  FormOptions.chbHideObjectClick(Self);
  // включаем линии созвездий
  FormOptions.chbConstLinesClick(Self);
end;

//----------------------------------------------------------------------------
//--------------------------- Планета ----------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.ToolButtonPlanetsClick(Sender: TObject);
begin
  tbPlanets.SetFocus;
  vBodyType := 1;
  // видимость планет
  sfPlanet.Visible := True;
  sfPlanetGrid.Visible := False; // нет сетки

  // пока фри форма не видна
  ffPlanet.Visible := False;
  // луны, астероиды и кометы не видны
  dcMoon.Visible := False;
  dcAsteroid.Visible := False;
  dcComet.Visible := False;

  // Загрузка карты планеты
  FileJpg := CurrentStar + TToolButton(Sender).ImageName + '.jpg';
  sfPlanet.Material.Texture.Image.LoadFromFile(FileJpg);
  // Показать атмосферы планет, заменить на case, так как толщина атмосфер разная
  if (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Earth') or
  //   (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Venus') or
  //   (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Jupiter') or
  //   (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Saturn') or
     (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Uranus') or
     (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption = 'Neptune')
  then
  begin
    //  Лёгкие облака
    //  sfClouds.Visible := True;
    DirectOpenGL.Visible := True;
    FormOptions.chbClouds.Checked := True;
  end
  else
  begin
    // Загрузить карту сплошной облочности
    // sfClouds.Visible := False;
    DirectOpenGL.Visible := False;
    FormOptions.chbClouds.Checked := False;
  end;

  // Кольца Сатурна
  if (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint = 'Сатурн') then
  (* or (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint = 'Уран') *)
  begin
    diskRingUp.Material.Texture.Image.LoadFromFile(CurrentStar  + 'saturn_ring.png');
    diskRingUp.Visible := True;
    diskRingDn.Material.Texture.Image.LoadFromFile(CurrentStar  + 'saturn_ring.png');
    diskRingDn.Visible := True;
  end
  else
  begin
    diskRingUp.Visible := False;
    diskRingDn.Visible := False;
  end;

  // Солнце с короной
  if (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint = 'Солнце') then
  begin
    // протуберанцы
  end;

  // Справка + ' в ' + 'RuWiki...';
  miHelpWiki.Caption := tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Hint;
end;

//----------------------------------------------------------------------------
//------------------------------- Луна ---------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.tvMoonsClick(Sender: TObject);
var
  MoonName : String;
begin
  tvMoons.SetFocus;
  FormOptions.chbHideObject.Checked := False;
  vBodyType := 2;
(*
  tvMoons.SetFocus;
  tvMoons.Select(tvMoons.Items[0]);  // по умолчанию Луна
  tvMoons.FullExpand;  // раскрываем все узлы дерева просмотра
*)
  // включаем видимость лун
  dcMoon.Visible := True;
  // планеты, астероиды и кометы не видны
  sfPlanet.Visible := False;
  ffPlanet.Visible := False;
  dcAsteroid.Visible := False;
  dcComet.Visible := False;

  // чтение CSV файла для перевода имени луны на английский язык
  FileCSV := CurrentStar + 'sol_moons.csv';
  // в CSV файле находим английское имя луны и её радиус
  // по полю name_ru и индексу узла дерева просмотра
  MoonName := GetMoonFromCSV(FileCSV,
    tvMoons.Selected.Index, tvMoons.Selected.Text (* sfMoon.Radius *));

  // Находим карту луны по названию на английском языке
  FileJpg := CurrentStar + LowerCase(MoonName) + '.jpg';
  if FileExists(FileJpg, True) then
  begin
  //sfMoon.Radius := Radius; // считывается из csv файла
    sfMoon.Material.Texture.Image.LoadFromFile(FileJpg);  // сфера
    // ffGMoon.LoadFromFile(DataDir + '\model\object.3ds'); // фриформа
    // ffMoon.Material.Texture.Image.LoadFromFile(FileJpg);  // карта
  end
  else
  begin // если нет ни модели, ни карты, то загружаем прототип
    FileJpg := CurrentStar + 'aMoon.jpg';
    sfMoon.Material.Texture.Image.LoadFromFile(FileJpg);
    // ffMoon.LoadFromFile(DataDir + '\model\object.3ds');
    // ffMoon.Material.Texture.Image.LoadFromFile(FileJpg);
  end;

(*
  если карты грузятся из VirtPlanetMaps
  ffMoon.Material.Texture.Image.Assign(dmImages.VirtPlanetMaps.Images.Items[?]);
  Camera.TagObject := ffPlanet;
*)

  // Показать атмосферу Титана
  if tvMoons.Selected.Text = 'Титан' then
    DirectOpenGL.Visible := True
  else
    DirectOpenGL.Visible := False;

  // Имя луны или спутника для веб-справки ruwiki
  // miHelpWiki->Caption = tvMoons->Selected->Text + "_(спутник)";
  miHelpWiki.Caption := tvMoons.Selected.Text + '_(спутник)';
end;

//----------------------------------------------------------------------------
//-------------------------- Aстероид ----------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.tvAsteroidsClick(Sender: TObject);
var
  AsteroidName : String;
begin
  tvAsteroids.SetFocus;
  FormOptions.chbHideObject.Checked := False;

  vBodyType := 3;
  // включение видимости астероидов
  dcAsteroid.Visible := True;
  // остальные планеты, астероиды и кометы не видны
  sfPlanet.Visible := False;
  ffPlanet.Visible := False;
  dcMoon.Visible := False;
  dcComet.Visible := False;

  // чтение CSV файла астероидов для перевода имени на английский язык
  FileCSV := CurrentStar + 'sol_asteroids.csv';
  // в CSV файле находим английское имя астероида и его радиус
  // по полю name_ru и индексу узла дерева просмотра
  AsteroidName := GetMoonFromCSV(FileCSV,
    tvAsteroids.Selected.Index, tvAsteroids.Selected.Text (* sfAsteroids.Radius *));

  // Загружаем карту астероида по названию на английском языке
  FileJpg := CurrentStar + LowerCase(AsteroidName) + '.jpg';
  if FileExists(FileJpg, True) then
  begin
//    sfAsteroid.Radius := Radius; // считывается из csv файла
    sfAsteroid.Material.Texture.Image.LoadFromFile(FileJpg);  // сфера
    // ffAsteroid.LoadFromFile(DataDir + '\model\object.3ds'); // модель
  end
  else
  begin
    FileJpg := CurrentStar + 'aAsteroid.jpg'; // паттерн
    sfAsteroid.Material.Texture.Image.LoadFromFile(FileJpg);
    // ffGlobe.LoadFromFile(DataDir + '\model\object.3ds');
  end;

  // У астероидов показать атмосферу Плутона
  if tvAsteroids.Selected.Text = 'Плутон' then
    DirectOpenGL.Visible := True
  else
    DirectOpenGL.Visible := False;

  miHelpWiki.Caption := tvAsteroids.Selected.Text + '_(астероид)';
end;


//-------------------------- Кнопка Reset ------------------------------------
procedure TFormAstroScene.tbSceneClick(Sender: TObject);
begin
  tbPlanets.Buttons[3].Click; // Buttons[tbnEarth.ImageIndex].Click;
  tbPlanets.SetFocus;
  // показываем Землю для которой tbnEarth.ImageIndex := 3;
  tbPlanets.Buttons[tbnEarth.ImageIndex].Click;
  // По умолчанию справка - Земля, имя 3-й планеты на кириллице
  miHelpWiki.Caption := tbPlanets.Buttons[3].Hint; // + ' в ' + 'RuWiki...';
end;


//-------------------------- Меню справки Wiki -------------------------------
procedure TFormAstroScene.miHelpWikiClick(Sender: TObject);
var
  S: String;

begin
/// Планеты, иногда S + '_(planet)' e.g. ../Mercury_(planet)
/// но некоторые названия звёзд не переводятся, остаются на латинице,
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

  // вращение небесного тела вместе с сеткой и облаками
  if FormOptions.CheckBoxRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + deltaTime * TimeMultiplier;
//    ffPlanet.TurnAngle := ffGlobe.TurnAngle + deltaTime * TimeMultiplier;
    // географическая сетка, вращается вместе с глобусом
    sfPlanetGrid.TurnAngle := sfPlanet.TurnAngle;

    // облака вращаются только у планет с лёгкой облачностью
    if sfPlanetClouds.Visible = True then
      sfPlanetClouds.TurnAngle := sfPlanetClouds.TurnAngle + deltaTime * timeMultiplier + 0.01;

    sfMoon.TurnAngle := sfMoon.TurnAngle + deltaTime * TimeMultiplier;
    ffMoon.TurnAngle := ffMoon.TurnAngle + deltaTime * TimeMultiplier;

    sfAsteroid.TurnAngle := sfAsteroid.TurnAngle + deltaTime * TimeMultiplier;
   end;

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

//----------------- Показать ядро планеты, луны или астероида -----------------
procedure TFormAstroScene.tbCoreClick(Sender: TObject);
begin
  tbCore.Down := not tbCore.Down;
  FormOptions.chbCore.Checked := not FormOptions.chbCore.Checked;
end;

procedure TFormAstroScene.tbGridClick(Sender: TObject);
begin
  tbGrid.Down := not tbGrid.Down;
  FormOptions.chbTopoGrid.Checked := not FormOptions.chbTopoGrid.Checked;
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
          if DirectoryExists(CurrentStar) then
          begin
            LoadHighResTexture(GLMatLib.Materials[0], 'earth_day_4096.jpg');
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
    CurrentStar := ExtractFilePath(OpenDialog.FileName);

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
    CurrentStar := GetCurrentDir();
  end;
end;

//----------------------------------------------------------------------------
//---------------------------- Меню Вид --------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.miPlanetSystemClick(Sender: TObject);
begin
  inherited;
///  frmStarSys.Show;    // иначе FormSolarSys
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

//----------------------------------------------------------------------------
procedure TFormAstroScene.miConstPolygonsClick(Sender: TObject);
begin
  with TfrmSkyPolygons.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;


//------------------------- Меню Опции ----------------------------------------
procedure TFormAstroScene.miOptionsClick(Sender: TObject);
begin
  FormOptions.Show;
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
procedure TFormAstroScene.miAboutClick(Sender: TObject);
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
