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

  fGLForm,
  fAbout,
  fSettings,
  fStarProj,
  uGlobals,

  gnuGettext;

type
  TFormGalaktika = class(TFormGL)
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
    camGalaxy: TGLCamera;
    LightGal: TGLLightSource;
    dcGalaxy: TGLDummyCube;
    dcHelios: TGLDummyCube;
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
    tsHeliobox: TTabSheet;
    tsGalabox: TTabSheet;
    svGalaxy: TGLSceneViewer;
    tvGalaxy: TTreeView;
    PanelLeft: TPanel;
    svHelios: TGLSceneViewer;
    camHelios: TGLCamera;
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
    FDBatchMove: TFDBatchMove;
    chbW: TCheckBox;
    shW: TShape;
    nbWn: TNumberBox;
    OpenTextFileDialog: TOpenTextFileDialog;
    SaveTextFileDialog: TSaveTextFileDialog;
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
    procedure shAContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
  public
    MousePoint: TPoint;
    // Создание скопления звёзд со случайной позицией и цветом
    procedure MakeRandomStars;
  private
    AtStart: Boolean;
    mx, my, dmx, dmy: Integer;
    DataDir, StarDir, CurrentStar: TFileName;
    FileName, CatalogName: TFileName;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
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
  FormGalaktika: TFormGalaktika;

// ========================================================
implementation
// ========================================================

{$R *.dfm}

procedure TFormGalaktika.FormCreate(Sender: TObject);
begin
  TP_GlobalIgnoreClassProperty(TAction, 'Category');
  TP_GlobalIgnoreClass(TOpenTextFileDialog);
  //TP_GlobalIgnoreClass(TTable);
  //TP_GlobalIgnoreClass(TFields);
  //TP_GlobalIgnoreClass(TFont);
  //TP_GlobalIgnoreClass(TListBox);
  //TP_GlobalIgnoreClass(TStaticText);
  //TP_GlobalIgnoreClass(TGLLibMaterial);
  //TP_GlobalIgnoreClass(TGLMaterialLibrary);
  //TP_IgnoreClass(TFont);


  tvGalaxy.FullExpand;

  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');
  SpinEdit.Value := 10000;
  inherited;
end;

// ------------------------------------------------------------------
procedure LangIni();
var
  i: Integer;
begin
  for i := 0 to Application.ComponentCount - 1 do
  begin
    if (Application.Components[i] is TForm) then
      TranslateComponent(Application.Components[i]);;
  end;
end;

// ------------------------------------------------------------------
procedure LangChange();
var
  i: Integer;

begin
  for i := 0 to Application.ComponentCount - 1 do
  begin
    if (Application.Components[i] is TForm) then
      RetranslateComponent(Application.Components[i]);;
  end;
end;

