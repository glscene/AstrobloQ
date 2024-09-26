unit fGalaxy;

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

  GLScene.VectorTypes,
  GLScene.VectorGeometry,
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

  fForm,
  dImages,
  dDialogs,
  dBase,
  fAbout,
  fSettings,
  fAnalyser,
  fMonitor,
  fParadox,

  fNewStarcube,
 /// flLitosfera,
  uGlobals,

  gnuGettext;

type
  TfrmGalaktika = class(TFormI) // not translated if TForm
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
    miSettings: TMenuItem;
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
    dotStars: TGLPoints;
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
    procedure miSettingsClick(Sender: TObject);
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
    StarColor: TVector3f;

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
  frmGalaktika: TfrmGalaktika;

implementation //-------------------------------------------------------------

{$R *.dfm}

uses
  fStarProj,
  fExoplanets;


// -----------------------------------------------------------------------
procedure TfrmGalaktika.FormCreate(Sender: TObject);
begin
  TP_GlobalIgnoreClassProperty(TAction, 'Category');
  TP_GlobalIgnoreClass(TStaticText);
  TP_GlobalIgnoreClass(TFont);
  TP_GlobalIgnoreClass(TGLSceneObject);  // otherwise no persistent image on disk


  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');
  inherited;    // inheritance for translation
end;

// -----------------------------------------------------------
procedure TfrmGalaktika.GLCadencerProgress(Sender: TObject;
  const DeltaTime, NewTime: Double);
begin
  if frmSettings.CheckBoxRotate.Checked and
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

// --------------------------------------------------------
procedure TfrmGalaktika.GLAsyncTimerTimer(Sender: TObject);
begin
  // diskGalaxy.Roll(0.01);
end;

// ------------------------------------------------------------
procedure TfrmGalaktika.MakeRandomStars;
var
  i: Integer;
  NStars: Integer;
  clrStar: TGLColorVector;
begin
  dotStars := TGLPoints(dcSolcube.AddNewChild(TGLPoints));
  dotStars.Size := 5.0;
  dotStars.Style := psSmooth;

  // O class
  if (chbO.Checked) then
  begin
    NStars := Round(nbOn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shO.Brush.Color); // clBlue;
      dotStars.Colors.Add(clrStar);
    end
  end;
  // B class
  if (chbB.Checked) then
  begin
    NStars := Round(nbBn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shB.Brush.Color); // clLightBlue;
      dotStars.Colors.Add(clrStar);
    end
  end;
  // A class
  if (chbA.Checked) then
  begin
    NStars := Round(nbAn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shA.Brush.Color); // clCream;
      dotStars.Colors.Add(clrStar);
    end
  end;
  // F class
  if (chbF.Checked) then
  begin
    NStars := Round(nbFn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shF.Brush.Color); // clKhaki
      dotStars.Colors.Add(clrStar);
    end
  end;
  // G class
  if (chbG.Checked) then
  begin
    NStars := Round(nbGn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shG.Brush.Color); // clYellow
      dotStars.Colors.Add(clrStar);
    end
  end;
  // K class
  if (chbK.Checked) then
  begin
    NStars := Round(nbKn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shK.Brush.Color); // clOrange
      dotStars.Colors.Add(clrStar);
    end
  end;
  // M class
  if (chbM.Checked) then
  begin
    NStars := Round(nbMn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shM.Brush.Color); // clRed
      dotStars.Colors.Add(clrStar);
    end
  end;
  // D class of white dwarf
  if (chbD.Checked) then
  begin
    NStars := Round(nbWn.Value);
    for i := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500,
        Random(1000) - 500);
      clrStar := ConvertWinColor(shW.Brush.Color); // clWhite
      dotStars.Colors.Add(clrStar);
    end
  end;
end;

//--------------------------------------------------------
procedure TfrmGalaktika.ButtonClearClick(Sender: TObject);
begin
  dcSolcube.DeleteChildren();
  svGalacube.Invalidate();
end;

//--------------------------------------------------------
procedure TfrmGalaktika.ButtonAddStarsClick(Sender: TObject);
begin
  MakeRandomStars;
end;

//--------------------------------------------------------
procedure TfrmGalaktika.chbAllClick(Sender: TObject);
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
procedure TfrmGalaktika.svGalaxyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TfrmGalaktika.svGalaxyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;


// -----------------------------------------------------------------------
procedure TfrmGalaktika.tbAxesClick(Sender: TObject);
begin
  dcAxes.Visible := not dcAxes.Visible;
end;

procedure TfrmGalaktika.tbSolarcubeClick(Sender: TObject);
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

