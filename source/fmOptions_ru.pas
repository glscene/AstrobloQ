unit fmOptions_ru;

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

  fmFormI;

type
  TFormOptions = class(TFormI)
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
  FormOptions: TFormOptions;

implementation //-----------------------------------------------------------

{$R *.dfm}

uses
  fmAstroScene_ru;

//-------------------------------------------------------------
procedure TFormOptions.FormCreate(Sender: TObject);
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
procedure TFormOptions.CheckBoxAtmosferaClick(Sender: TObject);
begin
 // frmAllPlanets.Atmosphere;
end;

//---------------------------------------------------
// Показать или скрыть оси X, Y, Z небесного тела
//---------------------------------------------------
procedure TFormOptions.CheckBoxAxesClick(Sender: TObject);
begin
  if CheckBoxAxes.Checked then
  begin
    FormAstroScene.sfPlanet.ShowAxes := not FormAstroScene.sfPlanet.ShowAxes;
    FormAstroScene.ffPlanet.ShowAxes := not FormAstroScene.ffPlanet.ShowAxes;
  end;
end;

//---------------------------------------------------
// Показать картографическую сетку
//---------------------------------------------------
procedure TFormOptions.chbCartographicGridClick(Sender: TObject);
begin
  //
end;

//---------------------------------------------------
// Показать разрез с ядром и мантией
//---------------------------------------------------
procedure TFormOptions.CheckBoxCoreClick(Sender: TObject);
begin
  with FormAstroScene do
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
procedure TFormOptions.CheckBoxHidePlanetClick(Sender: TObject);
begin
  if CheckBoxHidePlanet.Checked then
  begin
    FormAstroScene.sfPlanet.Visible := False;
    FormAstroScene.ffPlanet.Visible := False;
    FormAstroScene.DirectOpenGL.Visible := False;
  end
  else
  begin
    FormAstroScene.sfPlanet.Visible := True;
    FormAstroScene.ffPlanet.Visible := True;
    FormAstroScene.DirectOpenGL.Visible := True;
  end;
end;

//---------------------------------------------------------
// Выбор страниц опций
//---------------------------------------------------------
procedure TFormOptions.tvOptionsClick(Sender: TObject);
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

//------------------------------------------------------------
// Запись установок в инифайл
//------------------------------------------------------------
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

//--------------------------------------------------------------
// Изменение и запись в файл при нажатии на кнопку ОК
//--------------------------------------------------------------
procedure TFormOptions.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  FormOptions.Close;
end;


//--------------------------------------------------------------
// Запись при закрытии формы
//--------------------------------------------------------------
procedure TFormOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

end.
