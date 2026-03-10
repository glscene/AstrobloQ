unit faOptions_ru;

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
  TFormOptions = class(TFormFirst)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsScene: TTabSheet;
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
    chbHidePlanet: TCheckBox;
    gbShowStars: TGroupBox;
    chbSkyGrid: TCheckBox;
    tsDataTim: TTabSheet;
    cbSplashStart: TCheckBox;
    rgUnits: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    chbHidePanels: TCheckBox;
    tsMap: TTabSheet;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure CheckBoxCoreClick(Sender: TObject);
    procedure CheckBoxAtmosferaClick(Sender: TObject);
    procedure chbHidePlanetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxAxesClick(Sender: TObject);
    procedure chbCartographicGridClick(Sender: TObject);
    procedure chbHidePanelsClick(Sender: TObject);
  private
  public
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  end;

var
  FormOptions: TFormOptions;

implementation //==============================================================

{$R *.dfm}

uses
  faAstroScene_ru;

//-------------------------------------------------------------
procedure TFormOptions.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;

begin
  // Загрузка сохранённых опций интерфейса
  ReadIniFile;

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
  inherited; // считывает ini файл, не все планеты с атмосферой
  with FormAstroScene do
    DirectOpenGL.Visible := not DirectOpenGL.Visible;
end;

//---------------------------------------------------
// Показать или скрыть оси X, Y, Z небесного тела
//---------------------------------------------------
procedure TFormOptions.CheckBoxAxesClick(Sender: TObject);
begin
  inherited; // считывает параметры из ini файла
  with FormAstroScene do
  if CheckBoxAxes.Checked then
  begin
    sfPlanet.ShowAxes := not sfPlanet.ShowAxes;
    ffPlanet.ShowAxes := not ffPlanet.ShowAxes;
  end else
  begin
    sfPlanet.ShowAxes := not sfPlanet.ShowAxes;
    ffPlanet.ShowAxes := not ffPlanet.ShowAxes;
  end;
end;

//----------------------------------------------------------------------------
procedure TFormOptions.chbHidePanelsClick(Sender: TObject);
begin
  inherited;  // считывает параметры из ini файла
  with FormAstroScene do
  if chbHidePanels.Checked then // Показать панели
  begin
//    PanelLeft.Visible := not PanelLeft.Visible;
//    PanelRight.Visible := not PanelRight.Visible;
    StatusBar.Visible := not StatusBar.Visible;
    ControlBarTop.Visible := not ControlBarTop.Visible;
    FormAstroScene.BorderStyle := bsNone;
  end
  else  // Скрыть панели
  begin
//    PanelLeft.Visible := not PanelLeft.Visible;
//    PanelRight.Visible := not PanelRight.Visible;
    StatusBar.Visible := not StatusBar.Visible;
    ControlBarTop.Visible := not ControlBarTop.Visible;
    FormAstroScene.BorderStyle := bsSizeable;
  end;
end;

//-----------------------------------------------------------------------------
// Разрез с ядром и мантией
//-----------------------------------------------------------------------------
procedure TFormOptions.CheckBoxCoreClick(Sender: TObject);
var
  PlanetPath: TFileName;
begin
  inherited;  // считывает параметры из ini файла
  with FormAstroScene do
  if CheckBoxCore.Checked then
  begin
    // Переключить невидимую модель планеты типа GLFreeForm
    // на видимую модель планеты типа GLSphere c моделью сечения типа GLDisk
///    PlanetPath := CurrentStar + tvMoons.Selected.Text;
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

//-----------------------------------------------------------------------------
// Картографическая сетка
//-----------------------------------------------------------------------------
procedure TFormOptions.chbCartographicGridClick(Sender: TObject);
begin
  //
end;

//------------------------------------------------------------------
// Показать или скрыть небесное тело
//------------------------------------------------------------------
procedure TFormOptions.chbHidePlanetClick(Sender: TObject);
begin
  with FormAstroScene do
  if chbHidePlanet.Checked then
  begin
    dcPlanet.Visible := not dcPlanet.Visible;
//    sfPlanet.Visible := False;
//    ffPlanet.Visible := False;
    DirectOpenGL.Visible := False;
  end
  else
  begin
    dcPlanet.Visible := not dcPlanet.Visible;
//    sfPlanet.Visible := True;
//    ffPlanet.Visible := True;
    DirectOpenGL.Visible := True;
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
     1: PageControl.ActivePage := tsMap;
     2: PageControl.ActivePage := tsScene;
     3: PageControl.ActivePage := tsDataTim;
     4: PageControl.ActivePage := tsPlanets;
     5: PageControl.ActivePage := tsStars;
  end;
end;

//------------------------------------------------------------
// Чтение установок из ини файла
//------------------------------------------------------------
procedure TFormOptions.ReadIniFile;
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
  inherited;
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;   // запись опций в ини файл
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
