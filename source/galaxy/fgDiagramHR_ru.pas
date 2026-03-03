unit fgDiagramHR_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Math,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  VCLTee.TeeData,
  Data.DB,
  VCLTee.TeEngine,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.Series,

  GLS.Material,
  GLS.Color,
  GLS.Canvas,
  GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,

  fmFormFirst,
  Astro.ReadHyg,
  Astro.Utils,
  GLS.Cadencer
  ;

type
  TFormDiagramHR = class(TFormFirst)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLMaterialLibrary1: TGLMaterialLibrary;
    PanelRight: TPanel;
    GLCadencer1: TGLCadencer;
    Timer1: TTimer;
    Chart1: TChart;
    SeriesDataSet1: TSeriesDataSet;
    ChartDataSet1: TChartDataSet;
    Series1: TLineSeries;
    Series2: TPointSeries;
    procedure FormCreate(Sender: TObject);
  private
    // Recalculation of B-V and Mag into screen coordinates x, y
    procedure XY(B_V, Mag: single; var x, y: integer);
  public
    GLCanvas: TGLCanvas;
    procedure HerpResBV;
  end;

var
  FormDiagramHR: TFormDiagramHR;

const
  MagLow = 15.0;
  MagHi = -5.0; // Диапазон по абс. зв. величине
  BVLow = -0.5;
  BVHi = 2.0; // Диапазон по B-V
  Border = 50; // Отступ диаграммы от края окна
  RelErr = 0.5; // Относительная точность определения параллакса

var
  ScaleMg: double; // Масштаб по оси абс. зв. величин
  ScaleBV: double; // Масштаб по оси показателя цвета

implementation //=============================================================

{$R *.dfm}

// --------------------------------------------------------------------
procedure TFormDiagramHR.XY(B_V, Mag: single; var x, y: integer);
begin
  x := Border + Round((B_V - BVLow) * ScaleBV);
  y := Border + Round((Mag - MagHi) * ScaleMg);
end;

// --------------------------------------------------------------------

procedure TFormDiagramHR.FormCreate(Sender: TObject);
begin
  //
  inherited;
end;

procedure TFormDiagramHR.HerpResBV;
var
  mode: smallint; // Для инициализации графики
  HipRec: THipparcos; // Звезда в Hipparcos
  r: double; // Расстояние
  Mag: single; // Абсолютная звёздная величина
  BV: single; // Показательцвета
  buf: string[15]; // Буфер для формирования текстовых строк
  x, y, x1, y1: integer; // Экранные координаты
  Color: TGLColorVector; // Цвет точки
begin
  // Инициализация графического окна
  mode := 0;
  /// InitGraph(driver, mode, 'D:/BP/BGI');
  GLCanvas.Create(x,y);
  // Определение масштабов по осям
///  ScaleMg := (GetMaxY - 2 * Border) / (MagLow - MagHi);
///  ScaleBV := (GetMaxY - 2 * Border) / (BVHi - BVLow);
  // Заливка фона и установка цвета
///  SetFillStyle(SolidFill, White);
///  Bar(0, 0, GetMaxX, GetMaxY);
///  SetColor(Black);
  // Отрисовка обрамляющей рамки
  XY(BVLow, MagHi, x, y);
  XY(BVHi, MagLow, x1, y1);
  GLCanvas.FrameRect(x, y, x1, y1);
  // Разметка оси показателя цвета
///  SetTextJustify(CenterText, TopText);
  BV := BVLow;
  repeat
    XY(BV, 15, x, y);
    GLCanvas.Line(x, y, x, y + 3);
    Str(BV: 0: 1, buf);
///    GLCanvas.OutTextXY(x, y + 5, buf);
    BV := BV + 0.5;
  until BV > BVHi;
  // Разметка оси абс. зв. величин
///  SetTextJustify(RightText, CenterText);
  Mag := MagHi;
  Repeat
    XY(BVLow, Mag, x, y);
    GLCanvas.Line(x, y, x - 3, y);
    Str(Mag: 0: 0, buf);
///    OutTextXY(x - 5, y, buf);
    Mag := Mag + 5;
  until Mag > MagLow;
  OpenHygMain;
///  InitCriteria('100.txt');
  while ReadHygMain(HipRec) do
  begin
    if (HipRec.info and NoPlx) <> 0 then
      continue; // нет параллакса
    if (HipRec.info and NoB_V) <> 0 then
      continue; // нет B-V
    if (HipRec.info and NoVMag) <> 0 then
      continue; // нет V Mag
    if HipRec.plx <= 0.0 then
      continue; // "плохой" параллакс
    if HipRec.sigma.plx / HipRec.plx > RelErr then
      continue; // низкая точность
    if not inCelestia(HipRec.HIP) then continue; // нет в списке
    r := 1000.0 / HipRec.plx; // Вычисление расстояния в пк
    Mag := HipRec.VMag - 5.0 * log10(r) + 5.0; // Вычисл. абс. звезд. величины
    case HipRec.SP[0] of // Определение цвета точки
      'O','B':
        color := clrLightBlue;
      'A':
        color := clrLightPurple; // was LightCyan
      'F', 'G':
        color := clrYellow;
      'K', 'M':
        color := clrRed; //was LightRed
    else
      color := clrLightGray;
    end; // case
    XY(HipRec.B_V, Mag, x, y); // Вычисление экранных координат точки
    GLCanvas.PlotPixel(x, y); // Поставить точку цвета color
  end; // while
  ClearCriteria;
  CloseHygMain;
end;

end.
