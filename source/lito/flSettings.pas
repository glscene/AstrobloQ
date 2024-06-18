unit flSettings;

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
  Vcl.Samples.DirOutln,
  Vcl.ColorGrd,
  Vcl.Samples.Gauges,
  Vcl.CheckLst,
  Vcl.WinXCtrls,
  Vcl.NumberBox,

  fGLForm;

type
  TFormSettings = class(TFormGL)
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
    CheckBoxAxis: TCheckBox;
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
    ColorGrid1: TColorGrid;
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
    SpinEditPrecision: TSpinEdit;
    LabelPrecision: TLabel;
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
    chbPlanetCore: TCheckBox;
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
    nbGxDiameter: TNumberBox;
    grbDrakeFormula: TGroupBox;
    PanelDrake: TPanel;
    Label5: TLabel;
    lbEquals: TLabel;
    lbNs: TLabel;
    lbMult1: TLabel;
    lbMult2: TLabel;
    lbMult3: TLabel;
    lbMult4: TLabel;
    lbFl: TLabel;
    lbFb: TLabel;
    kbFn: TLabel;
    lbLc: TLabel;
    lbLs: TLabel;
    lbDivide: TLabel;
    ButtonCalculate: TButton;
    stNc: TStaticText;
    EditLc: TEdit;
    EditLs: TEdit;
    EditNs: TEdit;
    EditFl: TEdit;
    EditFb: TEdit;
    EditFn: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    chbAtmosfera: TCheckBox;
    GroupBox2: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    GroupBoxConstellations: TGroupBox;
    CheckBoxConstFigures: TCheckBox;
    CheckBoxConstLines: TCheckBox;
    CheckBoxConstBorders: TCheckBox;
    procedure tvSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
    procedure chbPlanetCoreClick(Sender: TObject);
    procedure chbAtmosferaClick(Sender: TObject);
    procedure rgLanguageClick(Sender: TObject);
  private
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
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

uses
  flLitosfera;


procedure TFormSettings.ButtonOKClick(Sender: TObject);
begin
  Close;
end;

//
// Показать сечение планеты с ядром
//
procedure TFormSettings.chbAtmosferaClick(Sender: TObject);
begin
 //FormLitosfera.Atmosphere;
end;

procedure TFormSettings.chbPlanetCoreClick(Sender: TObject);
begin
  FormLitosfera.PlanetCore;
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
  // 4 - Галактика 5 - Звёзды 6 - Планеты
  tvSettings.Select(tvSettings.Items[6]);
  tvSettings.FullExpand;
  tvSettings.Items[6].DropHighlighted := True;

  trbVelocityChange(Self);
end;

procedure TFormSettings.rgLanguageClick(Sender: TObject);
begin
  case rgLanguage.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN;
    2: CurLangID := LANG_SPANISH;
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

procedure TFormSettings.tvSettingsClick(Sender: TObject);
begin
  tvSettings.Items[6].DropHighlighted := False;
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
end;


//------------------------------------------------------------
procedure TFormSettings.ReadIniFile;
begin
  inherited;
  //
end;

//------------------------------------------------------------
procedure TFormSettings.WriteIniFile;
begin
//
end;

//---------------------------------------------------------------
// Расчёт числа цивилизаций в МП по ноосферной формуле Дрейка
//---------------------------------------------------------------
procedure TFormSettings.ButtonCalculateClick(Sender: TObject);
var
  Nc, Fl, Fb, Fn, Ratio : Extended;
  Ns, Lc, Ls: LONG64;
begin
  Ns := StrToInt64(EditNs.Text);
  Fl := StrToFloat(EditFl.Text);
  Fb := StrToFloat(EditFb.Text);
  Fn := StrToFloat(EditFn.Text);

  Lc := StrToInt64(EditLc.Text);
  Ls := StrToInt64(EditLs.Text);

  Ratio := Lc/Ls;
  Nc := Ns*Fl*Fb*Fn *Ratio;  // без времени существования ВЦ
  stNc.Caption := FloatToStr(Nc);
end;

//---------------------------------------------------------------
// Настройка навигации среди звёзд по кратчайшему пути
//--------------------------------------------------------------
procedure TFormSettings.trbVelocityChange(Sender: TObject);
var
  DistanceInYears: Single;
  FlightTime: Extended;
  Ratio : Extended;
begin
  stTrackBar.Caption := IntToStr(trbVelocity.Position);
  DistanceInYears := StrToFloat(EditDistance.Text);
  Ratio := trbVelocity.Position/299792;
  FlightTime := DistanceInYears/Ratio;
  stFlightTime.Caption := FloatToStrF(FlightTime, ffFixed, 20, 1);
end;

end.
