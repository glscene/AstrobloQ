unit fgOptions_en;
(*
  This unit is part of the Galaxy
*)
interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.UITypes,
  System.Variants,
  System.Classes,
  System.IniFiles,
  System.Math,
  System.ImageList,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.WinXCtrls,
  Vcl.WinXPickers,
  Vcl.WinXCalendars,

  Vcl.Samples.Spin,
  Vcl.CheckLst,
  Vcl.ColorGrd,
  Vcl.NumberBox,
  Vcl.ImgList,
  Vcl.Themes,

  Astro.Globals,
  fmFormFirst;

type
  TFormOptions = class(TFormFirst)
    PanelBottom: TPanel;
    PanelMain: TPanel;
    tvSettings: TTreeView;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    CheckBoxLoadProject: TCheckBox;
    CheckBoxSaveProject: TCheckBox;
    CheckBoxSplashStart: TCheckBox;
    tsDisplay: TTabSheet;
    CheckBoxAxes: TCheckBox;
    CheckBoxCoordinates: TCheckBox;
    tsMaterial: TTabSheet;
    ListView: TListView;
    ButtonModifyMat: TButton;
    tsGalaxy: TTabSheet;
    nbRg: TNumberBox;
    tsStars: TTabSheet;
    ColorGrid1: TColorGrid;
    chlbStarClasses: TCheckListBox;
    GroupBox2: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    tsGeneral: TTabSheet;
    LabelPrecision: TLabel;
    rgUnits: TRadioGroup;
    SpinEditPrecision: TSpinEdit;
    tsPathway: TTabSheet;
    PanelTitle: TPanel;
    LabelStarI: TLabel;
    LabelStarII: TLabel;
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
    chbIsTetranet: TCheckBox;
    chbIsPolynet: TCheckBox;
    chbIsGridnet: TCheckBox;
    tsPlanets: TTabSheet;
    chlbPlanetsize: TCheckListBox;
    CheckListBox1: TCheckListBox;
    RadioGroup1: TRadioGroup;
    LabelRg: TLabel;
    LabelNs: TLabel;
    EditLt: TEdit;
    EditLs: TEdit;
    LabelLs: TLabel;
    LabelLt: TLabel;
    nbHg: TNumberBox;
    LabelHg: TLabel;
    LabelVg: TLabel;
    EditVg: TEdit;
    EditNs: TEdit;
    EditDs: TEdit;
    Label5: TLabel;
    ButtonCalculate: TButton;
    ComboBoxVclStyles: TComboBox;
    Label2: TLabel;
    grbPlanetShow: TGroupBox;
    chbShowAxes: TCheckBox;
    CheckBox4: TCheckBox;
    chbCore: TCheckBox;
    chbAtmosfera: TCheckBox;
    chbClouds: TCheckBox;
    CheckBox1: TCheckBox;
    chbHidePlanet: TCheckBox;
    CheckBox3: TCheckBox;
    grbTerraLayers: TGroupBox;
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
    GroupBox1: TGroupBox;
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
    ImageList: TImageList;
    CheckBoxRotate: TCheckBox;
    ButtonOk: TButton;
    LabelTitle: TLabel;
    LabelRc: TLabel;
    NumberBoxRc: TNumberBox;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
  private
  public
    procedure ReadIniFile; override;
    procedure WriteIniFile;
    function Execute: boolean; virtual;
  end;

var
  FormOptions: TFormOptions;

implementation //==============================================================

{$R *.dfm}

uses
  fgGalaqtium_en;

//---------------------------------------------------------------------------
procedure TFormOptions.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
  S: String;
