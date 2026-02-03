unit LUX.GPU.OpenGL.Atom.Buffer.UniBuf;

interface

uses
  Winapi.OpenGL,
  Winapi.OpenGLext,
  LUX,
  LUX.GPU.OpenGL.Atom,
  LUX.GPU.OpenGL.Atom.Buffer;

type
  IGLUniBuf = interface(IGLBuffer)
    ['{923ECB97-7686-4B53-A9FC-AB4365C7CC4B}']
    procedure Use(const BinP_: GLuint); overload;
    procedure Use(const BinP_: GLuint; const Offs_: Integer;
      const Size_: Integer = 1); overload;
    procedure Unuse(const BinP_: GLuint);
  end;

  // -------------------------------------------------------------------------

  TGLUniBuf<_TItem_: record > = class
    (TGLBuffer<_TItem_, TGLBufferData<_TItem_>>, IGLUniBuf)
  private
  protected
    function GetKind: GLenum; override;
    function InitAlign: GLint; override;
  public
    procedure Use(const BinP_: GLuint); overload;
    procedure Use(const BinP_: GLuint; const Offs_: Integer;
      const Size_: Integer = 1); overload;
    procedure Unuse(const BinP_: GLuint);
  end;

implementation //-------------------------------------------------------------

function TGLUniBuf<_TItem_>.GetKind: GLenum;
begin
  Result := GL_UNIFORM_BUFFER;
end;

function TGLUniBuf<_TItem_>.InitAlign: GLint;
begin
  // glGetIntegerv( GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT, @Result );

  Result := 1 { Byte };
end;

procedure TGLUniBuf<_TItem_>.Use(const BinP_: GLuint);
begin
  glBindBufferBase(GetKind, BinP_, _ID);
end;

procedure TGLUniBuf<_TItem_>.Use(const BinP_: GLuint; const Offs_: Integer;
  const Size_: Integer = 1);
begin
  glBindBufferRange(GetKind, BinP_, _ID, _Strid * Offs_, _Strid * Size_);
end;

procedure TGLUniBuf<_TItem_>.Unuse(const BinP_: GLuint);
begin
  glBindBufferBase(GetKind, BinP_, 0);
end;

initialization //===================== 

finalization

end.