// ------------------------------------------------------------------
procedure TFormGalaktika.FormShow(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  {
    with TFormOptions.Create(Self) do
    try
    ShowModal;
    if (FormOptions.rgLanguages.ItemIndex = 0) then
    begin
    CurLang := 'ru';
    UseLanguage('ru');
    end
    else
    begin
    CurLang := 'en';
    UseLanguage('en');
    end;
    LangIni();

    finally
    Free;
    end;
  }
end;

// ------------------------------------------------------------------
procedure TFormGalaktika.GLAsyncTimerTimer(Sender: TObject);
begin
  // diskGalaxy.Roll(0.01);
end;

// ------------------------------------------------------------------
procedure TFormGalaktika.GLCadencerProgress(Sender: TObject;
  const DeltaTime, NewTime: Double);
begin
  dcGalaxy.Turn(0.001);
  dcHelios.Roll(0.001);
  dcAxis.Turn(0.001);
end;

// -----------------------------------------------------------------
//
procedure TFormGalaktika.MakeRandomStars;
var
  i: Integer;
  NStars: Integer;
  clrStar: TGLColorVector;

begin
  dotStars := TGLPoints(dcHelios.AddNewChild(TGLPoints));
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

procedure TFormGalaktika.ButtonClearClick(Sender: TObject);
begin
  dcHelios.DeleteChildren();
  svHelios.Invalidate();
end;

procedure TFormGalaktika.ButtonStarsClick(Sender: TObject);
begin
  MakeRandomStars;
end;

procedure TFormGalaktika.chbAllClick(Sender: TObject);
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
procedure TFormGalaktika.svGalaxyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TFormGalaktika.svGalaxyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

// -------------------------------------------------------------
procedure TFormGalaktika.miPanelShowClick(Sender: TObject);
begin
  miPanelShow.Checked := not miPanelShow.Checked;
  PanelLeft.Visible := not PanelLeft.Visible;
  PanelRight.Visible := not PanelRight.Visible;
  dcAxis.Visible := not dcAxis.Visible;
  dcGalaxy.Visible := not dcGalaxy.Visible;
end;

procedure TFormGalaktika.miProjectionClick(Sender: TObject);
begin
  with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// -------------------------------------------------------------
procedure TFormGalaktika.miOpenClick(Sender: TObject);
var
  F: TextFile;
  sl, tl: TStringList;

begin
  dcHelios.DeleteChildren();
  svHelios.Invalidate();

  sl := TStringList.Create;
  tl := TStringList.Create;
  DataDir := ExtractFilePath(ParamStr(0));
  DataDir := DataDir + 'data\catalog';
  // SetCurrentDir(DataDir);
  OpenTextFileDialog.InitialDir := DataDir;
  OpenTextFileDialog.FilterIndex := 1;

  // Выполняем диалог открыть файл
  if OpenTextFileDialog.Execute then
    // Проверка есть ли файл
    if FileExists(OpenTextFileDialog.FileName) then
      // If it exists, load the data into the memo box.
      MemoTable.Lines.LoadFromFile(OpenTextFileDialog.FileName)
    else
      // Otherwise, raise an exception.
      raise Exception.Create('File not exists');

  (*
    if OpenDialog.Execute() then
    AssignFile(F, OpenDialog.FileName)
    else
    Exit;
    try
    Reset(F);
    sl.LoadFromFile(OpenDialog.FileName);
    finally
    //
    end;
  *)
end;

// --------------------------------------------------------
// Пересчёт числа классов звёзд при изменении общего числа
// --------------------------------------------------------
procedure TFormGalaktika.miSaveAsClick(Sender: TObject);
begin
  // Открываем диалог сохранения файла
  if SaveTextFileDialog.Execute then
    // Проверка существует ли файл
    if FileExists(SaveTextFileDialog.FileName) then
      // Если существует, то raise как исключение
      raise Exception.Create(_('File exists. Can not overwrite'))
    else
      // Otherwise, save the memo box lines into the file.
      MemoTable.Lines.SaveToFile(SaveTextFileDialog.FileName);
  // Edit1.Text := SaveTextFileDialog.Encodings[SaveTextFileDialog.EncodingIndex];
end;

procedure TFormGalaktika.shAContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  //
end;

// -------------------------------------------------------------
procedure TFormGalaktika.SpinEditChange(Sender: TObject);
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
procedure TFormGalaktika.miAboutClick(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// -------------------------------------------------------------
procedure TFormGalaktika.miExitClick(Sender: TObject);
begin
  Close();
end;

procedure TFormGalaktika.miSettingsClick(Sender: TObject);
begin
  with TFormSettings.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalaktika.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    Top := IniFile.ReadInteger(Name, 'Top', 100);
    Left := IniFile.ReadInteger(Name, 'Left', 200);
  finally
    IniFile.Free;
  end;
end;

procedure TFormGalaktika.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteInteger(Name, 'Top', Top);
    IniFile.WriteInteger(Name, 'Left', Left);
    // IniFile.WriteBool(Name, 'InitMax', WindowState = wsMaximized);
  finally
    IniFile.Free;
  end;
  inherited;
end;

// ===========================================
initialization
// ===========================================

FormatSettings.DecimalSeparator := '.';

end.
