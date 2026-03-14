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

  fmFormFirst,
  fmSettings_ru,
  fmAbout_ru,


  faMakeStarsys_ru,
  faOptions_ru,
  faConstells_ru,
  faSkyPolygons_ru,

  faSolarSys_ru,
  faStarSys_ru,
  faNewSolblock_ru,
  faViewSolblock_ru,

  Astro.ReadCSV
  ;


type
  TFormAstroScene = class(TFormFirst)
    GLScene: TGLScene;
    Camera: TGLCamera;
    sfPlanet: TGLSphere;
    DirectOpenGL: TGLDirectOpenGL;
    sfMoon: TGLSphere;
    dcStar: TGLDummyCube;
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
    N3: TMenuItem;
    StatusBar: TStatusBar;
    miSolarSystem: TMenuItem;
    N4: TMenuItem;
    miToolsOptions: TMenuItem;
    N6: TMenuItem;
    sfCore: TGLSphere;
    miMakeStarsys: TMenuItem;
    miTools: TMenuItem;
    N7: TMenuItem;
    LensFlare: TGLLensFlare;
    LightStar: TGLLightSource;
    miHelpAbout: TMenuItem;
    miSettings: TMenuItem;
    ControlBarTop: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolBar2: TToolBar;
    ToolButtonReset: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    N5: TMenuItem;
    miConstAtlas: TMenuItem;
    miSkyPolygons: TMenuItem;
    dcPlanet: TGLDummyCube;
    dcAsteroid: TGLDummyCube;
    dcComet: TGLDummyCube;
    ffMoon: TGLFreeForm;
    ffAsteroid: TGLFreeForm;
    sfAsteroid: TGLSphere;
    sfComet: TGLSphere;
    ffComet: TGLFreeForm;
    Timer1: TTimer;
    miStarSys: TMenuItem;
    PanelLeft: TPanel;
    tvStellars: TTreeView;
    miSolblock: TMenuItem;
    N1: TMenuItem;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DirectOpenGLRender(Sender: TObject; var rci: TGLRenderContextInfo);
    procedure GLCadencerProgress(Sender: TObject; const deltaTime, newTime: Double);
    procedure SceneViewerMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SceneViewerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure SceneViewerBeforeRender(Sender: TObject);
    procedure miFileExitClick(Sender: TObject);
    procedure miViewConstlinesClick(Sender: TObject);
    procedure miViewConstBordersClick(Sender: TObject);
    procedure miHelpWikiClick(Sender: TObject);
    procedure miSolarSystemClick(Sender: TObject);
    procedure miToolsOptionsClick(Sender: TObject);
    procedure miMakeStarsysClick(Sender: TObject);
    procedure miHelpAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miConstAtlasClick(Sender: TObject);
    procedure miSkyPolygonsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure miStarSysClick(Sender: TObject);
    procedure miSolblockClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  public
    DataDir, StarDir, CurrentStar: TFileName;
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
  end;

var
  FormAstroScene: TFormAstroScene;

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

// --------------------------- Главная форма ----------------------------------
procedure TFormAstroScene.FormCreate(Sender: TObject);
begin
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('bin', DataDir), Length(DataDir)); // if bin dir for exe
  DataDir := IncludeTrailingPathDelimiter(DataDir) + 'data';
  SetCurrentDir(DataDir) ;
  StarDir := DataDir + '\' + 'starsys';

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
  CurrentStar := DataDir + '\starsys\sun\';

  // разрешенo текстурирования планет
  sfPlanet.Material.Texture.Disabled := False;
  ffPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');
//  ffPlanet.Scale.Scale(1); // масштаб фриформ планет

  // разрешенo текстурирования лун
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

end;

//----------------------------------------------------------------------------
//--------------------------- Шоу --------------------------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.FormShow(Sender: TObject);

begin
//  На главной форме - Солнечная система, загружаются звёздные системы с планетами
  FormStarSys.Parent := FormAstroScene;
  FormStarSys.Align := alClient;
  FormStarSys.BorderStyle := bsNone;
  FormStarSys.Show;

  //  miHelpWiki.Caption := miItem.Text + ' in ' + 'Ruwili...';
  TimeMultiplier := Power(1, 3); // 0 - стоп, ускорение вращения - Power(3, 3);
end;

//----------------------------------------------------------------------------
//--------------------------- Меню файл --------------------------------------
//----------------------------------------------------------------------------

//------------------------ Новый соларблок -----------------------------------
procedure TFormAstroScene.N1Click(Sender: TObject);
begin
  inherited;
  with TfrmNewSolblock.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//----------------------------------------------------------------------------
procedure TFormAstroScene.miSolblockClick(Sender: TObject);
begin
  inherited;
  with TfrmViewSolblock.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;

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

//----------------------------------------------------------------------------
//--------------------- Конструктор планетных систем -------------------------
//----------------------------------------------------------------------------
procedure TFormAstroScene.miMakeStarsysClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  with TfrmMakeStarsys.Create(Self) do
    try
      GLCadencerA.Enabled := False;
      ShowModal;
    finally
      GLCadencerA.Enabled := True;
      Free;
    end;
  Timer1.Enabled := True;
end;

//------------------- Перед рендером включение огней городов -----------------
procedure TFormAstroScene.SceneViewerBeforeRender(Sender: TObject);
begin
  LensStar.PreRender(Sender as TGLSceneBuffer);
  // если нет мультитекстурирования и combiner то без света городов
///  GLMatLib.Materials[0].Shader := GLTexCombiner;
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

//---------------------- Меню линий созвездий --------------------------------
procedure TFormAstroScene.miViewConstlinesClick(Sender: TObject);
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

//---------------------- Меню границ созвездий --------------------------------
procedure TFormAstroScene.miViewConstBordersClick(Sender: TObject);
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

//------------------------ Опускаем мышь -------------------------------------
procedure TFormAstroScene.SceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := x;
  my := y;
end;

//------------------------ Движение мыши ------------------------------------
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


procedure TFormAstroScene.Timer1Timer(Sender: TObject);
begin
  inherited;
  ///
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



//-------------------------- Звёздная система ---------------------------------
procedure TFormAstroScene.miSolarSystemClick(Sender: TObject);
begin
  FormStarSys.Show;    // ошибка если FormSolarSys ?
(*
  with TfrmStarSys.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
*)
end;


procedure TFormAstroScene.miStarSysClick(Sender: TObject);
begin
  inherited;
  //
end;

//------------------------- Показать опции ------------------------------------
procedure TFormAstroScene.miToolsOptionsClick(Sender: TObject);
begin
  FormOptions.Show;
end;

//------------------------ Показать настройки --------------------------------
procedure TFormAstroScene.miSettingsClick(Sender: TObject);
begin
  FormSettings.Show;
end;

//----------------------------------------------------------------------------
procedure TFormAstroScene.miSkyPolygonsClick(Sender: TObject);
begin
  with TfrmSkyPolygons.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//------------------------ Атлас созвездий -----------------------------------
procedure TFormAstroScene.miConstAtlasClick(Sender: TObject);
begin
  inherited;
  with TfrmConstells.Create(Self) do
  try
    ShowModal
  finally
    Free
  end;
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
/////    IniFile.WriteInteger(FormAstroScene.Name, tvStarsys.Name, tvStarsys.Selected.Index);
  finally
    IniFile.Free;
  end;
end;


//----------------------- О программе -----------------------------------------
procedure TFormAstroScene.miHelpAboutClick(Sender: TObject);
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
