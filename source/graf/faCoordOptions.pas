unit faCoordOptions;

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
  Vcl.Buttons,
  Vcl.StdCtrls,

  GLS.OpenGLTokens,
  GLS.PersistentClasses,
  GLS.Scene,
  GLS.VectorTypes,
  GLS.BitmapFont,
  GLS.VectorGeometry,
  
  Graf.Global2d,
  faGridOptions,
  faEvaluate;

type
  TCoordsForm = class(TForm)
    ColorDialog: TColorDialog;
    gbXCoordinates: TGroupBox;
    gbYCoordinates: TGroupBox;
    gbZCoordinates: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbXmaxY: TCheckBox;
    cbXmaxZ: TCheckBox;
    cbYmaxX: TCheckBox;
    cbYmaxZ: TCheckBox;
    cbZmaxX: TCheckBox;
    cbZmaxY: TCheckBox;

    xColorBtn: TSpeedButton;
    yColorBtn: TSpeedButton;
    zColorBtn: TSpeedButton;
    cbShowCoords: TCheckBox;
    FontDialog: TFontDialog;
    FontButton: TButton;
    CloseBitBtn: TBitBtn;
    procedure xColorBtnClick(Sender: TObject);
    procedure yColorBtnClick(Sender: TObject);
    procedure zColorBtnClick(Sender: TObject);
    procedure FontButtonClick(Sender: TObject);
    procedure cbShowCoordsClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);

    procedure cbXmaxYClick(Sender: TObject);
    procedure cbXmaxZClick(Sender: TObject);
    procedure cbYmaxXClick(Sender: TObject);
    procedure cbYmaxZClick(Sender: TObject);
    procedure cbZmaxXClick(Sender: TObject);
    procedure cbZmaxYClick(Sender: TObject);
  private
    procedure ClearXCoordsCube;
    procedure ClearYCoordsCube;
    procedure ClearZCoordsCube;
  public
    procedure UpdateCoordText;
  end;

var
  CoordsForm: TCoordsForm;

// =====================================================================
implementation
// =====================================================================

{$R *.dfm}

uses
  faGraf2d;

procedure TCoordsForm.UpdateCoordText;
var
  ScaleFactor: TGLFloat;
  CoordStep: TGLFloat;
  CoordMin: TGLFloat;
  CoordMax: TGLFloat;

  CurrentXCoord: TGLFloat;
  CurrentYCoord: TGLFloat;
  CurrentZCoord: TGLFloat;

  CurrentFlatText: TGLFlatText;

  procedure CalculateScaleFactor;
  begin
    with ViewData.xyGrid do
      ScaleFactor := xRange.Maximum - xRange.Minimum + yRange.Maximum -
        yRange.Minimum;
    with ViewData.yzGrid.zRange do
      ScaleFactor := ScaleFactor + (Maximum - Minimum) * ViewData.xyGrid.zScale;
    ScaleFactor := ScaleFactor / 3000;
  end;

