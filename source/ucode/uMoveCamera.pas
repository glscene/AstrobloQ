unit uMoveCamera;

(*
  Коллекция объектов графики OpenGL
*)

interface

uses
  Winapi.OpenGL,
  System.Math,

  GLScene.VectorTypes,
  GLScene.VectorGeometry,
  GLS.VectorFileObjects,
  GLS.Scene,
  GLS.Coordinates,

  uSkyBodies;

type
  TGLVec = array [0 .. 3] of GLFloat;
  TGLSpeedMatrix = array [0 .. 15] of GLFloat;

  // Перемещение камеры с помощью матрицы трансформации
  TMovingCamera = class(tObject)
  private
  protected
  public
    ux, uy, uz: single; // U: Горизонтальный вектор (слева направо, мировая система)
    vx, vy, vz: single; // V: Вертикальный вектор (снизу вверх, мировая система)
    nx, ny, nz: single; // N: Вектор нормали (в экран, мировая система)
    x, y, z: single; // Координаты, мировая система
    ru, rv, rn: single; // Угловая скорость; [deg/sec] (система камеры)
    Speed: single; // Скорость (along S) [1/sec]
    sx, sy, sz: single; // Вектор скорости (умноженный на Speed, мировая система)
    SpeedMatrix: TGLSpeedMatrix;
    SceneObject: TGLBaseSceneObject;
    procedure Accelerate(const au, av, an: single); // Изменение вектора скорости
    procedure Apply; // Поворот и перенос glWorld
    procedure ApplyFrontView; // Взгляд в направлении движения
    constructor Create;
    destructor Destroy; override;
    procedure GoThatWay; // Задание вектора скорости в направлении луча зрения
    procedure Move(const du, dv, dn: single);
    // Трансляция в координатную систему камеры
    procedure Pitch(const Angle: single); // U поворот
    procedure ResetAttitude;
    procedure Roll(const Angle: single); // N поворот
    procedure ComputeSpeed;
    procedure Translate(const dx, dy, dz: single);
    // Трансляция в мировую систему координат
    procedure UpdateAll(const Time: double);
    // Вычисление новых координат и углов
    procedure UpdateAttitude(const Time: double); // Вычисление новых углов
    procedure UpdatePosition(const Time: double); // Compute new coordinates
    procedure Yaw(const Angle: single); // V rotation
  end; // record

  // Реализация вибрации и гироскопических эффектов
  TRealMovingCamera = class(TMovingCamera)
  protected
    Vibx, Viby, Vibz: single;
  public
    InU, InV, InN: single; // Масса инерции вдоль трёх осей
    procedure Apply;
    procedure GyroPitch(const Moment: single); // U rotation
    procedure GyroRoll(const Moment: single); // N rotation
    procedure Vibrate(const Vibration: single);
    procedure GyroYaw(const Moment: single); // V rotation
  end; // class

// ==================================================================
implementation
// ==================================================================


(* ***********************************************************************
  // CAMERA OBJECT
  *********************************************************************** *)
procedure TMovingCamera.Accelerate(const au, av, an: single);
begin
  sx := sx + au * ux + av * vx + an * nx;
  sy := sy + au * uy + av * vy + an * ny;
  sz := sz + au * uz + av * vz + an * nz;
end;

// dx, dy and dz must have been computed beforehand
procedure TMovingCamera.Apply;
begin
  SceneObject.Position.SetVector(x, y, z);
  SceneObject.Direction.SetVector(nx, ny, nz);
  SceneObject.Up.SetVector(vx, vy, vz);
end;

// Z directed along the speed vector, X and Y are in the ship's horizontal plane
procedure TMovingCamera.ApplyFrontView;
var
  { sx1,sy1,sz1, } s: single;
