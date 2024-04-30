unit faGraf1d;
(* App crashes; stops responding; when vertical volume intergration calculated
  for x/arccsc(ln(x^4)); xonarccsc(ln(x_4)).yfx file
  also for large movements when logx and logy axes in use *)

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.ExtDlgs,
  Vcl.Printers,

  GLS.Scene,
  GLS.Coordinates,

  GLS.BaseClasses,
  GLS.SceneViewer,
  GLS.BitmapFont,
  GLS.WindowsFont,
  GLS.RenderContextInfo,

  fAbout,
  Graf.Canvas1d,
  Graf.Global1d,
  faFunc1d;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    New: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    SaveAs: TMenuItem;
    SaveBMPfile1: TMenuItem;
    SaveJPGfile1: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    SetupPrinter1: TMenuItem;
    N1: TMenuItem;
    ExitApp: TMenuItem;
    View1: TMenuItem;
    GridOptions1: TMenuItem;
    NumGraphs: TMenuItem;
    Texts1: TMenuItem;
    Style1: TMenuItem;
    SelectStyle1: TMenuItem;
    SaveStyle1: TMenuItem;
    StatusBar: TStatusBar;
    GLViewer: TGLSceneViewer;
    GLScene: TGLScene;
    GLCamera: TGLCamera;
    GLDirectOpenGL: TGLDirectOpenGL;
    GLWinBitFont: TGLWindowsBitmapFont;
    GLMemoryViewer: TGLMemoryViewer;
    PrinterSetupDialog: TPrinterSetupDialog;
    DefaultLayout1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    miRuwiki: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure GLViewerDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GLViewerEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure GLViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLViewerMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GLViewerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLDirectOpenGLRender(Sender: TObject;
      var rci: TGLRenderContextInfo);
    procedure NewClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure ExitAppClick(Sender: TObject);
    procedure GridOptions1Click(Sender: TObject);
    procedure Texts1Click(Sender: TObject);
    procedure SaveBMPfile1Click(Sender: TObject);
    procedure SaveJPGfile1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure SetupPrinter1Click(Sender: TObject);
    procedure SelectStyle1Click(Sender: TObject);
    procedure SaveStyle1Click(Sender: TObject);
    procedure GLViewerMouseLeave(Sender: TObject);
    procedure NumGraphsClick(Sender: TObject);
    procedure DefaultLayout1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    dMove: Integer;
    procedure ShowXYvalues(const X, Y: extended);
    procedure UpdateGridXRange;
    procedure UpdateGridYRange;
    procedure DefaultLayout;
    function ValueX(const X: Integer): extended;
    function ValueY(const Y: Integer): extended;
    function ValueLogX(const X: Integer): extended;
    function ValueLogY(const Y: Integer): extended;
  public
    oMousex, oMousey: Integer;
  end;

const
  crHandMove = 1;
  crMoveRight = 2;
  crMoveLeft = 3;
  crMoveUp = 4;
  crMoveDown = 5;
  crZoom = 6;

var
  MainForm: TMainForm;
  NewFont: Boolean = True;
  PrinterExists: Boolean;

// =====================================================================
implementation
// =====================================================================

{$R *.dfm}

uses
  faGridOpt1d,
  faIntegrateX,
  faIntegrateY,
  faBitmap,
  faStyle,
  faTextBlocks,
  faDerivative,
  faBetween,
  faVolumeX,
  faVolumeY,
  faValueX,
  faValueX1,
  faValueX2,
  faNumeric,
  faPrint;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  BinPath := ExtractFilePath(ParamStr(0));
  BinPath := IncludeTrailingPathDelimiter(BinPath);

  DataPath := BinPath + 'data\plot1d\';
  SetCurrentDir(DataPath);
  ImagePath := BinPath + 'data\image\';

  PrinterExists := Printer.Printers.Count > 0;
  StyleFName := BinPath + 'Style1d.sty';
  LayoutFName := BinPath + 'Layout1d.lay';

  Screen.Cursors[crHandMove] := LoadCursor(HInstance, 'HANDMOVE');
  Screen.Cursors[crMoveRight] := LoadCursor(HInstance, 'MOVERIGHT');
  Screen.Cursors[crMoveLeft] := LoadCursor(HInstance, 'MOVELEFT');
  Screen.Cursors[crMoveUp] := LoadCursor(HInstance, 'MOVEUP');
  Screen.Cursors[crMoveDown] := LoadCursor(HInstance, 'MOVEDOWN');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');
  dMove := $200;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  f: File of TLayout;

