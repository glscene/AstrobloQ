unit LUX.GPU.OpenGL.Atom;

interface

uses
  System.Classes,
  System.SysUtils,
  Winapi.OpenGL,
  Winapi.OpenGLext,
  LUX;

type
  IGLAtomer = interface;
  IGLProgra = interface;
  IGLShader = interface;

  TGLAtomer = class;
  TGLVarray = class;

  IGLAtomer = interface
    ['{7F595632-258C-41E9-B9FA-E71B18A2335A}']
    function GetID: GLuint;
    property ID: GLuint read GetID;
  end;

  // -------------------------------------------------------------------------

  TGLAtomer = class(TInterfacedBase, IGLAtomer)
  private
  protected
    _ID: GLuint;
    function GetID: GLuint;
  public
    property ID: GLuint read GetID;
  end;

  TGLVarray = class(TGLAtomer)
  private
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure Bind;
    procedure Unbind;
  end;

  IGLShader = interface(IGLAtomer)
    ['{1E06B97A-6947-4960-8CD7-8FAD5CBCC546}']
    function GetKind: GLenum;
    function GetSource: TStringList;
    function GetStatus: Boolean;
    function GetErrors: TStringList;
    property Kind: GLenum read GetKind;
    property Source: TStringList read GetSource;
    property Status: Boolean read GetStatus;
    property Errors: TStringList read GetErrors;
    procedure Attach(const Progra_: IGLProgra);
    procedure Detach(const Progra_: IGLProgra);
  end;

  IGLProgra = interface(IGLAtomer)
    ['{0B2FDEDE-30D3-439B-AC76-E61F9E028CD0}']
    { protected }
    function GetStatus: Boolean;
    function GetErrors: TStringList;
    function GetOnLinked: TProc;
    procedure SetOnLinked(const OnLinked_: TProc);
    { public }
    property Status: Boolean read GetStatus;
    property Errors: TStringList read GetErrors;
    property OnLinked: TProc read GetOnLinked write SetOnLinked;
    function GetAttribLocation(const Name_: String): GLuint;
    function GetUniformLocation(const Name_: String): GLuint;
    function GetProgramResourceLocation(const Kind_: GLenum;
      const Name_: String): GLuint;
    function GetUniformBlockIndex(const Name_: String): GLuint;
    function GetProgramResourceIndex(const Kind_: GLenum;
      const Name_: String): GLuint;
    procedure BindFragDataLocation(const BinP_: GLuint; const Name_: String);
    procedure Attach(const Shader_: IGLShader);
    procedure Detach(const Shader_: IGLShader);
    procedure Link;
    procedure Use;
    procedure Unuse;
  end;

implementation //-------------------------------------------------------------

function TGLAtomer.GetID: GLuint;
begin
  Result := _ID;
end;

constructor TGLVarray.Create;
begin
  inherited;

  glGenVertexArrays(1, @_ID);
end;

destructor TGLVarray.Destroy;
begin
  glDeleteVertexArrays(1, @_ID);

  inherited;
end;

procedure TGLVarray.Bind;
begin
  glBindVertexArray(_ID);
end;

procedure TGLVarray.Unbind;
begin
  glBindVertexArray(0);
end;

initialization //-------------------------------------------------------------

finalization //----------------------------------------------------------------

end.
