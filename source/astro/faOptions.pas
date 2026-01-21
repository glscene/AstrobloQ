unit faOptions;

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
  Vcl.Themes,

  fmFormFirst;

type
  TfrmOptions = class(TfrmFirst)
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
    gbShowStars: TGroupBox;
    chbSkyGrid: TCheckBox;
    tsInterface: TTabSheet;
    cbSplashStart: TCheckBox;
    ComboBoxVclStyles: TComboBox;
    lbStyle: TLabel;
    rgUnits: TRadioGroup;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure CheckBoxCoreClick(Sender: TObject);
    procedure CheckBoxAtmosferaClick(Sender: TObject);
    procedure CheckBoxHidePlanetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxAxesClick(Sender: TObject);
    procedure chbCartographicGridClick(Sender: TObject);
  private
  public
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  end;

var
  frmOptions: TfrmOptions;

implementation //-----------------------------------------------------------

{$R *.dfm}

uses
  fmAstroScene;

//-------------------------------------------------------------
procedure TfrmOptions.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;

begin
  // Загрузка сохранённых опций интерфейса
  ReadIniFile;

  // Включение стилей интерфейса в комбобокс
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Заполнение индексов узлов дерева установок
  for I := 0 to tvOptions.Items.Count - 1 do
  begin
    tvOptions.Items[I].ImageIndex := 0;
    tvOptions.Items[I].SelectedIndex := 1;
    tvOptions.Items[I].StateIndex := I;
  end;

  // Выбор начальной темы узла дерева
  tvOptions.Items[1].Selected := True;
  tvOptionsClick(Self);
  // Подсветка темы узла после клика !
  tvOptions.Items[1].DropHighlighted := True;
  // Раскрываем все узлы дерева
  tvOptions.FullExpand;

//  tvOptions.Select(tvOptions.Items[0]);
//  tvOptionsClick(Self);

  inherited;
end;

//---------------------------------------------------
// Показать кайму атмосферы
//---------------------------------------------------
procedure TfrmOptions.CheckBoxAtmosferaClick(Sender: TObject);
begin
 // frmAllPlanets.Atmosphere;
end;

//---------------------------------------------------
// Показать или скрыть оси X, Y, Z небесного тела
//---------------------------------------------------
procedure TfrmOptions.CheckBoxAxesClick(Sender: TObject);
begin
  if CheckBoxAxes.Checked then
  begin
    frmAstroScene.sfPlanet.ShowAxes := not frmAstroScene.sfPlanet.ShowAxes;
    frmAstroScene.ffPlanet.ShowAxes := not frmAstroScene.ffPlanet.ShowAxes;
  end;
end;

//---------------------------------------------------
// Показать картографическую сетку
//---------------------------------------------------
procedure TfrmOptions.chbCartographicGridClick(Sender: TObject);
begin
  //
end;

//---------------------------------------------------
// Показать разрез с ядром и мантией
//---------------------------------------------------
procedure TfrmOptions.CheckBoxCoreClick(Sender: TObject);
begin
  with frmAstroScene do
  if CheckBoxCore.Checked then
  begin
    // Переключить невидимую модель планеты типа GLFreeForm
    // на видимую модель планеты типа GLSphere c моделью сечения типа GLDisk
    PlanetPath := CurrentStar + tvMoons.Selected.Text;
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
// Показать или скрыть небесное тело
//------------------------------------------------------------------
procedure TfrmOptions.CheckBoxHidePlanetClick(Sender: TObject);
begin
  if CheckBoxHidePlanet.Checked then
  begin
    frmAstroScene.sfPlanet.Visible := False;
    frmAstroScene.ffPlanet.Visible := False;
    frmAstroScene.DirectOpenGL.Visible := False;
  end
  else
  begin
    frmAstroScene.sfPlanet.Visible := True;
    frmAstroScene.ffPlanet.Visible := True;
    frmAstroScene.DirectOpenGL.Visible := True;
  end;
end;

//---------------------------------------------------------
// Выбор страниц опций
//---------------------------------------------------------
procedure TfrmOptions.tvOptionsClick(Sender: TObject);
begin
  tvOptions.Items[1].DropHighlighted := False;
  case tvOptions.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsDisplay;
     3: PageControl.ActivePage := tsPlanets;
     4: PageControl.ActivePage := tsStars;
  end;
end;

//------------------------------------------------------------
// Чтение установок из ини файла
//------------------------------------------------------------
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

//------------------------------------------------------------
// Запись установок в инифайл
//------------------------------------------------------------
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

//--------------------------------------------------------------
// Изменение и запись в файл при нажатии на кнопку ОК
//--------------------------------------------------------------
procedure TfrmOptions.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  frmOptions.Close;
end;


//--------------------------------------------------------------
// Запись при закрытии формы
//--------------------------------------------------------------
procedure TfrmOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

end.