begin
  s := 1 / Speed;
  SpeedMatrix[0] := ux;
  SpeedMatrix[4] := vx;
  SpeedMatrix[8] := sx * s;
  SpeedMatrix[12] := x;
  SpeedMatrix[1] := uy;
  SpeedMatrix[5] := vy;
  SpeedMatrix[9] := sy * s;
  SpeedMatrix[13] := y;
  SpeedMatrix[2] := uz;
  SpeedMatrix[6] := vz;
  SpeedMatrix[10] := sz * s;
  SpeedMatrix[14] := z;
  SpeedMatrix[3] := 0;
  SpeedMatrix[7] := 0;
  SpeedMatrix[11] := 0;
  SpeedMatrix[15] := 1;

  glMultMatrixf(@SpeedMatrix);
end;

procedure TMovingCamera.ComputeSpeed;
begin
  Speed := sqrt(sqr(sx) + sqr(sy) + sqr(sz));
end;

constructor TMovingCamera.Create;
begin
  inherited Create;
  ResetAttitude;
end;

procedure TMovingCamera.GoThatWay;
begin
  sx := nx * Speed;
  sy := ny * Speed;
  sz := nz * Speed;
end;

//----------------------------------------------------------------
procedure TMovingCamera.Move(const du, dv, dn: single);
begin
  x := x + (du * ux + dv * vx + dn * nx);
  y := y + (du * uy + dv * vy + dn * ny);
  z := z + (du * uz + dv * vz + dn * nz);
end;

//----------------------------------------------------------------
procedure TMovingCamera.Pitch(const Angle: single);
var
  tempx, tempy, tempz: single;
  cosine, sine: double;
begin
  tempx := vx;
  tempy := vy;
  tempz := vz;
  SinCosine(DegToRadian(Angle), sine, cosine);

  vx := tempx * cosine - nx * sine;
  vy := tempy * cosine - ny * sine;
  vz := tempz * cosine - nz * sine;
  nx := tempx * sine + nx * cosine;
  ny := tempy * sine + ny * cosine;
  nz := tempz * sine + nz * cosine;
end;

//----------------------------------------------------------------
procedure TMovingCamera.ResetAttitude;
begin
  ux := 1;
  uy := 0;
  uz := 0;
  vx := 0;
  vy := 1;
  vz := 0;
  nx := 0;
  ny := 0;
  nz := -1;
end;

//----------------------------------------------------------------
procedure TMovingCamera.Roll(const Angle: single);
var
  tempx, tempy, tempz: single;
  cosine, sine: double;
begin
  tempx := ux;
  tempy := uy;
  tempz := uz;
  SinCosine(DegToRadian(Angle), sine, cosine);

  ux := tempx * cosine - vx * sine;
  uy := tempy * cosine - vy * sine;
  uz := tempz * cosine - vz * sine;
  vx := tempx * sine + vx * cosine;
  vy := tempy * sine + vy * cosine;
  vz := tempz * sine + vz * cosine;
end;

//----------------------------------------------------------------
procedure TMovingCamera.Translate(const dx, dy, dz: single);
begin
  x := x + dx;
  y := y + dy;
  z := z + dz;
end;

//----------------------------------------------------------------
procedure TMovingCamera.UpdateAll(const Time: double);
begin
  UpdatePosition(Time);
  UpdateAttitude(Time);
end;

procedure TMovingCamera.UpdateAttitude(const Time: double);
begin
  Pitch(ru * Time);
  Yaw(rv * Time);
  Roll(rn * Time);
end;

//----------------------------------------------------------------
procedure TMovingCamera.UpdatePosition(const Time: double);
begin
  Translate(sx * Time, sy * Time, sz * Time);
end;

//----------------------------------------------------------------
procedure TMovingCamera.Yaw(const Angle: single);
var
  tempx, tempy, tempz: single;
  cosine, sine: double;
begin
  tempx := ux;
  tempy := uy;
  tempz := uz;
  SinCosine(DegToRadian(Angle), sine, cosine);

  ux := tempx * cosine + nx * sine;
  uy := tempy * cosine + ny * sine;
  uz := tempz * cosine + nz * sine;
  nx := -tempx * sine + nx * cosine;
  ny := -tempy * sine + ny * cosine;
  nz := -tempz * sine + nz * cosine;
end;

