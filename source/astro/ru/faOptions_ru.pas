(*****************************************************************************
                           AstrobloQ System
******************************************************************************)
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

  Stage.Color,

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
    tsSkyDome: TTabSheet;
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
    CheckBox4: TCheckBox;
    chbCore: TCheckBox;
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
    chbConstBorders: TCheckBox;
    chbClouds: TCheckBox;
    chbGlobeGrid: TCheckBox;
    chbHideObject: TCheckBox;
    tsDataTim: TTabSheet;
    cbSplashStart: TCheckBox;
    rgUnits: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    chbHidePanels: TCheckBox;
    tsMap: TTabSheet;
    rgMapType: TRadioGroup;
    CheckBoxAxes: TCheckBox;
    CheckBoxRotate: TCheckBox;
    chbSkyGrid: TCheckBox;
    chbAxis: TCheckBox;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure chbInnerCoreClick(Sender: TObject);
    procedure CheckBoxAtmosferaClick(Sender: TObject);
    procedure chbHideObjectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxAxesClick(Sender: TObject);
    procedure chbGlobeGridClick(Sender: TObject);
    procedure chbHidePanelsClick(Sender: TObject);
    procedure chbConstLinesClick(Sender: TObject);
    procedure chbConstBordersClick(Sender: TObject);
    procedure chbCloudsClick(Sender: TObject);
    procedure chbConstFiguresClick(Sender: TObject);
    procedure chbAxisClick(Sender: TObject);
    procedure chbSkyGridClick(Sender: TObject);
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

//-----------------------------------------------------------------------------
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
  // Подсветка темы узла после клика !
  tvOptions.Items[1].DropHighlighted := True;
  // Раскрываем все узлы дерева
  tvOptions.FullExpand;

//  tvOptions.Select(tvOptions.Items[0]);
  tvOptionsClick(Self);
end;

//-----------------------------------------------------------------------------
//                    Показать атмосферу
//-----------------------------------------------------------------------------
procedure TFormOptions.CheckBoxAtmosferaClick(Sender: TObject);
begin
  inherited; // считывает ini файл, не все планеты с атмосферой
  with FormAstroScene do
    DirectOpenGL.Visible := not DirectOpenGL.Visible;
end;

//-----------------------------------------------------------------------------
//                 Показать или скрыть оси X, Y, Z небесного тела
//-----------------------------------------------------------------------------
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
    PanelLeft.Visible := not PanelLeft.Visible;
    PanelRight.Visible := not PanelRight.Visible;
    StatusBar.Visible := not StatusBar.Visible;
    ControlBarTop.Visible := not ControlBarTop.Visible;
    FormAstroScene.BorderStyle := bsNone;
  end
  else  // Скрыть панели
  begin
    PanelLeft.Visible := not PanelLeft.Visible;
    PanelRight.Visible := not PanelRight.Visible;
    StatusBar.Visible := not StatusBar.Visible;
    ControlBarTop.Visible := not ControlBarTop.Visible;
    FormAstroScene.BorderStyle := bsSizeable;
  end;
end;

//-----------------------------------------------------------------------------
//                         Разрез с ядром и мантией
//-----------------------------------------------------------------------------
procedure TFormOptions.chbInnerCoreClick(Sender: TObject);
begin
  inherited;  // считываем сохранённые опции из ini файла

  if chbCore.Checked then
  with FormAstroScene do
  begin
    if chbClouds.Checked = True then
    begin
      chbClouds.Checked := False;
    end
    else
    begin

    end;
    // Если активна модель типа GLFreeForm, то переключиться
    // на модель планеты типа GLSphere и сечение типа GLDisk
    case vBodyType of
    1: begin // Планета
         sfPlanet.Stop := 180;
//       if aColor then ... получить цвет дисков из файла sol_planets.csv
         begin
           sfCore.Material.FrontProperties.Emission.Color := clrRed;
           diskMantle.Material.FrontProperties.Ambient.Color := clrOrangeRed;
           diskCrust.Material.FrontProperties.Ambient.Color := clrYellow;
         end;
(*
        else // если есть карта сечения планеты через ядро
          FileJpg := CurrentStar +
          tbPlanets.Buttons[TToolButton(Sender).ImageIndex].ImageName + '.jpg';
        if FileExists(FileJpg + '_core.jpg') then
          diskMantle.Material.Texture.Image.LoadFromFile(FileJpg + '_core.jpg')
 *)
       end;
    2: begin // Луна
         sfMoon.Stop := 180;
         sfMoonCore.Material.FrontProperties.Emission.RandomColor;
         diskMoonMantle.Material.FrontProperties.Emission.RandomColor;
         diskMoonCrust.Material.FrontProperties.Emission.RandomColor;
         // если загрузить карту сечения
         //FileJpg := CurrentStar + tvMoons.Selected.Text;

       end;
    3: begin // Астероид
         sfAsteroid.Stop := 180;
         sfMoonCore.Material.FrontProperties.Emission.RandomColor;
         diskMoonMantle.Material.FrontProperties.Emission.RandomColor;
         diskMoonCrust.Material.FrontProperties.Emission.RandomColor;