begin
  ReadIniFile;
  // Including UI styles in a combobox
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Default Spectral Classes of Stars
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

  // Setting TreeView Icon Indexes
  for I := 0 to tvSettings.Items.Count - 1 do
  begin
    tvSettings.Items[I].ImageIndex := 0;
    tvSettings.Items[I].SelectedIndex := 1;
    tvSettings.Items[I].StateIndex := I;
  end;

  tvSettings.Select(tvSettings.Items[1]);
  tvSettingsClick(Self);
  tvSettings.FullExpand;
  tvSettings.Items[1].DropHighlighted := True;

  trbVelocityChange(Self);
  inherited;
end;

// ---------------------------------------------------------------------------
procedure TFormOptions.tvSettingsClick(Sender: TObject);
begin
  inherited;
  tvSettings.Items[1].DropHighlighted := False;
  case tvSettings.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsDisplay;
     3: PageControl.ActivePage := tsMaterial;
     4: PageControl.ActivePage := tsGalaxy;
     5: PageControl.ActivePage := tsStars;
     6: PageControl.ActivePage := tsPlanets;
     7: PageControl.ActivePage := tsPathway;
  end;
end;

// ---------------------------------------------------------------------------
procedure TFormOptions.trbVelocityChange(Sender: TObject);
var
  DistanceInYears: Single;
  FlightTime: Extended;
  Ratio: Extended;
begin
  stTrackBar.Caption := IntToStr(trbVelocity.Position);
  DistanceInYears := StrToFloat(EditDistance.Text);
  Ratio := trbVelocity.Position/299792;
  FlightTime := DistanceInYears/Ratio;
  stFlightTime.Caption := FloatToStrF(FlightTime, ffFixed, 20, 1);
end;


// ---------------------------------------------------------------------------
procedure TFormOptions.ButtonCalculateClick(Sender: TObject);
var
  Ns, Nt, Nl : Extended;
  Fp, Fb, Fn, Ft, Vg, Ratio : Extended;
  Ds, // Distance between stars
  Dt: Extended; // Distance between technospheres
  Lc, Ls: LONG64;
begin
  EditNs.Text := FloatToStr(Ns);
(*
  Lc := StrToInt64(EditLc.Text);
  Ls := StrToInt64(EditLs.Text);
  Ratio := Lc/Ls;
*)
  // Number of technospheres
  Nt := Round(Ns*Fp*Nl*Fb*Fn*Ft (*Ratio*));  // wihout Ratio of longevities
///  EditNt.Text := FloatToStr(Nt);

  // Calculating volume of galaxy cylinder
  Vg := Pi*Sqr(nbRg.Value)*nbHg.Value;
  EditVg.Text := FloatToStrF(Vg, ffFixed, 25, 2);
  // Average distance betweem galaxy stars
  Ratio := Vg/Ns;
  Ds := Power(Ratio, 1/3); // or  Ds := Exp(ln(Ratio)/3);
  // Distance betweem stars
  EditDs.Text := FloatToStrF(Ds, ffFixed, 25, 2);

  // Average distance betweem galaxy technospheres
  Ratio := Vg/Nt;
  Dt := Power(Ratio, 1/3);
  // Distance betweem technospheres
///  EditDt.Text := FloatToStrF(Dt, ffFixed, 25, 2);
end;

procedure TFormOptions.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

function TFormOptions.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

// ---------------------------------------------------------------------------
// Reading Inifile sections and setting the interface language
// ---------------------------------------------------------------------------
procedure TFormOptions.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxes.Checked := IniFile.ReadBool(FormOptions.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(FormOptions.Name, CheckBoxRotate.Name, True);
  finally
    IniFile.Free;
  end;
end;

// ---------------------------------------------------------------------------
procedure TFormOptions.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteBool(FormOptions.Name, CheckBoxAxes.Name, CheckBoxAxes.Checked);
    IniFile.WriteBool(FormOptions.Name, CheckBoxRotate.Name, CheckBoxRotate.Checked);
  finally
    IniFile.Free;
  end;
  inherited;
end;

// ---------------------------------------------------------------------------
procedure TFormOptions.ButtonOkClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  FormOptions.Close;
end;

// ---------------------------------------------------------------------------
end.
