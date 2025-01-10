unit fdUniverse;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Imaging.jpeg,
  Vcl.ToolWin,
  Vcl.ActnMan,
  Vcl.ActnCtrls,
  Vcl.VirtualImage,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.ImgList,
  Vcl.VirtualImageList,

  GLS.BaseClasses,
  Stage.VectorGeometry,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.Cadencer,
  GLS.Objects,
  GLS.Coordinates,
  GLS.SimpleNavigation,
  GLS.VectorFileObjects,
  GLS.LensFlare,
  Stage.Utils,
  GLS.GeomObjects,
  GLS.Material,
  GLS.Color,
  GLS.Graph,
  GLS.Navigator,

  GLS.SkyDome,

  ddImages,
  fdForm,
  fdAbout,
  fdCoordinates,
  fdPointto,
  fdConstPolygons,
  fdSettings,
  fdHipparcos,
  fdHercRussel,

  gnugettext;

type
  TfrmUniverse = class(TFormI)
    GLScene: TGLScene;
    MainMenu: TMainMenu;
    Timer: TTimer;
    GLCadencer: TGLCadencer;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    miSaveAs: TMenuItem;
    miExit: TMenuItem;
    N2: TMenuItem;
    miEdit: TMenuItem;
    miUndo: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    GoTo1: TMenuItem;
    Object1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    miOptions: TMenuItem;
    miSettings: TMenuItem;
    miHide: TMenuItem;
    miShow: TMenuItem;
    N6: TMenuItem;
    miHelp: TMenuItem;
    miHelpWiki: TMenuItem;
    miHelpAbout: TMenuItem;
    Camera: TGLCamera;
    LightSun: TGLLightSource;
    dcPlanet: TGLDummyCube;
    sfPlanet: TGLSphere;
    GLSimpleNavigation: TGLSimpleNavigation;
    ffPlanet: TGLFreeForm;
    LensFlareSun: TGLLensFlare;
    LinesGrid: TGLLines;
    SkyDome: TGLSkyDome;
    LinesConstellations: TGLLines;
    LinesConstborders: TGLLines;
    TorusEquator: TGLTorus;
    TorusGreenwich: TGLTorus;
    DiskEcliptic: TGLDisk;
    StatusBar: TStatusBar;
    N7: TMenuItem;
    miView: TMenuItem;
    miPointto: TMenuItem;
    miTopoCoordinates: TMenuItem;
    CameraController: TGLCamera;
    N1: TMenuItem;
    miHipparcos: TMenuItem;
    miHercrussel: TMenuItem;
    PageControl: TPageControl;
    tsPlanets: TTabSheet;
    tsConstellations: TTabSheet;
    GLSceneViewer: TGLSceneViewer;
    VirtualImageChart: TVirtualImage;
    DiskRing: TGLDisk;
    tvPlanets: TTreeView;
    miConstPolygons: TMenuItem;
    XYZGridXZ: TGLXYZGrid;
    dcArrows: TGLDummyCube;
    ArrowLineX: TGLArrowLine;
    Arrow_X: TGLArrowLine;
    ArrowLineY: TGLArrowLine;
    Arrow_Y: TGLArrowLine;
    ArrowLineZ: TGLArrowLine;
    Arrow_Z: TGLArrowLine;
    ControlBar: TControlBar;
    tbMain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    GLUserInterface1: TGLUserInterface;
    GLNavigator: TGLNavigator;
    ToolButton4: TToolButton;
    tbView: TToolBar;
    btnChart: TToolButton;
    btnFigures: TToolButton;
    PanelConsts: TPanel;
    tvConstellations: TTreeView;
    PolygonAndromeda: TGLPolygon;
    tvZodiacs: TTreeView;
    VirtualImageFigures: TVirtualImage;
    stZodiacs: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
    procedure miExitClick(Sender: TObject);
    procedure miTopoCoordinatesClick(Sender: TObject);
    procedure miHelpAboutClick(Sender: TObject);
    procedure miPointtoClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miHipparcosClick(Sender: TObject);
    procedure miHercrusselClick(Sender: TObject);
    procedure tvPlanetsClick(Sender: TObject);
    procedure tvConstellationsClick(Sender: TObject);
    procedure tvConstellationsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure miConstPolygonsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chbPlanetGridClick(Sender: TObject);
    procedure chbAxiesClick(Sender: TObject);
    procedure miHelpWikiClick(Sender: TObject);
    procedure tvZodiacsClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
  private
    ConstellationsAlpha: Single;
  public
    FileName: TFileName;
    procedure LoadConstLines(const aDataPath: TFileName);
    procedure LoadConstBorders(const aDataPath: TFileName);
    procedure LoadStarBayers(const aDataPath: TFileName);
  end;

var
  frmUniverse: TfrmUniverse;
  AssetsDir, DataDir, CurrDir: TFileName;

