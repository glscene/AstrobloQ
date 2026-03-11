(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fgGalaqtium_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IniFiles,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ToolWin,
  Vcl.Samples.Spin,
  Vcl.StdCtrls,
  Vcl.NumberBox,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtDlgs,
  Vcl.Actnlist,

  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Comp.BatchMove,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.AsyncTimer,
  GLS.Cadencer,
  GLS.Objects,
  GLS.Graph,
  GLS.Coordinates,
  GLS.GeomObjects,
  GLS.SimpleNavigation,
  GLS.VectorFileObjects,
  GLS.Material,
  GLS.Color,
  GLS.SpaceText,
  GLS.VectorLists,

  dmImages,
  dmDialogs,
  dmBase,

  Astro.Globals,

  fmFormFirst,
  fmAbout_ru,

  fgProjections_ru,
  fgCETInet_ru,
  fgMonitor_ru,
  fgNewStarblock_ru,
  fgViewSolarblock_ru,
  fgOptions_ru,
  fgParadox_ru,
  fgEquations_ru,
  fgStatistics_ru,
  fgDiagramHR_ru
  ;

type
  TFormGalaqtium = class(TFormFirst)
    GLScene: TGLScene;
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    GLAsyncTimer: TGLAsyncTimer;
    GLCadencer: TGLCadencer;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    miSaveAs: TMenuItem;
    miExit: TMenuItem;
    miN2: TMenuItem;
    miEdit: TMenuItem;
    miUndo: TMenuItem;
    miCut: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miFind: TMenuItem;
    miReplace: TMenuItem;
    miGoTo: TMenuItem;
    miObject: TMenuItem;
    miN1: TMenuItem;
    miN3: TMenuItem;
    miN4: TMenuItem;
    miTools: TMenuItem;
    miOptions: TMenuItem;
    miPanelShow: TMenuItem;
    miN5: TMenuItem;
    miHelp: TMenuItem;
    miRuwiki: TMenuItem;
    miAbout: TMenuItem;
    miN6: TMenuItem;
    Camera: TGLCamera;
    Lighting: TGLLightSource;
    dcGalaxy: TGLDummyCube;
    dcSolarBlock: TGLDummyCube;
    ArrowZ: TGLArrowLine;
    ArrowY: TGLArrowLine;
    ArrowX: TGLArrowLine;
    XYZGrid: TGLXYZGrid;
    ControlBar: TControlBar;
    diskGalaxy: TGLDisk;
    ToolBarMain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PageControl1: TPageControl;
    tsGalacube: TTabSheet;
    svGalaxyBlock: TGLSceneViewer;
    LightSol: TGLLightSource;
    GLSimpleNavigation: TGLSimpleNavigation;
    dcAxes: TGLDummyCube;
    Stars: TGLPoints;
    SpaceTextX: TGLSpaceText;
    SpaceTextY: TGLSpaceText;
    SpaceTextZ: TGLSpaceText;
    tsDatacat: TTabSheet;
    DBGrid: TDBGrid;
    MemoTable: TMemo;
    ToolButton4: TToolButton;
    miDiagramHR: TMenuItem;
    miMonitor: TMenuItem;
    ToolBarView: TToolBar;
    tbSolarcube: TToolButton;
    tbAddStars: TToolButton;
    tbClearCubes: TToolButton;
    tbAxes: TToolButton;
    miParadox: TMenuItem;
    miOpenExoplanets: TMenuItem;
    tbRotation: TToolButton;
    miNewStarblock: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    miProjection: TMenuItem;
    N3: TMenuItem;
    miMethod: TMenuItem;
    miGridding: TMenuItem;
    miInterpolate: TMenuItem;
    miTetranet: TMenuItem;
    N4: TMenuItem;
    ranslator1: TMenuItem;
    GLMatLib: TGLMaterialLibrary;
    miSettings: TMenuItem;
    celGalaxy: TGLCylinder;
    sphGalaxy: TGLSphere;
    ansGHZ: TGLAnnulus;
    miAnalytics: TMenuItem;
    N6: TMenuItem;
    miCETI: TMenuItem;
    N8: TMenuItem;
    miStatistics: TMenuItem;
    miEquations: TMenuItem;
    miConvolute: TMenuItem;
    miStarBlock: TMenuItem;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miProjectionClick(Sender: TObject);
    procedure miPanelShowClick(Sender: TObject);
    procedure GLAsyncTimerTimer(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject;
      const DeltaTime, NewTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure svGalaxyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure svGalaxyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonAddStarsClick(Sender: TObject);
    procedure chbAllClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure seNStarsChange(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure miDiagramHRClick(Sender: TObject);
    procedure miMonitorClick(Sender: TObject);
    procedure tbSolarcubeClick(Sender: TObject);
    procedure miParadoxClick(Sender: TObject);
    procedure miOpenExoplanetsClick(Sender: TObject);
    procedure tbAxesClick(Sender: TObject);
    procedure miNewStarblockClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miCETIClick(Sender: TObject);
    procedure miStatisticsClick(Sender: TObject);
    procedure miEquationsClick(Sender: TObject);
    procedure miTetranetClick(Sender: TObject);
    procedure miGriddingClick(Sender: TObject);
    procedure miInterpolateClick(Sender: TObject);
    procedure miConvoluteClick(Sender: TObject);
    procedure miStarBlockClick(Sender: TObject);
  public
    MousePoint: TPoint;
    procedure MakeRandomStars;
    function ReadHygStars: Boolean;
  private
    AtStart: Boolean;
    FileName, CatalogName: TFileName;
    DataDir, StarDir, CurrentStar: TFileName;
    mx, my, dmx, dmy: Integer;
    sl, tl: TStringList;
    x, y, z, g: Single; // Current coordinates of a star
    spect: string; // Spectral class of stars
    Color: TVector3f;
    StarColor: TGLColorVector;
    NStars: Integer;
    NSpectralClass: Byte;
    RealColor: TColor;
    RealGLColor: TGLColor;
  end;

const
  crLightxz = 1;
  crLightyz = 2;
  crLightxy = 3;
  crSlidexy = 4;
  crSlideyz = 5;
  crSlidexz = 6;
  crRotate = 7;
  crZoom = 8;
  crHandMove = 9;
  crSlidezy = 10;

var
  FormGalaqtium: TFormGalaqtium;

implementation //=============================================================

{$R *.dfm}

uses
  fgExoplanets_ru,
  fmSettings_ru;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.FormCreate(Sender: TObject);
begin
  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');

  tbSolarcubeClick(Self);
  tbAxesClick(Self);
  inherited;    // inheritance for translation
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.GLCadencerProgress(Sender: TObject;
  const DeltaTime, NewTime: Double);
begin
  if FormOptions.CheckBoxRotate.Checked and
     not tbRotation.Down then
  begin
//    sfPlanet.TurnAngle := sfPlanet.TurnAngle + DeltaTime * TimeMultiplier;
//    ffPlanet.TurnAngle := ffPlanet.TurnAngle + DeltaTime * TimeMultiplier;
    dcSolarBlock.Roll(0.001);
    dcGalaxy.Turn(0.001);
    dcAxes.Turn(0.001);
  end
  else
  begin
    dcSolarBlock.Roll(0);
    dcGalaxy.Turn(0);
    dcAxes.Turn(0);
  end;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.GLAsyncTimerTimer(Sender: TObject);
begin
  // diskGalaxy.Roll(0.01);
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.MakeRandomStars;
var
  i: Integer;
  Edge, Edge05: Integer;

begin
  Stars := TGLPoints(dcGalaxy.AddNewChild(TGLPoints));
  Stars.Size := 5.0;
  Stars.Style := psSmooth;
  Edge := Round(dcGalaxy.CubeSize);  // or Solcube.CubeSize
  Edge05 := Edge div 2;

  // O class
  if (FormOptions.chbO.Checked) then
  begin
    NStars := Round(FormOptions.nbOn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shO.Brush.Color); // clBlue;
      Stars.Colors.Add(StarColor);
    end
  end;
  // B class
  if (FormOptions.chbB.Checked) then
  begin
    NStars := Round(FormOptions.nbBn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shB.Brush.Color); // clLightBlue;
      Stars.Colors.Add(StarColor);
    end
  end;
  // A class
  if (FormOptions.chbA.Checked) then
  begin
    NStars := Round(FormOptions.nbAn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shA.Brush.Color); // clCream;
      Stars.Colors.Add(StarColor);
    end
  end;
  // F class
  if (FormOptions.chbF.Checked) then
  begin
    NStars := Round(FormOptions.nbFn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shF.Brush.Color); // clKhaki
      Stars.Colors.Add(StarColor);
    end
  end;
  // G class
  if (FormOptions.chbG.Checked) then
  begin
    NStars := Round(FormOptions.nbGn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shG.Brush.Color); // clYellow
      Stars.Colors.Add(StarColor);
    end
  end;
  // K class
  if (FormOptions.chbK.Checked) then
  begin
    NStars := Round(FormOptions.nbKn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shK.Brush.Color); // clOrange
      Stars.Colors.Add(StarColor);
    end
  end;
  // M class
  if (FormOptions.chbM.Checked) then
  begin
    NStars := Round(FormOptions.nbMn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shM.Brush.Color); // clRed
      Stars.Colors.Add(StarColor);
    end
  end;
  // D class of white dwarf
  if (FormOptions.chbD.Checked) then
  begin
    NStars := Round(FormOptions.nbDn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(FormOptions.shD.Brush.Color); // clWhite
      Stars.Colors.Add(StarColor);
    end
  end;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.ButtonClearClick(Sender: TObject);
begin
  dcSolarBlock.DeleteChildren();
  svGalaxyBlock.Invalidate();
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.ButtonAddStarsClick(Sender: TObject);
begin
  MakeRandomStars;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.chbAllClick(Sender: TObject);
begin
  with FormOptions do
  begin
    chbO.Checked := chbAll.Checked;
    chbB.Checked := chbAll.Checked;
    chbA.Checked := chbAll.Checked;
    chbF.Checked := chbAll.Checked;
    chbG.Checked := chbAll.Checked;
    chbK.Checked := chbAll.Checked;
    chbM.Checked := chbAll.Checked;
    chbD.Checked := chbAll.Checked;
  end;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.svGalaxyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TFormGalaqtium.svGalaxyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.tbAxesClick(Sender: TObject);
begin
  dcAxes.Visible := not dcAxes.Visible;
end;

//---------------------------------------------------------------------------
procedure TFormGalaqtium.tbSolarcubeClick(Sender: TObject);
begin
  dcGalaxy.Visible := not dcGalaxy.Visible;
  if dcGalaxy.Visible then
  begin
    tsGalacube.PageIndex := 0;
    Camera.Position.X := 50000;
    Camera.Position.Y := 60000;
    Camera.Position.Z := 70000;
  end
  else
  begin
    tsGalacube.PageIndex := 1;
    Camera.Position.X := 1000;
    Camera.Position.Y := 1000;
    Camera.Position.Z := 1000;
  end;
end;

//----------------------------------------------------------------------------
//                         Меню Файл
//----------------------------------------------------------------------------
procedure TFormGalaqtium.miOpenClick(Sender: TObject);
begin
//  dcSolcube.DeleteChildren();
  Stars.Free();
  Stars := TGLPoints(dcSolarBlock.AddNewChild(TGLPoints));

  sl := TStringList.Create;
  tl := TStringList.Create;
  DataDir := ExtractFilePath(ParamStr(0));
  DataDir := DataDir + 'data\catalog';
  // SetCurrentDir(DataDir);
  DataModuleDialogs.OpenTextFileDialog.InitialDir := DataDir;
  DataModuleDialogs.OpenTextFileDialog.FilterIndex := 1;
  if DataModuleDialogs.OpenTextFileDialog.Execute then
  try
    sl.LoadFromFile(DataModuleDialogs.OpenTextFileDialog.FileName);
    ReadHygStars;
  finally
    sl.Free;
    tl.Free;
  end;
  svGalaxyBlock.Invalidate();
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miSaveAsClick(Sender: TObject);
begin
  if DataModuleDialogs.SaveTextFileDialog.Execute then
    if FileExists(DataModuleDialogs.SaveTextFileDialog.FileName) then
      raise Exception.Create('Файл существует. Нельзя переписывать')
    else
      MemoTable.Lines.SaveToFile(DataModuleDialogs.SaveTextFileDialog.FileName);
  // Edit1.Text := SaveTextFileDialog.Encodings[SaveTextFileDialog.EncodingIndex];
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.seNStarsChange(Sender: TObject);
begin
  with FormOptions do
  begin
    nbOn.Value := Round(nbO.Value * seNStars.Value / 100);
    nbBn.Value := Round(nbB.Value * seNStars.Value / 100);
    nbAn.Value := Round(nbA.Value * seNStars.Value / 100);
    nbFn.Value := Round(nbF.Value * seNStars.Value / 100);
    nbGn.Value := Round(nbG.Value * seNStars.Value / 100);
    nbKn.Value := Round(nbK.Value * seNStars.Value / 100);
    nbMn.Value := Round(nbM.Value * seNStars.Value / 100);
    nbDn.Value := Round(nbD.Value * seNStars.Value / 100);
  end;
end;


//----------------------------------------------------------------------------
//                              Меню вид
//----------------------------------------------------------------------------
procedure TFormGalaqtium.miOpenExoplanetsClick(Sender: TObject);
begin
  with TfrmOpenExoplanets.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miPanelShowClick(Sender: TObject);
begin
  miPanelShow.Checked := not miPanelShow.Checked;
  dcAxes.Visible := not dcAxes.Visible;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miMonitorClick(Sender: TObject);
begin
  with TfrmMonitor.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//---------------------------------------------------------------------------
function TFormGalaqtium.ReadHygStars: Boolean;
var
  i: Integer;

begin
  // NSpectralClass := RadioGroupValue.ItemIndex + 5;
  //tl.CommaText := sl[0];
  tl.Delimiter := ';';
  tl.DelimitedText := sl[0];
  for i := 1 to sl.Count - 1 do
  begin
    //tl.CommaText := sl[i];
    tl.DelimitedText := sl[i];  // line
    x := StrToFloat(tl[17]);    // x field
    y := StrToFloat(tl[18]);    // y field
    z := StrToFloat(tl[19]);    // z field
    spect := tl[38];            // spect_design
   // g := StrToFloat(tl[39]);    // color
   // NSpectralClass := StrToInt(tl[40]); // linecolor
    Stars.Positions.Add(x, y, z);

    if ((spect = 'O') and (spect = 'B')) then
    begin
      Stars.Colors.Add(clrWhite);
    end
    else if (spect = 'A') then
    begin
      Stars.Colors.Add(clrBlue);
    end
    else if (spect = 'F') then
    begin
      Stars.Colors.Add(clrYellowGreen);
    end
    else if (spect = 'G') then
    begin
      Stars.Colors.Add(clrYellow);
    end
    else if (spect = 'K') then
    begin
      Stars.Colors.Add(clrOrange);
    end
    else  // 'M' class
    begin
      Stars.Colors.Add(clrRed);
    end;
(*
    if Mag<8 then
      dotStars.Size := 7.0;
    else
*)
    Stars.Size := 5.0;
    Stars.Style := psSmooth;    // size of dots

    // Stars with real spectral class colors
    ///RealColor := Round(StrToFloat(tl[NSpectralClass]));
    /// ColorToRGB(RealColor);

    // Srars with materials
//  Stars.Material.BackProperties.Ambient.RandomColor;
//  Stars.Material.FrontProperties.Diffuse.RandomColor;
//  Stars.Material.BackProperties.Specular.RandomColor;
//  Stars.Material.BackProperties.Diffuse := RealGLColor;    ???
//  Stars.Colors.AddPoint(1, 0.5, 0.5); // Temporarily random colors
  end;
end;

//----------------------------------------------------------------------------
//                      Создание нового старблока
//----------------------------------------------------------------------------
procedure TFormGalaqtium.miNewStarblockClick(Sender: TObject);
begin
  with TfrmNewStarblock.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


//----------------------------------------------------------------------------
//                             Меню Моделирование
//----------------------------------------------------------------------------
procedure TFormGalaqtium.miTetranetClick(Sender: TObject);
begin
  inherited;
  //
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miGriddingClick(Sender: TObject);
begin
  inherited;
  //
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miInterpolateClick(Sender: TObject);
begin
  inherited;
  //
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miConvoluteClick(Sender: TObject);
begin
  inherited;
  //
end;

//----------------------------------------------------------------------------
//                             Меню Вид
//----------------------------------------------------------------------------

procedure TFormGalaqtium.miStarBlockClick(Sender: TObject);
begin
  inherited;
  with TfrmStarBlock.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//-------------------------- Проекции звёзд -----------------------------------
procedure TFormGalaqtium.miProjectionClick(Sender: TObject);
begin
  inherited;
  with TfrmProjections.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;



//----------------------------------------------------------------------------
//                             Меню Анализ
//----------------------------------------------------------------------------

//---------------------- Парадокс Ферми --------------------------------------
procedure TFormGalaqtium.miParadoxClick(Sender: TObject);
begin
  inherited;
  with TfrmParadox.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//--------------------- Уравнения Дрейка, Дойла и CETI ------------------------

procedure TFormGalaqtium.miEquationsClick(Sender: TObject);
begin
  inherited;
  with TfrmEquations.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miStatisticsClick(Sender: TObject);
begin
  inherited;
  with TfrmStatistics.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// -------------- Диаграмма Герцшпрунга-Рассела по звездам каталога Hyg ------
procedure TFormGalaqtium.miDiagramHRClick(Sender: TObject);
begin
  with TfrmDiagramHR.Create(Self) do
  try
    Timer1.Enabled := False;
    GLCadencer1.Enabled := False;

    ShowModal;
  finally
    Timer1.Enabled := True;
    GLCadencer1.Enabled := True;
    Free;
  end;
end;

// ----------------------- Сеть CETI -----------------------------------------
procedure TFormGalaqtium.miCETIClick(Sender: TObject);
begin
  inherited;
  with TfrmCETInet.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//----------------------------------------------------------------------------
//                            Меню инструменты
//----------------------------------------------------------------------------

//----------------------------- Настройки ------------------------------------
procedure TFormGalaqtium.miSettingsClick(Sender: TObject);
begin
  inherited;
  FormSettings.Show;
end;

//----------------------- Опции ----------------------------------------------
procedure TFormGalaqtium.miOptionsClick(Sender: TObject);
begin
  FormOptions.Show;
end;

//----------------------------------------------------------------------------
//                             Меню справка
//----------------------------------------------------------------------------
procedure TFormGalaqtium.miAboutClick(Sender: TObject);
begin
  with TfrmAbout.Create(Self) do
    try
      PageControl.ActivePageIndex := 5;
      ShowModal;
    finally
      Free;
    end;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miExitClick(Sender: TObject);
begin
  Close();
end;

initialization //=============================================================

FormatSettings.DecimalSeparator := '.';

end.
