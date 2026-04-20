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
  fmFormFirst, Vcl.Imaging.jpeg;

type
  TFormOptions = class(TFormFirst)
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
    chlbStarClasses: TCheckListBox;
    gbConstells: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    tsGeneral: TTabSheet;
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
    LabelRg: TLabel;
    LabelNs: TLabel;
    EditLs: TEdit;
    LabelLs: TLabel;
    nbHg: TNumberBox;
    LabelHg: TLabel;
    LabelVg: TLabel;
    EditVg: TEdit;
    EditNs: TEdit;
    EditDs: TEdit;
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
    Button1: TButton;
    gbStars: TGroupBox;
    shO: TShape;
    shB: TShape;
    shA: TShape;
    shG: TShape;
    shK: TShape;
    shF: TShape;
    shM: TShape;
    Label4: TLabel;
    Label7: TLabel;
    shD: TShape;
    chbO: TCheckBox;
    chbB: TCheckBox;
    chbA: TCheckBox;
    chbF: TCheckBox;
    chbG: TCheckBox;
    chbK: TCheckBox;
    chbM: TCheckBox;
    nbO: TNumberBox;
    nbB: TNumberBox;
    nbA: TNumberBox;
    nbF: TNumberBox;
    nbG: TNumberBox;
    nbK: TNumberBox;
    nbM: TNumberBox;
    nbAn: TNumberBox;
    nbMn: TNumberBox;
    nbKn: TNumberBox;
    nbGn: TNumberBox;
    nbFn: TNumberBox;
    nbBn: TNumberBox;
    nbOn: TNumberBox;
    chbD: TCheckBox;
    nbDn: TNumberBox;
    seNStars: TSpinEdit;
    chbAll: TCheckBox;
    nbD: TNumberBox;
    procedure FormCreate(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
    function Execute: boolean; virtual;
  end;

var
  FormOptions: TFormOptions;

implementation //=============================================================

{$R *.dfm}

uses
  fgGalaqtium_ru;

//--------------------------- Создание формы ---------------------------------
procedure TFormOptions.FormCreate(Sender: TObject);
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

//---------------------- trbVelocity ------------------------------------------
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



procedure TFormOptions.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

function TFormOptions.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

//--------------------- ReadIniFile --------------------------------------------
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

// ---------------------- WriteIniFile -----------------------------------------
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

// ----------------------- ButtonOk -------------------------------------------
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

end.
