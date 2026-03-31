(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fmSettings_ru;
(*
  The unit for settings
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
  TFormSettings = class(TFormFirst)
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
    tsStars: TTabSheet;
    chlbStarClasses: TCheckListBox;
    tsGalaxy: TTabSheet;
    EditNs: TEdit;
    EditLr: TEdit;
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
    ComboBoxVclStyles: TComboBox;
    Label2: TLabel;
    ImageList: TImageList;
    tsGeneral: TTabSheet;
    RadioGroup1: TRadioGroup;
    rgUnits: TRadioGroup;
    SpinEditPrecision: TSpinEdit;
    LabelPrecision: TLabel;
    tsPlanets: TTabSheet;
    StaticTextLr: TStaticText;
    StaticTextDs: TStaticText;
    EditDs: TEdit;
    EditVg: TEdit;
    StaticTextVg: TStaticText;
    StaticTextHg: TStaticText;
    nbHg: TNumberBox;
    StaticTextLs: TStaticText;
    EditLs: TEdit;
    EditLt: TEdit;
    StaticTextLt: TStaticText;
    StaticTextNs: TStaticText;
    StaticTextRg: TStaticText;
    nbRg: TNumberBox;
    LabelDs: TLabel;
    LabelVg: TLabel;
    LabelHg: TLabel;
    LabelLt: TLabel;
    LabelLs: TLabel;
    LabelNs: TLabel;
    LabelRg: TLabel;
    ButtonCalculate: TButton;
    stStarDensity: TStaticText;
    EditStarDensityPC: TEdit;
    StaticText1: TStaticText;
    EditStarDensityKPC: TEdit;
    Label1: TLabel;
    EditKs: TEdit;
    StaticText2: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
    function Execute: boolean; virtual;
  end;

var
  FormSettings: TFormSettings;

implementation //==============================================================

{$R *.dfm}


// ----------------------------------------------------------------------------
procedure TFormSettings.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
  S: String;
begin
  ReadIniFile;
  // Добавление стилей интерфейса UI styles в комбобокс
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Спектральные классы звёзд по  умолчанию
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

  // Заполнение индексами узлов TreeView для иконок
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

// ----------------------------------------------------------------------------
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


// ----------------------------------------------------------------------------
procedure TFormSettings.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

// ----------------------------------------------------------------------------
function TFormSettings.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

// ----------------------------------------------------------------------------
// Reading Inifile sections and setting the interface language
// ----------------------------------------------------------------------------
procedure TFormSettings.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    // as exam CheckBoxAxes.Checked := IniFile.ReadBool(FormSettings.Name, CheckBoxAxes.Name, True);
    // as exam CheckBoxRotate.Checked := IniFile.ReadBool(FormSettings.Name, CheckBoxRotate.Name, True);
  finally
    IniFile.Free;
  end;
end;

// ----------------------------------------------------------------------------
procedure TFormSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    // as exam IniFile.WriteBool(FormSettings.Name, CheckBoxAxes.Name, CheckBoxAxes.Checked);
    // as exam IniFile.WriteBool(FormSettings.Name, CheckBoxRotate.Name, CheckBoxRotate.Checked);
  finally
    IniFile.Free;
  end;
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
     3: PageControl.ActivePage := tsGalaxy;
     4: PageControl.ActivePage := tsStars;
     5: PageControl.ActivePage := tsPlanets;
     6: PageControl.ActivePage := tsPathway;
  end;
end;

// -----------------------------------------------------------------------
procedure TFormSettings.ButtonCalculateClick(Sender: TObject);
var
  Ns: Uint64;
  Vg, Ratio : Extended;
  Ds: Extended; // Расстояние между звёздами
  Ls, Lt: LONG64;
begin
  Ns := StrToUInt64(EditNs.Text);
  // Определение объёма цилиндра галактики
  Vg := Pi*Sqr(nbRg.Value)*nbHg.Value;
  EditVg.Text := FloatToStrF(Vg, ffFixed, 25, 0);
  // Определение среднего расстояния между звёздами
  Ratio := Vg/Ns;
  Ds := Power(Ratio, 1/3); // or  Ds := Exp(ln(Ratio)/3);
  // Вывод расстояния между звёздами
  EditDs.Text := FloatToStrF(Ds, ffFixed, 25, 2);

  Ls := StrToInt64(EditLs.Text); // Долголетие звёзд
  Lt := StrToInt64(EditLt.Text); // Долголетие технопланет
  Ratio := Lt/Ls;
  // Вывод коэффициента долголетия
  EditLr.Text := FloatToStrF(Ratio, ffFixed, 25, 10);
end;

//-----------------------------------------------------------------------------
procedure TFormSettings.ButtonOkClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  FormSettings.Close;
end;

// ----------------------------------------------------------------------------
end.
