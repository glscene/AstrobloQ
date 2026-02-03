unit LUX.GPU.OpenGL.Camera;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Math,

  Winapi.OpenGL,
  Winapi.OpenGLext,
  LUX,
  LUX.D2,
  LUX.D3,
  LUX.M4, // LUX.D4x4,
  LUX.GPU.OpenGL,
  LUX.GPU.OpenGL.Atom.Buffer.UniBuf,
  LUX.GPU.OpenGL.Scener;

type

  TGLCamera = class(TGLObject, IGLCamera)
  private const
    _N: Single = 0.1;

  const
    _F: Single = 1000;
  protected
    _Proj: TGLUniBuf<TSingleM4>;
    _Offs: TSingle2D;
    /// // アクセス
    function GetProj: TSingleM4; virtual;
    procedure SetProj(const Proj_: TSingleM4); virtual;
    function GetOffs: TSingle2D; virtual;
    procedure SetOffs(const Offs_: TSingle2D); virtual;
    procedure CalcProj; virtual; abstract;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Proj: TSingleM4 read GetProj write SetProj;
    property Offs: TSingle2D read GetOffs write SetOffs;
    procedure HitRay(const AbsoRay_: TSingleRay3D; var Len_: Single;
      var Obj_: TGLObject); override;
    procedure Render;
  end;

  TGLCameraOrth = class(TGLCamera)
  private
  protected
    _Size: Single;
    function GetSize: Single; virtual;
    procedure SetSize(const Size_: Single); virtual;
    procedure CalcProj; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Size: Single read GetSize write SetSize;
  end;

  TGLCameraPers = class(TGLCamera)
  private
  protected
    _Angl: Single;
    function GetAngl: Single; virtual;
    procedure SetAngl(const Angl_: Single); virtual;
    procedure CalcProj; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Angl: Single read GetAngl write SetAngl;
  end;


implementation //-------------------------------------------------------------

//   

//   

// TGLCamera

//   private

//   protected

/// ///////////////////////////////////////////////////////////////

function TGLCamera.GetProj: TSingleM4;
begin
  Result := _Proj[0];
end;

procedure TGLCamera.SetProj(const Proj_: TSingleM4);
begin
  _Proj[0] := Proj_;
end;

// ------------------------------------------------------------------------------

function TGLCamera.GetOffs: TSingle2D;
begin
  Result := _Offs;
end;

procedure TGLCamera.SetOffs(const Offs_: TSingle2D);
begin
  _Offs := Offs_;

  CalcProj;
end;

//  & public

constructor TGLCamera.Create;
begin
  inherited;

  _Proj := TGLUniBuf<TSingleM4>.Create(GL_STATIC_DRAW);

  _Offs := TSingle2D.Create(0, 0);
end;

destructor TGLCamera.Destroy;
begin
  _Proj.Free;

  inherited;
end;

/// ///////////////////////////////////////////////////////////////

procedure TGLCamera.HitRay(const AbsoRay_: TSingleRay3D; var Len_: Single;
  var Obj_: TGLObject);
var
  I: Integer;
begin
  if _Visible and _HitTest then
  begin
    for I := 0 to ChildsN - 1 do
      Childs[I].HitRay(AbsoRay_, Len_, Obj_);
  end;
end;

procedure TGLCamera.Render;
begin
  _Proj.Use(1 { BinP } );
  _AbsoPose.Use(2 { BinP } );

  Scener.Draw;
end;

// TGLCameraOrth

//   private

//   protected

/// ///////////////////////////////////////////////////////////////

function TGLCameraOrth.GetSize: Single;
begin
  Result := _Size;
end;

procedure TGLCameraOrth.SetSize(const Size_: Single);
begin
  _Size := Size_;
  CalcProj;
end;

/// ///////////////////////////////////////////////////////////////

procedure TGLCameraOrth.CalcProj;
var
  S: Single;
  C: TSingle2D;
begin
  S := _Size / 2;

  C := S * _Offs;

  Proj := TSingleM4.ProjOrth(C.X - S, C.X + S, C.Y - S, C.Y + S, _N, _F);
end;

//  & public

constructor TGLCameraOrth.Create;
begin
  inherited;

  Size := 10;
end;

destructor TGLCameraOrth.Destroy;
begin

  inherited;
end;

// TGLCameraPers

//   private

//   protected

/// ///////////////////////////////////////////////////////////////

function TGLCameraPers.GetAngl: Single;
begin
  Result := _Angl;
end;

procedure TGLCameraPers.SetAngl(const Angl_: Single);
begin
  _Angl := Angl_;
  CalcProj;
end;

/// ///////////////////////////////////////////////////////////////

procedure TGLCameraPers.CalcProj;
var
  S: Single;
  C: TSingle2D;
begin
  S := _N * Tan(_Angl / 2);

  C := S * _Offs;

  Proj := TSingleM4.ProjPers(C.X - S, C.X + S, C.Y - S, C.Y + S, _N, _F);
end;

//  & public

constructor TGLCameraPers.Create;
begin
  inherited;

  Angl := DegToRad(60 { ° } );
end;

destructor TGLCameraPers.Destroy;
begin

  inherited;
end;

//   

//  

initialization //  

finalization //  

end. 
