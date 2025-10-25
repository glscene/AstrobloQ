unit fdxEarthMars;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Viewport3D,
  System.Math.Vectors, FMX.MaterialSources, FMX.Objects3D, FMX.Controls3D,
  FMX.Ani;

const
  ZOOM_STEP = 2;
  CAMERA_MAX_Z = -2;
  CAMERA_MIN_Z = -102;

type
  TfrmEarthMars = class(TForm)
    Viewport3D1: TViewport3D;
    DummyScene: TDummy;
    SphereEarth: TSphere;
    SphereMars: TSphere;
    TextureMaterialSourceEarth: TTextureMaterialSource;
    TextureMaterialSourceMars: TTextureMaterialSource;
    FloatAnimationSphereEarthRotAngleY: TFloatAnimation;
    DummyXY: TDummy;
    CameraZ: TCamera;
    procedure SphereEarthClick(Sender: TObject);
    procedure Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Viewport3D1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; var Handled: Boolean);
  private
    FDown: TPointF;
  public
    { Public declarations }
  end;

var
  frmEarthMars: TfrmEarthMars;

implementation

{$R *.fmx}

procedure TfrmEarthMars.SphereEarthClick(Sender: TObject);
begin
  if SphereEarth.Position.Z > -1 then
    TAnimator.AnimateFloat(SphereEarth, 'Position.Z', -2)
  else
    TAnimator.AnimateFloat(SphereEarth, 'Position.Z', 0);
end;

procedure TfrmEarthMars.Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  FDown := PointF(X, Y);
end;

procedure TfrmEarthMars.Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  if ssLeft in Shift then
  begin
    DummyScene.RotationAngle.X := DummyScene.RotationAngle.X - ((Y - FDown.Y) * 0.3);
    DummyScene.RotationAngle.Y := DummyScene.RotationAngle.Y - ((X - FDown.X) * 0.3);
    FDown := PointF(X, Y);
  end;
end;

procedure TfrmEarthMars.Viewport3D1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; var Handled: Boolean);
var newZ: Single;
begin
  if WheelDelta > 0 then
    newZ := CameraZ.Position.Z + ZOOM_STEP
  else
    newZ := CameraZ.Position.Z - ZOOM_STEP;

  if (newZ < CAMERA_MAX_Z) and (newZ > CAMERA_MIN_Z) then
    CameraZ.Position.Z := newZ;
end;

end.
