(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fdTetranet_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLiteWrapper.Stat,

  Vcl.ExtDlgs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.CheckLst,
  Vcl.ComCtrls,
  Vcl.Imaging.jpeg,
  Vcl.ToolWin,

  GLS.Cadencer,
  GLS.Scene,
  Stage.VectorGeometry,
  GLS.VectorFileObjects,
  GLS.GeomObjects,
  GLS.Objects,
  GLS.Coordinates,
  GLS.BaseClasses,
  GLS.SceneViewer,
  Stage.VectorTypes,
  GLS.Color,
  GLS.Graph,
  GLS.SimpleNavigation,
  GLS.FileJPEG,
  GLS.SkyDome,
  GLS.Material,

  fdOptions_ru;


type

//---------------------------------------------------------------------------

DelaunayBase = record
	color: Single; //float *color;
	nodeCount: Integer;
	node: PDouble;   //double **node;
	edgeCount: Integer;
	edge: PInteger;  // int **edge;
	//int faceCount;
	//int **face;
	//int tetraCount;
  //int **tetra;
end;

VoronoiBase = record
	color: Single; //float *color;
	nodeCount: Integer;
	node: PDouble;   //double **node;
	edgeCount: Integer;
	edge: PInteger;  // int **edge;
	//int faceCount;
	//int **face;
end;

type
  TFormTetranet = class(TForm)
    StatusBar1: TStatusBar;
    GLSceneViewer: TGLSceneViewer;
    PanelRight: TPanel;
    GLScene: TGLScene;
    Camera: TGLCamera;
    dcGalablock: TGLDummyCube;
    GLLines1: TGLLines;
    GLPoints1: TGLPoints;
    GLPolygon1: TGLPolygon;
    ffSolSphere: TGLFreeForm;
    LightSource1: TGLLightSource;
    GLCadencer: TGLCadencer;
    Timer1: TTimer;
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miModeling: TMenuItem;
    miPoints: TMenuItem;
    miDelaunay: TMenuItem;
    miVoronoi: TMenuItem;
    miView: TMenuItem;
    OpenTextFileDialog1: TOpenTextFileDialog;
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    GLSimpleNavigation1: TGLSimpleNavigation;
    xyzGrid: TGLXYZGrid;
    miTools: TMenuItem;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    PanelLeft: TPanel;
    miOpen: TMenuItem;
    N2: TMenuItem;
    miExit: TMenuItem;
    PanelTop: TPanel;
    SolCube: TGLCube;
    circSphere: TGLSphere;
    circDisk: TGLDisk;
    SkyBox: TGLSkyBox;
    boxPlane: TGLPlane;
    Content1: TMenuItem;
    N1: TMenuItem;
    miOptions: TMenuItem;
    Torus: TGLTorus;
    LightSource2: TGLLightSource;
    HeightField: TGLHeightField;
    YZGrid: TGLXYZGrid;
    XZGrid: TGLXYZGrid;
    XYGrid: TGLXYZGrid;
    ControlBar: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PanelBottom: TPanel;
    PageControl1: TPageControl;
    tsDatasets: TTabSheet;
    tsModeling: TTabSheet;
    tvDatasets: TTreeView;
    tvModeling: TTreeView;
    FDTable: TFDTable;
    SkySphere: TGLSphere;
    GLMaterialLibrary: TGLMaterialLibrary;
    miDrake: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miExitClick(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
    procedure miOptionsClick(Sender: TObject);
    procedure GLSceneViewerDblClick(Sender: TObject);
    procedure GLSceneViewerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    PathToData, CurrentDir: TFileName;
    mx, my, dmx, dmy: Integer;
    function GetDataDir(): TFileName;
  public
  end;

var
  FormTetranet: TFormTetranet;

  // All Delaunay records
  O_Delaunay,
  B_Delaunay,
  A_Delaunay,
  F_Delaunay,
  G_Delaunay,
  K_Delaunay,
  M_Delaunay: DelaunayBase;

  // All Voronoi records
  O_Voronoi,
  B_Voronoi,
  A_Voronoi,
  F_Voronoi,
  G_Voronoi,
  K_Voronoi,
  M_Voronoi: VoronoiBase;

const
// Colors for each star class
///lightblue: TGLColor = [0, 0.8, 1];  // float lightblue[3] = {0, 0.8, 1};

(*
float skyblue[3] = {0.803, 1, 1};
float white[3] = {1, 1, 1};
float lightyellow[3] = {0.996, 1, 0.6};
float yellow[3] = {1, 1, 0.003};
float orange[3] = {1, 0.4, 0};
float red[3] = {0.992, 0, 0.003};
*)
  prefix: string = '.\..\..\DATA\';

implementation //============================================================

{$R *.dfm}

function TFormTetranet.GetDataDir(): TFileName;
var
  path: TFileName;
begin
  path := LowerCase(ExtractFilePath(ParamStr(0)));
//  Delete(path, Pos('bin', path), Length(path));  // if exe in bin dir
  path := IncludeTrailingPathDelimiter(path) + 'data';
  SetCurrentDir(path);
  Result := path;
end;

//-----------------------------------------------

procedure TFormTetranet.FormCreate(Sender: TObject);
begin
  PathToData := GetDataDir(); // путь к данным
  CurrentDir := PathToData + '\image';
  SetCurrentDir(CurrentDir);

  circDisk.Material.Texture.Disabled := False;
//  circDisk.Material.Texture.Image.LoadFromFile('galaxy.jpg');

  boxPlane.Material.Texture.Disabled := False;
 /// boxPlane.Material.Texture.Image.LoadFromFile('galaxy.jpg');

  CurrentDir := PathToData + '\map';
  SetCurrentDir(CurrentDir);
  SkySphere.Material.Texture.Disabled := False;
///  SkySphere.Material.Texture.Image.LoadFromFile('starmap.jpg');
 // SkySphere.Material.Texture.Image.LoadFromFile('constellation_boundaries.jpg');

	miPoints.Checked := True;
 //	Form1.Caption := 'HYG 3D | Points mode';

	miModeling.Enabled := False;

end;

//------------------------------------------------------------------

procedure TFormTetranet.GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
begin
///  dcGalablock.TurnAngle := dcGalablock.TurnAngle - deltaTime * 10; // timeMultiplier / 29.5;

end;

//------------------------------------------------------------------

procedure TFormTetranet.GLSceneViewerDblClick(Sender: TObject);
begin
  GLSceneViewer.OnMouseMove := nil;
  if WindowState = wsMaximized then
  begin
    WindowState := wsNormal;
    BorderStyle := bsSizeable; // bsSizeToolWin;
    PanelRight.Visible := True;
    PanelLeft.Visible := True;
    ControlBar.Visible := True;
  end
  else
  begin
    BorderStyle := bsNone;
    WindowState := wsMaximized;
    PanelRight.Visible := False;
    PanelLeft.Visible := False;
    ControlBar.Visible := False;
  end;
  GLSceneViewer.OnMouseMove := GLSceneViewerMouseMove;
end;

procedure TFormTetranet.GLSceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	 mx := X; my := Y;
end;

procedure TFormTetranet.GLSceneViewerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssLeft] then
  begin
    dmx := dmx + (mx - X);
    dmy := dmy + (my - Y);
  end
  else if Shift = [ssRight] then
    Camera.FocalLength := Camera.FocalLength *
      PowerSingle(1.05, (my - Y) * 0.1);
  mx := X;
  my := Y;
end;

//------------------------------------------------------------------

procedure TFormTetranet.miOptionsClick(Sender: TObject);
begin
  frmOptions.Show;
end;

procedure TFormTetranet.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
