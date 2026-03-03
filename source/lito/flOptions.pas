unit flOptions;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.UITypes,
  System.Variants,
  System.Classes,
  System.IniFiles,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.Outline,
  Vcl.Samples.DirOutln,
  Vcl.ColorGrd,
  Vcl.Samples.Gauges,
  Vcl.CheckLst,
  Vcl.WinXCtrls,
  Vcl.NumberBox,
  Vcl.Themes,

  Astro.Globals,
  fmFormFirst;

type
  TfrmOptions = class(TFormFirst)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsMap: TTabSheet;
    tsScene: TTabSheet;
    tsDatatime: TTabSheet;
    PanelScale: TPanel;
    lblScaleX: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    tvOptions: TTreeView;
    PanelTop: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ImageList: TImageList;
    tsGalaxy: TTabSheet;
    tsStars: TTabSheet;
    tsPlanets: TTabSheet;
    lbExoplanets: TListBox;
    tsGeneral: TTabSheet;
    gbxCoordinateSys: TGroupBox;
    rgrSystem: TRadioGroup;
    rgUnits: TRadioGroup;
    gbStarColors: TGroupBox;
    ShapeM: TShape;
    ShapeK: TShape;
    ShapeG: TShape;
    ShapeF: TShape;
    ShapeA: TShape;
    ShapeO: TShape;
    ShapeB: TShape;
    Label4: TLabel;
    Label3: TLabel;
    clbStarColors: TCheckListBox;
    ListBox2: TListBox;
    stColor: TStaticText;
    RadioGroup1: TRadioGroup;
    chbSysTime: TCheckBox;
    SpinEditPrecision: TSpinEdit;
    LabelPrecision: TLabel;
    GroupBoxConstallations: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    CheckBox2: TCheckBox;
    grbShowPlanets: TGroupBox;
    chbRotate: TCheckBox;
    chbAxes: TCheckBox;
    chbCore: TCheckBox;
    chbAtmosphere: TCheckBox;
    chbClouds: TCheckBox;
    chbHide: TCheckBox;
    chbPlanetgrid: TCheckBox;
    chbShading: TCheckBox;
    chbSkyGrid: TCheckBox;
    gbShowStars: TGroupBox;
    grbPlanetGuts: TGroupBox;
    LabelIce: TLabel;
    LabelWater: TLabel;
    LabelCrust: TLabel;
    LabelMantle: TLabel;
    LabelCore: TLabel;
    nbIce: TNumberBox;
    nbWater: TNumberBox;
    nbCrust: TNumberBox;
    nbMantle: TNumberBox;
    nbCore: TNumberBox;
    grbPlanetParams: TGroupBox;
    LabelPlanetTilt: TLabel;
    LabelPlanetDensity: TLabel;
    LabelPlanetRadius: TLabel;
    LabelGravityAccel: TLabel;
    Label6: TLabel;
    nbTilt: TNumberBox;
    nbDensity: TNumberBox;
    nbRadius: TNumberBox;
    nbGravityAccel: TNumberBox;
    NumberBox7: TNumberBox;
    CheckBoxCubemap: TCheckBox;
    cbSplashStart: TCheckBox;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chbConstellationsClick(Sender: TObject);
    procedure chbAxesClick(Sender: TObject);
    procedure chbRotateClick(Sender: TObject);
    procedure chbCoreClick(Sender: TObject);
    procedure chbPlanetGridClick(Sender: TObject);
    procedure chbHideClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure chbAtmosphereClick(Sender: TObject);
  private
    CurrDir: TFileName;
    Node: TTreeNode;
    Nodes: TTreeNodes;
    procedure WriteIniFile;
  public
    //
  end;

var
  frmOptions: TfrmOptions;

implementation //==============================================================


{$R *.dfm}

uses
  flLithoneta;

//-------------------------------------------------------------
// Form Create
//-------------------------------------------------------------
procedure TfrmOptions.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
begin
  // Read saved settings
  ReadIniFile;

  // Fill items with indices for TreeView
  for I := 0 to tvOptions.Items.Count - 1 do
  begin
    tvOptions.Items[i].ImageIndex := 0;
    tvOptions.Items[i].SelectedIndex := 1;
    tvOptions.Items[i].StateIndex := 0;
  end;

  // Initial highlighted item
  tvOptions.Items[1].Selected := True;
  tvOptionsClick(Self);
  tvOptions.Items[1].DropHighlighted := True;
  tvOptions.FullExpand;
  inherited;
