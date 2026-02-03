unit LUX.GPU.OpenGL.Atom.Shader;

interface

uses
  Winapi.OpenGL,
  Winapi.OpenGLext,
  System.SysUtils,
  System.Classes,
  System.Types,
  LUX,
  LUX.GPU.OpenGL.Atom;

type
  TGLShader = class(TGLAtomer, IGLShader)
  private
  protected
    _Kind: GLenum;
    _Source: TStringList;
    _Status: Boolean;
    _Errors: TStringList;
    _Progra: IGLProgra;
    _OnCompiled: TProc;
    function GetKind: GLenum;
    function GetSource: TStringList;
    procedure SetSource(Sender_: TObject);
    function GetStatus: Boolean;
    function GetErrors: TStringList;
    procedure Compile(const Source_: AnsiString);
    function glGetStatus: Boolean;
    function glGetErrors: String;
  public
    constructor Create(const Kind_: GLenum);
    destructor Destroy; override;
    property Kind: GLenum read GetKind;
    property Source: TStringList read GetSource;
    property Status: Boolean read GetStatus;
    property Errors: TStringList read GetErrors;
    property OnCompiled: TProc read _OnCompiled write _OnCompiled;
    procedure Attach(const Progra_: IGLProgra);
    procedure Detach(const Progra_: IGLProgra);
    procedure LoadFromResource(const Name_: String);
  end;

  TGLShaderC = class(TGLShader)
  private
  protected
  public
    constructor Create;
  end;

  TGLShaderV = class(TGLShader)
  private
  protected
  public
    constructor Create;
  end;

  TGLShaderG = class(TGLShader)
  private
  protected
  public
    constructor Create;
  end;

  TGLShaderF = class(TGLShader)
  private
  protected
  public
    constructor Create;
  end;

implementation //=========================================

function TGLShader.GetKind: GLenum;
begin
  Result := _Kind;
end;

// ------------------------------------------------------------------------------

function TGLShader.GetSource: TStringList;
begin
  Result := _Source;
end;

procedure TGLShader.SetSource(Sender_: TObject);
begin
  Compile(AnsiString(_Source.Text));

  _Status := glGetStatus;
  _Errors.Text := glGetErrors;

  if Assigned(_OnCompiled) then
    _OnCompiled;

  if Assigned(_Progra) then
    _Progra.Link;
end;

// ------------------------------------------------------------------------------

function TGLShader.GetStatus: Boolean;
begin
  Result := _Status;
end;

function TGLShader.GetErrors: TStringList;
begin
  Result := _Errors;
end;

procedure TGLShader.Compile(const Source_: AnsiString);
var
  P: PGLchar;
  N: GLint;
begin
  P := PGLchar(Source_);
  N := Length(Source_);

  glShaderSource(_ID, 1, @P, @N);

  glCompileShader(_ID);
end;

function TGLShader.glGetStatus: Boolean;
var
  S: GLint;
begin
  glGetShaderiv(_ID, GL_COMPILE_STATUS, @S);

  Result := (S = GL_TRUE);
end;

function TGLShader.glGetErrors: String;
var
  N: GLint;
  Cs: TArray<GLchar>;
  CsN: GLsizei;
begin
  glGetShaderiv(_ID, GL_INFO_LOG_LENGTH, @N);

  SetLength(Cs, N);

  glGetShaderInfoLog(_ID, N, @CsN, PGLchar(Cs));

  SetString(Result, PGLchar(Cs), CsN);
end;

constructor TGLShader.Create(const Kind_: GLenum);
begin
  inherited Create;

  _Source := TStringList.Create;
  _Errors := TStringList.Create;

  _Source.OnChange := SetSource;

  _Kind := Kind_;

  _ID := glCreateShader(_Kind);
end;

destructor TGLShader.Destroy;
begin
  glDeleteShader(_ID);

  _Source.Free;
  _Errors.Free;

  inherited;
end;

procedure TGLShader.Attach(const Progra_: IGLProgra);
begin
  _Progra := Progra_;
end;

procedure TGLShader.Detach(const Progra_: IGLProgra);
begin
  _Progra := nil;
end;

// ------------------------------------------------------------------------------

procedure TGLShader.LoadFromResource(const Name_: String);
var
  RS: TResourceStream;
begin
  RS := TResourceStream.Create(hInstance, Name_, RT_RCDATA);
  try
    Source.LoadFromStream(RS);

  finally
    RS.Free;
  end;
end;

constructor TGLShaderC.Create;
begin
  inherited Create(GL_COMPUTE_SHADER);

end;

constructor TGLShaderV.Create;
begin
  inherited Create(GL_VERTEX_SHADER);

end;

constructor TGLShaderG.Create;
begin
  inherited Create(GL_GEOMETRY_SHADER);

end;

constructor TGLShaderF.Create;
begin
  inherited Create(GL_FRAGMENT_SHADER);

end;

initialization //===================== 

finalization

end.
