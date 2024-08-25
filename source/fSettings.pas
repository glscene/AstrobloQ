unit fSettings;
(*
  This unit is part of the Galaktika
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

  gnuGettext,  // for translation

  uGlobals,
  dImages,
  fForm;

type
  TfrmSettings = class(TFormI)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    PanelMain: TPanel;
    tvSettings: TTreeView;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    CheckBoxLoadProject: TCheckBox;
    CheckBoxSaveProject: TCheckBox;
    CheckBoxSplashStart: TCheckBox;
    rgLanguage: TRadioGroup;
    tsDisplay: TTabSheet;
    CheckBoxAxes: TCheckBox;
    CheckBoxCoordinates: TCheckBox;
    tsMaterial: TTabSheet;
    ListView: TListView;
    ButtonModifyMat: TButton;
    tsGalaxy: TTabSheet;
    nbRg: TNumberBox;
    grbDrakeFormula: TGroupBox;
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
    lbNs: TLabel;
    lbNt: TLabel;
    nbFn: TNumberBox;
    nbFb: TNumberBox;
    nbNl: TNumberBox;
    EditNt: TEdit;
    stMult1: TStaticText;
    stMult2: TStaticText;
    stMult3: TStaticText;
    stMult4: TStaticText;
    stEqual: TStaticText;
    lbFl: TLabel;
    lbFb: TLabel;
    StaticTextLt: TStaticText;
    EditLt: TEdit;
    EditLs: TEdit;
    StaticTextLs: TStaticText;
    lbFn: TLabel;
    LabelLs: TLabel;
    LabelLt: TLabel;
    nbFt: TNumberBox;
    lbFt: TLabel;
    nbHg: TNumberBox;
    StaticTextHg: TStaticText;
    LabelHg: TLabel;
    LabelDt: TLabel;
    EditDt: TEdit;
    LabelVg: TLabel;
    StaticTextVg: TStaticText;
    EditVg: TEdit;
    nbFp: TNumberBox;
    lbFp: TLabel;
    stMult5: TStaticText;
    EditNs: TEdit;
    nbNs: TNumberBox;
    EditDs: TEdit;
    LabelDs: TLabel;
    Label4: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure rgLanguageClick(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
    function Execute: boolean; virtual;
  end;

var
  frmSettings: TfrmSettings;

implementation //------------------------------------------------------------

{$R *.dfm}

uses
  fGalaktika;


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
    // add parentheses to translate using gnugettext
    tvSettings.Items[I].Text := _(tvSettings.Items[I].Text);
  end;

  tvSettings.Select(tvSettings.Items[1]);
  tvSettingsClick(Self);
  tvSettings.FullExpand;
  tvSettings.Items[1].DropHighlighted := True;

  trbVelocityChange(Self);
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


//--------------------------------------------------------------------
procedure TfrmSettings.rgLanguageClick(Sender: TObject);
begin
  case rgLanguage.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

//-----------------------------------------------------
procedure TfrmSettings.ButtonCalculateClick(Sender: TObject);
var
  Ns, Nt, Nl : Extended;
  Fp, Fb, Fn, Ft, Vg, Ratio : Extended;
  Ds, // Distance between stars
  Dt: Extended; // Distance between technospheres
  Lc, Ls: LONG64;
begin
  Ns := nbNs.Value;
  EditNs.Text := FloatToStr(Ns);
  Fp := nbFp.Value;
  Nl := nbNl.Value;
  Fb := nbFb.Value;
  Fn := nbFn.Value;
  Ft := nbFt.Value;
(*
  Lc := StrToInt64(EditLc.Text);
  Ls := StrToInt64(EditLs.Text);
  Ratio := Lc/Ls;
*)
  // Number of technospheres
  Nt := Round(Ns*Fp*Nl*Fb*Fn*Ft (*Ratio*));  // wihout Ratio of longevities
  EditNt.Text := FloatToStr(Nt);

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
  EditDt.Text := FloatToStrF(Dt, ffFixed, 25, 2);
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
    ActiveLang := IniFile.ReadInteger(frmSettings.Name, rgLanguage.Name, 0);
    CheckBoxAxes.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxRotate.Name, True);
    case ActiveLang of
      LANG_ENGLISH:
        rgLanguage.ItemIndex := 0;
      LANG_RUSSIAN:
        rgLanguage.ItemIndex := 1;
      LANG_PORTUGUESE:
        rgLanguage.ItemIndex := 2;
      LANG_SPANISH:
        rgLanguage.ItemIndex := 3
    else
      rgLanguage.ItemIndex := 0;
    end;
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
    IniFile.WriteInteger(frmSettings.Name, rgLanguage.Name, CurLangID);
  finally
    IniFile.Free;
  end;
  inherited;
end;

// -----------------------------------------------------------------------
procedure TfrmSettings.ButtonOkClick(Sender: TObject);
var
  FileName: TFileName;
begin
  if CurLangID <> ActiveLang then
  begin
    MessageDlg(_('Reload to change language'),
      mtInformation, [mbOK], 0);
    FileName := ChangeFileExt(ParamStr(0), '.ini');
    if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  end;
  WriteIniFile;
  frmSettings.Close;
end;

end.
