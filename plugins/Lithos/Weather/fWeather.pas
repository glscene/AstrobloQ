unit fWeather;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  GLS.Cadencer,
  GLS.Scene,
  GLS.Objects,
  Stage.AsyncTimer,
  GLS.SceneViewer,
  GLS.GeomObjects,
  GLS.Texture,
  GLS.HUDObjects,
  Stage.VectorTypes,
  GLS.SpaceText,
  Stage.VectorGeometry,
  GLS.ParticleFX,
  GLS.PerlinPFX,
  Stage.Keyboard,
  GLS.BitmapFont,
  GLS.WindowsFont,
  Stage.Coordinates,
  Stage.BaseClasses;

type
  TForm1 = class(TForm)
    Scene: TGLScene;
    SceneViewer: TGLSceneViewer;
    Cadencer: TGLCadencer;
    GLCamera1: TGLCamera;
    GLParticleFXRenderer1: TGLParticleFXRenderer;
    AsyncTimer1: TGLAsyncTimer;
    GLDummyCube1: TGLDummyCube;
    GLLightSource1: TGLLightSource;
    txt_gl: TGLSpaceText;
    txt_scene: TGLSpaceText;
    PointLightPFXManager1: TGLPointLightPFXManager;
    PointLightPFXManager2: TGLPointLightPFXManager;
    DC_emitter: TGLDummyCube;
    GLPerlinPFXManager1: TGLPerlinPFXManager;
    GLHUDText1: TGLHUDText;
    GLWindowsBitmapFont1: TGLWindowsBitmapFont;
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure CadencerProgress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure SceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SceneViewerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure CharType(ntype: Integer);
  end;

var
  Form1: TForm1;
  _type: Integer = 0; // effect type - rain/snow/fog
  _shift: Boolean = false; // indicator of any mouse button pressing
  _mx: Integer; // prev mouse button
  _zoom: single = 0; //

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  GLHUDText1.Text := '1 rain'#13 + '2 snow'#13 + '3 fog';
  CharType(0);
end;

procedure TForm1.CharType(ntype: Integer);
var
  a: Integer;
begin
  _type := ntype; // remember selected effect
  for a := 0 to 2 do
    // switch off unnecessary effects and switch on selected one
    with TGLSourcePFXEffect(GLDummyCube1.Effects[a]) do
      if _type = a then
        Enabled := true
      else
        Enabled := false;
end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  _zoom := WheelDelta / 120; // remember position of mouse wheel
end;

procedure TForm1.CadencerProgress(Sender: TObject;
  const deltaTime, newTime: Double);
begin
  if _shift then
    GLDummyCube1.Turn(_mx - mouse.CursorPos.X) // rotating camera by mouse
  else
    GLDummyCube1.Turn(deltaTime * 10); // othrwise auto rotation

  _mx := mouse.CursorPos.X; // remember coordinate

  GLCamera1.AdjustDistanceToTarget(Power(1.1, _zoom));
  _zoom := 0;

  if IsKeyDown('1') then
    CharType(0); // rain
  if IsKeyDown('2') then
    CharType(1); // snow
  if IsKeyDown('3') then
    CharType(2); // fog
  if IsKeyDown(VK_ESCAPE) then
    close;

  case _type of
    0: // adjusting "rain" to camera rotation
      with TGLSourcePFXEffect(GLDummyCube1.Effects[0]) do
      begin
        // emitter coordinates
        InitialPosition.AsVector := DC_emitter.AbsolutePosition;
        // direction to centre
        InitialVelocity.AsVector :=
          VectorScale
          (VectorNormalize(VectorNegate(DC_emitter.AbsolutePosition)), 10);
        // moving particles to centre
        PointLightPFXManager1.Rotation :=
          -arctan(InitialVelocity.X / InitialVelocity.Y);
      end;
    1: // adjusting "snow" to camera rotation
      with TGLSourcePFXEffect(GLDummyCube1.Effects[1]) do
      begin
        // emitter coordinates
        InitialPosition.AsVector := DC_emitter.AbsolutePosition;
        // direction to centre
        InitialVelocity.AsVector :=
          VectorScale
          (VectorNormalize(VectorNegate(DC_emitter.AbsolutePosition)), 4);
      end;
  end;
end;

procedure TForm1.AsyncTimer1Timer(Sender: TObject);
begin
  Form1.Caption := SceneViewer.FramesPerSecondText(2);   // output FPS
  SceneViewer.ResetPerformanceMonitor;
end;

procedure TForm1.SceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  _shift := true; // pressed button
end;

procedure TForm1.SceneViewerMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  _shift := false; // unpressed button
end;

end.