function TfrmGalaktika.ReadHygStars: Boolean;
var
  i: Integer;

begin
  /// NSpectralClass := RadioGroupValue.ItemIndex + 5;
  tl.Delimiter := ';';
  tl.DelimitedText := sl[0];
//  tl.CommaText := sl[0];
  for i := 1 to sl.Count - 1 do
  begin
    tl.DelimitedText := sl[i];
    spect := tl[15];    // x
    x := StrToFloat(tl[17]);    // x
    y := StrToFloat(tl[18]);    // y
    z := StrToFloat(tl[19]);    // z
/// g := StrToFloat(tl[22]);    // color

   // NSpectralClass := StrToInt(tl[25]); // One of 7 Class ?

    dotStars.Positions.Add(X, Y, Z);
    dotStars.Size := 2.0;

    // Stars with random colors
    StarColor.X := Random();
    StarColor.Y := Random();
    StarColor.Z := Random();
    dotStars.Colors.AddPoint(StarColor);

    // Stars with real spectral class colors
    ///RealColor := Round(StrToFloat(tl[NSpectralClass]));
    /// ColorToRGB(RealColor);

    // Srars with materials
//  dotStars.Material.BackProperties.Ambient.RandomColor;
//  dotStars.Material.FrontProperties.Diffuse.RandomColor;
//  dotStars.Material.BackProperties.Specular.RandomColor;
//  dotStars.Material.BackProperties.Diffuse := RealGLColor;    ???
//  dotStars.Colors.AddPoint(1, 0.5, 0.5); // Temporarily random colors
  end;
end;

// -------------------------------------------------------------
//                         File menu
// -------------------------------------------------------------
procedure TfrmGalaktika.miOpenClick(Sender: TObject);
begin

  dcSolcube.DeleteChildren();
  svGalacube.Invalidate();
  dotStars.Free();
  dotStars := TGLPoints(dcSolcube.AddNewChild(TGLPoints));

  sl := TStringList.Create;
  tl := TStringList.Create;
  DataDir := ExtractFilePath(ParamStr(0));
  DataDir := DataDir + 'data\catalog';
  // SetCurrentDir(DataDir);
  dmDialogs.OpenTextFileDialog.InitialDir := DataDir;
  dmDialogs.OpenTextFileDialog.FilterIndex := 1;
  if dmDialogs.OpenTextFileDialog.Execute then
  try
    sl.LoadFromFile(dmDialogs.OpenTextFileDialog.FileName);
    ReadHygStars;
  finally
    sl.Free;
    tl.Free;
  end;
end;

// --------------------------------------------------------
procedure TfrmGalaktika.miSaveAsClick(Sender: TObject);
begin
  if dmDialogs.SaveTextFileDialog.Execute then
    if FileExists(dmDialogs.SaveTextFileDialog.FileName) then
      raise Exception.Create(_('File exists. Can not overwrite'))
    else
      MemoTable.Lines.SaveToFile(dmDialogs.SaveTextFileDialog.FileName);
  // Edit1.Text := SaveTextFileDialog.Encodings[SaveTextFileDialog.EncodingIndex];
end;

//-----------------------------------------------------------
procedure TfrmGalaktika.seNStarsChange(Sender: TObject);
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
procedure TfrmGalaktika.miSettingsClick(Sender: TObject);
begin
  frmSettings.Show;
end;

procedure TfrmGalaktika.miNewStarcubeClick(Sender: TObject);
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
procedure TfrmGalaktika.miExoplanetsClick(Sender: TObject);
begin
  with TFormExoplanets.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmGalaktika.miLithosphereClick(Sender: TObject);
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

procedure TfrmGalaktika.miBiosphereClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmGalaktika.miTechnosphereClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmGalaktika.miPanelShowClick(Sender: TObject);
begin
  miPanelShow.Checked := not miPanelShow.Checked;
  PanelRight.Visible := not PanelRight.Visible;
  dcAxes.Visible := not dcAxes.Visible;
end;

//-----------------------------------------------------------------------
//                         Tools menu
//-----------------------------------------------------------------------
procedure TfrmGalaktika.miMonitorClick(Sender: TObject);
begin
  with TFormMonitor.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmGalaktika.miAnalyserClick(Sender: TObject);
begin
  with TFormAnalyser.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmGalaktika.miProjectionClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmGalaktika.miParadoxClick(Sender: TObject);
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
procedure TfrmGalaktika.miAboutClick(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


// -------------------------------------------------------------
procedure TfrmGalaktika.miExitClick(Sender: TObject);
begin
  Close();
end;

initialization //-------------------------------------------------------------

FormatSettings.DecimalSeparator := '.';

end.
