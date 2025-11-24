unit fgOptions_ru;
(*
  Опции настроек Galaqtium
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
  TfrmOptions = class(TfrmFirst)
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
    CheckListBox1: TCheckListBox;
    RadioGroup1: TRadioGroup;
    LabelRg: TLabel;
    LabelNs: TLabel;
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
    EditLs: TEdit;
    lbFn: TLabel;
    LabelLs: TLabel;
    nbFt: TNumberBox;
    lbFt: TLabel;
    nbHg: TNumberBox;
    LabelHg: TLabel;
    EditDp: TEdit;
    LabelVg: TLabel;
    EditVg: TEdit;
    nbFp: TNumberBox;
    lbFp: TLabel;
    stMult5: TStaticText;
    EditNs: TEdit;
    nbNs: TNumberBox;
    EditDs: TEdit;
    Label4: TLabel;
    Label5: TLabel;
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
    GroupBoxParams: TGroupBox;
    LabelTilt: TLabel;
    LabelDensity: TLabel;
    LabelRadius: TLabel;
    LabelGravity: TLabel;
    LabelTemperature: TLabel;
    nbTilt: TNumberBox;
    nbDensity: TNumberBox;
    nbRadius: TNumberBox;
    nbGravity: TNumberBox;
    nbTemperature: TNumberBox;
    ImageList: TImageList;
    CheckBoxRotate: TCheckBox;
    chlbPlanetsize: TCheckListBox;
    LabelTitle: TLabel;
    LabelRc: TLabel;
    NumberBoxRc: TNumberBox;
    LabelPlanets: TLabel;
    GroupBox1: TGroupBox;
    EditLt: TEdit;
    LabelLt: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    ButtonCalculate: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
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
  frmOptions: TfrmOptions;

implementation //=============================================================

{$R *.dfm}

uses
  fgGalaqtium_ru;

//--------------------------- Создание формы ---------------------------------
procedure TfrmOptions.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
  S: String;
begin
  ReadIniFile;
  // Включение стилей UI в комбобоксе настроек
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

  // Установка индексов в TreeView
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
end;

//---------------------- tvSettings -------------------------------------------
procedure TfrmOptions.tvSettingsClick(Sender: TObject);
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

//---------------------- trbVelocity ------------------------------------------
procedure TfrmOptions.trbVelocityChange(Sender: TObject);
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


//--------------------------- Вычисление --------------------------------------
procedure TfrmOptions.ButtonCalculateClick(Sender: TObject);
var
  Ns, Nt, Np : Extended;
  Fp, Fb, Fn, Ft, Vg, Ratio : Extended;
  Ds, // Расстояние между звёздами
  Dp: Extended; // Расстояние между планетами
  Lc, Ls: LONG64;
begin
  Ns := nbNs.Value;
  EditNs.Text := FloatToStr(Ns);
  Fp := nbFp.Value;
  Np := nbNl.Value;
  Fb := nbFb.Value;
  Fn := nbFn.Value;
  Ft := nbFt.Value;
(*
  Lc := StrToInt64(EditLc.Text);
  Ls := StrToInt64(EditLs.Text);
  Ratio := Lc/Ls;
*)
  // Число звёзд с экзопланетами без учёта долголетия в Ratio
  Nt := {1 Earth +} Round(Ns*Np*Fp*Fb*Fn*Ft (*Ratio*));
  EditNt.Text := FloatToStr(Nt);

  // Определение объёма цилиндра галактики
  Vg := Pi*Sqr(nbRg.Value)*nbHg.Value;
  EditVg.Text := FloatToStrF(Vg, ffFixed, 25, 2);
  // Средне расстояние между звёздами в галактике
  Ratio := Vg/Ns;
  Ds := Power(Ratio, 1/3); // or  Ds := Exp(ln(Ratio)/3);
  // Расстояние между звёздами
  EditDs.Text := FloatToStrF(Ds, ffFixed, 25, 2);

  // Среднее расстояние между планетными системами
  Ratio := Np*Vg/Nt;
  Dp := Power(Ratio, 1/3);
  // Вывод расстояния между экзопланетными системами
  EditDp.Text := FloatToStrF(Dp, ffFixed, 25, 2);
end;

procedure TfrmOptions.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

function TfrmOptions.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

//--------------------- ReadIniFile --------------------------------------------
procedure TfrmOptions.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxes.Checked := IniFile.ReadBool(frmOptions.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(frmOptions.Name, CheckBoxRotate.Name, True);
  finally
    IniFile.Free;
  end;
end;

// ---------------------- WriteIniFile -----------------------------------------
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

// ----------------------- ButtonOk -------------------------------------------
procedure TfrmOptions.ButtonOkClick(Sender: TObject);
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