end;

//---------------------------------------------------
// Show the planet core with mantle
//---------------------------------------------------
procedure TfrmOptions.chbCoreClick(Sender: TObject);
begin
  with frmAstroScene do
  begin
    // Make ffPlanet invisible and replace it with sfPlanet and glDisks visible
    PlanetPath := CurrentStar + tvMoons.Selected.Text;
    if FileExists(PlanetPath + '_core.jpg') then
      diskMantle.Material.Texture.Image.LoadFromFile(PlanetPath + '_core.jpg')
    else
      diskMantle.Material.Texture.Image.LoadFromFile(PlanetPath + '.jpg');
    sfCore.Visible := chbCore.Checked;
    if sfCore.Visible then
      sfPlanet.Stop := 180
    else
      sfPlanet.Stop := 360;
  end;
end;

//-----------------------------------------------------------------
// Show atmosphere
//-----------------------------------------------------------------
procedure TfrmOptions.chbAtmosphereClick(Sender: TObject);
begin
  frmAstroScene.DirectOpenGL.Visible := chbAtmosphere.Checked;
end;

//-----------------------------------------------------------------
// Show axes for celestial bodies
//-----------------------------------------------------------------
procedure TfrmOptions.chbAxesClick(Sender: TObject);
begin
  frmAstroScene.sfPlanet.ShowAxes := chbAxes.Checked;
end;

//-----------------------------------------------------------------
// Show lines, borders, figures and names of constellations
//-----------------------------------------------------------------

procedure TfrmOptions.chbPlanetGridClick(Sender: TObject);
begin
  frmAstroScene.TorusGreenwich.Visible := chbPlanetgrid.Checked;
  frmAstroScene.TorusEquator.Visible := chbPlanetgrid.Checked;
end;

//-----------------------------------------------------------------
// Show lines, borders, figures and names of constellations
//-----------------------------------------------------------------
procedure TfrmOptions.chbConstellationsClick(Sender: TObject);
begin
  CurrDir := frmAstroScene.DataDir + '\constellation\';
  SetCurrentDir(CurrDir);
  if chbConstLines.Checked then
    frmAstroScene.LoadConstLines(CurrDir)
  else
    frmAstroScene.ConstLines.Nodes.Clear;
  if chbConstBounds.Checked then
    frmAstroScene.LoadConstBorders(CurrDir)
  else
    frmAstroScene.ConstBorders.Nodes.Clear;
  // Also Figures
end;

//------------------------------------------------------------------
// Show/Hide panels and the planet
//------------------------------------------------------------------
procedure TfrmOptions.chbHideClick(Sender: TObject);
begin
  frmAstroScene.PanelLeft.Visible := chbHide.Checked;
  frmAstroScene.PanelRight.Visible := chbHide.Checked;
  frmAstroScene.StatusBar.Visible := chbHide.Checked;
  frmAstroScene.ControlBarTop.Visible := chbHide.Checked;
  frmAstroScene.sfPlanet.Visible := chbHide.Checked;
  (*
  if chbHide.Checked then
    frmAstroScene.BorderStyle := bsNone
  else
    frmAstroScene.BorderStyle := bsSizeable;
  *)
end;

//------------------------------------------------------------------
// Planet rotations
//------------------------------------------------------------------
procedure TfrmOptions.chbRotateClick(Sender: TObject);
begin
  frmAstroScene.GLCadencer.Enabled := chbRotate.Checked;
end;

//-----------------------------------------------------------------
// Active page of PageControl
//-----------------------------------------------------------------
procedure TfrmOptions.tvOptionsClick(Sender: TObject);
begin
  inherited;
  tvOptions.Items[1].DropHighlighted := False;
  case tvOptions.Selected.Index of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsMap;
     2: PageControl.ActivePage := tsScene;
     3: PageControl.ActivePage := tsDatatime;
     4: PageControl.ActivePage := tsPlanets;
     5: PageControl.ActivePage := tsStars;
     6: PageControl.ActivePage := tsGalaxy;
  end;
end;

//---------------------------------------------------------
// Writing settingd in ini file
//---------------------------------------------------------
procedure TfrmOptions.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteBool(frmOptions.Name, chbAxes.Name, chbAxes.Checked);
    IniFile.WriteBool(frmOptions.Name, chbRotate.Name, chbRotate.Checked);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//-----------------------------------------------------------
// OK click
//-----------------------------------------------------------
procedure TfrmOptions.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  frmOptions.Close;
end;

end.