//----------------------------------------------------------------
procedure TRealMovingCamera.Apply;
begin
  with SceneObject do
  begin
    Position.x := x + Vibx;
    Position.y := y + Viby;
    Position.z := z + Vibz;
    Direction.SetVector(nx, ny, nz);
    Up.SetVector(vx, vy, vz);
  end; // with
  Vibx := 0;
  Viby := 0;
  Vibz := 0;
end;

// Input axis: U
procedure TRealMovingCamera.GyroPitch(const Moment: single);
var
  dWu, dWv, dWn: single; // Rotation acceleration
  Ini, Ino, Inr: single; // Inertia along input, output and rotor axes
  ri, ro, rr: single; // Rotation speeds on each axis
begin
  Ini := InU;
  ri := DegToRadian(ru);
  // Rotor axis: V, Output axis: N
  Inr := InV;
  rr := DegToRadian(rv);
  Ino := InN;
  ro := DegToRadian(rn);
  dWu := (Moment - (Inr - Ino) * rr * ro) / InU;
  dWn := (-(Ini - Inr) * ri * rr) / InN;
  // Rotor axis: N, Output axis: V
  Inr := InN;
  rr := DegToRadian(rn);
  Ino := InV;
  ro := DegToRadian(rv);
  dWu := dWu + (Moment - (Inr - Ino) * rr * ro) / InU;
  dWv := -(Ini - Inr) * ri * rr / InV;

  ru := ru + RadianToDeg(dWu);
  rv := rv + RadianToDeg(dWv);
  rn := rn + RadianToDeg(dWn);
end;

// Input axis: N
procedure TRealMovingCamera.GyroRoll(const Moment: single);
var
  dWu, dWv, dWn: single; // Rotation acceleration
  Ini, Ino, Inr: single; // Inertia along input, output and rotor axes
  ri, ro, rr: single; // Rotation speeds on each axis
begin
  Ini := InN;
  ri := DegToRadian(rn);
  // Rotor axis: V, Output axis: U
  Inr := InV;
  rr := DegToRadian(rv);
  Ino := InU;
  ro := DegToRadian(ru);
  dWn := (Moment - (Inr - Ino) * rr * ro) / InN;
  dWu := (-(Ini - Inr) * ri * rr) / InU;
  // Rotor axis: U, Output axis: V
  Inr := InU;
  rr := DegToRadian(ru);
  Ino := InV;
  ro := DegToRadian(rv);
  dWn := dWn + (Moment - (Inr - Ino) * rr * ro) / InN;
  dWv := -(Ini - Inr) * ri * rr / InV;

  ru := ru + RadianToDeg(dWu);
  rv := rv + RadianToDeg(dWv);
  rn := rn + RadianToDeg(dWn);
end;

// Input axis: V
procedure TRealMovingCamera.GyroYaw(const Moment: single);
var
  dWu, dWv, dWn: single; // Rotation acceleration
  Ini, Ino, Inr: single; // Inertia along input, output and rotor axes
  ri, ro, rr: single; // Rotation speeds on each axis
begin
  Ini := InV;
  ri := DegToRadian(rv);
  // Rotor axis: U, Output axis: N
  Inr := InU;
  rr := DegToRadian(ru);
  Ino := InN;
  ro := DegToRadian(rn);
  dWv := (Moment - (Inr - Ino) * rr * ro) / InV;
  dWn := (-(Ini - Inr) * ri * rr) / InN;
  // Rotor axis: N, Output axis: U
  Inr := InN;
  rr := DegToRadian(rn);
  Ino := InU;
  ro := DegToRadian(ru);
  dWv := dWv + (Moment - (Inr - Ino) * rr * ro) / InV;
  dWu := -(Ini - Inr) * ri * rr / InU;

  ru := ru + RadianToDeg(dWu);
  rv := rv + RadianToDeg(dWv);
  rn := rn + RadianToDeg(dWn);
end;

//----------------------------------------------------------------
procedure TRealMovingCamera.Vibrate(const Vibration: single);
begin
  Vibx := random * 2 * Vibration - Vibration;
  Viby := random * 2 * Vibration - Vibration;
  Vibz := random * 2 * Vibration - Vibration;
end;

//----------------------------------------------------------------
destructor TMovingCamera.Destroy;
begin
  inherited Destroy;
end;

end.