const
  TimeMultiplier = 10.0;



implementation //--------------------------------------------------------------

{$R *.dfm}

procedure TfrmUniverse.FormCreate(Sender: TObject);
begin
  inherited;

  TP_GlobalIgnoreClass(TStaticText);
  TP_GlobalIgnoreClass(TFont);
  TP_GlobalIgnoreClass(TGLSceneObject);  // otherwise no persistent image on disk

  DataDir := ExtractFilePath(ParamStr(0)) + 'data\';;
  SetCurrentDir(DataDir);

  SkyDome.Visible := True;
  SkyDome.Bands.Clear;

  // Loadfile hipparcos.stars or Yale_BSC.stars for SkyDome
  CurrDir := DataDir + 'catalog\';
  SetCurrentDir(CurrDir);
  FileName := 'hipparcos.stars';
  if FileExists(FileName) then
    SkyDome.Stars.LoadStarsFile(FileName);

  // Load Planet map
  CurrDir := DataDir + 'map\';
  SetCurrentDir(CurrDir);
  sfPlanet.Material.Texture.Disabled := False;
end;

//--------------------------------------------------------------------
procedure TfrmUniverse.FormShow(Sender: TObject);
begin
  // Planets
  tvPlanets.Select(tvPlanets.Items[3]); // show Earth
  tvPlanetsClick(Self);
  miHelpWiki.Caption := tvPlanets.Selected.Text + ' in ' + 'Wikipedia...';

  // Constellations
  tvConstellations.Select(tvConstellations.Items[0]);  // goto to And
  tvConstellationsClick(Self);

  // Zodiacs
  tvZodiacs.Select(tvZodiacs.Items[0]);  // goto to Aries
  tvZodiacsClick(Self);
end;

//------------------------------------------------------------------
procedure TfrmUniverse.LoadConstLines(const aDataPath: TFileName);
var
  sl, line: TStrings;
  pos1, pos2: TAffineVector;
  I: Integer;
begin
  sl := TStringList.CReate;
  line := TStringList.CReate;
  sl.LoadFromFile(aDataPath + 'ConstLines.dat');
  for I := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[I];
    pos1 := LonLatToPos(StrToFloatDef(line[0]), StrToFloatDef(line[1]));
    linesConstellations.AddNode(pos1);
    pos2 := LonLatToPos(StrToFloatDef(line[2]), StrToFloatDef(line[3]));
    linesConstellations.AddNode(pos2);
  end;
  sl.Free;
  line.Free;
end;

//------------------------------------------------------------------
procedure TfrmUniverse.LoadConstBorders(const aDataPath: TFileName);
var
  sl, line: TStrings;
  SkyPos: TAffineVector;
  i: Integer;

begin
  sl := TStringList.CReate;
  line := TStringList.CReate;
  sl.LoadFromFile(aDataPath + 'ConstBounds.csv');
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i];
    SkyPos := LonLatToPos(StrToFloatDef(line[0]), StrToFloatDef(line[1]));
    linesConstborders.AddNode(SkyPos);
  end;
  sl.Free;
  line.Free;
end;

//------------------------------------------------------------------
procedure TfrmUniverse.LoadStarBayers(const aDataPath: TFileName);
begin
  //
end;

//------------------------------------------------------------------
// Rotation of celestial bodies on orbits
//------------------------------------------------------------------
procedure TfrmUniverse.GLCadencerProgress(Sender: TObject;
  const DeltaTime, NewTime: Double);
begin
  if frmSettings.CheckBoxRotate.Checked then
  begin
    sfPlanet.TurnAngle := sfPlanet.TurnAngle + DeltaTime * TimeMultiplier;
    ffPlanet.TurnAngle := ffPlanet.TurnAngle + DeltaTime * TimeMultiplier;
  end;

(*
  Changing velocity
  if frmSettings.CheckboxRotate.Checked then
    sfPlanet.TurnAngle := 10 * NewTime
  else
    sfPlanet.TurnAngle := 0;
*)
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.tvConstellationsClick(Sender: TObject);
begin
  VirtualImageChart.ImageIndex := tvConstellations.Selected.Index;
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.tvConstellationsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  tmpNode: TTreeNode;
begin
  tmpNode := (Sender as TTreeView).GetNodeAt(MousePos.X, MousePos.Y);
  if tmpNode <> nil then
    TTreeView(Sender).Selected := tmpNode;
end;

//--------------------------------------------------------------------------
procedure TfrmUniverse.tvPlanetsClick(Sender: TObject);
begin
  case tvPlanets.Selected.Index of
     0: begin
          // FileName : TFileName;
          sfPlanet.Material.Texture.Image.LoadFromFile('sun.jpg');
          sfPlanet.Radius := 12000; //  take from apc or planets.csv
          TorusGreenwich.MajorRadius := 12000;
          TorusEquator.MajorRadius := 12000;
        end;
     1: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('mercury.jpg');
          sfPlanet.Radius := 2440;
          TorusGreenwich.MajorRadius := 2440;
          TorusEquator.MajorRadius := 2440;
