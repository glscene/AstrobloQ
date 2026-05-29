(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit faStarsys_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.Jpeg,
  Vcl.Imaging.pngimage,
  Vcl.Menus,


  Stage.VectorTypes,
  Stage.VectorGeometry,
  Stage.Utils,
  Stage.Keyboard,

  GLS.SceneViewer,
  GLS.PersistentClasses,

  GLS.Scene,
  GLS.Context,
  GLS.State,
  GLS.Objects,
  GLS.GeomObjects,
  GLS.Cadencer,
  GLS.Extrusion,
  GLS.GeometryBB,
  GLS.File3DS,
  GLS.FileSTL,

  GLS.VectorFileObjects,
  GLS.Coordinates,
  GLS.BaseClasses,
  GLS.RenderContextInfo,
  GLS.AsyncTimer,
  GLS.SimpleNavigation,
  GLS.Material,
  GLS.Color,
  GLS.SkyDome,
  GLS.FireFX,
  GLS.FileObj,
  GLS.Atmosphere,
  GLS.LensFlare,

  Astro.Utils,
  fmFormFirst,
  faOptions_ru,
  frParams_ru
  ;

type
  TfrmStarSys = class(TFormFirst)
    GLSceneStarsys: TGLScene;
    svStarsys: TGLSceneViewer;
    PanelLeft: TPanel;
    tvStarSys: TTreeView;
    Camera: TGLCamera;
    LightSource: TGLLightSource;
    Cadencer: TGLCadencer;
    Mercury: TGLSphere;
    sys_dogl: TGLDirectOpenGL;
    SolarSystem: TGLDummyCube;
    lineAxis: TGLLines;
    bb_lines: TGLLines;
    AsyncTimer: TGLAsyncTimer;
    SaturnRing: TGLDisk;
    Sun: TGLSphere;
    MatLib: TGLMaterialLibrary;
    dcEarth: TGLDummyCube;
    Earth: TGLSphere;
    dcMoon: TGLDummyCube;
    Moon: TGLSphere;
    dcMars: TGLDummyCube;
    Mars: TGLSphere;
    MarsOrbit: TGLTorus;
    dcMercury: TGLDummyCube;
    dcSaturn: TGLDummyCube;
    dcVenus: TGLDummyCube;
    Venus: TGLSphere;
    dcJupiter: TGLDummyCube;
    Saturn: TGLSphere;
    Jupiter: TGLSphere;
    dcUranus: TGLDummyCube;
    dcNeptune: TGLDummyCube;
    dcPluto: TGLDummyCube;
    Uranus: TGLSphere;
    Neptune: TGLSphere;
    Pluto: TGLSphere;
    Charon: TGLSphere;
    SkyDome: TGLSkyDome;
    FireFXManager: TGLFireFXManager;
    Europa: TGLSphere;
    dcEuropa: TGLDummyCube;
    dcTitan: TGLDummyCube;
    dcEnceladus: TGLDummyCube;
    Titan: TGLSphere;
    dcPhobos: TGLDummyCube;
    dcDeimos: TGLDummyCube;
    Enceladus: TGLSphere;
    NeptuneRing: TGLDisk;
    dcGanymede: TGLDummyCube;
    Ganymede: TGLSphere;
    dcIo: TGLDummyCube;
    Io: TGLSphere;
    dcCallisto: TGLDummyCube;
    Callisto: TGLSphere;
    dcTitania: TGLDummyCube;
    dcMiranda: TGLDummyCube;
    Titania: TGLSphere;
    Miranda: TGLSphere;
    dcTriton: TGLDummyCube;
    Triton: TGLSphere;
    dcCharon: TGLDummyCube;
    JupiterOrbit: TGLTorus;
    MercuryOrbit: TGLTorus;
    SaturnOrbit: TGLTorus;
    VenusOrbit: TGLTorus;
    UranusOrbit: TGLTorus;
    NeptuneOrbit: TGLTorus;
    PlutoOrbit: TGLTorus;
    EarthOrbit: TGLTorus;
    UranusRing: TGLDisk;
    diskSHZup: TGLDisk;
    MainMenu: TMainMenu;
    PanelRight: TPanel;
    Window1: TMenuItem;
    miHidePanels: TMenuItem;
    N1: TMenuItem;
    stPickObject: TStaticText;
    cbOrbit: TCheckBox;
    Splitter1: TSplitter;
    cbStarHZ: TCheckBox;
    MemoInfo: TMemo;
    cbRotation: TCheckBox;
    Phobos: TGLFreeForm;
    Deimos: TGLFreeForm;
    StatusBarSol: TStatusBar;
    JupiterRing: TGLDisk;
    FrameParamsR: TFrameParamsR;
    N2: TMenuItem;
    miOpen: TMenuItem;
    miExit: TMenuItem;
    SimpleNavigation: TGLSimpleNavigation;
    diskSHZdown: TGLDisk;
    chbInnerCore: TCheckBox;
    procedure CadencerProgress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure Sys_doglRender(Sender: TObject; var rci: TGLRenderContextInfo);
    procedure svStarsysMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AsyncTimerTimer(Sender: TObject);
    procedure tvStarSysChange(Sender: TObject; Node: TTreeNode);
    procedure cbOrbitClick(Sender: TObject);
    procedure cbRotationClick(Sender: TObject);
    procedure cbStarHZClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure tvStarSysClick(Sender: TObject);
    procedure miHidePanelsClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure chbInnerCoreClick(Sender: TObject);
  public
    PickObject: TGLBaseSceneObject;
    procedure UpdateTreeView;
    procedure AddBBox;  // Bounding Box
    procedure UpdateBBox;
  private
    newPickObject: TGLBaseSceneObject;
    Core: TGLSPhere;
    Crust: TGLDisk;
    Mantle: TGLDisk;
    Atmosphere: TGLAtmosphere;
    PathToData, CurrentDir, FileName: TFileName;
    procedure GetObjects(ParentNode: TTreeNode; SceneObject: TGLBaseSceneObject);
  end;

var
  frmStarSys: TfrmStarSys;
const
  cOmega = 10;  // угловая скорость

implementation //==============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TfrmStarSys.FormCreate;
begin
  PathToData := GetDataPath();
  CurrentDir := PathToData  + '\starsys\sun\'; // вместо GetCurrentDir()
  SetCurrentDir(CurrentDir);

  // Текстуры карт
  Sun.Material.Texture.Image.LoadFromFile('sol.jpg');
  Mercury.Material.Texture.Image.LoadFromFile('mercury.jpg');
  Venus.Material.Texture.Image.LoadFromFile('venus.jpg');

  Earth.Material.Texture.Image.LoadFromFile('earth.jpg');
    Moon.Material.Texture.Image.LoadFromFile('moon.jpg');

  Mars.Material.Texture.Image.LoadFromFile('mars.jpg');
    Phobos.Material.Texture.Image.LoadFromFile('phobos.jpg');
    Deimos.Material.Texture.Image.LoadFromFile('deimos.jpg');

  Jupiter.Material.Texture.Image.LoadFromFile('jupiter.jpg');
    Io.Material.Texture.Image.LoadFromFile('io.jpg');
    Europa.Material.Texture.Image.LoadFromFile('europa.jpg');
    Ganymede.Material.Texture.Image.LoadFromFile('ganymede.jpg');
    Callisto.Material.Texture.Image.LoadFromFile('callisto.jpg');

  Saturn.Material.Texture.Image.LoadFromFile('saturn.jpg');
    SaturnRing.Material.Texture.Image.LoadFromFile('saturn_ring.png');
    Titan.Material.Texture.Image.LoadFromFile('titan.jpg');
    Enceladus.Material.Texture.Image.LoadFromFile('enceladus.jpg');

  Uranus.Material.Texture.Image.LoadFromFile('uranus.jpg');
    UranusRing.Material.Texture.Image.LoadFromFile('uranus_ring.png');
    Titania.Material.Texture.Image.LoadFromFile('titania.jpg');
    Miranda.Material.Texture.Image.LoadFromFile('miranda.jpg');

  Neptune.Material.Texture.Image.LoadFromFile('neptune.jpg');
    NeptuneRing.Material.Texture.Image.LoadFromFile('neptune_ring.png');
    Triton.Material.Texture.Image.LoadFromFile('triton.jpg');

  Pluto.Material.Texture.Image.LoadFromFile('pluto.jpg');
    Charon.Material.Texture.Image.LoadFromFile('charon.jpg');

  // Загрузка моделей в FreeForms
  Phobos.LoadFromFile('phobos.3ds');
  Phobos.Scale.Scale(0.05 / Phobos.BoundingSphereRadius);
  Deimos.LoadFromFile('deimos.3ds');
  Deimos.Scale.Scale(0.05 / Deimos.BoundingSphereRadius);

  // Загрузка каталогов звёзд в SkyDome
  SetCurrentDir(PathToData + '\catalog');
  FileName := GetCurrentDir + '\Yale_BSC.stars';
  SkyDome.Bands.Clear;
  if FileExists(FileName) then
    SkyDome.Stars.LoadStarsFile(FileName);

  UpdateTreeView;
  tvStarSys.Select(tvStarSys.Items[0]); // выбор первого узла
(*
//  ffAsteroid.LoadFromFile('asteroid.3ds');
//  ffComet.LoadFromFile('comet.3ds');
*)
  tvStarSys.FullExpand;
  ///Atmosphere := TGLAtmosphere.Create(Self);
  svStarsys.Buffer.RenderingContext.Activate;

  // возврат в папку солнца
  SetCurrentDir(CurrentDir);
  inherited;   // inheritance for translation
end;

//----------------------------------------------------------------------------
// FormShow
//----------------------------------------------------------------------------
procedure TfrmStarSys.FormShow(Sender: TObject);
begin
  cbOrbitClick(Self);
  cbRotationClick(Self);
  cbStarHZClick(Self);
  UpdateBBox; // ?
end;

//----------------------------------------------------------------------------
// ------------------- Скрыть или показать панели ----------------------------
//----------------------------------------------------------------------------
procedure TfrmStarSys.miHidePanelsClick(Sender: TObject);
begin
   PanelLeft.Visible := not PanelLeft.Visible;
   PanelRight.Visible := not PanelRight.Visible;
   miHidePanels.Checked := not miHidePanels.Checked;
   if miHidePanels.Checked then
     miHidePanels.Caption := 'Скрыть панели'
   else
    miHidePanels.Caption := 'Показать панели';
end;

//----------------------------------------------------------------------------
// Открыть файл и загрузить данные
//----------------------------------------------------------------------------
procedure TfrmStarSys.miOpenClick(Sender: TObject);
begin
  // not ready csv files
end;

//----------------------------------------------------------------------------
// ---------------------- Прогресс каденсера ---------------------------------
//----------------------------------------------------------------------------
procedure TfrmStarSys.CadencerProgress(Sender: TObject;
      const deltaTime, newTime: Double);
begin
  //SolarSystem.Turn(deltaTime * cOmega);
  Sun.Turn(deltaTime * cOmega);
  dcMercury.Turn(deltaTime * 50);
    Mercury.Turn(deltaTime * cOmega);
  dcVenus.Turn(deltaTime * 35);
    Venus.Turn(deltaTime * cOmega);

  dcEarth.Turn(deltaTime * 30);
    Earth.Turn(deltaTime * 100);
  (**)
    dcMoon.Turn(deltaTime * 50);
  dcMars.Turn(deltaTime * 24);
    Mars.Turn(deltaTime * 100);
    dcPhobos.Turn(deltaTime * 200);
    dcDeimos.Turn(deltaTime * cOmega);
  dcJupiter.Turn(deltaTime * 14);
    Jupiter.Turn(deltaTime * 80);
    dcIo.Turn(deltaTime * 180);
    dcEuropa.Turn(deltaTime * 140);
    dcGanymede.Turn(deltaTime * 100);
    dcCallisto.Turn(deltaTime * 60);
  dcSaturn.Turn(deltaTime * cOmega);
  Saturn.Turn(deltaTime * 50);
    Saturnring.Roll(deltaTime * 50);
    dcEnceladus.Turn(deltaTime * 50);
    dcTitan.Turn(deltaTime * 20);
  dcUranus.Turn(deltaTime * 14);
    Uranus.Turn(deltaTime * 50);
    dcTitania.Turn(deltaTime * 100);
    dcMiranda.Turn(deltaTime * 50);
  dcNeptune.Turn(deltaTime * 12);
    Neptune.Turn(deltaTime * 50);
    dcTriton.Turn(deltaTime * 120);
  dcPluto.Turn(deltaTime * cOmega);
    Pluto.Turn(deltaTime * 50);
    dcCharon.Turn(deltaTime * 100);
end;

//---------------------- Показать линии орбит --------------------------------
procedure TfrmStarSys.cbOrbitClick(Sender: TObject);
begin
  MercuryOrbit.Visible := cbOrbit.Checked;
  VenusOrbit.Visible := cbOrbit.Checked;
  EarthOrbit.Visible := cbOrbit.Checked;
  MarsOrbit.Visible := cbOrbit.Checked;
  JupiterOrbit.Visible := cbOrbit.Checked;
  SaturnOrbit.Visible := cbOrbit.Checked;
  UranusOrbit.Visible := cbOrbit.Checked;
  NeptuneOrbit.Visible := cbOrbit.Checked;
  PlutoOrbit.Visible := cbOrbit.Checked;
  svStarsys.Invalidate;
end;

//--------------------- Вращение планетной системы ----------------------------
procedure TfrmStarSys.cbRotationClick(Sender: TObject);
begin
  Cadencer.Enabled := cbRotation.Checked;
  svStarsys.Invalidate;
end;

//----------------------- Показать обитаемую зону звезды ----------------------
procedure TfrmStarSys.cbStarHZClick(Sender: TObject);
begin
  diskSHZup.Visible := cbStarHZ.Checked;
  diskSHZdown.Visible := cbStarHZ.Checked;
end;


//--------------------- Внутреннее ядро планеты -------------------------------
procedure TfrmStarSys.chbInnerCoreClick(Sender: TObject);
begin
  tvStarSysClick(Self); // в дереве просмотра if chbInnerCore then...
  svStarsys.Invalidate;
end;

//--------------------- Изменение дерева просмотра ----------------------------
procedure TfrmStarSys.tvStarSysChange(Sender: TObject; Node: TTreeNode);
begin
  if Node <> nil then
  begin
    PickObject := TGLBaseSceneObject(Node.Data);
    stPickObject.Caption := PickObject.Name;
    MemoInfo.Text := PickObject.Name + ': ' + PickObject.ClassName;
    FrameParamsR.ShowParams;
  end;
end;

//------------------------ клик мыши по узлу дерева ---------------------------
procedure TfrmStarSys.tvStarSysClick(Sender: TObject);
var
  i: integer;
begin
  SetCurrentDir(CurrentDir);

  // Звёздная система ===============
  if (tvStarSys.Selected.Text = SolarSystem.Name) then
  begin
    Camera.MoveTo(SolarSystem);
    Camera.TargetObject := SolarSystem;
    Camera.Position.X := 10;
    Camera.Position.Y := 10;
    Camera.Position.Z := 10;
  end;
  //  Звезда ===================
  if (tvStarSys.Selected.Text = Sun.Name) then
  begin
    Camera.MoveTo(Sun);
    Camera.TargetObject := Sun;
    Camera.Position.X := 1;
    Camera.Position.Y := 1;
    Camera.Position.Z := 1;
  end;
  //  Меркурий ===================
  if (tvStarSys.Selected.Text = Mercury.Name) then
  begin
    Camera.MoveTo(Mercury);
    Camera.TargetObject := Mercury;
    Camera.Position.X := 0.5;
    Camera.Position.Y := 1;
    Camera.Position.Z := 0.5;
    if chbInnerCore.Checked then
    begin
      // Mercury.Radius := 0.32;
      (PickObject as TGLSphere).Stop := 180;
      // Core
      Core := TGLSphere.CreateAsChild(Mercury);
      Core.Radius := 0.1;
      Core.Material.FrontProperties.Diffuse.Color := clrCoral;
      // Mantle
      Mantle := TGLDisk.CreateAsChild(Mercury);
      Mantle.InnerRadius := 0.1;
      Mantle.OuterRadius := 0.3;
      Mantle.Material.FrontProperties.Diffuse.Color := clrBrown;
      Mantle.NormalDirection := ndInside;
      Mantle.Slices := 64;
      Mantle.TurnAngle := 90;
      // Crust
      Crust := TGLDisk.CreateAsChild(Mercury);
      Crust.InnerRadius := 0.3;
      Crust.OuterRadius := 0.32;
      Crust.Material.FrontProperties.Diffuse.Color := clrYellow;
      Crust.NormalDirection := ndInside;
      Crust.Slices := 64;
      Crust.TurnAngle := 90;
    end
    else
    begin
      Mercury.Stop := 360;
      Core.Free;
      Crust.Free;
      Mantle.Free;
    end;
  end;
  // Венера ==================
  if (tvStarSys.Selected.Text = Venus.Name) then
  begin
    Camera.MoveTo(Venus);
    Camera.TargetObject := Venus;
    Camera.Position.X := 1;
    Camera.Position.Y := 1;
    Camera.Position.Z := 1;
    if chbInnerCore.Checked then
    begin
      // Venus.Radius := 0.75;
      (PickObject as TGLSphere).Stop := 180;
      // Core
      Core := TGLSphere.CreateAsChild(Venus);
      Core.Radius := 0.2;
      Core.Material.FrontProperties.Diffuse.Color := clrRed;
      // Mantle
      Mantle := TGLDisk.CreateAsChild(Venus);
      Mantle.InnerRadius := 0.2;
      Mantle.OuterRadius := 0.7;
      Mantle.Material.FrontProperties.Diffuse.Color := clrBrown;
      Mantle.NormalDirection := ndInside;
      Mantle.Slices := 64;
      Mantle.TurnAngle := 90;
      // Crust
      Crust := TGLDisk.CreateAsChild(Venus);
      Crust.InnerRadius := 0.7;
      Crust.OuterRadius := 0.75;
      Crust.Material.FrontProperties.Diffuse.Color := clrCoral;
      Crust.NormalDirection := ndInside;
      Crust.Slices := 64;
      Crust.TurnAngle := 90;
    end
    else
    begin
      Venus.Stop := 360;
      Core.Free;
      Crust.Free;
      Mantle.Free;
    end;
  end;
  // Earth ====================
  if (tvStarSys.Selected.Text = Earth.Name) or
     (tvStarSys.Selected.Text = Moon.Name) then
  begin
    if PickObject = Earth then
    begin
      Camera.MoveTo(Earth);
      Camera.TargetObject := Earth;
      Camera.Position.X := -1.2;
      Camera.Position.Y := 1;
      Camera.Position.Z := -1.2;
    end;
    if PickObject = Moon then
    begin
      Camera.MoveTo(Moon);
      Camera.TargetObject := Moon;
      Camera.Position.X := -0.6;
      Camera.Position.Y := 1;
      Camera.Position.Z := -0.6;
    end;

    if chbInnerCore.Checked then
    begin
      // Earth.Radius := 0.8;
      Earth.Stop := 180;
      // a half map of Earth
      Earth.Material.Texture.Image.LoadFromFile('earth_east.jpg'); // remove to MatLib
      // Core
      Core := TGLSphere.CreateAsChild(Earth);
      Core.Radius := 0.3;
      Core.Material.FrontProperties.Diffuse.Color := clrRed;
      // Mantle
      Mantle := TGLDisk.CreateAsChild(Earth);
      Mantle.InnerRadius := 0.3;
      Mantle.OuterRadius := 0.7;
      Mantle.Material.FrontProperties.Diffuse.Color := clrBrown;
      Mantle.NormalDirection := ndInside;
      Mantle.Slices := 64;
      Mantle.TurnAngle := 90;
      // Crust
      Crust := TGLDisk.CreateAsChild(Earth);
      Crust.InnerRadius := 0.7;
      Crust.OuterRadius := 0.8;
      Crust.Material.FrontProperties.Diffuse.Color := clrCoral;
      Crust.NormalDirection := ndInside;
      Crust.Slices := 64;
      Crust.TurnAngle := 90;
    end
    else
    begin
      Earth.Stop := 360;
      Core.Free;
      Crust.Free;
      Mantle.Free;
    end;
  end;

  // Mars ===================
  if (tvStarSys.Selected.Text = Mars.Name) or
     (tvStarSys.Selected.Text = Phobos.Name) or
     (tvStarSys.Selected.Text = Deimos.Name) then
  begin
    if PickObject = Mars then
    begin
      Camera.MoveTo(Mars);
      Camera.TargetObject := Mars;
      Camera.Position.X := -0.8;
      Camera.Position.Y := 1;
      Camera.Position.Z := 0.8;
    end;
    if PickObject = Phobos then
    begin
      Camera.MoveTo(dcPhobos);
      Camera.TargetObject := Phobos;
      Camera.Position.X := -1;
      Camera.Position.Y := 1;
      Camera.Position.Z := 1;
    end;
    if (tvStarSys.Selected.Text = Deimos.Name) then
    begin
      Camera.MoveTo(dcDeimos);
      Camera.TargetObject := Deimos;
      Camera.Position.X := 1;
      Camera.Position.Y := 1;
      Camera.Position.Z := 1;
    end;
    if chbInnerCore.Checked then
    begin
      // Mars.Radius := 0.4;
      Mars.Stop := 180;   // Half sphere
      Mars.Material.Texture.Image.LoadFromFile('mars_east.jpg');
      // Core
      Core := TGLSphere.CreateAsChild(Mars);
      Core.Radius := 0.1;
      Core.Material.FrontProperties.Diffuse.Color := clrRed;
      // Mantle
      Mantle := TGLDisk.CreateAsChild(Mars);
      Mantle.InnerRadius := 0.1;
      Mantle.OuterRadius := 0.3;
      Mantle.Material.FrontProperties.Diffuse.Color := clrBrown;
      Mantle.NormalDirection := ndInside;
      Mantle.Slices := 64;
      Mantle.TurnAngle := 90;
      // Crust
      Crust := TGLDisk.CreateAsChild(Mars);
      Crust.InnerRadius := 0.3;
      Crust.OuterRadius := 0.4;
      Crust.Material.FrontProperties.Diffuse.Color := clrCoral;
      Crust.NormalDirection := ndInside;
      Crust.Slices := 64;
      Crust.TurnAngle := 90;
    end
    else
    begin
      Mars.Stop := 360;
      Core.Free;
      Crust.Free;
      Mantle.Free;
    end;
  end;

  // Jupiter ==================
  if (tvStarSys.Selected.Text = Jupiter.Name) or
     (tvStarSys.Selected.Text = Io.Name) or
     (tvStarSys.Selected.Text = Europa.Name) or
     (tvStarSys.Selected.Text = Ganymede.Name) or
     (tvStarSys.Selected.Text = Callisto.Name) then
  begin
    if PickObject = Jupiter then
    begin
      Camera.MoveTo(Jupiter);
      Camera.TargetObject := Jupiter;
      Camera.Position.X := 7;
      Camera.Position.Y := 1;
      Camera.Position.Z := 7;
    end
    else   // for Jupiter moons
    begin
      Camera.Position.X := 1;
      Camera.Position.Y := 1;
      Camera.Position.Z := 1;
    end;
    if PickObject = Io then
    begin
      Camera.MoveTo(Io);
      Camera.TargetObject := Io;
    end;
    if PickObject = Europa then
    begin
      Camera.MoveTo(Europa);
      Camera.TargetObject := Europa;
    end;
    if PickObject = Ganymede then
    begin
      Camera.MoveTo(Ganymede);
      Camera.TargetObject := Ganymede;
    end;
    if PickObject = Callisto then
    begin
      Camera.MoveTo(Callisto);
      Camera.TargetObject := Callisto;
    end;
  end;

  //  Saturn ====================
  if (tvStarSys.Selected.Text = Saturn.Name) or
     (tvStarSys.Selected.Text = Titan.Name) or
     (tvStarSys.Selected.Text = Enceladus.Name) then
  begin
    if PickObject = Saturn then
    begin
      Camera.MoveTo(Saturn);
      Camera.TargetObject := Saturn;
      Camera.Position.X := 5;
      Camera.Position.Y := 0;
      Camera.Position.Z := 5;
    end
    else   // для лун Сатурна
    begin
      Camera.Position.X := 1;
      Camera.Position.Y := 1;
      Camera.Position.Z := 1;
    end;
    if PickObject = Enceladus then
    begin
      Camera.MoveTo(Enceladus);
      Camera.TargetObject := Enceladus;
    end;
    if PickObject = Titan then
    begin
      Camera.MoveTo(Titan);
      Camera.TargetObject := Titan;
    end;
  end;

  // Uranus ====================
  if (tvStarSys.Selected.Text = Uranus.Name) or
     (tvStarSys.Selected.Text = Titania.Name) or
     (tvStarSys.Selected.Text = Miranda.Name) then
  begin
    if PickObject = Uranus then
    begin
      Camera.MoveTo(Uranus);
      Camera.TargetObject := Uranus;
      Camera.Position.X := 5;
      Camera.Position.Y := 0;
      Camera.Position.Z := 5;
    end
    else   // for Uranus moons
    begin
      Camera.Position.X := 1;
      Camera.Position.Y := 1;
      Camera.Position.Z := 1;
    end;
    if PickObject = Miranda then
    begin
      Camera.MoveTo(Miranda);
      Camera.TargetObject := Miranda;
    end;
    if PickObject = Titania then
    begin
      Camera.MoveTo(Titania);
      Camera.TargetObject := Titania;
    end;
  end;

  // Neptune ====================
  if tvStarSys.Selected.Text = Neptune.Name then
  begin
    Camera.MoveTo(Neptune);
    Camera.TargetObject := Neptune;
    Camera.Position.X := 5;
    Camera.Position.Y := 0;
    Camera.Position.Z := 5;
  end;

  // Pluto ====================
  if tvStarSys.Selected.Text = Pluto.Name then
  begin
    Camera.MoveTo(Pluto);
    Camera.TargetObject := Pluto;
    Camera.Position.X := 1;
    Camera.Position.Y := 0;
    Camera.Position.Z := 1;
  end;
  svStarsys.Invalidate;
end;

//----------------------------------------------------------------------------
procedure TfrmStarSys.svStarsysMouseDown;
begin
  newPickObject := svStarsys.Buffer.GetPickedObject(X, Y);
  if newPickObject is TGLLines then
    exit;
  if newPickObject = nil then
    tvStarSys.Select(tvStarSys.Items[0])
  else
    tvStarSys.Select(TTreeNode(newPickObject.TagObject));
end;


//---------------------------------------------------------------------------
procedure TfrmStarSys.GetObjects(ParentNode: TTreeNode; SceneObject: TGLBaseSceneObject);
var
  n: Integer;
  Node: TTreeNode;
begin
  if SceneObject.Pickable then
  begin
    if (SceneObject.Name <> Camera.Name) then
    begin
      Node := tvStarSys.Items.AddChildObject(ParentNode, SceneObject.Name, SceneObject);
      SceneObject.TagObject := Node;
      for n := 0 to SceneObject.Count - 1 do
        GetObjects(Node, SceneObject.Children[n]);
    end;
  end;
end;

//---------------------------------------------------------------------------
procedure TfrmStarSys.UpdateTreeView;
begin
  tvStarSys.Items.Clear;
  GetObjects(tvStarSys.TopItem, SolarSystem);
end;

//---------------------------------------------------------------------------
procedure TfrmStarSys.AddBBox;
const
  c = 0.5;
  d = 0.3;

begin
  with bb_lines.Nodes do
  begin
    AddNode(c, c, c);
    AddNode(c, c, d);
    AddNode(c, c, -c);
    AddNode(c, c, -d);
    AddNode(-c, c, c);
    AddNode(-c, c, d);
    AddNode(-c, c, -c);
    AddNode(-c, c, -d);
    AddNode(c, -c, c);
    AddNode(c, -c, d);
    AddNode(c, -c, -c);
    AddNode(c, -c, -d);
    AddNode(-c, -c, c);
    AddNode(-c, -c, d);
    AddNode(-c, -c, -c);
    AddNode(-c, -c, -d);

    AddNode(c, c, c);
    AddNode(c, d, c);
    AddNode(c, -c, c);
    AddNode(c, -d, c);
    AddNode(-c, c, c);
    AddNode(-c, d, c);
    AddNode(-c, -c, c);
    AddNode(-c, -d, c);
    AddNode(c, c, -c);
    AddNode(c, d, -c);
    AddNode(c, -c, -c);
    AddNode(c, -d, -c);
    AddNode(-c, c, -c);
    AddNode(-c, d, -c);
    AddNode(-c, -c, -c);
    AddNode(-c, -d, -c);

    AddNode(c, c, c);
    AddNode(d, c, c);
    AddNode(-c, c, c);
    AddNode(-d, c, c);
    AddNode(c, -c, c);
    AddNode(d, -c, c);
    AddNode(-c, -c, c);
    AddNode(-d, -c, c);
    AddNode(c, c, -c);
    AddNode(d, c, -c);
    AddNode(-c, c, -c);
    AddNode(-d, c, -c);
    AddNode(c, -c, -c);
    AddNode(d, -c, -c);
    AddNode(-c, -c, -c);
    AddNode(-d, -c, -c);
  end;
end;

//---------------------------------------------------------------------------
procedure TfrmStarSys.UpdateBBox;
var
  v1, v2: TVector3f;

begin
  if PickObject = nil then
    Exit;
  if bb_lines.Nodes.Count = 0 then
    AddBBox;
  bb_lines.Matrix^ := PickObject.AbsoluteMatrix;
  if PickObject is TGLFreeForm then
  begin
    TGLFreeForm(PickObject).MeshObjects.GetExtents(v1, v2);
    v1 := VectorTransform(v1, PickObject.Matrix^);
    v2 := VectorTransform(v2, PickObject.Matrix^);
    bb_lines.Position.SetPoint(vectorlerp(v1, v2, 0.5));
    bb_lines.Scale.SetVector(PickObject.BoundingBox(false).BBox[0]);
    bb_lines.Scale.Scale(2);
  end
  else
  begin
    bb_lines.Scale.SetVector(PickObject.BoundingBox(false).BBox[0]);
    bb_lines.Scale.Scale(2.1);
  end;
  lineAxis.Matrix^ := PickObject.AbsoluteMatrix;
end;

//---------------------------------------------------------------------------
procedure TfrmStarSys.Sys_doglRender;
begin
  if PickObject <> nil then
  begin
    rci.GLStates.DepthFunc := cfAlways;
    UpdateBBox;
    lineAxis.Render(rci);
    bb_lines.Render(rci);
  end;
end;

//----------------------------------------------------------------------------
procedure TfrmStarSys.AsyncTimerTimer;
begin
  Caption := 'Звёздная система' + ' / ' + svStarsys.FramesPerSecondText(2);
  svStarsys.ResetPerformanceMonitor;
end;

//----------------------------------------------------------------------------
procedure TfrmStarSys.miExitClick(Sender: TObject);
begin
  Close;
end;

//----------------------------------------------------------------------------
procedure TfrmStarSys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
///  Atmosphere.Free;
end;

end.
