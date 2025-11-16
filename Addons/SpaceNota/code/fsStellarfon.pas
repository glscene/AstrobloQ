unit fsStellarfon;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.MMSystem,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Math,
  System.IniFiles,


  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ImgList,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.ToolWin,
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,

  GLS.DCE,
  GLS.SoundManager,
  GLS.Sounds.BASS,
  GLS.Collision,
  GLS.FPSMovement,
  GLS.NGDManager,
  GLS.BaseClasses,
  GLS.Cadencer,
  GLS.ParticleFX,
  GLS.Material,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  Stage.Keyboard,
  Stage.RandomLib,

  GLS.Scene,
  GLS.SceneViewer,
  GLS.FireFX,
  GLS.Objects,
  GLS.HUDObjects,
  GLS.Graph,
  GLS.VectorFileObjects,
  GLS.GeomObjects,
  GLS.Mesh,
  GLS.Coordinates,
  GLS.SkyDome,
  GLS.Navigator,
  GLS.BitmapFont,
  GLS.WindowsFont,
  GLS.SimpleNavigation,
  GLS.Color,
  GLS.Texture,
  GLS.RenderContextInfo,

  GLS.MusicKeys, // todo

  dmImages,
  dmDialogs,

  Astro.Globals,
  Astro.Utils,

  fsFirstForm,
  fsSettings,  // AV
  fsColorFigures,
  fsMidikeys,
  fsSequencer,
  fsAbout
  ;

