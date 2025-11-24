unit faConstells;

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
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.VirtualImage,
  Vcl.ImgList,
  Vcl.ToolWin,

  GLS.Material,
  GLS.Cadencer,
  GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,

  Stage.Keyboard,
  GLS.Coordinates,
  GLS.Texture,
  GLS.SkyDome,
  GLS.Navigator,
  GLS.LensFlare,
  GLS.Objects,
  GLS.SimpleNavigation,
  GLS.VectorFileObjects,

  Astro.Globals,
  Astro.Utils,

  fmMixTextures,
  dmImages,
  dmDialogs
  ;

type
  TfrmConstells = class(TForm)
    PanelLeft: TPanel;
    StatusBar1: TStatusBar;
    PanelRight: TPanel;
    GLScene: TGLScene;
    GLCadencer: TGLCadencer;
    PanelBottom: TPanel;
    Camera: TGLCamera;
    LightSource: TGLLightSource;
    dcWorld: TGLDummyCube;
    LensFlare: TGLLensFlare;
    SkyDome: TGLSkyDome;
    sfPlanet: TGLSphere;
    ffPlanet: TGLFreeForm;
    ConstellationLines: TGLLines;
    ConstellationBorders: TGLLines;
    tvZodiacs: TTreeView;
    tvConstellations: TTreeView;
    VirtualImageChart: TVirtualImage;
    VirtualImageFigures: TVirtualImage;
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
    procedure tvConstellationsClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miTexCombineClick(Sender: TObject);
    procedure GLSimpleNavigation1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure tvZodiacsClick(Sender: TObject);
    procedure tvConstellationsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    DataDir, CatalogDir, StarDir, FileName : TFileName;
    ConstNames, PlanetMap: TFileName;
  public
    procedure HandleKeys(d: Double);
  end;

var
  frmConstells: TfrmConstells;

implementation //--------------------------------------------------------

{$R *.dfm}

//-----------------------------------------------------------------------
// Loading data and maps for SkyDome
//-----------------------------------------------------------------------
procedure TfrmConstells.FormCreate(Sender: TObject);
begin
  DataDir := GetDataPath(); //ExtractFilePath(ParamStr(0)) + 'data';
  SetCurrentDir(DataDir);
  SetCurrentDir(DataDir + 'cubemap');
  PlanetMap := DataDir + 'map\earth.jpg';

  sfPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile(PlanetMap);

  CatalogDir := DataDir + 'catalog\hipparcos.stars';

   // Skybox stars
  SkyDome.Visible := True;
  SkyDome.Bands.Clear;
  if FileExists(FileName) then
    SkyDome.Stars.LoadStarsFile(FileName);

  if FileExists(CatalogDir) then
  begin
    SkyDome.Bands.Clear;
    SkyDome.Stars.Clear;
    SkyDome.Stars.LoadStarsFile(CatalogDir);
    SkyDome.StructureChanged;
  end;

  ConstNames := DataDir + 'constellation\ConstNames.dat';
///    tvConstellations.LoadFromFile(ConstNames);
  (* // Short names
  ConstNames := DataDir + 'constellation\ConstShortNames.dat';
    tvConstellations.LoadFromFile(ConstNames);
  *)

  ffPlanet.Assign(sfPlanet);
end;

procedure TfrmConstells.FormShow(Sender: TObject);
begin
  // Constellations, goto to And
  frmConstells.tvConstellations.Select(frmConstells.tvConstellations.Items[0]);
  frmConstells.tvConstellationsClick(Self);
  // Zodiacs
  frmConstells.tvZodiacs.Select(frmConstells.tvZodiacs.Items[0]);  // goto to Aries
  frmConstells.tvZodiacsClick(Self);
end;

//-----------------------------------------------------------------------
// Open File of constellations
//-----------------------------------------------------------------------
procedure TfrmConstells.Open1Click(Sender: TObject);
begin
  // Load next skyculture for constellations ...
  DataModuleDialogs.OpenDialog.Filter := 'Constellation (*.dat)|*.dat';
  DataModuleDialogs.OpenDialog.InitialDir := DataDir;
  DataModuleDialogs.OpenDialog.DefaultExt := '*.dat';
  if DataModuleDialogs.OpenDialog.Execute then
  begin
    tvConstellations.LoadFromFile(DataModuleDialogs.OpenDialog.FileName);
    DataDir := ExtractFilePath(DataModuleDialogs.OpenDialog.FileName);
    tvConstellations.Select(tvConstellations.Items[0]);  // goto to new const
    tvConstellationsClick(Sender);
  end;
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.tvConstellationsClick(Sender: TObject);
begin
  VirtualImageChart.ImageIndex := tvConstellations.Selected.Index;
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.tvConstellationsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  tmpNode: TTreeNode;
begin
  tmpNode := (Sender as TTreeView).GetNodeAt(MousePos.X, MousePos.Y);
  if tmpNode <> nil then
    TTreeView(Sender).Selected := tmpNode;
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.tvZodiacsClick(Sender: TObject);
begin
  VirtualImageFigures.ImageIndex := tvZodiacs.Selected.ImageIndex;
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.Save1Click(Sender: TObject);
begin
  // Save TreeView
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.SaveAs1Click(Sender: TObject);
begin
  // Save TreeView As...
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
begin
 //
  HandleKeys(deltaTime);

end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.GLSimpleNavigation1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.HandleKeys(d: Double);
begin
  if (IsKeyDown('W') or IsKeyDown('Z')) then
    Camera.Move(d);
  if (IsKeyDown('S')) then
    Camera.Move(-d);
  if (IsKeyDown('A') or IsKeyDown('A')) then
    Camera.Slide(-d);
  if (IsKeyDown('D')) then
    Camera.Slide(d);

  if IsKeyDown(VK_ESCAPE) then
    Close;
end;


//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.miSettingsClick(Sender: TObject);
begin
//
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.miTexCombineClick(Sender: TObject);
begin
  with TFormTexCombine.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//-----------------------------------------------------------------------
//
//-----------------------------------------------------------------------
procedure TfrmConstells.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
