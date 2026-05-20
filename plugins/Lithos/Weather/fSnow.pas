unit fSnow;

interface

uses
  System.Classes,
  Vcl.Forms,
  System.Types,
  Vcl.Dialogs,
  System.SysUtils,
  Vcl.ExtCtrls,
  Vcl.Controls,
  Vcl.StdCtrls,

  GLS.PersistentClasses,
  Stage.VectorTypes,
  GLS.Scene,
  GLS.Objects,
  GLS.Particles,
  GLS.Cadencer,
  GLS.Behaviours,
  Stage.VectorGeometry,
  GLS.SceneViewer,
  GLS.FileTGA,
  GLS.SkyDome,
  GLS.Texture,
  GLS.Coordinates,
  GLS.BaseClasses,
  GLS.Material;

type
  TFormSnow = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    GLParticles1: TGLParticles;
    GLCadencer1: TGLCadencer;
    Timer1: TTimer;
    GLDummyCube1: TGLDummyCube;
    Timer2: TTimer;
    GLSphere1: TGLSphere;
    procedure GLParticles1ActivateParticle(Sender: TObject;
      particle: TGLBaseSceneObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Timer2Timer(Sender: TObject);
  private
    procedure SSpriteProgress(Sender: TObject;
      const deltaTime, newTime: Double);
  public
  end;

type
  // Let's create simple class to hold data for particles movement
  TSpriteHolder = class(TObject)
  public
    amp, kof: real;
    initalPosx, initalPosz: real;
    speed: real;
  end;

var
  FormSnow: TFormSnow;
  SSprite: TGLSprite;

//====================================
implementation

{$R *.DFM}

procedure TFormSnow.FormCreate(Sender: TObject);
begin
  // if we don't do this, our random won't look like random
  Randomize;
  SSprite := TGLSprite(GLParticles1.AddNewChild(TGLSprite));
  SSprite.Material.Texture.Image.LoadFromFile('Flare1.bmp');
  SSprite.Material.BlendingMode := bmAdditive;
  SSprite.Material.Texture.Disabled := False;
  SSprite.OnProgress := SSpriteProgress;
end;

procedure TFormSnow.SSpriteProgress(Sender: TObject;
  const deltaTime, newTime: Double);
var
  LifeTime: Double;
  tempholder: TSpriteHolder;
begin
  with TGLSprite(Sender) do
  begin
    // calculate for how long we've been living
    LifeTime := (newTime - TagFloat);
    TempHolder := TSpriteHolder(TGLSprite(Sender).TagObject);
    Position.Y := Position.Y - (deltaTime / 2) * tempholder.speed;
    Position.X := TempHolder.initalPosx - (TempHolder.amp / 2) +
      (tempholder.amp / 2 * sin(LifeTime));
    Position.Z := TempHolder.initalPosz - (TempHolder.amp / 2) +
      (TempHolder.amp / 2 * cos(LifeTime));
    if LifeTime > 25 then
    // old particle to kill
    begin
      FormSnow.GLParticles1.KillParticle(TGLSprite(Sender))
    end
    // We are happy because actually we don't destroy anything
    // (fragment memory and all bad stuff)
    // rather than reusing free particles from pool
    else
    begin
      Material.FrontProperties.Diffuse.Alpha := (24 - LifeTime) / 24
    end;
  end;
end;

procedure TFormSnow.GLParticles1ActivateParticle(Sender: TObject;
  particle: TGLBaseSceneObject);
begin
  // this event is called when a particle is activated,
  // ie. just before it will be rendered
  with TGLSprite(particle) do
  begin
    with Material.FrontProperties do
    begin
      // we pick a random color
      Emission.Color := PointMake(1, 1, 1);
      // random color
///      Emission.Color := PointMake(Random, Random, Random);
      // our halo starts transparent
      Diffuse.Alpha := 1;
    end;
    // this is our "birth time"
    TagFloat := GLCadencer1.CurrentTime;
  end;
end;

var
  mx, my: Integer;

procedure TFormSnow.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

procedure TFormSnow.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssLeft in Shift then
  begin
    GLCamera1.MoveAroundTarget(my - Y, mx - X)
  end;
  mx := X;
  my := Y;
end;

procedure TFormSnow.Timer1Timer(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 6 do
  begin
    with TGLSprite(GLParticles1.CreateParticle) do
    begin
      Position.X := GLDummyCube1.Position.X + (GLDummyCube1.CubeSize / 2) *
        random - (GLDummyCube1.CubeSize / 4);
      Position.Z := GLDummyCube1.Position.Z + (GLDummyCube1.CubeSize / 2) *
        random - (GLDummyCube1.CubeSize / 4);

      // Snow should fall from the top of the cube
      Position.Y := GLDummyCube1.Position.Y + (GLDummyCube1.CubeSize / 4);;

      Width := random * 0.2;
      height := Width;

      // We need to store some additional info
      TagObject := TSpriteHolder.create;
      (TagObject as TSpriteHolder).amp := random;
      (TagObject as TSpriteHolder).kof := random;
      (TagObject as TSpriteHolder).initalPosx := Position.X;
      (TagObject as TSpriteHolder).initalPosz := Position.Z;
      (TagObject as TSpriteHolder).speed := random;
    end;

  end;
end;

procedure TFormSnow.Timer2Timer(Sender: TObject);
begin

  // infos for the user
  Caption := Format('%d particles, %.1f FPS', [GLParticles1.Count - 1,
    GLSceneViewer1.FramesPerSecond]);
  GLSceneViewer1.ResetPerformanceMonitor;
end;

procedure TFormSnow.FormResize(Sender: TObject);
begin
  // change focal so the view will shrink and not just get clipped
  GLCamera1.FocalLength := 50 * Width / 280;
end;

procedure TFormSnow.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  with GLSceneViewer1 do
  begin
    if PtInRect(ClientRect, ScreenToClient(MousePos)) then
    begin
      GLCamera1.SceneScale := GLCamera1.SceneScale * (1000 - WheelDelta) / 1000;
      Handled := true;
    end
  end;
end;

end.
