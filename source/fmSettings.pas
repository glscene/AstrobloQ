unit fmSettings;
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
  dmImages,
  fmFormFirst;

type
  TfrmSettings = class(TfrmFirst)
    PanelBottom: TPanel;
    ButtonOk: TButton;
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
    StaticTextRg: TStaticText;
    LabelNs: TLabel;
    StaticTextNs: TStaticText;
    StaticTextLt: TStaticText;
    EditLt: TEdit;
    EditLs: TEdit;
    StaticTextLs: TStaticText;
    LabelLs: TLabel;
    LabelLt: TLabel;
    nbHg: TNumberBox;
    StaticTextHg: TStaticText;
    LabelHg: TLabel;
    LabelVg: TLabel;
    StaticTextVg: TStaticText;
    EditVg: TEdit;
    EditNs: TEdit;
    EditDs: TEdit;
    LabelDs: TLabel;
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
    ButtonCalculate: TButton;
    StaticTextDs: TStaticText;
    StaticTextLr: TStaticText;
    EditLr: TEdit;
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
  frmSettings: TfrmSettings;

implementation //=============================================================

{$R *.dfm}

{
uses
  fgGalaxy;
}

//---------------------------------------------------------------------------
procedure TfrmSettings.FormCreate(Sender: TObject);
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

//--------------------------------------------------------------------
procedure TfrmSettings.trbVelocityChange(Sender: TObject);
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


//-----------------------------------------------------
procedure TfrmSettings.ButtonCalculateClick(Sender: TObject);
var
  Ns: Uint64;
  Vg, Ratio : Extended;
  Ds: Extended; // Distance between stars
  Ls, Lt: LONG64;
begin
  Ns := StrToUInt64(EditNs.Text);
  // Calculating volume of galaxy cylinder
  Vg := Pi*Sqr(nbRg.Value)*nbHg.Value;
  EditVg.Text := FloatToStrF(Vg, ffFixed, 25, 0);
  // Average distance betweem galaxy stars
  Ratio := Vg/Ns;
  Ds := Power(Ratio, 1/3); // or  Ds := Exp(ln(Ratio)/3);
  // Distance betweem stars
  EditDs.Text := FloatToStrF(Ds, ffFixed, 25, 2);

  Ls := StrToInt64(EditLs.Text); // Longevity of stars
  Lt := StrToInt64(EditLt.Text); // Longevity of technets
  Ratio := Lt/Ls;
  // Ratio of longevities
  EditLr.Text := FloatToStrF(Ratio, ffFixed, 25, 10);

end;

procedure TfrmSettings.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

function TfrmSettings.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

//--------------------------------------------------------------------
// Reading Inifile sections and setting the interface language
//--------------------------------------------------------------------
procedure TfrmSettings.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxes.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxRotate.Name, True);
  finally
    IniFile.Free;
  end;
end;

// --------------------------------------------------------------------
procedure TfrmSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteBool(frmSettings.Name, CheckBoxAxes.Name, CheckBoxAxes.Checked);
    IniFile.WriteBool(frmSettings.Name, CheckBoxRotate.Name, CheckBoxRotate.Checked);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//--------------------------------------------------------------------
procedure TfrmSettings.tvSettingsClick(Sender: TObject);
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

// -----------------------------------------------------------------------
procedure TfrmSettings.ButtonOkClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  frmSettings.Close;
end;

end.
