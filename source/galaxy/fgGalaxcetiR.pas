unit fgGalaxcetiR;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IniFiles,
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

  fmFormI,
  fmAboutR,

  dmImages,
  dmDialogs,
  dmBase,

  Space.Globals,

  fgAnalyserR,
  fgMonitorR,
  fgParadoxR,
  fgAstrocubeR,
  fgOptionsR
  ;

type
  TFormGalaxceti = class(TFormI)
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
    miNewStarcube: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    miLithosphere: TMenuItem;
    miBiosphere: TMenuItem;
    miTechnosphere: TMenuItem;
    N3: TMenuItem;
    miMethod: TMenuItem;
    miGridding: TMenuItem;
    miInterpolation: TMenuItem;
    miTetralization: TMenuItem;
    N4: TMenuItem;
    ranslator1: TMenuItem;
    GLMatLib: TGLMaterialLibrary;
    miSettings: TMenuItem;
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
    procedure miNewStarcubeClick(Sender: TObject);
    procedure miLithosphereClick(Sender: TObject);
    procedure miBiosphereClick(Sender: TObject);
    procedure miTechnosphereClick(Sender: TObject);
    procedure GLSimpleNavigationMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
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
  FormGalaxceti: TFormGalaxceti;

implementation //-------------------------------------------------------------

{$R *.dfm}

uses
  fStarProj,
  fgExoplanetsR;


// -----------------------------------------------------------------------
procedure TFormGalaxceti.FormCreate(Sender: TObject);
begin
  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');

  tbSolarcubeClick(Self);
  tbAxesClick(Self);
  inherited;    // inheritance for translation
end;

// -----------------------------------------------------------
procedure TFormGalaxceti.GLCadencerProgress(Sender: TObject;
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

procedure TFormGalaxceti.GLSimpleNavigationMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

// --------------------------------------------------------
procedure TFormGalaxceti.GLAsyncTimerTimer(Sender: TObject);
begin
  // diskGalaxy.Roll(0.01);
end;

// ------------------------------------------------------------
procedure TFormGalaxceti.MakeRandomStars;
var
  i: Integer;
begin
  Stars := TGLPoints(dcSolcube.AddNewChild(TGLPoints));
  Stars.Size := 5.0;
  Stars.Style := psSmooth;

  // O class
  if (chbO.Checked) then
  begin
    NStars := Round(nbOn.Value);
    for i := 0 to NStars - 1 do
    begin
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
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
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
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
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
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
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
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
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
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
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
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
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
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
      Stars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      StarColor := ConvertWinColor(shW.Brush.Color); // clWhite
      Stars.Colors.Add(StarColor);
    end
  end;
end;

//--------------------------------------------------------
procedure TFormGalaxceti.ButtonClearClick(Sender: TObject);
begin
  dcSolcube.DeleteChildren();
  svGalacube.Invalidate();
end;

//--------------------------------------------------------
procedure TFormGalaxceti.ButtonAddStarsClick(Sender: TObject);
begin
  MakeRandomStars;
end;

//--------------------------------------------------------
procedure TFormGalaxceti.chbAllClick(Sender: TObject);
begin
  chbO.Checked := chbAll.Checked;
  chbB.Checked := chbAll.Checked;
  chbA.Checked := chbAll.Checked;
  chbF.Checked := chbAll.Checked;
  chbG.Checked := chbAll.Checked;
  chbK.Checked := chbAll.Checked;
  chbM.Checked := chbAll.Checked;
end;

// -----------------------------------------------------------------------
procedure TFormGalaxceti.svGalaxyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TFormGalaxceti.svGalaxyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

// -----------------------------------------------------------------------
procedure TFormGalaxceti.tbAxesClick(Sender: TObject);
begin
  dcAxes.Visible := not dcAxes.Visible;
end;

//---------------------------------------------------------------------------

procedure TFormGalaxceti.tbSolarcubeClick(Sender: TObject);
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

//---------------------------------------------------------------------------

function TFormGalaxceti.ReadHygStars: Boolean;
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

// -------------------------------------------------------------
//                         File menu
// -------------------------------------------------------------
procedure TFormGalaxceti.miOpenClick(Sender: TObject);
begin
//  dcSolcube.DeleteChildren();
  Stars.Free();
  Stars := TGLPoints(dcSolcube.AddNewChild(TGLPoints));

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
  svGalacube.Invalidate();
end;

// --------------------------------------------------------
procedure TFormGalaxceti.miSaveAsClick(Sender: TObject);
begin
  if DataModuleDialogs.SaveTextFileDialog.Execute then
    if FileExists(DataModuleDialogs.SaveTextFileDialog.FileName) then
      raise Exception.Create('File exists. Can not overwrite')
    else
      MemoTable.Lines.SaveToFile(DataModuleDialogs.SaveTextFileDialog.FileName);
  // Edit1.Text := SaveTextFileDialog.Encodings[SaveTextFileDialog.EncodingIndex];
end;

//-----------------------------------------------------------
procedure TFormGalaxceti.seNStarsChange(Sender: TObject);
begin
  nbOn.Value := Round(nbO.Value * seNStars.Value / 100);
  nbBn.Value := Round(nbB.Value * seNStars.Value / 100);
  nbAn.Value := Round(nbA.Value * seNStars.Value / 100);
  nbFn.Value := Round(nbF.Value * seNStars.Value / 100);
  nbGn.Value := Round(nbG.Value * seNStars.Value / 100);
  nbKn.Value := Round(nbK.Value * seNStars.Value / 100);
  nbMn.Value := Round(nbM.Value * seNStars.Value / 100);
end;

//---------------------------------------------------------------------
// Опции и настройки
//---------------------------------------------------------------------
procedure TFormGalaxceti.miOptionsClick(Sender: TObject);
begin
  FormOptions.Show;
end;

//---------------------------------------------------------------------
//
//---------------------------------------------------------------------
procedure TFormGalaxceti.miNewStarcubeClick(Sender: TObject);
begin
  with TFormNewStarcube.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//------------------------------------------------------------------------
//                           View menu
//------------------------------------------------------------------------
procedure TFormGalaxceti.miExoplanetsClick(Sender: TObject);
begin
  with TFormExoplanets.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxceti.miLithosphereClick(Sender: TObject);
begin
{
  with TfrmLitosphere.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
}
end;

procedure TFormGalaxceti.miBiosphereClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxceti.miTechnosphereClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxceti.miPanelShowClick(Sender: TObject);
begin
  miPanelShow.Checked := not miPanelShow.Checked;
  PanelRight.Visible := not PanelRight.Visible;
  dcAxes.Visible := not dcAxes.Visible;
end;

//-----------------------------------------------------------------------
//                         Tools menu
//-----------------------------------------------------------------------
procedure TFormGalaxceti.miMonitorClick(Sender: TObject);
begin
  with TFormMonitor.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxceti.miAnalyserClick(Sender: TObject);
begin
  with TFormAnalyser.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxceti.miProjectionClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaxceti.miParadoxClick(Sender: TObject);
begin
  with TFormParadox.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// -------------------------------------------------------------
//                                Help menu
// -------------------------------------------------------------
procedure TFormGalaxceti.miAboutClick(Sender: TObject);
begin
  with TFrmAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


// -------------------------------------------------------------
procedure TFormGalaxceti.miExitClick(Sender: TObject);
begin
  Close();
end;

initialization //-------------------------------------------------------------

FormatSettings.DecimalSeparator := '.';

end.