begin
  if cbShowCoords.Checked then
  begin
    CalculateScaleFactor;
    // draw X coords
    ClearXCoordsCube;
    if cbXmaxY.Checked then
      CurrentYCoord := ViewData.xyGrid.yRange.Maximum
    else
      CurrentYCoord := ViewData.xyGrid.yRange.Minimum;
    CoordMax := ViewData.xyGrid.xRange.Maximum;
    CoordMin := ViewData.xyGrid.xRange.Minimum;
    CoordStep := ViewData.xyGrid.xRange.Step;

    if cbXmaxZ.Checked then
      CurrentZCoord := ViewData.yzGrid.zRange.Maximum * ViewData.xyGrid.zScale
    else
      CurrentZCoord := ViewData.yzGrid.zRange.Minimum * ViewData.xyGrid.zScale;

    CurrentXCoord := CoordMin;
    while CurrentXCoord >= CoordMax do  // Error:  here is fault while <= !
    begin
      TGLFlatText.CreateAsChild(FormPlotStars.XCoordsCube);
      CurrentFlatText := TGLFlatText(FormPlotStars.XCoordsCube.Children[
        FormPlotStars.XCoordsCube.Count - 1]);
      CurrentFlatText.BitmapFont := FormPlotStars.GLWinBmpFont;
      if cbXmaxY.Checked then
        CurrentFlatText.Direction.AsVector := VectorMake(0, 1, 0)
      else
        CurrentFlatText.Direction.AsVector := VectorMake(0, -1, 0);
      CurrentFlatText.Up.AsVector := VectorMake(0, 0, 1);
      if cbXmaxZ.Checked then
        CurrentFlatText.Layout := tlBottom // locate at z maximum
      else
        CurrentFlatText.Layout := tlTop; // or tlBottom, tlCenter
      CurrentFlatText.ModulateColor.AsWinColor := ViewData.xTextColor;
      CurrentFlatText.Position.AsVector := VectorMake(CurrentXCoord, CurrentYCoord,
        CurrentZCoord);
      CurrentFlatText.Scale.AsVector := VectorMake(ScaleFactor, ScaleFactor, 0);
      Text := FloatToStr(CurrentXCoord);
      CurrentXCoord := CurrentXCoord + CoordStep;
    end;

    // draw Y coords
    ClearYCoordsCube;
    if cbYmaxX.Checked then
      CurrentXCoord := ViewData.xyGrid.xRange.Maximum
    else
      CurrentXCoord := ViewData.xyGrid.xRange.Minimum;
    CoordMax := ViewData.xyGrid.yRange.Maximum;
    CoordMin := ViewData.xyGrid.yRange.Minimum;
    CoordStep := ViewData.xyGrid.yRange.Step;

    if cbYmaxZ.Checked then
      CurrentZCoord := ViewData.yzGrid.zRange.Maximum * ViewData.xyGrid.zScale
    else
      CurrentZCoord := ViewData.yzGrid.zRange.Minimum * ViewData.xyGrid.zScale;

    CurrentYCoord := CoordMin;
    while CurrentYCoord >= CoordMax do   // Error: here is fault while <= !
    begin
      TGLFlatText.CreateAsChild(FormPlotStars.YCoordsCube);
      CurrentFlatText := TGLFlatText(FormPlotStars.YCoordsCube.Children[
        FormPlotStars.YCoordsCube.Count - 1]);
      CurrentFlatText.BitmapFont := FormPlotStars.GLWinBmpFont;
      if cbYmaxX.Checked then
        FormPlotStars.YCoordsCube.Direction.AsVector := VectorMake(1, 0, 0)
      else
        FormPlotStars.YCoordsCube.Direction.AsVector := VectorMake(-1, 0, 0);
      FormPlotStars.YCoordsCube.Up.AsVector := VectorMake(0, 0, 1);
      if cbYmaxZ.Checked then
        CurrentFlatText.Layout := tlBottom // locate at z maximum
      else
        CurrentFlatText.Layout := tlTop; // or tlBottom, tlCenter
      CurrentFlatText.ModulateColor.AsWinColor := ViewData.yTextColor;
      FormPlotStars.YCoordsCube.Position.AsVector := VectorMake(CurrentXCoord, CurrentYCoord,
        CurrentZCoord);
      FormPlotStars.YCoordsCube.Scale.AsVector := VectorMake(ScaleFactor, ScaleFactor, 0);
      Text := FloatToStr(CurrentYCoord);
      CurrentYCoord := CurrentYCoord + CoordStep;
    end;

    // draw Z coords
    ClearZCoordsCube;
    if cbZmaxX.Checked then
      CurrentXCoord := ViewData.xzGrid.xRange.Maximum
    else
      CurrentXCoord := ViewData.xzGrid.xRange.Minimum;
    CoordMax := ViewData.xzGrid.zRange.Maximum;
    CoordMin := ViewData.xzGrid.zRange.Minimum;
    CoordStep := ViewData.xzGrid.zRange.Step;

    if cbZmaxY.Checked then
      CurrentYCoord := ViewData.xyGrid.yRange.Maximum
    else
      CurrentYCoord := ViewData.xyGrid.yRange.Minimum;

    CurrentZCoord := CoordMin;
    while CurrentZCoord >= CoordMax do   // Error: here is fault while <= !
    begin
      TGLFlatText.CreateAsChild(FormPlotStars.ZCoordsCube);
      CurrentFlatText := TGLFlatText(FormPlotStars.ZCoordsCube.Children[
        FormPlotStars.ZCoordsCube.Count - 1]);
      CurrentFlatText.BitmapFont := FormPlotStars.GLWinBmpFont;
      if cbZmaxX.Checked then
      begin
        if not cbZmaxY.Checked then
          FormPlotStars.ZCoordsCube.Direction.AsVector := VectorMake(0, -1, 0);
      end
      else
      begin
        if not cbZmaxY.Checked then
          FormPlotStars.ZCoordsCube.Direction.AsVector := VectorMake(-1, 0, 0)
        else
          FormPlotStars.ZCoordsCube.Direction.AsVector := VectorMake(0, 1, 0);
      end;
      FormPlotStars.ZCoordsCube.Up.AsVector := VectorMake(0, 0, 1);
      CurrentFlatText.Layout := tlCenter;
      CurrentFlatText.ModulateColor.AsWinColor := ViewData.zTextColor;
      FormPlotStars.ZCoordsCube.Position.AsVector := VectorMake(CurrentXCoord, CurrentYCoord,
        CurrentZCoord * ViewData.xyGrid.zScale);

      FormPlotStars.ZCoordsCube.Scale.AsVector := VectorMake(ScaleFactor, ScaleFactor, 0);
      if CurrentZCoord < 0 then
        Text := ' ' + FloatToStr(CurrentZCoord)
      else
        Text := '  ' + FloatToStr(CurrentZCoord);
      CurrentZCoord := CurrentZCoord + CoordStep;
    end;
    Altered := True;
  end;