//         FileJpg := CurrentStar + FormAstroScene.tvAsteroids.Selected.Text;
       end;
    4: begin // Комета
         // if aColor then ... получить цвет дисков из файла sol_comets.csv
         // sfComet.Material.Texture.Disabled := True;
         // ffComet.Material.Texture.Disabled := True;

         // else разрешаем текстурирование комет
         // FileJpg := CurrentStar + tvComets.Selected.Text;
         // sfComet.Material.Texture.Disabled := False;
         // ffComet.Material.Texture.Disabled := False;
         //
       end
    else
    begin
      //
    end;
    end; // case
  end
  else
  with FormAstroScene do
  begin
    sfPlanet.Stop := 360;
    sfMoon.Stop := 360;
    sfAsteroid.Stop := 360;
  end;
end;

//---------------------------------------------------------------------------
//                           Сетка небосвода
//---------------------------------------------------------------------------
procedure TFormOptions.chbSkyGridClick(Sender: TObject);
begin
  FormAstroScene.dcSkyGrid.Visible := chbSkyGrid.Checked;
end;

//--------------------------------------------------------------------------
//                           Cетка глобуса
//--------------------------------------------------------------------------
procedure TFormOptions.chbGlobeGridClick(Sender: TObject);
begin
  FormAstroScene.dcGlobeGrid.Visible := chbGlobeGrid.Checked;
end;

// ------------------------------- Оси -------------------------------------
procedure TFormOptions.chbAxisClick(Sender: TObject);
begin
  FormAstroScene.sfPlanet.ShowAxes := chbAxis.Checked;
  FormAstroScene.ffPlanet.ShowAxes := chbAxis.Checked;
  FormAstroScene.dcArrows.Visible := chbAxis.Checked;
end;

// ------------------------ Облачность --------------------------------------
procedure TFormOptions.chbCloudsClick(Sender: TObject);
begin
  FormAstroScene.sfGlobeClouds.Visible := chbClouds.Checked;
end;

//---------------------- Вывод линий созвездий ------------------------------
procedure TFormOptions.chbConstLinesClick(Sender: TObject);
begin
  FormAstroScene.polylineConstells.Nodes.Clear;
 // chbConstLines.Checked := not chbConstLines.Checked;
  if chbConstLines.Checked then
  begin
    FormAstroScene.ConstLinesAlpha := 0.5 - FormAstroScene.ConstLinesAlpha;
    FormAstroScene.LoadConstLines;
  end;
end;

//---------------------- Вывод границ созвездий -----------------------------
procedure TFormOptions.chbConstBordersClick(Sender: TObject);
begin
  FormAstroScene.polygonBorders.Nodes.Clear;
//  chbConstBorders.Checked := not chbConstBorders.Checked;
  if chbConstBorders.Checked then
  begin
    FormAstroScene.ConstBordersAlpha := 0.5 - FormAstroScene.ConstBordersAlpha;
    FormAstroScene.LoadConstBorders;
  end;
end;

//---------------------------------------------------------------------------
procedure TFormOptions.chbConstFiguresClick(Sender: TObject);
begin
  // Figures inside borders of costallations
end;

//---------------------------------------------------------------------------
// Показать или скрыть небесное тело
//---------------------------------------------------------------------------
procedure TFormOptions.chbHideObjectClick(Sender: TObject);
begin
  with FormAstroScene do
  if chbHideObject.Checked then
  begin
    sfPlanet.Visible := False;
    sfMoon.Visible := False;
    ffMoon.Visible := False;
    sfAsteroid.Visible := False;
    ffAsteroid.Visible := False;
    ffComet.Visible := False;
    DirectOpenGL.Visible := False;
  end
  else
  begin
    sfPlanet.Visible := True;
    sfMoon.Visible := True;
    ffMoon.Visible := True;
    sfAsteroid.Visible := True;
    ffAsteroid.Visible := True;
    ffComet.Visible := True;
    DirectOpenGL.Visible := True;
  end;
end;

//---------------------------------------------------------------------------
// Выбор страниц опций
//---------------------------------------------------------------------------
procedure TFormOptions.tvOptionsClick(Sender: TObject);
begin
  tvOptions.Items[1].DropHighlighted := False;
  case tvOptions.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsMap;
     2: PageControl.ActivePage := tsScene;
     3: PageControl.ActivePage := tsDataTim;
     4: PageControl.ActivePage := tsPlanets;
     5: PageControl.ActivePage := tsSkyDome;
  end;
end;

//---------------------------------------------------------------------------
// Чтение установок из ини файла
//---------------------------------------------------------------------------
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

//---------------------------------------------------------------------------
// Запись установок в инифайл
//---------------------------------------------------------------------------
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

//---------------------------------------------------------------------------
// Изменение и запись в файл при нажатии на кнопку ОК
//---------------------------------------------------------------------------
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


//---------------------------------------------------------------------------
// Запись при закрытии формы
//---------------------------------------------------------------------------
procedure TFormOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

//---------------------------------------------------------------------------
end.
