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
  fmForm;

type
  TfrmOptions = class(TFormI)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    tsDisplay: TTabSheet;
    CheckBoxAxes: TCheckBox;
    tsDatatime: TTabSheet;
    PanelScale: TPanel;
    lblScaleX: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    tvSettings: TTreeView;
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
    CheckBoxRotate: TCheckBox;
    GroupBoxConstallations: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBoxCubemap: TCheckBox;
    ComboBoxVclStyles: TComboBox;
    lbStyle: TLabel;
    cbSplashStart: TCheckBox;
    grbShowPlanets: TGroupBox;
    chbRotation: TCheckBox;
    chbAxis: TCheckBox;
    chbShading: TCheckBox;
    CheckBoxCore: TCheckBox;
    CheckBoxAtmosfera: TCheckBox;
    chbClouds: TCheckBox;
    chbCartographicGrid: TCheckBox;
    chbHide: TCheckBox;
    CheckBoxPlanetgrid: TCheckBox;
    gbShowStars: TGroupBox;
    chbSkyGrid: TCheckBox;
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
    procedure tvSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
    procedure chbConstellationsClick(Sender: TObject);
    procedure chbAxisClick(Sender: TObject);
    procedure CheckBoxPlanetgridClick(Sender: TObject);
    procedure chbHideClick(Sender: TObject);
    procedure chbRotationClick(Sender: TObject);
  private
    CurrDir: TFileName;
    Node: TTreeNode;
    Nodes: TTreeNodes;
    procedure ReadIniFile; override; // from base class
    procedure WriteIniFile;
  public
    //
  end;

var
  frmOptions: TfrmOptions;

implementation //------------------------------------------------------------


{$R *.dfm}

uses
  fmAstroScene;

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

  // Styles for interface
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Fill items with indices for TreeView
  for I := 0 to tvSettings.Items.Count - 1 do
  begin
    tvSettings.Items[i].ImageIndex := 0;
    tvSettings.Items[i].SelectedIndex := 1;
  end;

  // Initial highlighted item
  tvSettings.Items[1].Selected := True;
  tvSettingsClick(Self);
  tvSettings.Items[1].DropHighlighted := True;
  tvSettings.FullExpand;
  inherited;
end;

//-----------------------------------------------------------------
// Change interface style
//-----------------------------------------------------------------
procedure TfrmOptions.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

//-----------------------------------------------------------------
// Show axis for celestial bodies
//-----------------------------------------------------------------
procedure TfrmOptions.chbAxisClick(Sender: TObject);
begin
  CheckBoxAxes.Checked := not CheckBoxAxes.Checked;
  frmAllPlanets.sfPlanet.ShowAxes := CheckBoxAxes.Checked;
end;

//-----------------------------------------------------------------
// Show lines, borders, figures and names of constellations
//-----------------------------------------------------------------

procedure TfrmOptions.CheckBoxPlanetGridClick(Sender: TObject);
begin
  frmAllPlanets.TorusGreenwich.Visible := frmOptions.CheckBoxPlanetgrid.Checked;
  frmAllPlanets.TorusEquator.Visible := frmOptions.CheckBoxPlanetgrid.Checked;
end;

//-----------------------------------------------------------------
// Show lines, borders, figures and names of constellations
//-----------------------------------------------------------------
procedure TfrmOptions.chbConstellationsClick(Sender: TObject);
begin
  CurrDir := frmAllPlanets.DataDir + '\constellation\';
  SetCurrentDir(CurrDir);
  if chbConstLines.Checked then
    frmAllPlanets.LoadConstLines(CurrDir)
  else
    frmAllPlanets.ConstLines.Nodes.Clear;
  if chbConstBounds.Checked then
    frmAllPlanets.LoadConstBorders(CurrDir)
  else
    frmAllPlanets.ConstBorders.Nodes.Clear;
end;

//------------------------------------------------------------------
// Show/Hide panels and the planet
//------------------------------------------------------------------
procedure TfrmOptions.chbHideClick(Sender: TObject);
begin
  frmAllplanets.PanelLeft.Visible := chbHide.Checked;
  frmAllplanets.StatusBar.Visible := chbHide.Checked;
  frmAllplanets.ControlBar.Visible := chbHide.Checked;
  frmAllplanets.sfPlanet.Visible := chbHide.Checked;
  (*
  if chbHide.Checked then
    frmAllplanets.BorderStyle := bsNone
  else
    frmAllplanets.BorderStyle := bsSizeable;
  *)
end;

//------------------------------------------------------------------
// Planet rotations
//------------------------------------------------------------------
procedure TfrmOptions.chbRotationClick(Sender: TObject);
begin
  //
end;

//-----------------------------------------------------------------
// Active page of PageControl
//-----------------------------------------------------------------
procedure TfrmOptions.tvSettingsClick(Sender: TObject);
begin
  inherited;
  tvSettings.Items[1].DropHighlighted := False;
  case tvSettings.Selected.Index of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsDisplay;
     3: PageControl.ActivePage := tsDatatime;
     4: PageControl.ActivePage := tsPlanets;
     5: PageControl.ActivePage := tsStars;
     6: PageControl.ActivePage := tsGalaxy;
  end;
end;

//--------------------------------------------------------------------
// Reading settings from ini file
//--------------------------------------------------------------------
procedure TfrmOptions.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxes.Checked := IniFile.ReadBool(frmOptions.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(frmOptions.Name, CheckBoxRotate.Name, True);
  finally
    IniFile.Free;
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
    IniFile.WriteBool(frmOptions.Name, CheckBoxAxes.Name, CheckBoxAxes.Checked);
    IniFile.WriteBool(frmOptions.Name, CheckBoxRotate.Name, CheckBoxRotate.Checked);
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
