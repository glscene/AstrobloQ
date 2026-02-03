unit LUX.FMX.Forms;

interface

uses
  System.Types,
  System.UITypes,
  System.Classes,
  FMX.Types,
  FMX.Forms,
  FMX.Graphics,
  LUX,
  LUX.FMX.Pratform;

type
  HCommonCustomForm = class helper for TCommonCustomForm
  private
  protected
  public
    function MousePos: TPointF;
  end;

  HCustomForm = class helper for TCustomForm
  private
  protected
  public
    function MakeScreenShot: TBitmap;
  end;

  TLuxCommonCustomForm = class(FMX.Forms.TCommonCustomForm)
  private
  protected
    _OnMouseClick: TMouseEvent;
  public
    property OnMouseClick: TMouseEvent read _OnMouseClick write _OnMouseClick;
    procedure MouseUp(Button_: TMouseButton; Shift_: TShiftState;
      X_, Y_: Single; DoClick_: Boolean = True); override;
  end;

implementation //=========================================

function HCommonCustomForm.MousePos: TPointF;
begin
  Result := ScreenToClient(Screen.MousePos);
end;

function HCustomForm.MakeScreenShot: TBitmap;
begin
  Result := TBitmap.Create;

  with Result do
  begin
    BitmapScale := GetDisplayScale;

    SetSize(Round(BitmapScale * ClientWidth),
      Round(BitmapScale * ClientHeight));

    PaintTo(Canvas);
  end;
end;

procedure TLuxCommonCustomForm.MouseUp(Button_: TMouseButton;
  Shift_: TShiftState; X_, Y_: Single; DoClick_: Boolean = True);
begin
  if Assigned(_OnMouseClick) and DoClick_ then
    _OnMouseClick(Self, Button_, Shift_, X_, Y_);

  inherited;
end;

initialization //===================== 

finalization // ----------------------------------------------------------------

end.
