unit fGalaktika;

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

  dImages,
  dDialogs,
  dBase,
  fGLForm,
  fAbout,
  fSettings,
  fAnalyzer,
  fMonitor,
  fStarProj,
  uGlobals,

  gnuGettext;

type
  TFormGalablock = class(TFormGL)
    GLScene: TGLScene;
    StatusBar1: TStatusBar;
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
    camGalacube: TGLCamera;
    LightGal: TGLLightSource;
    dcGalacube: TGLDummyCube;
    dcSolcube: TGLDummyCube;
    ArrowZ: TGLArrowLine;
    ArrowY: TGLArrowLine;
    ArrowX: TGLArrowLine;
    XYZGrid: TGLXYZGrid;
    miMonitor: TMenuItem;
    miProjection: TMenuItem;
    ControlBar1: TControlBar;
    diskGalaxy: TGLDisk;
    GLMatLib: TGLMaterialLibrary;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PageControl1: TPageControl;
    tsGalacube: TTabSheet;
    svHelios: TGLSceneViewer;
    camSolcube: TGLCamera;
    LightSol: TGLLightSource;
    GLSimpleNavigation: TGLSimpleNavigation;
    dcAxis: TGLDummyCube;
    PanelRight: TPanel;
    ButtonStars: TButton;
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
    chbAll: TCheckBox;
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
    SpinEdit: TSpinEdit;
    ButtonClear: TButton;
    dotStars: TGLPoints;
    SpaceTextX: TGLSpaceText;
    SpaceTextY: TGLSpaceText;
    SpaceTextZ: TGLSpaceText;
    tsDatacat: TTabSheet;
    DBGrid: TDBGrid;
    MemoTable: TMemo;
    chbW: TCheckBox;
    shW: TShape;
    nbWn: TNumberBox;
    ToolButton4: TToolButton;
    miAnalyzer: TMenuItem;
    Monitor1: TMenuItem;
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
    procedure ButtonStarsClick(Sender: TObject);
    procedure chbAllClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure SpinEditChange(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miAnalyzerClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Monitor1Click(Sender: TObject);
  public
    MousePoint: TPoint;
    procedure MakeRandomStars;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  private
    AtStart: Boolean;
    mx, my, dmx, dmy: Integer;
    DataDir, StarDir, CurrentStar: TFileName;
    FileName, CatalogName: TFileName;
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
  FormGalablock: TFormGalablock;

// ========================================================
implementation
// ========================================================

{$R *.dfm}

procedure TFormGalablock.FormCreate(Sender: TObject);
begin
  TP_GlobalIgnoreClassProperty(TAction, 'Category');
  TP_GlobalIgnoreClass(TOpenTextFileDialog);
  TP_GlobalIgnoreClass(TStaticText);
  TP_GlobalIgnoreClass(TFont);
  TP_GlobalIgnoreClass(TGLSceneObject);  // otherwise no persistent image on disk


  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');
  SpinEdit.Value := 10000;
  inherited;
end;

// ------------------------------------------------------------------
procedure TFormGalablock.GLAsyncTimerTimer(Sender: TObject);
begin
  // diskGalaxy.Roll(0.01);
end;

// ------------------------------------------------------------------
procedure TFormGalablock.GLCadencerProgress(Sender: TObject;
  const DeltaTime, NewTime: Double);
begin
  dcGalacube.Turn(0.001);
  dcSolcube.Roll(0.001);
  dcAxis.Turn(0.001);
end;

// -----------------------------------------------------------------
//
procedure TFormGalablock.MakeRandomStars;
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
  // W class of white dwarf
  if (chbW.Checked) then
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

procedure TFormGalablock.ButtonClearClick(Sender: TObject);
begin
  dcSolcube.DeleteChildren();
  svHelios.Invalidate();
end;

procedure TFormGalablock.ButtonStarsClick(Sender: TObject);
begin
  MakeRandomStars;
end;

procedure TFormGalablock.chbAllClick(Sender: TObject);
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
procedure TFormGalablock.svGalaxyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TFormGalablock.svGalaxyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

procedure TFormGalablock.ToolButton1Click(Sender: TObject);
begin
  dcGalacube.Visible := not dcGalacube.Visible;
end;

// -------------------------------------------------------------
procedure TFormGalablock.miPanelShowClick(Sender: TObject);
begin
  miPanelShow.Checked := not miPanelShow.Checked;
  PanelRight.Visible := not PanelRight.Visible;
  dcAxis.Visible := not dcAxis.Visible;
end;

// -------------------------------------------------------------
procedure TFormGalablock.miOpenClick(Sender: TObject);
var
  F: TextFile;
  sl, tl: TStringList;

begin
  dcSolcube.DeleteChildren();
  svHelios.Invalidate();

  sl := TStringList.Create;
  tl := TStringList.Create;
  DataDir := ExtractFilePath(ParamStr(0));
  DataDir := DataDir + 'data\catalog';
  // SetCurrentDir(DataDir);
  DataModuleDialogs.OpenTextFileDialog.InitialDir := DataDir;
  DataModuleDialogs.OpenTextFileDialog.FilterIndex := 1;

  // Выполняем диалог открыть файл
  if DataModuleDialogs.OpenTextFileDialog.Execute then
    if FileExists(DataModuleDialogs.OpenTextFileDialog.FileName) then
      // If it exists, load the data into the memo box.
      MemoTable.Lines.LoadFromFile(DataModuleDialogs.OpenTextFileDialog.FileName)
    else
      // Otherwise, raise an exception.
      raise Exception.Create(_('File not exists'));

  (*
    if DataModuleDialogs.OpenDialog.Execute() then
    AssignFile(F, DataModuleDialogs.OpenDialog.FileName)
    else
    Exit;
    try
    Reset(F);
    sl.LoadFromFile(DataModuleDialogs.OpenDialog.FileName);
    finally
    //
    end;
  *)
end;

// --------------------------------------------------------
// Пересчёт числа классов звёзд при изменении общего числа
// --------------------------------------------------------
procedure TFormGalablock.miSaveAsClick(Sender: TObject);
begin
  if DataModuleDialogs.SaveTextFileDialog.Execute then
    if FileExists(DataModuleDialogs.SaveTextFileDialog.FileName) then
      raise Exception.Create(_('File exists. Can not overwrite'))
    else
      MemoTable.Lines.SaveToFile(DataModuleDialogs.SaveTextFileDialog.FileName);
  // Edit1.Text := SaveTextFileDialog.Encodings[SaveTextFileDialog.EncodingIndex];
end;

// -------------------------------------------------------------
procedure TFormGalablock.SpinEditChange(Sender: TObject);
begin
  nbOn.Value := Round(nbO.Value * SpinEdit.Value / 100);
  nbBn.Value := Round(nbB.Value * SpinEdit.Value / 100);
  nbAn.Value := Round(nbA.Value * SpinEdit.Value / 100);
  nbFn.Value := Round(nbF.Value * SpinEdit.Value / 100);
  nbGn.Value := Round(nbG.Value * SpinEdit.Value / 100);
  nbKn.Value := Round(nbK.Value * SpinEdit.Value / 100);
  nbMn.Value := Round(nbM.Value * SpinEdit.Value / 100);
end;

// -------------------------------------------------------------
procedure TFormGalablock.miAboutClick(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//---------------------------------------------------------------------
procedure TFormGalablock.miSettingsClick(Sender: TObject);
begin
  FormSettings.Show;
end;

procedure TFormGalablock.Monitor1Click(Sender: TObject);
begin
  with TFormMonitor.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//---------------------------------------------------------------------
procedure TFormGalablock.miAnalyzerClick(Sender: TObject);
begin
  with TFormAnalyzer.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//---------------------------------------------------------------------
procedure TFormGalablock.miProjectionClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

//---------------------------------------------------------------------
procedure TFormGalablock.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    Top := IniFile.ReadInteger(FormGalablock.Name, 'Top', 100);
    Left := IniFile.ReadInteger(FormGalablock.Name, 'Left', 200);
  finally
    IniFile.Free;
  end;
end;

//---------------------------------------------------------------------
procedure TFormGalablock.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteInteger(FormGalablock.Name, 'Top', Top);
    IniFile.WriteInteger(FormGalablock.Name, 'Left', Left);
    // IniFile.WriteBool(FormGalablock.Name, 'InitMax', WindowState = wsMaximized);
  finally
    IniFile.Free;
  end;
  inherited;
end;

// -------------------------------------------------------------
procedure TFormGalablock.miExitClick(Sender: TObject);
begin
  Close();
end;

// ===========================================
initialization
// ===========================================

FormatSettings.DecimalSeparator := '.';

end.
