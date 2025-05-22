unit fmOptions;

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

  Space.Globals,
  fmFormI;

type
  TFormOptions = class(TFormI)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    tsDisplay: TTabSheet;
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
    ComboBoxVclStyles: TComboBox;
    lbStyle: TLabel;
    cbSplashStart: TCheckBox;
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
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
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
  FormOptions: TFormOptions;

implementation //------------------------------------------------------------


{$R *.dfm}

uses
  fmAstroScene;

//-------------------------------------------------------------
// Form Create
//-------------------------------------------------------------
procedure TFormOptions.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
begin
  // Read saved settings
  ReadIniFile;

  // Styles for interface
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

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
// Styles of Interface
//---------------------------------------------------
procedure TFormOptions.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

//---------------------------------------------------
// Show the planet core with mantle
//---------------------------------------------------
procedure TFormOptions.chbCoreClick(Sender: TObject);
begin
  with FormAstroScene do
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
procedure TFormOptions.chbAtmosphereClick(Sender: TObject);
begin
  FormAstroScene.DirectOpenGL.Visible := chbAtmosphere.Checked;
end;

//-----------------------------------------------------------------
// Show axes for celestial bodies
//-----------------------------------------------------------------
procedure TFormOptions.chbAxesClick(Sender: TObject);
begin
  FormAstroScene.sfPlanet.ShowAxes := chbAxes.Checked;
end;

//-----------------------------------------------------------------
// Show lines, borders, figures and names of constellations
//-----------------------------------------------------------------

procedure TFormOptions.chbPlanetGridClick(Sender: TObject);
begin
  FormAstroScene.TorusGreenwich.Visible := chbPlanetgrid.Checked;
  FormAstroScene.TorusEquator.Visible := chbPlanetgrid.Checked;
end;

//-----------------------------------------------------------------
// Show lines, borders, figures and names of constellations
//-----------------------------------------------------------------
procedure TFormOptions.chbConstellationsClick(Sender: TObject);
begin
  CurrDir := FormAstroScene.DataDir + '\constellation\';
  SetCurrentDir(CurrDir);
  if chbConstLines.Checked then
    FormAstroScene.LoadConstLines(CurrDir)
  else
    FormAstroScene.ConstLines.Nodes.Clear;
  if chbConstBounds.Checked then
    FormAstroScene.LoadConstBorders(CurrDir)
  else
    FormAstroScene.ConstBorders.Nodes.Clear;
  // Also Figures
end;

//------------------------------------------------------------------
// Show/Hide panels and the planet
//------------------------------------------------------------------
procedure TFormOptions.chbHideClick(Sender: TObject);
begin
  FormAstroScene.PanelLeft.Visible := chbHide.Checked;
  FormAstroScene.PanelRight.Visible := chbHide.Checked;
  FormAstroScene.StatusBar.Visible := chbHide.Checked;
  FormAstroScene.ControlBar.Visible := chbHide.Checked;
  FormAstroScene.sfPlanet.Visible := chbHide.Checked;
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
procedure TFormOptions.chbRotateClick(Sender: TObject);
begin
  FormAstroScene.Cadencer.Enabled := chbRotate.Checked;
end;

//-----------------------------------------------------------------
// Active page of PageControl
//-----------------------------------------------------------------
procedure TFormOptions.tvOptionsClick(Sender: TObject);
begin
  inherited;
  tvOptions.Items[1].DropHighlighted := False;
  case tvOptions.Selected.Index of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsDisplay;
     3: PageControl.ActivePage := tsDatatime;
     4: PageControl.ActivePage := tsPlanets;
     5: PageControl.ActivePage := tsStars;
     6: PageControl.ActivePage := tsGalaxy;
  end;
end;

//---------------------------------------------------------
// Writing settingd in ini file
//---------------------------------------------------------
procedure TFormOptions.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteBool(FormOptions.Name, chbAxes.Name, chbAxes.Checked);
    IniFile.WriteBool(FormOptions.Name, chbRotate.Name, chbRotate.Checked);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//-----------------------------------------------------------
// OK click
//-----------------------------------------------------------
procedure TFormOptions.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  FormOptions.Close;
end;

end.
