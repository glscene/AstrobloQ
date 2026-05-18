(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit flLithoneta_ru;
(*
Генератор фрактальных ландшафтов FractaLandscape на основе компонента TGLFractalHDS
и других функций, входящих в модуль GLS.RandomHDS.
Диалоговое окно взаимодействует практически со всеми свойствами объекта,
позволяя понять, как изменяется ландшафт.

TGLFractalHDS используется так же, как и другие HDS GLScene. Для просмотра результатов необходимо
связать его с TGLTerrainRenderer. Но он делает следующее:

1) создает свой собственный HDS на основе нескольких параметров, выбранных пользователем,
2) вычисляет освещение и
3) вычисляет свою собственную текстуру. Пользователю практически ничего не нужно делать, кроме выбора комбинации параметров, соответствующей его потребностям. Его
творческий потенциал используется в событии OnDrawtexture, которое определяет, как цвета будут
накладываться на поле высот в соответствии с координатами и топографией.

Чтобы понять, как это работает, взгляните на модуль agGLRandomHDS и
на следующие методы:

- FormCreate: Как объявить и создать FractalHDS (не компонент типа «подключи и работай»)
- btApplyClick: Установка свойств
- GenerateLandscape: Как загрузить текстуры, построить ландшафт и освободить их
после этого
- OnDrawTexture: Эта функция выбирает правильный цвет для отображения в определенной
ячейке ландшафта в зависимости от её координат, высоты и уклона. Эта
функция использует текстуры, загруженные в процедуре GenerateLandscape, для наложения
их на поле высоты. Хотя Drawtexture позволяет полностью
контролировать внешний вид вашего ландшафта и создавать наиболее впечатляющие эффекты,
он не является обязательным. Если обработчик события OnDrawTexture не предоставлен для
TGLFractalHDS, будет использоваться функция по умолчанию:

- DummyCube для масштабирования;
- Cadencer заменен на TGLAsyncTimer.

Остальные методы данной формы необходимы для интерактивного взаимодействия
с пользователем и поддержки версий, не имея прямого отношения к генерации ландшафтов.
Исходный код модуля основан на демоверсии SynthTerr Александра Хирзеля
и дальнейших улучшениях фрактальных свойств ландшафтов.
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
  Vcl.Menus,

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
  TFormLithoneta = class(TForm)
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
    GroupBoxShadows: TGroupBox;
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
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    N3: TMenuItem;
    miExit: TMenuItem;
    miView: TMenuItem;
    miArchpelago: TMenuItem;
    miDunes: TMenuItem;
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
    procedure miExitClick(Sender: TObject);
    procedure miDunesClick(Sender: TObject);
    procedure miArchpelagoClick(Sender: TObject);
  private
    MediaPath, FileJpg: TFileName;
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
  FormLithoneta: TFormLithoneta;
  covFlat, covSteep: Single; // Slope strata
  covLow, covHigh: Single; // Elevation strata

implementation //=============================================================

{$R *.DFM}

uses
  flFractalArch_ru,
  flDuneFighter_ru,
  flProgress_ru;

var
  Forest, Sea, Beach, Snow, Grass, Cliff, BrownSoil: tBitmap;

//----------------------------------------------------------------------------
function TextureSea(const X, Y: Integer): TGLColorVector;
begin
  Result := ConvertWinColor(Sea.Canvas.Pixels[X * 5 mod Sea.Width, Y * 5 mod Sea.Height]);
  // Result:=TextureBlue(x,y);
end;

//----------------------------------------------------------------------------
function TextureForest(const X, Y: Integer): TGLColorVector;
begin
  with Forest do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
  AddVector(Result, 0.2); // Original texture is too dark
  // Result:=TextureDarkGreen(x,y);
end;

//----------------------------------------------------------------------------
function TextureGrass(const X, Y: Integer): TGLColorVector;
begin
  with Grass do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
  AddVector(Result, 0.2); // Original texture is too dark
end;

//----------------------------------------------------------------------------
function TextureSnow(const X, Y: Integer): TGLColorVector;
begin
  with Snow do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
end;

//----------------------------------------------------------------------------
function TextureBeach(const X, Y: Integer): TGLColorVector;
begin
  with Beach do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
end;

