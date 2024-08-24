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
  TfrmSettingsLito = class(TFormI)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsDisplay: TTabSheet;
    tvOptions: TTreeView;
    PanelTop: TPanel;
    ImageList: TImageList;
    tsStars: TTabSheet;
    tsPlanets: TTabSheet;
    tsGeneral: TTabSheet;
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
    grbShowPlanets: TGroupBox;
    CheckBoxRotate: TCheckBox;
    CheckBoxAxes: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBoxCore: TCheckBox;
    grbPlanetParams: TGroupBox;
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
    CheckBoxAtmosfera: TCheckBox;
    GroupBox2: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    chbClouds: TCheckBox;
    chbCartographicGrid: TCheckBox;
    CheckBoxHidePlanet: TCheckBox;
    rgLanguage: TRadioGroup;
    gbShowStars: TGroupBox;
    chbSkyGrid: TCheckBox;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure CheckBoxCoreClick(Sender: TObject);
    procedure CheckBoxAtmosferaClick(Sender: TObject);
    procedure CheckBoxHidePlanetClick(Sender: TObject);
    procedure rgLanguageClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxAxesClick(Sender: TObject);
    procedure chbCartographicGridClick(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  end;

var
  frmSettingsLito: TfrmSettingsLito;

//================================================
implementation

{$R *.dfm}

uses
  flLitosfera;

procedure TfrmSettingsLito.FormCreate(Sender: TObject);
begin
  ReadIniFile;

  // Заполнение индексов узлов дерева установок
  for var I: Integer := 0 to tvOptions.Items.Count - 1 do
  begin
    tvOptions.Items[I].ImageIndex := 0;
    tvOptions.Items[I].SelectedIndex := 1;
    tvOptions.Items[I].StateIndex := I;
    tvOptions.Items[I].Text := _(tvOptions.Items[I].Text);
  end;
  // 0 - Общие 1- Материал 2 - Планеты 3 - Звёзды
  tvOptions.Select(tvOptions.Items[0]);
  tvOptionsClick(Self);
  tvOptions.FullExpand;
  tvOptions.Items[0].DropHighlighted := True;

  inherited;
end;

//---------------------------------------------------
// Show rim of atmosphere
//---------------------------------------------------
procedure TfrmSettingsLito.CheckBoxAtmosferaClick(Sender: TObject);
begin
 // FormLitosfera.Atmosphere;
end;

// Show or hide axes X, Y, Z for a planet
procedure TfrmSettingsLito.CheckBoxAxesClick(Sender: TObject);
begin
  if CheckBoxAxes.Checked then
  begin
    frmLitosphere.sfPlanet.ShowAxes := not frmLitosphere.sfPlanet.ShowAxes;
    frmLitosphere.ffPlanet.ShowAxes := not frmLitosphere.ffPlanet.ShowAxes;
  end;
end;

//---------------------------------------------------
// Show cartographic grid
//---------------------------------------------------
procedure TfrmSettingsLito.chbCartographicGridClick(Sender: TObject);
begin
  //
end;

//---------------------------------------------------
// Show core with mantle
//---------------------------------------------------
procedure TfrmSettingsLito.CheckBoxCoreClick(Sender: TObject);
begin
  with frmLitosphere do
  if CheckBoxCore.Checked then
  begin
    // Переключить невидимую модель планеты типа GLFreeForm
    // на видимую модель планеты типа GLSphere c моделью сечения типа GLDisk
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
// Show or hide planet
//------------------------------------------------------------------
procedure TfrmSettingsLito.CheckBoxHidePlanetClick(Sender: TObject);
begin
  if CheckBoxHidePlanet.Checked then
  begin
    frmLitosphere.sfPlanet.Visible := False;
    frmLitosphere.ffPlanet.Visible := False;
    frmLitosphere.DirectOpenGL.Visible := False;
  end
  else
  begin
    frmLitosphere.sfPlanet.Visible := True;
    frmLitosphere.ffPlanet.Visible := True;
    frmLitosphere.DirectOpenGL.Visible := True;
  end;
end;

//---------------------------------------------------------
procedure TfrmSettingsLito.tvOptionsClick(Sender: TObject);
begin
  case tvOptions.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsDisplay;
     2: PageControl.ActivePage := tsPlanets;
     3: PageControl.ActivePage := tsStars;
  end;
end;

procedure TfrmSettingsLito.rgLanguageClick(Sender: TObject);
begin
  case rgLanguage.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

//------------------------------------------------------------
procedure TfrmSettingsLito.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    ActiveLang := IniFile.ReadInteger(frmSettingsLito.Name, rgLanguage.Name, 0);
    CheckBoxAxes.Checked := IniFile.ReadBool(frmSettingsLito.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(frmSettingsLito.Name, CheckBoxRotate.Name, True);
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

//------------------------------------------------------------
procedure TfrmSettingsLito.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteInteger(frmSettingsLito.Name, rgLanguage.Name, CurLangID);
    IniFile.WriteBool(frmSettingsLito.Name, CheckBoxAxes.Name, CheckBoxAxes.Checked);
    IniFile.WriteBool(frmSettingsLito.Name, CheckBoxRotate.Name, CheckBoxRotate.Checked);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//--------------------------------------------------------------
procedure TfrmSettingsLito.ButtonOKClick(Sender: TObject);
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
  frmSettingsLito.Close;
end;


procedure TfrmSettingsLito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

end.