end;

procedure TCoordsForm.ClearXCoordsCube;
var
  i: integer;

begin
  i := FormPlotStars.XCoordsCube.Count;
  while i > 0 do
  begin
    FormPlotStars.XCoordsCube.Children[i - 1].Free;
    i := FormPlotStars.XCoordsCube.Count;
  end;
end;

procedure TCoordsForm.ClearYCoordsCube;
var
  i: integer;

begin
  i := FormPlotStars.YCoordsCube.Count;
  while i > 0 do
  begin
    FormPlotStars.YCoordsCube.Children[i - 1].Free;
    i := FormPlotStars.YCoordsCube.Count;
  end;
end;

procedure TCoordsForm.ClearZCoordsCube;
var
  i: integer;

begin
  i := FormPlotStars.ZCoordsCube.Count;
  while i > 0 do
  begin
    FormPlotStars.ZCoordsCube.Children[i - 1].Free;
    i := FormPlotStars.ZCoordsCube.Count;
  end;
end;

procedure TCoordsForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCoordsForm.FontButtonClick(Sender: TObject);
begin
  FontDialog.Font := FormPlotStars.GLWinBmpFont.Font;
  FontDialog.Font.Name := ViewData.TextFontN;
  FontDialog.Font.Size := ViewData.TextFontSz;
  if FontDialog.Execute then
  begin
    FormPlotStars.GLWinBmpFont.Font := FontDialog.Font;
    ViewData.TextFontN := FontDialog.Font.Name;
    ViewData.TextFontSz := FontDialog.Font.Size;
    FontButton.Caption := 'Font:' + ' ' + ViewData.TextFontN + ' ' +
      IntToStr(ViewData.TextFontSz);
    UpdateCoordText;
  end;
end;

procedure TCoordsForm.cbShowCoordsClick(Sender: TObject);
begin
  FormPlotStars.XCoordsCube.Visible := cbShowCoords.Checked;
  FormPlotStars.YCoordsCube.Visible := cbShowCoords.Checked;
  FormPlotStars.ZCoordsCube.Visible := cbShowCoords.Checked;
  if Active then
  begin
    UpdateCoordText;
    ViewData.TextVisible := cbShowCoords.Checked;
  end;
end;

procedure TCoordsForm.xColorBtnClick(Sender: TObject);
begin
  ColorDialog.Color := ViewData.xTextColor;
  if ColorDialog.Execute then
  begin
    ViewData.xTextColor := ColorDialog.Color;
    UpdateCoordText;
    EvaluateForm.DoEvaluate;
  end;
end;

procedure TCoordsForm.cbXmaxYClick(Sender: TObject);
begin
  ViewData.xPosYMax := cbXmaxY.Checked;
  UpdateCoordText;
end;

procedure TCoordsForm.cbXmaxZClick(Sender: TObject);
begin
  ViewData.xPosZMax := cbXmaxZ.Checked;
  UpdateCoordText;
end;

procedure TCoordsForm.yColorBtnClick(Sender: TObject);
begin
  ColorDialog.Color := ViewData.yTextColor;
  if ColorDialog.Execute then
  begin
    ViewData.yTextColor := ColorDialog.Color;
    UpdateCoordText;
    EvaluateForm.DoEvaluate;
  end;
end;

procedure TCoordsForm.cbYmaxXClick(Sender: TObject);
begin
  ViewData.yPosXMax := cbYmaxX.Checked;
  UpdateCoordText;
end;

procedure TCoordsForm.cbYmaxZClick(Sender: TObject);
begin
  ViewData.yPosZMax := cbYmaxZ.Checked;
  UpdateCoordText;
end;

procedure TCoordsForm.zColorBtnClick(Sender: TObject);
begin
  ColorDialog.Color := ViewData.zTextColor;
  if ColorDialog.Execute then
  begin
    ViewData.zTextColor := ColorDialog.Color;
    UpdateCoordText;
  end;
end;

procedure TCoordsForm.cbZmaxXClick(Sender: TObject);
begin
  ViewData.zPosXMax := cbZmaxX.Checked;
  UpdateCoordText;
end;

procedure TCoordsForm.cbZmaxYClick(Sender: TObject);
begin
  ViewData.zPosYMax := cbZmaxY.Checked;
  UpdateCoordText;
end;

end.
