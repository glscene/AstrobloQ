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
  Vcl.ComCtrls,
  Vcl.WinXCtrls,
  Vcl.Samples.Spin,
  Vcl.CheckLst,
  Vcl.ColorGrd,
  Vcl.NumberBox,

  //
  uGlobals,
  dImages,
  fGLForm;

type
  TFormSettings = class(TFormGL)
    PanelBottom: TPanel;
    Button2: TButton;
    ButtonOk: TButton;
    PanelMain: TPanel;
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
    rgLanguages: TRadioGroup;
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
    LabelDiameter: TLabel;
    nbRadius: TNumberBox;
    grbDrakeFormula: TGroupBox;
    PanelDrake: TPanel;
    lbEquals: TLabel;
    lbMult1: TLabel;
    lbMult2: TLabel;
    lbMult3: TLabel;
    lbMult4: TLabel;
    lbDivide: TLabel;
    ButtonCalculate: TButton;
    EditLc: TEdit;
    EditLs: TEdit;
    EditNs: TEdit;
    StaticTextNc: TStaticText;
    StaticTextNs: TStaticText;
    StaticTextFb: TStaticText;
    StaticTextFn: TStaticText;
    StaticTextLc: TStaticText;
    StaticTextLs: TStaticText;
    tsStars: TTabSheet;
    ColorGrid1: TColorGrid;
    chlbStarClasses: TCheckListBox;
    GroupBox2: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    tsGeneral: TTabSheet;
    LabelPrecision: TLabel;
    gbxCoordinateSys: TGroupBox;
    chbEquatorial: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    rgUnits: TRadioGroup;
    SpinEditPrecision: TSpinEdit;
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
    CheckBox4: TCheckBox;
    tsPlanets: TTabSheet;
    chlbPlanetsize: TCheckListBox;
    CheckListBox1: TCheckListBox;
    EditNc: TEdit;
    StaticTextFl: TStaticText;
    nbFl: TNumberBox;
    nbFb: TNumberBox;
    nbFn: TNumberBox;
    Label1: TLabel;
    StaticTextDc: TStaticText;
    StaticText2: TStaticText;
    nbDc: TNumberBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgLanguagesClick(Sender: TObject);
    procedure PanelBackgroundClick(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure trbVelocityChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
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

//---------------------------------------------------------------------------
implementation

{$R *.dfm}

uses
  GnuGettext,
  fGalagrid;


procedure TFormSettings.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ReadIniFile;

  // спектральные классы звёзд по умолчанию
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

  // Заполнение индексов узлов дерева установок
  for I := 0 to tvSettings.Items.Count - 1 do
  begin
    tvSettings.Items[I].ImageIndex := 0;
    tvSettings.Items[I].SelectedIndex := 1;
    tvSettings.Items[I].StateIndex := I;
  end;
  // Items: 4 - Галактика 5 - Звёзды 6 - Планеты
  tvSettings.Select(tvSettings.Items[6]);
  tvSettings.FullExpand;
  tvSettings.Items[6].DropHighlighted := True;

  trbVelocityChange(Self);
end;

procedure TFormSettings.rgLanguagesClick(Sender: TObject);
begin
  case rgLanguages.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN;
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

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

procedure TFormSettings.tvSettingsClick(Sender: TObject);
begin
  inherited;
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

//--------------------------------------------------------------------
procedure TFormSettings.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxis.Checked := IniFile.ReadBool(Name, CheckBoxAxis.Name, True);
    PanelBkg.Color := IniFile.ReadInteger(Name, PanelBkg.Name, 0);
    LangID := IniFile.ReadInteger(Name, rgLanguages.Name, 0);
    case LangID of
      LANG_ENGLISH:
        rgLanguages.ItemIndex := 0;
      LANG_RUSSIAN:
        rgLanguages.ItemIndex := 1;
    else
      rgLanguages.ItemIndex := 0;
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
    IniFile.WriteBool(Name, CheckBoxAxis.Name, CheckBoxAxis.Checked);
    IniFile.WriteInteger(Name, PanelBkg.Name, PanelBkg.Color);
    IniFile.WriteInteger(Name, rgLanguages.Name, CurLangID);
  finally
    IniFile.Free;
  end;
  inherited;
end;

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
  Nc, Fl, Fb, Fn, Ratio : Extended;
  Ns, Lc, Ls: LONG64;
begin
  Ns := StrToInt64(EditNs.Text);

  Fl := nbFl.Value;
  Fb := nbFb.Value;
  Fn := nbFn.Value;

  Lc := StrToInt64(EditLc.Text);
  Ls := StrToInt64(EditLs.Text);

  Ratio := Lc/Ls;
  Nc := Ns*Fl*Fb*Fn *Ratio;  // без времени существования ВЦ
  EditNc.Text := FloatToStr(Nc);
end;

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
