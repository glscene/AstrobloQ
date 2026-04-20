(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fgGalaqtium_en;

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
  GLS.VectorLists,
  GLS.Material,
  GLS.Color,
  GLS.SpaceText,

  fmFormFirst,
  fmAbout_en,

  dmImages,
  dmDialogs,
  dmBase,

  fgDiagramHR_en,
  fgMonitor_en,
  fgParadox_en,
  fgGenGalablock_en,
  fgViewGalablock_en,
  fgGlobulars_en,
  fgOptions_en,

  Astro.Globals,
  Astro.Utils;

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
    dcGalacube: TGLDummyCube;
    dcSolcube: TGLDummyCube;
    ArrowZ: TGLArrowLine;
    ArrowY: TGLArrowLine;
    ArrowX: TGLArrowLine;
    XYZGrid: TGLXYZGrid;
    miProjection: TMenuItem;
    ControlBar: TControlBar;
    diskGalaxy: TGLDisk;
    ToolBarMain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PageControl1: TPageControl;
    tsGalacube: TTabSheet;
    svGalacube: TGLSceneViewer;
    LightSol: TGLLightSource;
    GLSimpleNavigation: TGLSimpleNavigation;
    dcAxes: TGLDummyCube;
    PanelRight: TPanel;
    gbStars: TGroupBox;
    shO: TShape;
    shB: TShape;
    shA: TShape;
    shG: TShape;
    shK: TShape;
    shF: TShape;
    shM: TShape;
    Label1: TLabel;
    Label2: TLabel;
    chbO: TCheckBox;
    chbB: TCheckBox;
    chbA: TCheckBox;
    chbF: TCheckBox;
    chbG: TCheckBox;
    chbK: TCheckBox;
    chbM: TCheckBox;
    nbO: TNumberBox;
    nbB: TNumberBox;
    nbA: TNumberBox;
    nbF: TNumberBox;
    nbG: TNumberBox;
    nbK: TNumberBox;
    nbM: TNumberBox;
    nbAn: TNumberBox;
    nbMn: TNumberBox;
    nbKn: TNumberBox;
    nbGn: TNumberBox;
    nbFn: TNumberBox;
    nbBn: TNumberBox;
    nbOn: TNumberBox;
    seNStars: TSpinEdit;
    Stars: TGLPoints;
    SpaceTextX: TGLSpaceText;
    SpaceTextY: TGLSpaceText;
    SpaceTextZ: TGLSpaceText;
    tsDatacat: TTabSheet;
    DBGrid: TDBGrid;
    MemoTable: TMemo;
    ToolButton4: TToolButton;
    miAnalyser: TMenuItem;
    miMonitor: TMenuItem;
    ToolBarView: TToolBar;
    tbSolarcube: TToolButton;
    tbAddStars: TToolButton;
    tbClearCubes: TToolButton;
    chbAll: TCheckBox;
    tbAxes: TToolButton;
    miParadox: TMenuItem;
    shW: TShape;
    chbD: TCheckBox;
    nbWn: TNumberBox;
    miExoplanets: TMenuItem;
    tbRotation: TToolButton;
    miNewStarblock: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miMethod: TMenuItem;
    miGridding: TMenuItem;
    miInterpolation: TMenuItem;
    miTetralization: TMenuItem;
    N4: TMenuItem;
    miTranslator: TMenuItem;
    GLMatLib: TGLMaterialLibrary;
    miAnalytics: TMenuItem;
    miSettings: TMenuItem;
    N5: TMenuItem;
    miDiagramHR: TMenuItem;
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
    procedure miAnalyserClick(Sender: TObject);
    procedure miMonitorClick(Sender: TObject);
    procedure tbSolarcubeClick(Sender: TObject);
    procedure miParadoxClick(Sender: TObject);
    procedure miExoplanetsClick(Sender: TObject);
    procedure tbAxesClick(Sender: TObject);
    procedure miNewStarblockClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miDiagramHRClick(Sender: TObject);
    procedure miConvoluteClick(Sender: TObject);
    procedure miTetralizationClick(Sender: TObject);
    procedure miGriddingClick(Sender: TObject);
    procedure miInterpolationClick(Sender: TObject);
    procedure miTranslatorClick(Sender: TObject);
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

implementation //==============================================================

{$R *.dfm}

uses
  fgTechnets_en,
  fgSettings_en;


//-----------------------------------------------------------------------------
procedure TFormGalaqtium.FormCreate(Sender: TObject);
begin
  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');

///  tbSolarcubeClick(Self);
  tbAxesClick(Self);
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.GLCadencerProgress(Sender: TObject;
  const DeltaTime, NewTime: Double);
begin
  if FormOptions.CheckBoxRotate.Checked and
     not tbRotation.Down then
  begin
//    sfPlanet.TurnAngle := sfPlanet.TurnAngle + DeltaTime * TimeMultiplier;
//    ffPlanet.TurnAngle := ffPlanet.TurnAngle + DeltaTime * TimeMultiplier;
    dcSolcube.Roll(0.001);
    dcGalacube.Turn(0.001);
    dcAxes.Turn(0.001);
  end
  else
  begin
    dcSolcube.Roll(0);
    dcGalacube.Turn(0);
    dcAxes.Turn(0);
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.GLAsyncTimerTimer(Sender: TObject);
begin
  // diskGalaxy.Roll(0.01);
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.MakeRandomStars;
var
  i: Integer;
  Edge, Edge05: Integer;

begin
  Stars := TGLPoints(dcGalacube.AddNewChild(TGLPoints));
  Stars.Size := 5.0;
  Stars.Style := psSmooth;
  Edge := Round(dcGalacube.CubeSize);  // or Solcube.CubeSize
  Edge05 := Edge div 2;

  // O class
  if (chbO.Checked) then
  begin
    NStars := Round(nbOn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shO.Brush.Color); // clBlue;
      Stars.Colors.Add(StarColor);
    end
  end;
  // B class
  if (chbB.Checked) then
  begin
    NStars := Round(nbBn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shB.Brush.Color); // clLightBlue;
      Stars.Colors.Add(StarColor);
    end
  end;
  // A class
  if (chbA.Checked) then
  begin
    NStars := Round(nbAn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shA.Brush.Color); // clCream;
      Stars.Colors.Add(StarColor);
    end
  end;
  // F class
  if (chbF.Checked) then
  begin
    NStars := Round(nbFn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shF.Brush.Color); // clKhaki
      Stars.Colors.Add(StarColor);
    end
  end;
  // G class
  if (chbG.Checked) then
  begin
    NStars := Round(nbGn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shG.Brush.Color); // clYellow
      Stars.Colors.Add(StarColor);
    end
  end;
  // K class
  if (chbK.Checked) then
  begin
    NStars := Round(nbKn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shK.Brush.Color); // clOrange
      Stars.Colors.Add(StarColor);
    end
  end;
  // M class
  if (chbM.Checked) then
  begin
    NStars := Round(nbMn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shM.Brush.Color); // clRed
      Stars.Colors.Add(StarColor);
    end
  end;
  // D class of white dwarf
  if (chbD.Checked) then
  begin
    NStars := Round(nbWn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(Edge) - Edge05, Random(Edge) - Edge05, Random(Edge) - Edge05);
      StarColor := ConvertWinColor(shW.Brush.Color); // clWhite
      Stars.Colors.Add(StarColor);
    end
  end;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.ButtonClearClick(Sender: TObject);
begin
  dcSolcube.DeleteChildren();
  svGalacube.Invalidate();
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.ButtonAddStarsClick(Sender: TObject);
begin
  MakeRandomStars;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.chbAllClick(Sender: TObject);
begin
  chbO.Checked := chbAll.Checked;
  chbB.Checked := chbAll.Checked;
  chbA.Checked := chbAll.Checked;
  chbF.Checked := chbAll.Checked;
  chbG.Checked := chbAll.Checked;
  chbK.Checked := chbAll.Checked;
  chbM.Checked := chbAll.Checked;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.svGalaxyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.svGalaxyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.tbAxesClick(Sender: TObject);
begin
  dcAxes.Visible := not dcAxes.Visible;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.tbSolarcubeClick(Sender: TObject);
begin
  dcGalacube.Visible := not dcGalacube.Visible;
  if dcGalacube.Visible then
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

//-----------------------------------------------------------------------------
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

//-----------------------------------------------------------------------------
//                         File menu
//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miOpenClick(Sender: TObject);
begin
//  dcSolcube.DeleteChildren();
  Stars.Free();
  Stars := TGLPoints(dcSolcube.AddNewChild(TGLPoints));

  sl := TStringList.Create;
  tl := TStringList.Create;
  DataDir := GetDataPath() + 'catalog'; //ExtractFilePath(ParamStr(0));
  SetCurrentDir(DataDir);
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
  svGalacube.Invalidate();
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miSaveAsClick(Sender: TObject);
begin
  if DataModuleDialogs.SaveTextFileDialog.Execute then
    if FileExists(DataModuleDialogs.SaveTextFileDialog.FileName) then
      raise Exception.Create('File exists. Can not overwrite')
    else
      MemoTable.Lines.SaveToFile(DataModuleDialogs.SaveTextFileDialog.FileName);
  // Edit1.Text := SaveTextFileDialog.Encodings[SaveTextFileDialog.EncodingIndex];
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.seNStarsChange(Sender: TObject);
begin
  nbOn.Value := Round(nbO.Value * seNStars.Value / 100);
  nbBn.Value := Round(nbB.Value * seNStars.Value / 100);
  nbAn.Value := Round(nbA.Value * seNStars.Value / 100);
  nbFn.Value := Round(nbF.Value * seNStars.Value / 100);
  nbGn.Value := Round(nbG.Value * seNStars.Value / 100);
  nbKn.Value := Round(nbK.Value * seNStars.Value / 100);
  nbMn.Value := Round(nbM.Value * seNStars.Value / 100);
end;

//----------------------- New Starblock ---------------------------------------
procedure TFormGalaqtium.miNewStarblockClick(Sender: TObject);
begin
  with TfrmNewStarblock.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//-----------------------------------------------------------------------------
//                         Method menu
//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miTetralizationClick(Sender: TObject);
begin
  inherited;
  //
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miGriddingClick(Sender: TObject);
begin
  inherited;
  //
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miInterpolationClick(Sender: TObject);
begin
  inherited;
  //
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miConvoluteClick(Sender: TObject);
begin
  inherited;
  // Convolute stars
end;


//-----------------------------------------------------------------------------
//                           View menu
//-----------------------------------------------------------------------------

procedure TFormGalaqtium.miStarBlockClick(Sender: TObject);
begin
  inherited;
  with TfrmGalablock.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miExoplanetsClick(Sender: TObject);
begin
  with TfrmTechnets.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miProjectionClick(Sender: TObject);
begin
  with TfrmGlobulars.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miAnalyserClick(Sender: TObject);
begin
  with TfrmTechnets.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miTranslatorClick(Sender: TObject);
begin
  inherited;
  //
end;


//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miPanelShowClick(Sender: TObject);
begin
  miPanelShow.Checked := not miPanelShow.Checked;
  PanelRight.Visible := not PanelRight.Visible;
  dcAxes.Visible := not dcAxes.Visible;
end;

//-----------------------------------------------------------------------------
//                         Analytics menu
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miParadoxClick(Sender: TObject);
begin
  with TfrmParadox.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//----------------------------------------------------------------------------
procedure TFormGalaqtium.miDiagramHRClick(Sender: TObject);
begin
  inherited;
  with TfrmDiagramHR.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
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

//-----------------------------------------------------------------------------
//                         Tools menu
//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miSettingsClick(Sender: TObject);
begin
  inherited;
  FormSettings.Show;
end;

//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miOptionsClick(Sender: TObject);
begin
  FormOptions.Show;
end;


//-----------------------------------------------------------------------------
//                                Help menu
//-----------------------------------------------------------------------------
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


//-----------------------------------------------------------------------------
procedure TFormGalaqtium.miExitClick(Sender: TObject);
begin
  Close();
end;

initialization //==============================================================

FormatSettings.DecimalSeparator := '.';

end.