//----------------------------------------------------------------------------
function TextureCliff(const X, Y: Integer): TGLColorVector;
begin
  with Cliff do
    Result := ConvertWinColor(Canvas.Pixels[X * 2 mod Width, Y * 2 mod Height]);
end;

//----------------------------------------------------------------------------
function TextureBrownSoil(const X, Y: Integer): TGLColorVector;
begin
  with BrownSoil do
    Result := ConvertWinColor(Canvas.Pixels[X mod Width, Y mod Height]);
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.FormCreate(Sender: TObject);
begin
  MediaPath := LowerCase(ExtractFilePath(ParamStr(0)));
  MediaPath := IncludeTrailingPathDelimiter(MediaPath); // + '\media';
//  Delete(MediaPath, Pos('litosfera', MediaPath), Length(MediaPath)); // if litosfera dir for exe
  MediaPath := MediaPath + 'media\';
  SetCurrentDir(MediaPath) ;

  FileJpg := MediaPath + 'Forest.jpg';
  if FileExists(FileJpg, True) then
    GLTerrainRenderer1.MaterialLibrary := GLMaterialLibrary1
  else
    // Change dir
    Exit;

  // Terrain Renderer initialisation
  GLTerrainRenderer1.TileSize := 32;

  TopographyChanged := True;
  LightChanged := True;
end;

