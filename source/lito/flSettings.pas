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
  System.IniFiles,
  System.UITypes,

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


  gnuGettext,
  fForm;

type
  TFormSettings = class(TFormI)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsMaterial: TTabSheet;
    ListView: TListView;
    ButtonModifyMat: TButton;
    tvOptions: TTreeView;
    PanelTop: TPanel;
    ImageList: TImageList;
    tsStars: TTabSheet;
    tsPlanets: TTabSheet;
    tsGeneral: TTabSheet;
    rgUnits: TRadioGroup;
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
    chbCore: TCheckBox;
    GroupBox1: TGroupBox;
    nbTilt: TNumberBox;
    LabelPlanetTilt: TLabel;
    nbDensity: TNumberBox;
    LabelPlanetDensity: TLabel;
    nbRadius: TNumberBox;
    LabelPlanetRadius: TLabel;
    nbGravityAccel: TNumberBox;
    LabelGravityAccel: TLabel;
    NumberBox7: TNumberBox;
    Label6: TLabel;
    chbAtmosfera: TCheckBox;
    GroupBox2: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    chbClouds: TCheckBox;
    CheckBox1: TCheckBox;
    chbHidePlanet: TCheckBox;
    CheckBox3: TCheckBox;
    rgLanguage: TRadioGroup;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure chbCoreClick(Sender: TObject);
    procedure chbAtmosferaClick(Sender: TObject);
    procedure chbHidePlanetClick(Sender: TObject);
    procedure rgLanguageClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  end;

var
  FormSettings: TFormSettings;

//================================================
implementation

{$R *.dfm}

uses
  flLitosfera;

procedure TFormSettings.FormCreate(Sender: TObject);
begin
  // спектральные классы звёзд по умолчанию
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

  // Заполнение индексов узлов дерева установок
  for var I: Integer := 0 to tvOptions.Items.Count - 1 do
  begin
    tvOptions.Items[I].ImageIndex := 0;
    tvOptions.Items[I].SelectedIndex := 1;
    tvOptions.Items[I].StateIndex := I;
  end;
  // 0 - Общие 1- Материал 2 - Планеты 3 - Звёзды
  tvOptions.Select(tvOptions.Items[0]);
  tvOptionsClick(Self);
  tvOptions.FullExpand;
  tvOptions.Items[0].DropHighlighted := True;

  inherited;
end;

//---------------------------------------------------
// Показать кромку атмосферы
//---------------------------------------------------
procedure TFormSettings.chbAtmosferaClick(Sender: TObject);
begin
 // FormLitosfera.Atmosphere;
end;

//---------------------------------------------------
// Показать разрез планеты с корой, мантией и ядром
//---------------------------------------------------
procedure TFormSettings.chbCoreClick(Sender: TObject);
begin
  with FormLitosfera do
  if chbCore.Checked then
  begin
    // Переключить невидимую GLFreeForm модель планеты на видимую GLSphere модель и GLDisk
    PlanetPath := CurrentStar + tvPlanets.Selected.Text;
    if FileExists(PlanetPath + '_core.jpg') then
      diskMantle.Material.Texture.Image.LoadFromFile(PlanetPath + '_core.jpg')
    else
      diskMantle.Material.Texture.Image.LoadFromFile(PlanetPath + '.jpg');
    sfPlanet.Stop := 180;
    Atmosphere.Visible := False;
  end
  else
  begin
    sfPlanet.Stop := 360;
    Atmosphere.Visible := True;
  end;
end;

//------------------------------------------------------------------
// Показать или скрыть планету
//------------------------------------------------------------------
procedure TFormSettings.chbHidePlanetClick(Sender: TObject);
begin
 // FormLitosfera.ShowHidePlanet;
  if chbHidePlanet.Checked then
  begin
    FormLitosfera.sfPlanet.Visible := False;
    FormLitosfera.ffPlanet.Visible := False;
    FormLitosfera.DirectOpenGL.Visible := False;
  end
  else
  begin
    FormLitosfera.sfPlanet.Visible := True;
    FormLitosfera.ffPlanet.Visible := True;
    FormLitosfera.DirectOpenGL.Visible := True;
  end;
end;

//---------------------------------------------------------
procedure TFormSettings.tvOptionsClick(Sender: TObject);
begin
  case tvOptions.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsMaterial;
     2: PageControl.ActivePage := tsPlanets;
     3: PageControl.ActivePage := tsStars;
  end;
end;

procedure TFormSettings.rgLanguageClick(Sender: TObject);
begin
  case rgLanguage.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

//------------------------------------------------------------
procedure TFormSettings.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
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

//------------------------------------------------------------
procedure TFormSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteInteger(FormSettings.Name, rgLanguage.Name, CurLangID);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//--------------------------------------------------------------
procedure TFormSettings.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  MessageDlg(_('Reload to change language'),
      mtInformation, [mbOK], 0);
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to avoid duplication of sections

  Close;
end;


procedure TFormSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

end.
