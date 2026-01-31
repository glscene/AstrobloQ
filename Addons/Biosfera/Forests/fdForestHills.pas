unit fdForestHills;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
   
  Stage.VectorGeometry,
  Stage.VectorTypes,
  Stage.Utils,

  GLS.Scene,
  GLS.Coordinates,
  GLS.Objects,
  GLS.AsyncTimer,
  GLS.Cadencer,
  GLS.SceneViewer,

  GLS.BaseClasses,
  GLS.RenderContextInfo,
  GLS.Context,
  GLS.VectorFileObjects,
  GLS.FileTGA;

type
  TFormForestHills = class(TForm)
    GLScene1: TGLScene;
    vp: TGLSceneViewer;
    cad: TGLCadencer;
    AsyncTimer1: TGLAsyncTimer;
    dc_cam: TGLDummyCube;
    cam: TGLCamera;
    dogl: TGLDirectOpenGL;
    ffForest: TGLFreeForm;
    procedure doglRender(Sender: TObject; var rci: TGLRenderContextInfo);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cadProgress(Sender: TObject; const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
  end;

var
  FormForestHills: TFormForestHills;
  InitDGL: boolean;
  GLSL: TGLProgramHandle;

  tree_cnt: integer = 100000;
  world_height: single = 1;
  world_size: single = 40;

implementation //=============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TFormForestHills.doglRender;
var
  ax, ay: integer;
begin
  if not InitDGL then
  begin
    GLSL := TGLProgramHandle.CreateAndAllocate;
    GLSL.AddShader(TGLVertexShaderHandle, LoadAnsiStringFromFile('..\media\shader\forest.vp'));
    GLSL.AddShader(TGLFragmentShaderHandle, LoadAnsiStringFromFile('..\media\shader\forest.fp'));
    if not GLSL.LinkProgram then
      raise Exception.Create(GLSL.InfoLog);
    if not GLSL.ValidateProgram then
      raise Exception.Create(GLSL.InfoLog);
    InitDGL := True;
  end;

  if InitDGL then
    with GLSL do
    begin
      UseProgramObject;
      Uniform1i['BaseTex'] := 0;
      Uniform4f['cam'] := cam.AbsolutePosition;
      ffForest.Render(rci);
      EndUseProgramObject;
    end;
end;

//----------------------------------------------------------------------------
procedure TFormForestHills.AsyncTimer1Timer(Sender: TObject);
begin
  caption := 'Forest Hills: ' + vp.FramesPerSecondText(2);
  vp.ResetPerformanceMonitor;
end;

//----------------------------------------------------------------------------
procedure TFormForestHills.FormShow(Sender: TObject);
begin
  cad.Enabled := True;
end;

//----------------------------------------------------------------------------
procedure TFormForestHills.cadProgress;
begin
  dc_cam.Turn(deltaTime * 10);
  vp.Invalidate;
end;

//----------------------------------------------------------------------------
procedure TFormForestHills.FormCreate(Sender: TObject);
var
  ts: TBitmap;
  mObj: TGLMeshObject;
  i: integer;

//----------------------------------------------------------------------------
procedure genTree;
var
  x, y: integer;
  b: byte;
  v: TGLVector;
  d: single;
begin
  repeat
    x := Random(ts.Width);
    y := Random(ts.Height);
    b := PByteArray(ts.ScanLine[ts.Height - 1 - y])[x];
  until b > 20;
  setvector(v, x * world_size / ts.Width - world_size / 2 + (random - 0.5) *
    0.1, b * 0.03 * world_height - 5, y * world_size / ts.Height - world_size /
    2 + (Random - 0.5) * 0.1);

  // momTriangles
  with mObj.Vertices do
  begin
    Add(v);
    Add(v);
    Add(v);
  end;
  with mObj.TexCoords do
  begin
    Add(0, 0);
    Add(0.5, 1);
    Add(1, 0);
  end;
  d := 0.2 + random * 0.1;
  with mObj.Normals do
  begin
    Add(d, 0, 0);
    Add(0, 2.5 * d, 0);
    Add(-d, 0, 0);
  end;
end;

begin
  Randomize;
  ts := TBitmap.Create;
  ts.LoadFromFile('..\media\texture\ts.bmp');
  mObj := TGLMeshObject.CreateOwned(ffForest.MeshObjects);
  mObj.Mode := momTriangles;
  for i := 0 to tree_cnt - 1 do
    genTree;
end;

end.