begin
  if FileExists(LayoutFName) then
  begin
    try
      AssignFile(f, LayoutFName);
      try
        Reset(f);
        Read(f, Layout);
      finally
        CloseFile(f);
      end;

      if Layout.IsMaximize then
        WindowState := wsMaximized
      else
      begin
        with Layout do
        begin
          Left := MainLeft;
          Top := MainTop;
          Width := MainWidth;
          Height := MainHeight;
          GraphFName := CurrentGraphFName;
          DataPath := CurrentDataPath;
          ImagePath := CurrentImagePath;
          PrinterInfo := CurrentPrinterInfo;

          if GridsVisible then
            GridOptionsForm.Show;
          with GridOptionsForm do
          begin
            MainForm.Left := GridsLeft;
            MainForm.Top := GridsTop;
          end;

          if NumericVisible then
            NumericForm.Show;
          with NumericForm do
          begin
            MainForm.Left := NumericLeft;
            MainForm.Top := NumericTop;
          end;

          if TextVisible then
            TextBlocksForm.Show;
          with TextBlocksForm do
          begin
            MainForm.Left := TextLeft;
            MainForm.Top := TextTop;
            MainForm.Width := TextWidth;
            MainForm.Height := TextHeight;
          end;
          with FunctionsForm do
          begin
            MainForm.Left := FuncLeft;
            MainForm.Top := FuncTop;
          end;
          with DerivativeForm do
          begin
            MainForm.Left := DerivLeft;
            MainForm.Top := DerivTop;
          end;
          with IntegrateXForm do
          begin
            MainForm.Left := IntegXLeft;
            MainForm.Top := IntegXTop;
          end;
          with IntegrateYForm do
          begin
            MainForm.Left := IntegYLeft;
            MainForm.Top := IntegYTop;
          end;
          with BetweenForm do
          begin
            MainForm.Left := BetweenLeft;
            MainForm.Top := BetweenTop;
          end;
          with VolumeXForm do
          begin
            MainForm.Left := VolumeXLeft;
            MainForm.Top := VolumeXTop;
          end;
          with VolumeYForm do
          begin
            MainForm.Left := VolumeYLeft;
            MainForm.Top := VolumeYTop;
          end;
          with fxValueForm do
          begin
            MainForm.Left := fxLeft;
            MainForm.Top := fxTop;
          end;
          with fx1ValueForm do
          begin
            MainForm.Left := fx1Left;
            MainForm.Top := fx1Top;
          end;
          with fx2ValueForm do
          begin
            MainForm.Left := fx2Left;
            MainForm.Top := fx2Top;
          end;
        end;
      end;
    except
      MessageDlg('Ошибка чтения файла!' + #13#10'"' + LayoutFName + '".' +
        #13#10'Будут использоваться исходные установки', mtError, [mbOK], 0);
      DefaultLayout;
    end;
  end
  else
    DefaultLayout;
  if DataPath = '' then
    DataPath := BinPath + 'data\plot1d\';
  if ImagePath = '' then
    ImagePath := BinPath + 'data\image\';
  if not DirectoryExists(DataPath) then
    ForceDirectories(DataPath);
  if not DirectoryExists(ImagePath) then
    ForceDirectories(ImagePath);

  if PrinterExists then
  begin
    SetPrinterInfo(PrinterInfo);
    GetPrinterInfo(PrinterInfo);
    if PrinterInfo.Orientation = poPortrait then
      StatusBar.Panels[1].Text := '  ' + Printer.Printers[PrinterInfo.Index] +
        '  ' + GetPaperType + ', Книжная'
    else
      StatusBar.Panels[1].Text := '  ' + Printer.Printers[PrinterInfo.Index] +
        '  ' + GetPaperType + ', Альбомная';
  end
  else
  begin
    Print1.Enabled := false; // disabled if no printer
    SetupPrinter1.Enabled := false;
    StatusBar.Panels[1].Text := 'Принтер не найден';
  end;

  Caption := GraphFName;
  KeepRange := false;
  FunctionsForm.Show;
  Altered := false;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  f: File of TLayout;

begin
  with Layout do
  begin
    IsMaximize := WindowState = wsMaximized;
    MainLeft := Left;
    MainTop := Top;
    MainWidth := Width;
    MainHeight := Height;
    CurrentGraphFName := GraphFName;
    CurrentDataPath := DataPath;
    CurrentImagePath := ImagePath;
    CurrentPrinterInfo := PrinterInfo;
    GridsVisible := GridOptionsForm.Visible;
    with GridOptionsForm do
    begin
      GridsLeft := Left;
      GridsTop := Top;
    end;

    NumericVisible := NumericForm.Visible;
    with NumericForm do
    begin
      NumericLeft := Left;
      NumericTop := Top;
    end;

    with NumericForm do
      if Visible then
      begin
        if (DataListBox.Count = 0) and (CheckListBox.Count > 0) then
          DeleteButtonClick(Sender);
        FunctionsForm.CoordPointButton.Visible := false;
      end;

    TextVisible := TextBlocksForm.Visible;
    with TextBlocksForm do
    begin
      TextLeft := Left;
      TextTop := Top;
      TextWidth := Width;
      TextHeight := Height;
    end;
    with FunctionsForm do
    begin
      FuncLeft := Left;
      FuncTop := Top;
    end;
    with DerivativeForm do
    begin
      DerivLeft := Left;
      DerivTop := Top;
    end;
    with IntegrateXForm do
    begin
      IntegXLeft := Left;
      IntegXTop := Top;
    end;
    with IntegrateYForm do
    begin
      IntegYLeft := Left;
      IntegYTop := Top;
    end;
    with BetweenForm do
    begin
      BetweenLeft := Left;
      BetweenTop := Top;
    end;
    with VolumeXForm do
    begin
      VolumeXLeft := Left;
      VolumeXTop := Top;
    end;
    with VolumeYForm do
    begin
      VolumeYLeft := Left;
      VolumeYTop := Top;
    end;
    with fxValueForm do
    begin
      fxLeft := Left;
      fxTop := Top;
    end;
    with fx1ValueForm do
    begin
      fx1Left := Left;
      fx1Top := Top;
    end;
    with fx2ValueForm do
    begin
      fx2Left := Left;
      fx2Top := Top;
    end;
  end;

  try
    AssignFile(f, LayoutFName);
    try
      Rewrite(f);
      write(f, Layout);
    finally
      CloseFile(f);
    end;
  except
    MessageDlg('Ошибка при работе с файлом' + #13#10'при записи в "' +
      LayoutFName + '".', mtError, [mbOK], 0);
  end;

  if Altered then
  begin
    case MessageDlg('Параметры графика были изменены.' +
      #13#10'Сохранить изменения ?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) of
      mrYes:
        FunctionsForm.SaveClick(Sender);
      mrCancel:
        begin
          CanClose := false;
          Exit;
        end;
    end;
  end;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  X, Y, r: extended;

begin
  with GraphData.Grid do
    if (xAxisStyle = asLog) or (yAxisStyle = asLog) then
      Exit;
  case Key of
    // VK_F2:ShowAbout;
    VK_ESCAPE:
      if (MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
        ExitAppClick(Sender);
    VK_LEFT, VK_NUMPAD4:
      begin
        Screen.Cursor := crMoveLeft;
        with GraphData do
        begin
          X := (xMax - xMin) / dMove;
          xMin := xMin + X;
          xMax := xMax + X;
        end;
        UpdateGridXRange;
        Altered := True;
        if dMove > 1 then
          dec(dMove, dMove div 16);
        GLViewer.Invalidate;
        Key := 0;
      end;
    VK_RIGHT, VK_NUMPAD6:
      begin
        Screen.Cursor := crMoveRight;
        with GraphData do
        begin
          X := (xMax - xMin) / dMove;
          xMin := xMin - X;
          xMax := xMax - X;
        end;
        UpdateGridXRange;
        Altered := True;
        if dMove > 1 then
          dec(dMove, dMove div 16);
        GLViewer.Invalidate;
        Key := 0;
      end;
    VK_UP, VK_NUMPAD8:
      begin
        Screen.Cursor := crMoveUp;
        with GraphData do
        begin
          Y := (yMax - yMin) / dMove;
          yMin := yMin - Y;
          yMax := yMax - Y;
        end;
        UpdateGridYRange;
        Altered := True;
        if dMove > 1 then
          dec(dMove, dMove div 16);
        GLViewer.Invalidate;
        Key := 0;
      end;
    VK_DOWN, VK_NUMPAD2:
      begin
        Screen.Cursor := crMoveDown;
        with GraphData do
        begin
          Y := (yMax - yMin) / dMove;
          yMin := yMin + Y;
          yMax := yMax + Y;
        end;
        UpdateGridYRange;
        Altered := True;
        if dMove > 1 then
          dec(dMove, dMove div 16);
        GLViewer.Invalidate;
        Key := 0;
      end;
    VK_ADD: // zoom in
      begin
        Screen.Cursor := crZoom;
        with GraphData do
        begin
          X := (xMax - xMin) / dMove;
          xMin := xMin + X;
          xMax := xMax - X;

          Y := (yMax - yMin) / dMove;
          yMin := yMin + Y;
          yMax := yMax - Y;
        end;
        UpdateGridXRange;
        UpdateGridYRange;
        Altered := True;
        if dMove > 1 then
          dec(dMove, dMove div 16);
        GLViewer.Invalidate;
        Key := 0;
      end;
    VK_SUBTRACT: // zoom out
      begin
        Screen.Cursor := crZoom;
        X := (GraphData.xMax - GraphData.xMin) / dMove;
        GraphData.xMin := GraphData.xMin - X;
        GraphData.xMax := GraphData.xMax + X;

        Y := (GraphData.yMax - GraphData.yMin) / dMove;
        GraphData.yMin := GraphData.yMin - Y;
        GraphData.yMax := GraphData.yMax + Y;
        UpdateGridXRange;
        UpdateGridYRange;
        Altered := True;
        if dMove > 1 then
          dec(dMove, dMove div 16);
        GLViewer.Invalidate;
        Key := 0;
      end;
    VK_HOME, VK_NUMPAD7:
      begin
        X := (GraphData.xMax - GraphData.xMin) / 2;
        GraphData.xMin := -X;
        GraphData.xMax := X;
        Y := (GraphData.yMax - GraphData.yMin) / 2;
        GraphData.yMin := -Y;
        GraphData.yMax := Y;
        UpdateGridXRange;
        UpdateGridYRange;
        Altered := True;
        GLViewer.Invalidate;
        Key := 0;
      end;
    12, VK_NUMPAD5: // eual grid
      begin
        with GraphData do
        begin
          X := xMax - xMin;
          Y := yMax - yMin;
          r := (X * MainForm.GLViewer.Height) / (Y * MainForm.GLViewer.Width);

          if X > Y then
          begin
            if Shift = [ssCtrl] then
            begin
              xMax := yMax;
              xMin := yMin;
            end
            else
            begin
              yMax := yMax * r;
              yMin := yMin * r;
            end;
          end
          else
          begin
            if Shift = [ssCtrl] then
            begin
              yMax := xMax;
              yMin := xMin;
            end
            else
            begin
              xMax := xMax / r;
              xMin := xMin / r;
            end;
          end;
        end;
        UpdateGridXRange;
        UpdateGridYRange;
        Altered := True;
        GLViewer.Invalidate;
        Key := 0;
      end;
  end;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Screen.Cursor := crDefault;
  dMove := $200;
end;

procedure TMainForm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  d: Integer;
  X, Y: extended;

begin
  with GraphData.Grid do
    if (xAxisStyle = asLog) or (yAxisStyle = asLog) then
      Exit;
  // WheelDelta is negative when wheel is rotated toward user, i.e. Zoom in.
  d := -WheelDelta div 2;
  if Shift = [ssShift] then
    d := d div 4
  else if Shift = [ssCtrl] then
    d := d div 2;

  with GraphData do
  begin
    X := (xMax - xMin) / d;
    xMin := xMin + X;
    xMax := xMax - X;

    Y := (yMax - yMin) / d;
    yMin := yMin + Y;
    yMax := yMax - Y;
  end;
  UpdateGridXRange;
  UpdateGridYRange;
  Altered := True;
  GLViewer.Invalidate;
end;

procedure TMainForm.GLViewerDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source = Sender;
  if Accept then
    with GraphData, PlotData do
    begin
      with Grid do
      begin
        if xAxisStyle = asLog then
          xLabel := ValueLogX(X)
        else
          xLabel := ValueX(X);

        if yAxisStyle = asLog then
          yLabel := ValueLogY(Y)
        else
          yLabel := ValueY(Y);
      end;

      FunctionsForm.EditLocX.Text := FloatToStrF(xLabel, ffNumber, 4, 3);
      FunctionsForm.EditLocY.Text := FloatToStrF(yLabel, ffNumber, 4, 3);
      ShowXYvalues(xLabel, yLabel);
    end;
end;

procedure TMainForm.GLViewerEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  if Target = Sender then // end of drag
    with FunctionsForm.CheckListBox,
      TPlotDataObject(Items.Objects[ItemIndex]).Data do
    begin
      with GraphData.Grid do
      begin
        if xAxisStyle = asLog then
          xLabel := ValueLogX(X)
        else
          xLabel := ValueX(X);

        if yAxisStyle = asLog then
          yLabel := ValueLogY(Y)
        else
          yLabel := ValueY(Y);
      end;

      Altered := True;
      GLViewer.Invalidate;
    end;
end;

procedure TMainForm.GLViewerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  dx, dy: extended;

begin
  if Shift = [ssLeft] then // drag only if left button pressed
    with Sender as TGLSceneViewer do // treat Sender as TGLSceneViewer
    begin
      if (X >= LabelRect.Left) and (X <= LabelRect.Right) and
        (Y >= LabelRect.Top) and (Y <= LabelRect.Bottom) then
        BeginDrag(false)
      else
        Screen.Cursor := crHandMove;
    end
  else if (GraphData.Grid.xAxisStyle <> asLog) and
    (GraphData.Grid.yAxisStyle <> asLog) and (Shift = [ssLeft, ssAlt]) then
  begin // reposition graph; set mouse location as graph center
    with GraphData do
    begin
      dx := (xMin + xMax) / 2 - ValueX(X);
      dy := (yMin + yMax) / 2 - ValueY(Y);
      xMin := xMin - dx;
      xMax := xMax - dx;
      yMin := yMin - dy;
      yMax := yMax - dy;
    end;
    UpdateGridXRange;
    UpdateGridYRange;
    Altered := True;
    GLViewer.Invalidate;
  end;
end;

procedure TMainForm.GLViewerMouseLeave(Sender: TObject);
begin
  oMousex := -1;
end;

procedure TMainForm.GLViewerMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);

  procedure IsAltered;
  begin
    UpdateGridXRange;
    UpdateGridYRange;
    Altered := True;
    GLViewer.Invalidate;
  end;

var
  xValue, yValue: extended;

begin
  xValue := 0;
  yValue := 0;

  if Active and (oMousex > -1) then
  begin
    if Shift = [ssLeft] then
    begin
      with GraphData do
      begin
        if Grid.xAxisStyle = asLog then
        begin // ratio of change to current value of x
          xValue := (ValueLogX(X) - ValueLogX(oMousex)) / ValueLogX(X);
          xMin := xMin - xMin * xValue;
          xMax := xMax - xMax * xValue;
        end
        else
        begin
          xValue := ValueX(X) - ValueX(oMousex);
          xMax := xMax - xValue;
          xMin := xMin - xValue;
        end;

        if Grid.yAxisStyle = asLog then
        begin // ratio of change to current value of y
          yValue := (ValueLogY(Y) - ValueLogY(oMousey)) / ValueLogY(Y);
          yMin := yMin - yMin * yValue;
          yMax := yMax - yMax * yValue;
        end
        else
        begin
          yValue := ValueY(Y) - ValueY(oMousey);
          yMax := yMax - yValue;
          yMin := yMin - yValue;
        end;
      end;
      IsAltered;
    end
    else if Shift = [ssLeft, ssCtrl] then
    begin
      Screen.Cursor := crSizeAll;

      if GraphData.Grid.xAxisStyle = asLog then
      begin
        xValue := (ValueLogX(X) - ValueLogX(oMousex)) / ValueLogX(X);
        GraphData.xMin := GraphData.xMin + GraphData.xMin * xValue;
        GraphData.xMax := GraphData.xMax - GraphData.xMax * xValue;
      end
      else
      begin
        xValue := ValueX(X) - ValueX(oMousex);
        GraphData.xMin := GraphData.xMin + xValue;
        GraphData.xMax := GraphData.xMax - xValue;
      end;

      if GraphData.Grid.yAxisStyle = asLog then
      begin
        yValue := (ValueLogY(Y) - ValueLogY(oMousey)) / ValueLogY(Y);
        GraphData.yMin := GraphData.yMin + GraphData.yMin * yValue;
        GraphData.yMax := GraphData.yMax - GraphData.yMax * yValue;
      end
      else
      begin
        yValue := ValueY(Y) - ValueY(oMousey);
        GraphData.yMin := GraphData.yMin + yValue;
        GraphData.yMax := GraphData.yMax - yValue;
      end;

      IsAltered;
    end;

    if GraphData.Grid.xAxisStyle = asLog then
      xValue := ValueLogX(X)
    else
      xValue := ValueX(X);

    if GraphData.Grid.yAxisStyle = asLog then
      yValue := ValueLogY(Y)
    else
      yValue := ValueY(Y);
  end;

  oMousex := X;
  oMousey := Y;

  ShowXYvalues(xValue, yValue);
end;

procedure TMainForm.GLViewerMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

procedure TMainForm.NewClick(Sender: TObject);
begin
  FunctionsForm.NewClick(Sender);
end;

procedure TMainForm.OpenClick(Sender: TObject);
begin
  FunctionsForm.OpenClick(Sender);
end;

procedure TMainForm.SaveClick(Sender: TObject);
begin
  FunctionsForm.SaveClick(Sender);
end;

procedure TMainForm.SaveAsClick(Sender: TObject);
begin
  FunctionsForm.SaveAsClick(Sender);
end;

procedure TMainForm.SaveBMPfile1Click(Sender: TObject);
begin
  BitmapForm := TBitmapForm.Create(Application);
  if FunctionsForm.CheckListBox.Count > 1 then
    BitmapForm.Caption := '   Сохранить графики как ''' +
      ChangeFileExt(GraphFName, '.bmp''')
  else
    BitmapForm.Caption := '   Сохранить график как ''' +
      ChangeFileExt(GraphFName, '.bmp''');
  BitmapForm.ShowModal;
  BitmapForm.Free;
  BitmapForm := nil;
end;

procedure TMainForm.SaveJPGfile1Click(Sender: TObject);
begin
  BitmapForm := TBitmapForm.Create(Application);
  if FunctionsForm.CheckListBox.Count > 1 then
    BitmapForm.Caption := '   Сохранить графики как ''' +
      ChangeFileExt(GraphFName, '.jpg''')
  else
    BitmapForm.Caption := '   Сохранить график как ''' +
      ChangeFileExt(GraphFName, '.jpg''');
  BitmapForm.ShowModal;
  BitmapForm.Free;
  BitmapForm := nil;
end;

procedure TMainForm.Print1Click(Sender: TObject);
begin
  PrintForm := TPrintForm.Create(Application);
  PrintForm.Caption := '   Печать ''' + GraphFName + '''.';
  PrintForm.ShowModal;
  PrintForm.Free;
  PrintForm := nil;
end;

procedure TMainForm.SetupPrinter1Click(Sender: TObject);
begin
  if PrinterSetupDialog.Execute then
  begin
    GetPrinterInfo(PrinterInfo);
    if PrinterInfo.Orientation = poPortrait then
      StatusBar.Panels[1].Text := '  ' + Printer.Printers[PrinterInfo.Index] +
        '  ' + GetPaperType + ', Книжная'
    else
      StatusBar.Panels[1].Text := '  ' + Printer.Printers[PrinterInfo.Index] +
        '  ' + GetPaperType + ', Альбомная';
  end;
end;

procedure TMainForm.DefaultLayout1Click(Sender: TObject);
begin
  DefaultLayout;
end;

procedure TMainForm.ExitAppClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.GridOptions1Click(Sender: TObject);
begin
  if not GridOptionsForm.Visible then
    GridOptionsForm.Show;
end;

procedure TMainForm.NumGraphsClick(Sender: TObject);
begin
  if not NumericForm.Visible then
  begin
    NumericForm.Show;
    NumericForm.CheckListBoxClick(Sender); // updates NumericForm.DataListBox
  end;
end;

procedure TMainForm.Texts1Click(Sender: TObject);
begin
  if not TextBlocksForm.Visible then
    TextBlocksForm.Show;
end;

procedure TMainForm.SelectStyle1Click(Sender: TObject);
begin
  StyleNameForm := TStyleNameForm.Create(Application);
  StyleNameForm.Selecting := True;
  StyleNameForm.ShowModal;
  StyleNameForm.Free;
  StyleNameForm := nil;
  Altered := True;
  (*
    NewFont needed to initialize GLWinFont.GetCharWidth
    if the font has been altered, which may or may not be the case,
    so do it anyway
  *)
  NewFont := True;
  GLViewer.Invalidate;
end;

procedure TMainForm.SaveStyle1Click(Sender: TObject);
begin
  StyleNameForm := TStyleNameForm.Create(Application);
  StyleNameForm.Selecting := false;
  StyleNameForm.ShowModal;
  StyleNameForm.Free;
  StyleNameForm := nil;
end;

procedure TMainForm.GLDirectOpenGLRender(Sender: TObject;
  var rci: TGLRenderContextInfo);
var
  fxCanvas: TfxCanvas;

begin
  fxCanvas := TfxCanvas.Create(GLViewer.Width, GLViewer.Height);
  try
    if NewFont then
    begin
      fxCanvas.SetGLWinBitFont(rci, GLWinBitFont, GraphData.FontName,
        GraphData.FontSize, GraphData.FontStyle);
      fxCanvas.SetupFont(rci, GLWinBitFont);
      NewFont := false;
    end;

    with fxCanvas do
    begin
      xAxisGradsCalc(GLWinBitFont); // calculates graduations
      yAxisGradsCalc(GLWinBitFont);

      if GraphData.Grid.GridStyle > gsNone then
        DrawAxes;

      AddFunctionLabelsText; // add the labels to text list
      DrawTextList(rci, TextList, GLWinBitFont); // axes and labels text
      DrawFunctions;
      DrawNumericData;
      DrawTextBlocks(rci, GLWinBitFont);
    end;
  finally
    fxCanvas.Free;
  end;
end;

procedure TMainForm.ShowXYvalues(const X, Y: extended);
var
  sx, sy: string;

begin
  sx := FloatToStrF(X, ffNumber, 16, 8);
  sy := FloatToStrF(Y, ffNumber, 16, 8);
  StatusBar.Panels[0].Text := ' x : ' + sx + ', y : ' + sy;
end;

procedure TMainForm.UpdateGridXRange;
begin
  with GridOptionsForm do
    if Visible then
    begin
      EditMinX.Text := FloatToStrF(GraphData.xMin, ffGeneral, 13, 4);
      EditMaxX.Text := FloatToStrF(GraphData.xMax, ffGeneral, 13, 4);
    end;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.DefaultLayout;
begin
  MainForm.Left := 1;
  MainForm.Top := 1;
  MainForm.Width := Screen.Width - GridOptionsForm.Width - 10;
  MainForm.Height := Screen.Height - 30;
  FunctionsForm.Left := MainForm.Left + MainForm.Width + 5;
  FunctionsForm.Top := MainForm.Top + 5;
  GridOptionsForm.Left := FunctionsForm.Left;
  GridOptionsForm.Top := FunctionsForm.Top + FunctionsForm.Height + 10;
  GridOptionsForm.Show;
  NumericForm.Top := 25;
  NumericForm.Left := 25;
  TextBlocksForm.Top := 75;
  TextBlocksForm.Left := 75;
end;

procedure TMainForm.UpdateGridYRange;
begin
  with GridOptionsForm do
    if Visible then
    begin
      EditMinY.Text := FloatToStrF(GraphData.yMin, ffGeneral, 13, 4);
      EditMaxY.Text := FloatToStrF(GraphData.yMax, ffGeneral, 13, 4);
    end;
end;

function TMainForm.ValueX(const X: Integer): extended;
begin
  Result := GraphData.xMin + X * (GraphData.xMax - GraphData.xMin) /
    GLViewer.Width;
end;

function TMainForm.ValueY(const Y: Integer): extended;
begin
  Result := GraphData.yMax + Y * (GraphData.yMin - GraphData.yMax) /
    GLViewer.Height;
end;

function TMainForm.ValueLogX(const X: Integer): extended;
var
  LogMin, a: extended;

begin
  LogMin := Log10(GraphData.xMin);
  a := LogMin + X * (Log10(GraphData.xMax) - LogMin) / GLViewer.Width;
  Result := Power(10, a);
end;

function TMainForm.ValueLogY(const Y: Integer): extended;
var
  LogMax, a: extended;

begin
  LogMax := Log10(GraphData.yMax);
  a := LogMax + Y * (Log10(GraphData.yMin) - LogMax) / GLViewer.Height;
  Result := Power(10, a);
end;

// ------------------------------------------------------------------
initialization

// ------------------------------------------------------------------
FormatSettings.DecimalSeparator := '.';

// ------------------------------------------------------------------
finalization

// ------------------------------------------------------------------
// return to FormatSettings.DecimalSeparator := ',';

end.
