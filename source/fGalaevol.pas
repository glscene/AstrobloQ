unit fGalaevol;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
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

  fAbout,
  fOptions,
  fProjection, GLS.SpaceText, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs,
  FireDAC.Stan.Intf, FireDAC.Comp.BatchMove;

type
  TFormGalagrid = class(TForm)
    GLScene: TGLScene;
    StatusBar1: TStatusBar;
    MainMenu: TMainMenu;
    GLAsyncTimer: TGLAsyncTimer;
    GLCadencer: TGLCadencer;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    miExit: TMenuItem;
    miN2: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    GoTo1: TMenuItem;
    Object1: TMenuItem;
    miN1: TMenuItem;
    miN3: TMenuItem;
    miN4: TMenuItem;
    miView: TMenuItem;
    miSettings: TMenuItem;
    miViewPanelHide: TMenuItem;
    miViewPanelShow: TMenuItem;
    miN5: TMenuItem;
    Help1: TMenuItem;
    miWiki: TMenuItem;
    About1: TMenuItem;
    miN6: TMenuItem;
    camGalaxy: TGLCamera;
    LightGal: TGLLightSource;
    dcGalaxy: TGLDummyCube;
    dcHelios: TGLDummyCube;
    ArrowZ: TGLArrowLine;
    ArrowY: TGLArrowLine;
    ArrowX: TGLArrowLine;
    XYZGrid: TGLXYZGrid;
    N7: TMenuItem;
    N8: TMenuItem;
    ControlBar1: TControlBar;
    diskGalaxy: TGLDisk;
    GLMatLib: TGLMaterialLibrary;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PageControl1: TPageControl;
    tsHeliocube: TTabSheet;
    tsGalacube: TTabSheet;
    svGal: TGLSceneViewer;
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
    tsTable: TTabSheet;
    DBGrid: TDBGrid;
    MemoTable: TMemo;
    OpenTextFileDialog: TOpenTextFileDialog;
    SaveTextFileDialog: TSaveTextFileDialog;
    FDBatchMove: TFDBatchMove;
    procedure miExitClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure miViewPanelHideClick(Sender: TObject);
    procedure miViewPanelShowClick(Sender: TObject);
    procedure GLAsyncTimerTimer(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime,
      NewTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure svGalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure svGalMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miSettingsClick(Sender: TObject);
    procedure ButtonStarsClick(Sender: TObject);
    procedure chbAllClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure SpinEditChange(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
  public
    MousePoint: TPoint;
    // Создание скопления звёзд со случайной позицией и цветом
    procedure MakeRandomStars;
  private
    AtStart: Boolean;
    mx, my,
    dmx, dmy: Integer;
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
  FormGalagrid: TFormGalagrid;

//========================================================
implementation
//========================================================

{$R *.dfm}

procedure TFormGalagrid.FormCreate(Sender: TObject);
begin
  tvGalaxy.FullExpand;

  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');
end;

procedure TFormGalagrid.GLAsyncTimerTimer(Sender: TObject);
begin
//  diskGalaxy.Roll(0.01);
end;

procedure TFormGalagrid.GLCadencerProgress(Sender: TObject; const DeltaTime,
  NewTime: Double);
begin
  diskGalaxy.Roll(0.001);
end;

// -----------------------------------------------------------------
//
procedure TFormGalagrid.MakeRandomStars;
var
  I: Integer;
  NStars: Integer;
begin
  {
    for I := 0 to SpinEdit.Value - 1 do
    begin
    Stars := TGLPoints.Create(dcSol);
    Stars.Style := psSmooth;
    Stars.Size := 5;
    Stars.PointParameters.Enabled := true;
    Stars.PointParameters.MinSize := 1;
    Stars.PointParameters.MaxSize := 10;
    Stars.PointParameters.DistanceAttenuation.SetVector(0, 0.1, 0);
    Stars.Positions.Add(Random(1000), Random(1000), Random(1000));
    Stars.Colors.AddPoint(Random(), Random(), Random());
    end;

  NumPoints := 10000;
  GLPoints := TGLPoints(dcWorld.AddNewChild(TGLPoints));
  GLPoints.Size := 5.0;
  GLPoints.Style := psSmooth;
  for I := 0 to NumPoints - 1 do
  begin
    Color.X := Random();
    Color.Y := Random();
    Color.Z := Random();

    X := Random(10) - 5;
    Y := Random(10) - 5;
    Z := Random(10) - 5;

    GLPoints.Positions.Add(X * 0.05, Y * 0.05, Z * 0.05);
    // Fill array of GLPoints
    GLPoints.Colors.AddPoint(Color);
  end;

  }
  dotStars := TGLPoints(dcHelios.AddNewChild(TGLPoints));
  dotStars.Size := 5.0;
  dotStars.Style := psSmooth;

  // O class
  if (chbO.Checked) then
  begin
    NStars := Round(nbOn.Value);
    for I := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      dotStars.Colors.Add(clrBlue);
    end
  end;
  // B class
  if (chbB.Checked) then
  begin
    NStars := Round(nbBn.Value);
    for I := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      dotStars.Colors.Add(clrLightBlue);
    end
  end;
  // A class
  if (chbA.Checked) then
  begin
    NStars := Round(nbAn.Value);
    for I := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      dotStars.Colors.Add(clrWheat);
    end
  end;
  // F class
  if (chbF.Checked) then
  begin
    NStars := Round(nbFn.Value);
    for I := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      dotStars.Colors.Add(clrFuchsia);
    end
  end;
  // G class
  if (chbG.Checked) then
  begin
    NStars := Round(nbGn.Value);
    for I := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      dotStars.Colors.Add(clrYellow);
    end
  end;
  // K class
  if (chbK.Checked) then
  begin
    NStars := Round(nbKn.Value);
    for I := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      dotStars.Colors.Add(clrOrange);
    end
  end;
  // M class
  if (chbM.Checked) then
  begin
    NStars := Round(nbMn.Value);
    for I := 0 to NStars - 1 do
    begin
      dotStars.Positions.Add(Random(1000) - 500, Random(1000) - 500, Random(1000) - 500);
      dotStars.Colors.Add(clrRed);
    end
  end;
end;

procedure TFormGalagrid.ButtonClearClick(Sender: TObject);
begin
 dcHelios.DeleteChildren();
 svHelios.Invalidate();
end;

procedure TFormGalagrid.ButtonStarsClick(Sender: TObject);
begin
  MakeRandomStars;
end;

procedure TFormGalagrid.chbAllClick(Sender: TObject);
begin
  chbO.Checked := chbAll.Checked;
  chbB.Checked := chbAll.Checked;
  chbA.Checked := chbAll.Checked;
  chbF.Checked := chbAll.Checked;
  chbG.Checked := chbAll.Checked;
  chbK.Checked := chbAll.Checked;
  chbM.Checked := chbAll.Checked;
end;

//-----------------------------------------------------------------------
procedure TFormGalagrid.svGalMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TFormGalagrid.svGalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

procedure TFormGalagrid.miViewPanelHideClick(Sender: TObject);
begin
  PanelLeft.Visible := False;
  PanelRight.Visible := False;
end;

procedure TFormGalagrid.miSettingsClick(Sender: TObject);
begin
   with TFormOptions.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalagrid.N8Click(Sender: TObject);
begin
   with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// -------------------------------------------------------------
procedure TFormGalagrid.Open1Click(Sender: TObject);
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
      raise Exception.Create('Файла не существует');

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

//--------------------------------------------------------
// Пересчёт числа классов звёзд при изменении общего числа
//--------------------------------------------------------
procedure TFormGalagrid.SaveAs1Click(Sender: TObject);
begin
  // Открываем диалог сохранения файла
  if SaveTextFileDialog.Execute then
    // Проверка существует ли файл
    if FileExists(SaveTextFileDialog.FileName) then
      // Если существует, то raise как исключение
      raise Exception.Create('Файл существует. Перезаписать нельзя')
    else
      // Otherwise, save the memo box lines into the file.
      MemoTable.Lines.SaveToFile(SaveTextFileDialog.FileName);
  // Edit1.Text := SaveTextFileDialog.Encodings[SaveTextFileDialog.EncodingIndex];
end;


// -------------------------------------------------------------
procedure TFormGalagrid.SpinEditChange(Sender: TObject);
begin
 nbOn.Value := Round(nbO.Value * SpinEdit.Value / 100);
 nbBn.Value := Round(nbB.Value * SpinEdit.Value / 100);
 nbAn.Value := Round(nbA.Value * SpinEdit.Value / 100);
 nbFn.Value := Round(nbF.Value * SpinEdit.Value / 100);
 nbGn.Value := Round(nbG.Value * SpinEdit.Value / 100);
 nbKn.Value := Round(nbK.Value * SpinEdit.Value / 100);
 nbMn.Value := Round(nbM.Value * SpinEdit.Value / 100);
end;

procedure TFormGalagrid.miViewPanelShowClick(Sender: TObject);
begin
  PanelLeft.Visible := True;
  PanelRight.Visible := True;
end;

// -------------------------------------------------------------
procedure TFormGalagrid.About1Click(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

// -------------------------------------------------------------
procedure TFormGalagrid.miExitClick(Sender: TObject);
begin
  Close();
end;

end.