type
  TfrmStellarfon = class(TfrmFirst)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miNew: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    miSaveAs: TMenuItem;
    miN1: TMenuItem;
    miExit: TMenuItem;
    miEdit: TMenuItem;
    miUndo: TMenuItem;
    miN5: TMenuItem;
    miCut: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miN4: TMenuItem;
    miGoTo: TMenuItem;
    N3: TMenuItem;
    miView: TMenuItem;
    miN6: TMenuItem;
    miHide: TMenuItem;
    miShow: TMenuItem;
    miHelp: TMenuItem;
    miWiki: TMenuItem;
    miN2: TMenuItem;
    miAbout: TMenuItem;
    miInstruments: TMenuItem;
    miCalculate: TMenuItem;
    miSettings: TMenuItem;
    GLSceneViewer1: TGLSceneViewer;
    GLScene: TGLScene;
    LightSource1: TGLLightSource;
    Camera1: TGLCamera;
    dcScene: TGLDummyCube;
    spEarth: TGLSphere;
    dcMoon: TGLDummyCube;
    spMoon: TGLSphere;
    dcPianoKeys: TGLDummyCube;
    cbPianoStand: TGLCube;
    dcCamera: TGLDummyCube;
    GLCadencer: TGLCadencer;
    StatusBar1: TStatusBar;
    PanelLeft: TPanel;
    PanelRight: TPanel;
    Timer: TTimer;
    GLWindowsBitmapFont: TGLWindowsBitmapFont;
    spCore: TGLSphere;
    LightSource2: TGLLightSource;
    tvComposition: TTreeView;
    dcGuitarKeys: TGLDummyCube;
    cbGuitarStand: TGLCube;
    grdGuitarKeys: TGLXYZGrid;
    grdPianoKeysH: TGLXYZGrid;
    grdPianoKeysV: TGLXYZGrid;
    EdgeXa: TGLArrowLine;
    EdgeYf: TGLArrowLine;
    EdgeZc: TGLArrowLine;
    dcEdges: TGLDummyCube;
    EdgeZcs: TGLArrowLine;
    EdgeXas: TGLArrowLine;
    GLArrowLine5: TGLArrowLine;
    EdgeZd: TGLArrowLine;
    EdgeZds: TGLArrowLine;
    EdgeYfs: TGLArrowLine;
    EdgeYg: TGLArrowLine;
    EdgeYgs: TGLArrowLine;
    EdgeXb: TGLArrowLine;
    EdgeXe: TGLArrowLine;
    GLBitmapFont: TGLBitmapFont;
    HUDTextGuitar: TGLHUDText;
    HUDTextPiano: TGLHUDText;
    GLFlatText1: TGLFlatText;
    rgColorScale: TRadioGroup;
    hfBottom: TGLHeightField;
    GLSkyDome: TGLSkyDome;
    Cameracontroller: TGLCamera;
    Camera: TGLCamera;
    GLSkyBox: TGLSkyBox;
    GLPolygon1: TGLPolygon;
    GLLines1: TGLLines;
    GLPoints1: TGLPoints;
    miColorFigures: TMenuItem;
    C: TGLDisk;
    Bb: TGLDisk;
    D: TGLDisk;
    dcColorWheel: TGLDummyCube;
    CdDb: TGLDisk;
    E: TGLDisk;
    F: TGLDisk;
    FdGb: TGLDisk;
    G: TGLDisk;
    Eb: TGLDisk;
    A: TGLDisk;
    Ab: TGLDisk;
    CdB: TGLDisk;
    chAm: TGLDisk;
    chDm: TGLDisk;
    chE7: TGLDisk;
    dcMajor: TGLDummyCube;
    dcMinor: TGLDummyCube;
    Am: TGLDisk;
    Em: TGLDisk;
    Bm: TGLDisk;
    Fdm: TGLDisk;
    Cdm: TGLDisk;
    GdmAbm: TGLDisk;
    DdmEbm: TGLDisk;
    AdmBbm: TGLDisk;
    Fm: TGLDisk;
    Cm: TGLDisk;
    Gm: TGLDisk;
    Dm: TGLDisk;
    dcDim: TGLDummyCube;
    dimB: TGLDisk;
    dimFd: TGLDisk;
    dimCd: TGLDisk;
    dimGd: TGLDisk;
    dimDd: TGLDisk;
    dimAd: TGLDisk;
    dimEd: TGLDisk;
    dimBd: TGLDisk;
    dimG: TGLDisk;
    dimD: TGLDisk;
    dimA: TGLDisk;
    dimE: TGLDisk;
    dcNdb: TGLDummyCube;
    db0: TGLDisk;
    d1: TGLDisk;
    d2: TGLDisk;
    d3: TGLDisk;
    d4: TGLDisk;
    d5b7: TGLDisk;
    d6b6: TGLDisk;
    d7b5: TGLDisk;
    b4: TGLDisk;
    b3: TGLDisk;
    b2: TGLDisk;
    b1: TGLDisk;
    dcSectors: TGLDummyCube;
    scSharps: TGLDisk;
    scEnharmonics: TGLDisk;
    scFlats: TGLDisk;
    scBekar: TGLDisk;
    chbEnsemble: TCheckBox;
    GLMatLibOctava: TGLMaterialLibrary;
    GLMatLibTextures: TGLMaterialLibrary;
    GLMatLibBW: TGLMaterialLibrary;
    niN7: TMenuItem;
    miMidikeys: TMenuItem;
    dcBaynKeys: TGLDummyCube;
    cbRightBayanStand: TGLCube;
    grdRightBayanKeys: TGLXYZGrid;
    grdLeftBayanKeys: TGLXYZGrid;
    cbLeftBayanStand: TGLCube;
    GLMatLibCubeMap: TGLMaterialLibrary;
    miSequencer: TMenuItem;
    miMediaPlayer: TMenuItem;
    baseCylinder: TGLCylinder;
    N1: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
      MousePos: TPoint; var Handled: Boolean);
    procedure TimerTimer(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure GLSceneViewer1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure rgColorScaleClick(Sender: TObject);
    procedure miColorFiguresClick(Sender: TObject);
    procedure chbEnsembleClick(Sender: TObject);
    procedure miMidikeysClick(Sender: TObject);
    procedure miSequencerClick(Sender: TObject);
    procedure miMediaPlayerClick(Sender: TObject);
  public
    PathToAssets, PathToData : TFileName;
    mx: Integer;
    my: Integer;
    MaterialIndex: Integer;
    ConstNames: TFileName;
    procedure MakePianoKeys(Sender: TObject);
    procedure MakeGuitarKeys(Sender: TObject);
    function LoadTexture(Matname, Filename: string): TGLLibMaterial;
    function LoadCubeMap(Matname, Filename: string): TGLLibMaterial;
    property Action;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  private
    CameraHeight: Single;

    // piano keyboard
    // 88 keys for 9 octavas or 88 constellations
    NPianoKeys: Integer;
    PianoKeys: array [0 .. 87] of TGLCube;
    KeyDepthW, KeyHeightW, KeyWidthW: Single;
    KeyDepthB, KeyHeightB, KeyWidthB: Single;
    CountOctavas: Integer;

    // guitar fretboard
    // 149 keys for 6 strings
    NGuitarKeys: Integer;
    GuitarKeys: array [0 .. 149] of TGLCube;
    KeyDepth, KeyHeight, KeyWidth: Single;
    StringIndex, FretIndex: Integer;
    CountStrings, CountFrets: Integer;
    OriginX, OriginY, OriginZ: Single;
    OpenMaterials: array [0 .. 5] of Integer; // materials for open strings

    // bayan right and left keyboards
    NRightBayanKeys, NLeftBayanKeys: Integer;
    RightBayanKeys: array [0 .. 130] of TGLSuperellipsoid;
    LeftBayanKeys: array [0 .. 150] of TGLCylinder;

    // a quintwheel of color notes
    // 12 sectors for clockwised camelot
    NWheelSectors: Integer;
    WheelSectors: array [0 .. 11] of TGLDisk;

    procedure SetPianoKeySizes;
    procedure SetGuitarKeySizes;
  end;

var
  frmStellarfon: TfrmStellarfon;
  PickDown: TGLCustomSceneObject;
  PickUp: TGLCustomSceneObject;


implementation //==============================================================

uses
  fsMediaPlayer;

{$R *.dfm}

// ----------------------------------------
// Define key sizes ans set for black keys
// ----------------------------------------
procedure TfrmStellarfon.SetPianoKeySizes;
begin
  NPianoKeys := 88;

  KeyDepthW := 12;
  KeyDepthB := 6;
  KeyHeightW := 1;
  KeyHeightB := 1;
  KeyWidthW := 1;
  KeyWidthB := 0.6;

  // 36 black keys for 9 octavas
  BlackKeySet :=                                 [{  0 }  1, {  2,   // 0 octava
     3 }  4, {  5 }  6, {  7,  8 }  9, { 10 } 11, { 12 } 13, { 14,   // 1 octava
    15 } 16, { 17 } 18, { 19, 20 } 21, { 22 } 23, { 24 } 25, { 26,   // 2 octava
    27 } 28, { 29 } 30, { 31, 32 } 33, { 34 } 35, { 36 } 37, { 38,   // 3 octava
    39 } 40, { 41 } 42, { 43, 44 } 45, { 46 } 47, { 48 } 49, { 50,   // 4 octava
    51 } 52, { 53 } 54, { 55, 56 } 57, { 58 } 59, { 60 } 61, { 62,   // 5 octava
    63 } 64, { 65 } 66, { 67, 68 } 69, { 70 } 71, { 72 } 73, { 74,   // 6 octava
    75 } 76, { 77 } 78, { 79, 80 } 81, { 82 } 83, { 84 } 85  { 86,   // 7 octava
    87 }];                                                           // 8 octava
end;

// ----------------------------------------------------------------------------------
// Make 88 keys for 3 notes in 0 octave + 84 notes in 7 octavas + 1 note for octava 8
// ----------------------------------------------------------------------------------
procedure TfrmStellarfon.MakePianoKeys(Sender: TObject);
var
  i: Integer;
  CurrentX: Single;
  rci: TGLRenderContextInfo;
begin
  SetPianoKeySizes;

  CurrentX := (cbPianoStand.CubeWidth / 2 - 0.5);
  for i := 0 to NPianoKeys - 1 do
  begin
    PianoKeys[i] := TGLCube.CreateAsChild(dcPianoKeys);
    if (i in BlackKeySet) then
    begin
      PianoKeys[i].Position.SetPoint(CurrentX + 0.5, 1, 3);
      PianoKeys[i].CubeDepth := KeyDepthB;
      PianoKeys[i].CubeHeight := KeyHeightB;
      PianoKeys[i].CubeWidth := KeyWidthB;
      if (rgColorScale.ItemIndex = 1) then
        PianoKeys[i].Material.FrontProperties.Diffuse.Color := clrGray20;
    end
    else
    begin
      PianoKeys[i].Position.SetPoint(CurrentX, 0, 0);
      PianoKeys[i].CubeDepth := KeyDepthW;
      PianoKeys[i].CubeHeight := KeyHeightW;
      PianoKeys[i].CubeWidth := KeyWidthW;
      if (rgColorScale.ItemIndex = 1) then
        PianoKeys[i].Material.FrontProperties.Diffuse.Color := clrWhite;
      CurrentX := CurrentX - KeyWidthW; // moving to the next key position on X axes
    end;
    PianoKeys[i].Tag := i + 1;  // for 1..88 keys
    MaterialIndex := i mod 12;  // or MaterialIndex := (i+3) mod 12;
    case rgColorScale.ItemIndex of
    0: begin
         PianoKeys[i].Material.MaterialLibrary := GLMatLibOctava;
         PianoKeys[i].Material.LibMaterialName := GLMatLibOctava.Materials[MaterialIndex].Name;
       end;
    (*
    3: begin
         PianoKeys[i].Material.MaterialLibrary := GLMatLibScriabin;
         PianoKeys[i].Material.LibMaterialName := GLMatLibScriabin.Materials[MaterialIndex].Name;
       end;
    *)
    end;
  end;
end;

// --------------------------------------
// Define guitar key sizes
// --------------------------------------
procedure TfrmStellarfon.SetGuitarKeySizes;
begin
  NGuitarKeys := 150;

  KeyDepth := 1;
  KeyHeight := 1;
  KeyWidth := 2;
  OriginX := (cbGuitarStand.CubeWidth / 2 - 1);
  OriginY := 11;
  OriginZ := 5;

  CountStrings := 6;
  CountFrets := 25;

  FretIndex := 0;
  StringIndex := 0;
  MaterialIndex := 0;

  // open strings colors
  OpenMaterials[0] := 7;  // e -> mi
  OpenMaterials[1] := 2;  // b -> si
  OpenMaterials[2] := 10; // g -> sol
  OpenMaterials[3] := 5;  // d -> re
  OpenMaterials[4] := 0;  // a -> la
  OpenMaterials[5] := 7;  // e -> mi
end;

// ---------------------------------------------------
//          Make 150 guitar keys
// ---------------------------------------------------
procedure TfrmStellarfon.MakeGuitarKeys(Sender: TObject);
var
  i, j, k,
  NumString: Integer; // current string number

begin
  SetGuitarKeySizes;
  i := 0;
  j := 0;
  k := 0; // current keyindex
  NumString := 0; // the first string number
  for i := 0 to CountFrets - 1 do
  begin
    for j := 0 to CountStrings - 1 do
    begin
      GuitarKeys[k] := TGLCube.CreateAsChild(dcGuitarKeys);
      NumString := k div 25 + 1;
      FretIndex := k mod 25;
      if (rgColorScale.ItemIndex = 1) then
        MaterialIndex := 1 // uniform color of frets
      else
        MaterialIndex := (OpenMaterials[NumString - 1] + FretIndex) mod 12;
      GuitarKeys[k].Material.MaterialLibrary := GLMatLibOctava;
      GuitarKeys[k].Material.LibMaterialName := GLMatLibOctava.Materials[MaterialIndex].Name;
      //
      GuitarKeys[k].Position.SetPoint(OriginX - FretIndex * 2 - 1, OriginY - NumString + 1, OriginZ);
      GuitarKeys[k].CubeDepth := KeyDepth;
      GuitarKeys[k].CubeHeight := KeyHeight;
      GuitarKeys[k].CubeWidth := KeyWidth;
      Inc(k);
    end;
  end;
  NGuitarKeys := k;
end;

//---------------------------------------------------------------
procedure TfrmStellarfon.chbEnsembleClick(Sender: TObject);
begin
  dcPianoKeys.Visible := chbEnsemble.Checked;
  dcGuitarKeys.Visible := chbEnsemble.Checked;
  rgColorScale.Enabled := chbEnsemble.Checked;
end;

//---------------------------------------------------------------
function TfrmStellarfon.LoadTexture(Matname, Filename: string): TGLLibMaterial;
begin
  Result := GLMatLibTextures.AddTextureMaterial(Matname, Filename);
  Result.Material.Texture.Disabled := False;
  Result.Material.Texture.TextureMode := tmDecal;
end;

//---------------------------------------------------------------
function TfrmStellarfon.LoadCubeMap(Matname, Filename: string): TGLLibMaterial;
begin
  Result := GLMatLibCubeMap.AddTextureMaterial(Matname, Filename);
  Result.Material.Texture.Disabled := False;
  Result.Material.Texture.TextureMode := tmDecal;
end;

//---------------------------------------------------------------
// FormCreate
//---------------------------------------------------------------
procedure TfrmStellarfon.FormCreate(Sender: TObject);
begin
  inherited;
  // path to assets
  PathToAssets := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(PathToAssets, Pos('astrobloq', PathToAssets), Length(PathToAssets)); // if bin dir for exe
  PathToAssets := IncludeTrailingPathDelimiter(PathToAssets) + 'astrobloq\assets';
  SetCurrentDir(PathToAssets) ;

  SetCurrentDir(PathToAssets  + '\cubemap');
  // MaterialLibrary needs to be included in GLSkyBox
  GLMatLibCubeMap.TexturePaths := GetCurrentDir();

  LoadCubeMap('Left', 'mw_left.jpg');
  LoadCubeMap('Right', 'mw_right.jpg');
  LoadCubeMap('Top', 'mw_top.jpg');
  LoadCubeMap('Bottom', 'mw_bot.jpg');
  LoadCubeMap('Front', 'mw_front.jpg');
  LoadCubeMap('Back', 'mw_back.jpg');

  // Loading maps for planets
  SetCurrentDir(PathToAssets + '\map');
  spEarth.Material.Texture.Disabled := False;
  spEarth.Material.Texture.Image.LoadFromFile('earth.jpg');
  spMoon.Material.Texture.Disabled:= False;
  spMoon.Material.Texture.Image.LoadFromFile('moon.jpg');

  // back to folder with textures
  SetCurrentDir(PathToAssets  + '\texture');
  with LoadTexture('clouds', 'clouds.jpg') do
  begin
    // Add transparency to clouds
    Material.BlendingMode := bmTransparency;
    Material.FrontProperties.Diffuse.Alpha := 0.2;
    // scale the clouds texture
    TextureScale.X := 8;
    TextureScale.Y := 8;
  end;

  cbPianoStand.Material.Texture.Disabled := False;
  cbPianoStand.Material.Texture.Image.LoadFromFile('ashwood.jpg');
  cbGuitarStand.Material.Texture.Disabled := False;
  cbGuitarStand.Material.Texture.Image.LoadFromFile('ashwood.jpg');

  SetCurrentDir(PathToAssets  + '\font');
  //GLWindowsBitmapFont.Glyphs.LoadFromFile('toonfont.bmp');
  GLBitmapFont.Glyphs.LoadFromFile('goldfont.bmp');

  // path to data to show stars
(*
  PathToData := GetDataPath();
  CurrentPath := PathToData;
  SetCurrentDir(PathToData);
  ConstNames := CurrentPath + '\constellation\ConstNames.dat';
  tvConstellations.LoadFromFile(ConstNames);   // read names
*)
  MakePianoKeys(Self);
  MakeGuitarKeys(Self);
  rgColorScaleClick(nil);  // if conmment then white gridlines
  rgColorScale.Enabled := chbEnsemble.Checked;
  chbEnsembleClick(Self);
end;

// -----------------------------------------------------------------------------------------
procedure TfrmStellarfon.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  Camera1.AdjustDistanceToTarget(Power(1.1, WheelDelta / 120));
end;

// ----------------------------------------------------------------------------------------
procedure TfrmStellarfon.GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
var
  speed : Single;
  MyString: String;
begin
  // Rotate colorwheel
  dcColorWheel.Roll(-deltaTime * 7);

  // dcEdges.TurnAngle := -NewTime * 60;
  ///spEarth.TurnAngle := newTime * 60;

  // Moving cloud slides
  with GLMatLibTextures.Materials.GetLibMaterialByName('clouds') do
  begin
    TextureOffset.X := TextureOffset.X + deltaTime * 0.02;
    TextureOffset.y := TextureOffset.y + deltaTime * 0.03;
  end;

  if IsKeyDown(VK_SHIFT) then
    speed := 5 * deltaTime
  else
    speed := deltaTime;

  with Camera1.Position do
  begin // WASD
    if (IsKeyDown(VK_RIGHT) or IsKeyDown('D') or IsKeyDown('Â')) then
      dcCamera.Translate(Z * speed, 0, -X * speed);
    if (IsKeyDown(VK_LEFT) or IsKeyDown('A') or IsKeyDown('Ô')) then
      dcCamera.Translate(-Z * speed, 0, X * speed);
    if (IsKeyDown(VK_UP) or IsKeyDown('W') or IsKeyDown('Ö')) then
      dcCamera.Translate(-X * speed, 0, -Z * speed);
    if (IsKeyDown(VK_DOWN) or IsKeyDown('S') or IsKeyDown('Û')) then
      dcCamera.Translate(X * speed, 0, Z * speed);
    if (IsKeyDown(VK_PRIOR) or IsKeyDown('Q') or IsKeyDown('É')) then
    begin
      CameraHeight := CameraHeight + 10 * speed;
      dcCamera.Position.Y := CameraHeight;
    end;
    if (IsKeyDown(VK_NEXT) or IsKeyDown('E') or IsKeyDown('Ó')) then
    begin
      CameraHeight := CameraHeight - 10 * speed;
      dcCamera.Position.Y := CameraHeight;
    end;
    if IsKeyDown(VK_ESCAPE) then
      Close;
  end;

  StatusBar1.Panels[1].Text := 'X: ' + FloatToStrF(dcCamera.Position.X, ffFixed, 7, 2);
  StatusBar1.Panels[2].Text := 'Y: ' + FloatToStrF(dcCamera.Position.Y, ffFixed, 7, 2);
  StatusBar1.Panels[3].Text := 'Z: ' + FloatToStrF(dcCamera.Position.Z, ffFixed, 7, 2);
  // don't drop through terrain!
  // with Camera.Position do
  // Y := GLTerrainRenderer1.InterpolatedHeight(AsVector) + FCamHeight;

  GLSceneViewer1.Invalidate();
end;

// ------------------------------------------------------------------------------
procedure TfrmStellarfon.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  PickedObject: TGLCustomSceneObject;
begin
  if Button = TMouseButton.mbLeft then
  begin
    // if an object is picked...
    PickedObject := (GLSceneViewer1.Buffer.GetPickedObject(X, Y) as TGLCustomSceneObject);
    if Assigned(PickedObject) and (PickedObject is TGLCube) then
    begin
      // ...turn it to yellow and show its name
      PickedObject.Material.FrontProperties.Emission.Color := clrYellow; // not from MatLib
      old_color := PickedObject.Material.FrontProperties.Emission.Color;
      new_color := vectorlerp(old_color, clrWhite, 0.25);
(*
      if Pickdown.Name = 'GLSkyDome1' then
        Pickdown.Material.FrontProperties.Emission.Color := old_color
      else
        Pickdown.Material.FrontProperties.Emission.Color := new_color;
*)
      Note := IntToStr(PickedObject.Tag);   // in Tags must be Ñ1,D1,E1.. (88 notes)
      // Note := GetNoteFromTag(); /// or  Sound := PickedObject.Name; e.g.  Sound := 'C2'
      ShowMessage('You clicked the ' + PickedObject.Name + ' ' + Note + ' key');
      PlayNote(Note, True);

    end;
  end;
  mx := X;
  my := Y;
end;

// ----------------------------------------------------------------------------
procedure TfrmStellarfon.GLSceneViewer1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbLeft then // check if the mouse button is still pressed
  begin
    PickUp := (GLSceneViewer1.Buffer.GetPickedObject(X, Y) as TGLCustomSceneObject);
    if Assigned(PickUp) then
      if (PickUp = PickDown) and (PickUp is TGLCube) then
      begin
        SetCurrentDir(PathToData + '\audio\piano');

        PickUp.Material.FrontProperties.Emission.Color := old_color;
        if PickUp.Name = 'cbPianoStand' then
        begin
//          S1 := S1 + '1';
          // sndPlaySound('red.wav',snd_ASync);
          PlaySound('k30.ogg', hinstance, SND_RESOURCE or SND_ASYNC);
        end;
      end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TfrmStellarfon.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (ssRight in Shift) then
    Camera1.MoveAroundTarget(my - Y, mx - X);
  mx := X;
  my := Y;
end;

// ---------------------- Settings --------------------------------------------
procedure TfrmStellarfon.miSettingsClick(Sender: TObject);
begin
  frmSettings.Show;
end;

// ---------------------- Sequencer -------------------------------------------
procedure TfrmStellarfon.miSequencerClick(Sender: TObject);
begin
  with TFormSequencer.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// ---------------------- MediaPlayer ----------------------------------------
procedure TfrmStellarfon.miMediaPlayerClick(Sender: TObject);
begin
  frmMediaPlayer.Show;
end;

// --------------------------- About ------------------------------------------
procedure TfrmStellarfon.miAboutClick(Sender: TObject);
begin
  with TFormAbout.Create(nil) do
    try
      PanelStellarfon.Caption := 'Stellarfon';
      ShowModal;
    finally
      Free;
    end;
end;

// ------------------------------------------------------------------------------
procedure TfrmStellarfon.rgColorScaleClick(Sender: TObject);
begin
  if rgColorScale.ItemIndex <> 2 then
  begin
    grdPianoKeysH.LineColor.Color := clrBlack;
    grdPianoKeysV.LineColor.Color := clrBlack;
    grdGuitarKeys.LineColor.Color := clrBlack;
  end
  else
  begin
    grdPianoKeysH.LineColor.Color := clrWhite;;
    grdPianoKeysV.LineColor.Color := clrWhite;
    grdGuitarKeys.LineColor.Color := clrWhite;
  end;

  MakePianoKeys(Sender);
  MakeGuitarKeys(Sender);
  GLSceneViewer1.Invalidate;
end;


// ------------------------------------------------------------------------------

procedure TfrmStellarfon.TimerTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Format('FPS:  %.1f ', [GLSceneViewer1.FramesPerSecond]);
  // Format('%d particles, %.1f FPS', [GLParticles1.Count, GLSceneViewer1.FramesPerSecond]);
  GLSceneViewer1.ResetPerformanceMonitor;
end;

// ------------------------------------------------------------------------------

procedure TfrmStellarfon.miMidikeysClick(Sender: TObject);
begin
  with TFormMidikeys.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


// ------------------------------------------------------------------------------
procedure TfrmStellarfon.miColorFiguresClick(Sender: TObject);
begin
  with TFormColorFigures.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// ------------------------------------------------------------------------------

procedure TfrmStellarfon.ReadIniFile;
var
  StyleID: integer;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      Top  := ReadInteger(Name, 'Top', 100);
      Left := ReadInteger(Name, 'Left', 200);
      if ReadBool(Name, 'InitMax', False) then
        WindowState := wsMaximized
      else
        WindowState := wsNormal;
      StyleID := ReadInteger(Name, 'StyleID', 0);
    finally
      IniFile.Free;
    end;
end;

// ------------------------------------------------------------------------------

procedure TfrmStellarfon.WriteIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      WriteInteger(Name, 'Top', Top);
      WriteInteger(Name, 'Left', Left);
      WriteBool(Name, 'InitMax', WindowState = wsMaximized);
    finally
      IniFile.Free;
    end;
end;

// ------------------------------------------------------------------------------
procedure TfrmStellarfon.miExitClick(Sender: TObject);
begin
  frmStellarfon.Close;
end;

end.
