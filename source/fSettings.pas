unit fSettings;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Beacon.Components,
  System.Beacon,
  System.Bluetooth,

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
  Vcl.NumberBox;

type
  TFormSettings = class(TForm)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    LabelProgram: TLabel;
    LabelData: TLabel;
    PanelExePath: TPanel;
    cbDataPath: TComboBox;
    ButtonBrowsePathData: TButton;
    CheckBoxLoadProject: TCheckBox;
    CheckBoxSaveProject: TCheckBox;
    tsDisplay: TTabSheet;
    LabelBackground: TLabel;
    CheckBoxAxes: TCheckBox;
    PanelBackground: TPanel;
    CheckBoxCoordinates: TCheckBox;
    cbxTwoSideLighting: TCheckBox;
    tsMaterial: TTabSheet;
    ListView: TListView;
    ButtonModifyMat: TButton;
    tvSettings: TTreeView;
    PanelTop: TPanel;
    ImageList: TImageList;
    tsGalaxy: TTabSheet;
    tsStars: TTabSheet;
    tsPlanets: TTabSheet;
    LabelDiameter: TLabel;
    Gauge1: TGauge;
    ColorGrid1: TColorGrid;
    SpinEdit1: TSpinEdit;
    rgLanguage: TRadioGroup;
    cbSplashStart: TCheckBox;
    tsGeneral: TTabSheet;
    tsFlights: TTabSheet;
    gbxCoordinateSys: TGroupBox;
    chbEquatorial: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    rgrSystem: TRadioGroup;
    rgUnits: TRadioGroup;
    PanelTitle: TPanel;
    LabelA: TLabel;
    LabelB: TLabel;
    LabelDistance: TLabel;
    LabelVelocity: TLabel;
    LabelFlightTime: TLabel;
    SearchBoxA: TSearchBox;
    trbVelocity: TTrackBar;
    stFlightTime: TStaticText;
    SearchBoxB: TSearchBox;
    EditDistance: TEdit;
    stTrackBar: TStaticText;
    gbFindPath: TGroupBox;
    chbOnTetramesh: TCheckBox;
    chbAvoidHazards: TCheckBox;
    Button1: TButton;
    SpinEditPrecision: TSpinEdit;
    LabelPrecision: TLabel;
    PanelScale: TPanel;
    lblScaleX: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    grbPlanetGuts: TGroupBox;
    LabelIce: TLabel;
    nbIce: TNumberBox;
    nbWater: TNumberBox;
    LabelWater: TLabel;
    nbCrust: TNumberBox;
    LabelCrust: TLabel;
    nbMantle: TNumberBox;
    LabelMantle: TLabel;
    nbCore: TNumberBox;
    LabelCore: TLabel;
    chlbStarClasses: TCheckListBox;
    grbPlanetShow: TGroupBox;
    chbRotate: TCheckBox;
    chbShowAxes: TCheckBox;
    CheckBox4: TCheckBox;
    chbPlanetGuts: TCheckBox;
    ButtonGrid: TButton;
    GroupBox1: TGroupBox;
    nbTilt: TNumberBox;
    LabelPlanetTilt: TLabel;
    nbDensity: TNumberBox;
    LabelPlanetDensity: TLabel;
    nbRadius: TNumberBox;
    LabelPlanetRadius: TLabel;
    nbRadiusEcv: TNumberBox;
    Label3: TLabel;
    nbRadiusPol: TNumberBox;
    Label4: TLabel;
    nbGravityAccel: TNumberBox;
    LabelGravityAccel: TLabel;
    NumberBox7: TNumberBox;
    Label6: TLabel;
    procedure tvSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private
    //
  public
    //
    Node: TTreeNode;
    Nodes: TTreeNodes;
  end;

var
  FormSettings: TFormSettings;

//================================================
implementation

{$R *.dfm}

procedure TFormSettings.ButtonOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSettings.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  // спектральные классы звёзд по умолчанию
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

//  создание новых узлов
//  Nodes := TTreeNodes.Create (tvSettings);
//  Node := TTreeNode.Create (Nodes);
//  Node := nil;
  // Заполнение индексов узлов дерева установок
  for I := 0 to tvSettings.Items.Count - 1 do
  begin
    tvSettings.Items[I].ImageIndex := 0;
    tvSettings.Items[I].SelectedIndex := 1;
    tvSettings.Items[I].StateIndex := I;
  end;
  tvSettings.Items[6].Selected := True; // 6 - Планеты
  tvSettings.Items[6].Focused := True;
  tvSettings.Items[6].DropHighlighted := True;
  tvSettings.FullExpand;

  tvSettingsClick(Sender);
  trbVelocityChange(Self);
end;

//---------------------------------------------------------------
// Настройка навигации среди звёзд по кратчайшему пути
//--------------------------------------------------------------
procedure TFormSettings.trbVelocityChange(Sender: TObject);
var
  DistanceInYears: Single;
  Ratio, FlightTime: Extended;

begin
  stTrackBar.Caption := IntToStr(trbVelocity.Position);
  DistanceInYears := StrToFloat(EditDistance.Text);
  Ratio := trbVelocity.Position/299792;
  FlightTime := DistanceInYears/Ratio;

  stFlightTime.Caption := FloatToStrF(FlightTime, ffFixed, 20, 1);
end;

procedure TFormSettings.tvSettingsClick(Sender: TObject);
begin
  case tvSettings.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsDisplay;
     3: PageControl.ActivePage := tsMaterial;
     4: PageControl.ActivePage := tsGalaxy;
     5: PageControl.ActivePage := tsStars;
     6: PageControl.ActivePage := tsPlanets;
     7: PageControl.ActivePage := tsFlights;
  end;
  PageControl.ActivePage.Repaint;
end;

end.
