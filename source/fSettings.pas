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
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  //
  dImages,
  fGLForm,
  fGLDialog,
  Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.Samples.Spin, Vcl.CheckLst, Vcl.ColorGrd,
  Vcl.NumberBox;

type
  TFormGLOptions = class(TGLDialog)
    tvSettings: TTreeView;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    LabelProgram: TLabel;
    LabelData: TLabel;
    PanelExePath: TPanel;
    cbDataPath: TComboBox;
    ButtonBrowsePathData: TButton;
    CheckBoxLoadProject: TCheckBox;
    CheckBoxSaveProject: TCheckBox;
    cbSplashStart: TCheckBox;
    tsDisplay: TTabSheet;
    LabelBackground: TLabel;
    CheckBoxAxes: TCheckBox;
    Panel1: TPanel;
    CheckBoxCoordinates: TCheckBox;
    cbxTwoSideLighting: TCheckBox;
    tsMaterial: TTabSheet;
    ListView: TListView;
    ButtonModifyMat: TButton;
    tsGalaxy: TTabSheet;
    LabelDiameter: TLabel;
    nbGxDiameter: TNumberBox;
    grbDrakeFormula: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
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
    tsStars: TTabSheet;
    ColorGrid1: TColorGrid;
    chlbStarClasses: TCheckListBox;
    GroupBox2: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    tsPlanets: TTabSheet;
    grbPlanetGuts: TGroupBox;
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
    grbPlanetShow: TGroupBox;
    chbRotate: TCheckBox;
    chbShowAxes: TCheckBox;
    CheckBox4: TCheckBox;
    chbPlanetCore: TCheckBox;
    ButtonGrid: TButton;
    chbAtmosfera: TCheckBox;
    GroupBox1: TGroupBox;
    LabelPlanetTilt: TLabel;
    LabelPlanetDensity: TLabel;
    LabelPlanetRadius: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelGravityAccel: TLabel;
    Label6: TLabel;
    nbTilt: TNumberBox;
    nbDensity: TNumberBox;
    nbRadius: TNumberBox;
    nbRadiusEcv: TNumberBox;
    nbRadiusPol: TNumberBox;
    nbGravityAccel: TNumberBox;
    NumberBox7: TNumberBox;
    tsGeneral: TTabSheet;
    LabelPrecision: TLabel;
    gbxCoordinateSys: TGroupBox;
    chbEquatorial: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    rgrSystem: TRadioGroup;
    rgUnits: TRadioGroup;
    SpinEditPrecision: TSpinEdit;
    PanelScale: TPanel;
    lblScaleX: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    tsFlights: TTabSheet;
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
    ‘ÓÌ: TStaticText;
    rgLanguages: TRadioGroup;
    PanelBackground: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgLanguagesClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure PanelBackgroundClick(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile; override;
  end;

var
  FormGLOptions: TFormGLOptions;

//---------------------------------------------------------------------------
implementation

{$R *.dfm}

uses
  GnuGettext,
  fGalaktika;


procedure TFormGLOptions.FormCreate(Sender: TObject);
begin
  inherited;
  ReadIniFile;
end;

procedure TFormGLOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

procedure TFormGLOptions.ReadIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
//      CheckBoxAxis.Checked := ReadBool(Name, CheckBoxAxis.Name, True);
      PanelBackground.Color  := ReadInteger(Name, PanelBackground.Name, 0);
      LangID := ReadInteger(Name, rgLanguages.Name, 0);
      case LangID of
        LANG_ENGLISH : rgLanguages.ItemIndex := 0;
        LANG_RUSSIAN : rgLanguages.ItemIndex := 1;
        LANG_SPANISH : rgLanguages.ItemIndex := 2;
        LANG_FRENCH  : rgLanguages.ItemIndex := 3;
        LANG_GERMAN  : rgLanguages.ItemIndex := 4;
        LANG_ITALIAN : rgLanguages.ItemIndex := 5;
        else
          rgLanguages.ItemIndex := 0;
      end;
    finally
      IniFile.Free;
    end;
end;

procedure TFormGLOptions.rgLanguagesClick(Sender: TObject);
begin
  case rgLanguages.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN;
    2: CurLangID := LANG_SPANISH;
    3: CurLangID := LANG_FRENCH;
    4: CurLangID := LANG_GERMAN;
    5: CurLangID := LANG_ITALIAN;
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

procedure TFormGLOptions.WriteIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
//      WriteBool(Name, CheckBoxAxis.Name, CheckBoxAxis.Checked);
      WriteInteger(Name, PanelBackground.Name, PanelBackground.Color);
      WriteInteger(Name, rgLanguages.Name, CurLangID);
    finally
      IniFile.Free;
    end;
  inherited;
end;

procedure TFormGLOptions.PanelBackgroundClick(Sender: TObject);
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

procedure TFormGLOptions.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  if CurLangID <> LangID then
  begin
    MessageDlg(_('Reload to change language'),
      mtInformation, [mbOK], 0);
    FileName := ChangeFileExt(ParamStr(0), '.ini');
    if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to exclude dublicated sections for each language
  end;
end;

end.
