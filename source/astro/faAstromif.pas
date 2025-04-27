unit faAstromif;

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

  Space.Globals,
  Astro.Utils,

  faMixTextures,
  dmImages;

type
  TFormAstromif = class(TForm)
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
    GLSimpleNavigation1: TGLSimpleNavigation;
    OpenDialog: TOpenDialog;
    SkyDome: TGLSkyDome;
    sfPlanet: TGLSphere;
    ffPlanet: TGLFreeForm;
    ConstellationLines: TGLLines;
    ConstellationBorders: TGLLines;
    tvConstellations: TTreeView;
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
  private
    DataDir, StarDir, FileName : TFileName;
    ConstNames, PlanetMap: TFileName;
  public
    procedure HandleKeys(d: Double);
  end;

var
  FormAstromif: TFormAstromif;

implementation //--------------------------------------------------------

{$R *.dfm}

procedure TFormAstromif.FormCreate(Sender: TObject);
begin
  DataDir := GetDataPath(); //ExtractFilePath(ParamStr(0)) + 'data';
  SetCurrentDir(DataDir);
  CurrentPath := DataDir;
  SetCurrentDir(CurrentPath + '\cubemap');
  PlanetMap := CurrentPath + '\map\earth.jpg';

  sfPlanet.Material.Texture.Disabled := False;
  sfPlanet.Material.Texture.Image.LoadFromFile(PlanetMap);

  Catalog := CurrentPath + '\catalog\hipparcos.stars';

   // Skybox stars
  SkyDome.Visible := True;
  SkyDome.Bands.Clear;
  if FileExists(FileName) then
    SkyDome.Stars.LoadStarsFile(FileName);

  if FileExists(Catalog) then
  begin
    SkyDome.Bands.Clear;
    SkyDome.Stars.Clear;
    SkyDome.Stars.LoadStarsFile(Catalog);
    SkyDome.StructureChanged;
  end;


  ConstNames := CurrentPath + '\constellation\ConstNames.dat';
///    tvConstellations.LoadFromFile(ConstNames);
  (* // Short names
  ConstNames := CurrentPath + '\constellation\ConstShortNames.dat';
    tvConstellations.LoadFromFile(ConstNames);
  *)

  ffPlanet.Assign(sfPlanet);
end;

//-----------------------------------------------------------------------

procedure TFormAstromif.Open1Click(Sender: TObject);
begin
  // Load next skyculture for constellations ...
  OpenDialog.Filter := 'Constellation (*.dat)|*.dat';
  OpenDialog.InitialDir := DataDir;
  OpenDialog.DefaultExt := '*.dat';
  if OpenDialog.Execute then
  begin
    tvConstellations.LoadFromFile(OpenDialog.FileName);
    CurrentPath := ExtractFilePath(OpenDialog.FileName);
    tvConstellations.Select(tvConstellations.Items[0]);  // goto to new mif
    tvConstellationsClick(Sender);
  end;
end;

//-----------------------------------------------------------------------

procedure TFormAstromif.tvConstellationsClick(Sender: TObject);
begin
  //
end;

//-----------------------------------------------------------------------

procedure TFormAstromif.Save1Click(Sender: TObject);
begin
  // Save TreeView
end;

//-----------------------------------------------------------------------

procedure TFormAstromif.SaveAs1Click(Sender: TObject);
begin
  // Save TreeView As...
end;

//-----------------------------------------------------------------------

procedure TFormAstromif.GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
begin
 //
  HandleKeys(deltaTime);

end;

procedure TFormAstromif.GLSimpleNavigation1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

//-----------------------------------------------------------------------

procedure TFormAstromif.HandleKeys(d: Double);
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

procedure TFormAstromif.miSettingsClick(Sender: TObject);
begin
//
end;

//-----------------------------------------------------------------------

procedure TFormAstromif.miTexCombineClick(Sender: TObject);
begin
  with TFormTexCombine.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormAstromif.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