//          TorusEcliptic.PitchAngle := -23.5;
        end;
     2: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('venus.jpg');
          sfPlanet.Radius := 6052;
          TorusGreenwich.MajorRadius := 6052;
          TorusEquator.MajorRadius := 6052;
//          TorusEcliptic.PitchAngle := -23.5;
        end;
     3: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');
          sfPlanet.Radius := 6371;
          TorusGreenwich.MajorRadius := 6371;
          TorusEquator.MajorRadius := 6371;
          // add Moon as child
        end;
     4: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('mars.jpg');
          sfPlanet.Radius := 3390;
          TorusGreenwich.MajorRadius := 3390;
          TorusEquator.MajorRadius := 3390;
        end;
     5: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('jupiter.jpg');
          sfPlanet.Radius := 10000; //
          TorusGreenwich.MajorRadius := 10000;
          TorusEquator.MajorRadius := 10000;
          // add Io, Europa, Callisto Ganimede as childs
          //        Camera.ToTarget;
        end;
     6: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('saturn.jpg');
          sfPlanet.Radius := 9500; //
          TorusGreenwich.MajorRadius := 9500;
          TorusEquator.MajorRadius := 9500;
          // add Titan and Enceladus as childs
        end;
     7: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('uranus.jpg');
          sfPlanet.Radius := 7500; // 3390;
          TorusGreenwich.MajorRadius := 7500;
          TorusEquator.MajorRadius := 7500;
//          TorusEcliptic.PitchAngle := -28.3;
        end;
     8: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('neptune.jpg');
          sfPlanet.Radius := 8000; //24622;
          TorusGreenwich.MajorRadius := 8000; //24622;
          TorusEquator.MajorRadius := 8000; // 24622;
        end;
     9: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('pluto.jpg');
//          ffPlanet.Material.Texture.Image.LoadFromFile('charon.jpg');
          sfPlanet.Radius := 2377;
          TorusGreenwich.MajorRadius := 2377;
          TorusEquator.MajorRadius := 2377;
 //         TorusEcliptic.PitchAngle := -119.3;
          // add Charon as child
        end;

  end;

 (*
   // Rings
  if tvPlanets.Selected.Text = 'Saturn' then
  begin
     // Up
    DiskRing.Material.Texture.Image.LoadFromFile(FileName  + 'ring.jpg');
    DiskRing.Visible := True;
    //Down
    DiskRing.Material.Texture.Image.LoadFromFile(FileName  + 'ring.jpg');
    DiskRing.Visible := True;
  end
  else
  begin
    DiskRing.Visible := False;
  end;
*)
   miHelpWiki.Caption := tvPlanets.Selected.Text + ' in ' + 'Wikipedia...';
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.tvZodiacsClick(Sender: TObject);
begin
  VirtualImageFigures.ImageIndex := tvZodiacs.Selected.ImageIndex;
end;

procedure TfrmUniverse.miConstPolygonsClick(Sender: TObject);
begin
  with TFormConstBorders.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmUniverse.miTopoCoordinatesClick(Sender: TObject);
begin
  with TFormCoords.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmUniverse.miHercrusselClick(Sender: TObject);
begin
  with TFormHercrussel.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmUniverse.miHipparcosClick(Sender: TObject);
begin
  with TFormHipparcos.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmUniverse.miOpenClick(Sender: TObject);
begin
  //
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.miPointtoClick(Sender: TObject);
begin
  with TFormPointto.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.miSettingsClick(Sender: TObject);
begin
  frmSettings.Show;
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.miHelpAboutClick(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.chbAxiesClick(Sender: TObject);
begin
  sfPlanet.ShowAxes := frmSettings.CheckBoxAxes.Checked;
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.chbPlanetGridClick(Sender: TObject);
begin
  TorusGreenwich.Visible := frmSettings.CheckBoxPlanetgrid.Checked;
  TorusEquator.Visible := frmSettings.CheckBoxPlanetgrid.Checked;
end;

//----------------------------------------------------------------------------
procedure TfrmUniverse.miHelpWikiClick(Sender: TObject);
begin
  // if en then
  miHelpWiki.Caption := tvPlanets.Selected.Text + ' in ' + 'Wikipedia...';
  // or for en https://en.wikipedia.org/wiki/Saturn
  // else if ru then
  // for ru https://ru.ruwiki.ru/wiki/Сатурн
  // for ru e.g. https://ru.ruwiki.ru/wiki/(90377)_Седна
end;


//----------------------------------------------------------------------------
procedure TfrmUniverse.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