//----------------------------------------------------------------------------
function TFormLithoneta.OnDrawTexture(const Sender: tGLBaseRandomHDS;
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
function TFormLithoneta.OnDrawTextureFlashy(const Sender: tGLBaseRandomHDS;
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

//----------------------------------------------------------------------------
function TFormLithoneta.OnDrawTextureSlope(const Sender: tGLBaseRandomHDS;
  X, Y: Integer; z: double; aNormal: TGLVector): TGLColorVector;
var
  slope: Single;
begin
  slope := aNormal.Y * pi;
  MakeVector(Result, cos(slope), sin(slope), slope); // False colour
end;

//---------------------------------------------------------------------------
function TFormLithoneta.OnDrawTextureGrass(const Sender: tGLBaseRandomHDS;
  X, Y: Integer; z: double; aNormal: TGLVector): TGLColorVector;
begin
  Result := TextureGrass(X, Y);
end;

//------------------- Movement, mouse handling etc. -------------------------
procedure TFormLithoneta.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

//-----------------------------------------------------------------------
procedure TFormLithoneta.GLSceneViewer1MouseMove(Sender: TObject;
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
procedure TFormLithoneta.Timer1Timer(Sender: TObject);
begin
  Caption := Format('%.1f FPS - %d', [GLSceneViewer1.FramesPerSecond,
    GLTerrainRenderer1.LastTriangleCount]);
  GLSceneViewer1.ResetPerformanceMonitor;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.FormActivate(Sender: TObject);
begin
  if not LandscapeGenerated then
  begin
    btApplyClick(Sender);
    Start := GetTickCount;
  end;
  LandscapeGenerated := True;
  OnCameraChanged(Sender);
  OnScaleChanged(Sender);
end;

//-----------------------------------------------------------------------------
procedure TFormLithoneta.GenerateLandscape;
begin
  try
    Rendering := False; // Без рендера пока создаём ландшафт
    FormProgress.lblTask.Caption := 'Создание ландшафта';
    FormProgress.Execute;
    Screen.Cursor := crHourGlass;

    // Загрузка временной текстуры
    Forest := LoadJPGtexture('Forest.jpg');
    Sea := LoadJPGtexture('Sea.jpg');
    Snow := LoadJPGtexture('Snow.jpg');
    Cliff := LoadJPGtexture('Cliff.jpg');
    BrownSoil := LoadJPGtexture('BrownSoil.jpg');
    Grass := LoadJPGtexture('Grass.jpg');
    Beach := LoadJPGtexture('Beach.jpg');

(*
    Forest := LoadJPGtexture('mousse_1.jpg');
    Sea := LoadJPGtexture('Sea.jpg');
    Snow := LoadJPGtexture('004_neige.jpg');
    Cliff := LoadJPGtexture('017Roche.jpg');
    BrownSoil := LoadJPGtexture('058terresable-sombre.jpg');
    Grass := LoadJPGtexture('nature073-Terre+Herbe.jpg');
    // or Grass:=LoadJPGTexture('nature093-Gazon.jpg');
    Beach := LoadJPGtexture('057terresable-Clair.jpg');
*)

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

  finally
    Sea.Free; // Битмап нужен пока строится ландшафт
    Forest.Free;
    Snow.Free;
    Cliff.Free;
    Grass.Free;
    Beach.Free;
    BrownSoil.Free;

    FormProgress.Close;
    Screen.Cursor := crDefault;
    Rendering := True; // включить рендер
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormLithoneta.OnTopographyChanged(Sender: TObject);
begin
  if seDepth.Value > 6 then
    seDepth.Value := 6;  // иначе AV
  DummyTrackbar.SetFocus;
  TopographyChanged := True;
  btApply.Enabled := True;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.OnLightChanged(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
  LightChanged := True;
  btApply.Enabled := True;
  grpStrata.Visible := ckTexture.Checked;
  rgTextureQuality.Visible := ckTexture.Checked;
  grpDefaultTexture.Visible := not ckTexture.Checked;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.shColorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LightChanged := True;
  btApply.Enabled := True;
end;

//---------------------------------------------------------------------------
procedure TFormLithoneta.btApplyClick(Sender: TObject);
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
    // свойства топографии
    Depth := seDepth.Value;
    Cyclic := ckCyclic.Checked; // циклический ландшафт
    Seed := seSeed.Value;
    Amplitude := tbAmplitude.Position;
    Roughness := tbRoughness.Position / 10;
    Sea := ckSea.Checked;
    SeaLevel := (tbSeaLevel.Position - 5) / 10 * Amplitude;
    if not Cyclic then
      SeaLevel := SeaLevel * 2; // to cope with the larger variance
    SeaTransparency := tbTransparency.Position / 10 *
      (SeaLevel + Amplitude / 2);

    // свойства эрозии
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

    // свойства освещения
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

    // свойства текстуры
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
     // ландшафт без моря
     PrimerLandscape := True;
     PrimerIsland(0, 100, fHeight);
    *)
  end; // with
  GenerateLandscape;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.FormDestroy(Sender: TObject);
begin
  FractalHDS.Free;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.OnCameraChanged(Sender: TObject);
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

//----------------------------------------------------------------------------
procedure TFormLithoneta.OnScaleChanged(Sender: TObject);
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
  end; // with
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.ckIsometricClick(Sender: TObject);
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

//----------------------------------------------------------------------------
procedure TFormLithoneta.GLSceneViewer1MouseEnter(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.TrackBar2Change(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.PageControl1Change(Sender: TObject);
begin
  DummyTrackbar.SetFocus;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.Button1Click(Sender: TObject);
begin
   AsyncTimer1.Enabled:=True;
  // AsyncTimer1.Enabled:=False;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.AsyncTimer1Timer(Sender: TObject);
var
  DeltaTime: double;
begin
  DeltaTime := (GetTickCount - Start) / 1000;
  Start := GetTickCount;

  lblDebug.Caption := Format('%f,%f,%f', [GLCamera1.Position.X,
    GLCamera1.Position.Y, GLCamera1.Position.z]);
  ProcessKeyboard(DeltaTime);
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.ProcessKeyboard(const DeltaTime: double);
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

//----------------------------------------------------------------------------
procedure TFormLithoneta.SetRendering(const Value: boolean);
begin
  FRendering := Value;
  AsyncTimer1.Enabled := FRendering;
  GLSceneViewer1.Enabled := FRendering;
  if FRendering = False then
    GLTerrainRenderer1.HeightDataSource := nil
  else
    GLTerrainRenderer1.HeightDataSource := FractalHDS;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.btDefaultTextureClick(Sender: TObject);
begin
  with OpenPictureDialog1 do
  begin
    if not Execute then
      exit;
    edDefaultTexture.Text := FileName;
    LightChanged := True;
  end; // with
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Rendering := False;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.miArchpelagoClick(Sender: TObject);
begin
  with TfrmFracArchip.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.miDunesClick(Sender: TObject);
begin
  with TfrmDuneFighter.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------------------------------------------------------------
procedure TFormLithoneta.miExitClick(Sender: TObject);
begin
  Close;
end;

//----------------------------------------------------------------------------
end.
