//
// This unit is part of the Galaktika
//
unit fSettings;

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

  //
  gnuGettext,

  uGlobals,
  dImages,
  fForm;

type
  TFormSettings = class(TFormI)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    PanelMain: TPanel;
    tvSettings: TTreeView;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    LabelData: TLabel;
    cbDataPath: TComboBox;
    ButtonBrowsePathData: TButton;
    CheckBoxLoadProject: TCheckBox;
    CheckBoxSaveProject: TCheckBox;
    cbSplashStart: TCheckBox;
    rgLanguage: TRadioGroup;
    tsDisplay: TTabSheet;
    LabelBackground: TLabel;
    CheckBoxAxis: TCheckBox;
    PanelBkg: TPanel;
    CheckBoxCoordinates: TCheckBox;
    cbxTwoSideLighting: TCheckBox;
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
    cbxVclStyles: TComboBox;
    Label2: TLabel;
    grbPlanetShow: TGroupBox;
    chbRotate: TCheckBox;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgLanguageClick(Sender: TObject);
    procedure PanelBackgroundClick(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
    function Execute: boolean; virtual;
  end;

var
  FormSettings: TFormSettings;

//---------------------------------------------------------------------------
implementation

{$R *.dfm}

uses
  fGalaktika;


//--------------------------------------------------------------------
procedure TFormSettings.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;

begin
  ReadIniFile;
  // Включение стилей интерфейса в комбобокс
  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);
  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Спектральные классы звёзд по умолчанию
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

  // Items:
  tvSettings.Items[0].Text := _('General');
  tvSettings.Items[1].Text := _('Interface');
  tvSettings.Items[2].Text := _('Display');
  tvSettings.Items[3].Text := _('Material');
  tvSettings.Items[4].Text := _('Galaxy');
  tvSettings.Items[5].Text := _('Stars');
  tvSettings.Items[6].Text := _('Planets');
  tvSettings.Items[7].Text := _('Pathway');

  // TreeView item indexes
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
procedure TFormSettings.tvSettingsClick(Sender: TObject);
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
procedure TFormSettings.trbVelocityChange(Sender: TObject);
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
procedure TFormSettings.rgLanguageClick(Sender: TObject);
begin
  case rgLanguage.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN
    else
      CurLangID := LANG_ENGLISH;
  end;
end;


//--------------------------------------------------------------------
// Чтение секций Инифайла и установка языка интерфейса
//--------------------------------------------------------------------
procedure TFormSettings.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxis.Checked := IniFile.ReadBool(FormSettings.Name, CheckBoxAxis.Name, True);
    PanelBkg.Color := IniFile.ReadInteger(FormSettings.Name, PanelBkg.Name, 0);
    LangID := IniFile.ReadInteger(FormSettings.Name, rgLanguage.Name, 0);
    case LangID of
      LANG_ENGLISH:
        rgLanguage.ItemIndex := 0;
      LANG_RUSSIAN:
        rgLanguage.ItemIndex := 1
    else
      rgLanguage.ItemIndex := 0;
    end;
  finally
    IniFile.Free;
  end;
end;

// --------------------------------------------------------------------
procedure TFormSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteBool(FormSettings.Name, CheckBoxAxis.Name, CheckBoxAxis.Checked);
    IniFile.WriteInteger(FormSettings.Name, PanelBkg.Name, PanelBkg.Color);
    IniFile.WriteInteger(FormSettings.Name, rgLanguage.Name, CurLangID);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//----------------------------------------------------------------
// Цвет фона GLSceneViewer по умолчанию чёрный
//----------------------------------------------------------------
procedure TFormSettings.PanelBackgroundClick(Sender: TObject);
begin
  {
    dmDialogs.ColorDialog.Color := PanelBackground.Color;
   if dmDialogs.ColorDialog.Execute then
   begin
     PanelBackground.Color :=  dmDialogs.ColorDialog.Color;
     FormGalaktika.ApplyBgColor;
   end;
}
end;

//-----------------------------------------------------
procedure TFormSettings.ButtonCalculateClick(Sender: TObject);
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

//========================================================================
procedure TFormSettings.ButtonOkClick(Sender: TObject);
var
  FileName: TFileName;
begin
  if CurLangID <> LangID then
  begin
    MessageDlg(_('Reload to change language'),
      mtInformation, [mbOK], 0);
    FileName := ChangeFileExt(ParamStr(0), '.ini');
    if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  end;
  Close;
end;

procedure TFormSettings.cbxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbxVclStyles.Text);
end;

function TFormSettings.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TFormSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

end.
