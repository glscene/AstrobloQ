unit LUX.GPU.OpenGL.Render_;

interface

uses
  System.UITypes,
  Winapi.Windows,
  Winapi.OpenGL,
  Winapi.OpenGLext,
  LUX,
  LUX.M4,
  LUX.GPU.OpenGL.Atom.Buffer.UniBuf,
  LUX.GPU.OpenGL.Atom.Framer,
  LUX.GPU.OpenGL.Camera;

type
  TGL_Render = class
  private
  protected
    _Frame1: TGLFramer1;
    _FrameN: TGLFramerN;
    _Camera: TGLCamera;
    _SizeX: Integer;
    _SizeY: Integer;
    _Viewer: TGLUniBuf<TSingleM4>;
    _Color: TAlphaColorF;
    /// // アクセス
    function GetSizeX: Integer;
    procedure SetSizeX(const SizeX_: Integer);
    function GetSizeY: Integer;
    procedure SetSizeY(const SizeY_: Integer);
    function GetColor: TAlphaColorF;
    procedure SetColor(const Color_: TAlphaColorF);
    procedure FitWindow;
  public
    constructor Create;
    destructor Destroy; override;
    property Camera: TGLCamera read _Camera write _Camera;
    property SizeX: Integer read GetSizeX write SetSizeX;
    property SizeY: Integer read GetSizeY write SetSizeY;
    property Color: TAlphaColorF read GetColor write SetColor;
    procedure Render;
  end;

implementation //=========================================

function TGL_Render.GetSizeX: Integer;
begin
  Result := _SizeX;
end;

procedure TGL_Render.SetSizeX(const SizeX_: Integer);
begin
  _SizeX := SizeX_;

  _Frame1.SizeX := _SizeX;
  _FrameN.SizeX := _SizeX;

  FitWindow;
end;

function TGL_Render.GetSizeY: Integer;
begin
  Result := _SizeY;
end;

procedure TGL_Render.SetSizeY(const SizeY_: Integer);
begin
  _SizeY := SizeY_;

  _Frame1.SizeY := _SizeY;
  _FrameN.SizeY := _SizeY;

  FitWindow;
end;

// ------------------------------------------------------------------------------

function TGL_Render.GetColor: TAlphaColorF;
begin
  Result := _Color;
end;

procedure TGL_Render.SetColor(const Color_: TAlphaColorF);
begin
  _Color := Color_;
end;

procedure TGL_Render.FitWindow;
begin
  if _SizeY < _SizeX then
    _Viewer[0] := TSingleM4.Scale(_SizeY / _SizeX, 1, 1)
  else if _SizeX < _SizeY then
    _Viewer[0] := TSingleM4.Scale(1, _SizeX / _SizeY, 1)
  else
    _Viewer[0] := TSingleM4.Identity;
end;

constructor TGL_Render.Create;
begin
  inherited;

  _Frame1 := TGLFramer1.Create;
  _FrameN := TGLFramerN.Create;

  _Viewer := TGLUniBuf<TSingleM4>.Create(GL_DYNAMIC_DRAW);

  SizeX := 1920;
  SizeY := 1080;

  _Color := TAlphaColorF.Create(0, 0, 0, 1);
end;

destructor TGL_Render.Destroy;
begin
  _Viewer.Free;

  _Frame1.Free;
  _FrameN.Free;

  inherited;
end;

procedure TGL_Render.Render;
begin
  _FrameN.Bind;

  with _Color do
    glClearColor(R, G, B, A);

  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

  _Viewer.Use(0 { BinP } );

  glViewport(0, 0, _SizeX, _SizeY);

  if Assigned(_Camera) then
    _Camera.Render;

  _Viewer.Unuse(0 { BinP } );

  glFlush;

  _FrameN.Unbind;
  _FrameN.DrawToFramer(_Frame1);
end;


initialization //==============================================================

finalization

end.
