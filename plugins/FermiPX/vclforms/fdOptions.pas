unit fdOptions;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.UITypes,
  System.SysUtils,
  System.Variants,
  System.Classes,
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

  GLS.BaseClasses,
  GLS.Material;

type
  TFormSettings = class(TForm)
    PanelBottom: TPanel;
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
    LabelMapUnits: TLabel;
    CheckBoxAxes: TCheckBox;
    PanelBackground: TPanel;
    CheckBoxCoordinates: TCheckBox;
    ComboBoxMapUnits: TComboBox;
    cbxTwoSideLighting: TCheckBox;
    tsMaterial: TTabSheet;
    ListView: TListView;
    ButtonModifyMat: TButton;
    tvOptions: TTreeView;
    PanelTop: TPanel;
    ImageList: TImageList;
    tsGalaxy: TTabSheet;
    tsStars: TTabSheet;
    tsPlanets: TTabSheet;
    LabelDiameter: TLabel;
    ColorGrid1: TColorGrid;
    ListBox1: TListBox;
    ComboBox1: TComboBox;
    rgLanguage: TRadioGroup;
    Memo1: TMemo;
    chlbStarClasses: TCheckListBox;
    cbSplashStart: TCheckBox;
    tsGeneral: TTabSheet;
    tsFlights: TTabSheet;
    gbxCoordinateSys: TGroupBox;
    chbEquatorial: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    rgrSystem: TRadioGroup;
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
    chbStarColors: TCheckListBox;
    ListBox2: TListBox;
    stColor: TStaticText;
    ColorDialog: TColorDialog;
    GLMaterialLibrary: TGLMaterialLibrary;
    TrackBar1: TTrackBar;
    ShapeW: TShape;
    PanelScale: TPanel;
    lblScaleX: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    SpinEditPrecision: TSpinEdit;
    LabelPrecision: TLabel;
    EditDg: TEdit;
    EditHg: TEdit;
    Label5: TLabel;
    EditNs: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    stVolume: TStaticText;
    rgUnits: TRadioGroup;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ShapeColorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure rgUnitsClick(Sender: TObject);
  private
    //
    Node: TTreeNode;
    Nodes: TTreeNodes;
  public
    //
  end;

var
  FormSettings: TFormSettings;
  Ns, // number of stars in galaxy
  Dg, // diameter of galaxy
  Hg: Extended; // thickness or height of galaxy

//-----------------------------------------------------------------
implementation
//-----------------------------------------------------------------

{$R *.dfm}

uses
  udGlobals;

//-----------------------------------------------------------------

procedure TFormSettings.FormCreate(Sender: TObject);
begin
  EditNs.Text := FloatToStr(cNs);
  EditDg.Text := FloatToStr(cDg);
  EditHg.Text := FloatToStr(cHg);

  // Default classes for terrain planets
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

  chbStarColors.CheckAll(cbChecked, True, True);
  trbVelocityChange(Self);
end;

//-----------------------------------------------------------------

procedure TFormSettings.FormShow(Sender: TObject);
var
  I: Integer;
begin
//  create new nodes
//  Nodes := TTreeNodes.Create (tvSettings);
//  Node := TTreeNode.Create (Nodes);
//  Node := nil;
  tvOptions.Items[0].Selected := True;
  tvOptions.Items[0].Focused := True;
  for I := 0 to tvOptions.Items.Count - 1 do
  begin
    tvOptions.Items[i].ImageIndex := 0;
    tvOptions.Items[i].SelectedIndex := 1;
  end;
  tvOptionsClick(Sender);
  tvOptions.Items[0].DropHighlighted := True;
  tvOptions.FullExpand;

  rgUnitsClick(Self);
end;

//-----------------------------------------------------------------

procedure TFormSettings.rgUnitsClick(Sender: TObject);
var
  sVolume: String;
begin
  case rgUnits.ItemIndex of
    0:
      begin // 1 million kilometers = 0.07 au
        Dg := 9460528.534365271 * cDg;
        Hg := 9460528.534365271 * cHg;
      end;
    1:
      begin // 1 astronomical units = 149597871.198 km
        Dg := 63239.727 * cDg ;
        Hg := 63239.727 * cHg;
      end;
    2:
      begin // 1 light years = 63239.727 au
        Dg := cDg;
        Hg := cHg;
      end;
    3:
      begin // 1 parsecs = 3.262 ly
        Dg := 0.30656 * cDg;
        Hg := 0.30656 * cHg;
      end;
    4:
      begin // 1 kiloparsecs = 1000 pc
        Dg := 0.000307 * cDg;
        Hg := 0.000307 * cHg;
      end;
  end;
  EditDg.Text := FloatToStr(Dg);
  EditHg.Text := FloatToStr(Hg);
  // Vg = pi * R^2 * Hg
  Str((Pi * Sqr(0.5 * Dg) * Hg):5:2, sVolume);
  stVolume.Caption := sVolume; // or FloatToStr(Pi * Sqr(0.5 * Dg) * Hg):5:2;
end;

//-----------------------------------------------------------------

procedure TFormSettings.ShapeColorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  // Allow choosing the star class color
  ColorDialog.Color := (Sender as TShape).Brush.Color;
  if ColorDialog.Execute() then
  begin
  	(Sender as TShape).Brush.Color := ColorDialog.Color;
  end;
	GLMaterialLibrary.Materials[0].Material.FrontProperties.Diffuse.AsWinColor := ColorDialog.Color;
end;

//-----------------------------------------------------------------

procedure TFormSettings.trbVelocityChange(Sender: TObject);
var
  DistanceInYears: Single;
  Ratio, FlightTime: Extended;
begin
  stTrackBar.Caption := IntToStr(trbVelocity.Position);
  DistanceInYears := StrToFloat(EditDistance.Text);
  Ratio := trbVelocity.Position/cLightSpeed;
  FlightTime := DistanceInYears/Ratio;

  stFlightTime.Caption := FloatToStrF(FlightTime, ffFixed, 20, 1);
end;

//-----------------------------------------------------------------

procedure TFormSettings.tvOptionsClick(Sender: TObject);
begin
  tvOptions.Items[0].DropHighlighted := False;
  case tvOptions.Selected.Index of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsDisplay;
     3: PageControl.ActivePage := tsMaterial;
     4: PageControl.ActivePage := tsGalaxy;
     5: PageControl.ActivePage := tsStars;
     6: PageControl.ActivePage := tsPlanets;
     7: PageControl.ActivePage := tsFlights;
  end;
end;

end.
