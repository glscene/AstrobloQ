unit fBumpBeast;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.OpenGL,
  Winapi.OpenGLext,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.Jpeg,

  GLS.SceneViewer,
  GLS.Scene,
  GLS.Cadencer,
  GLS.Objects,
  GLS.VectorFileObjects,
  GLS.FileSMD,
  GLS.Texture,
  GLSL.BumpShaders,
  GLS.zBuffer,
  GLS.File3DS,
  GLS.FileTGA,
  GLS.GeomObjects,
  GLS.Material,
  GLS.Coordinates,
  GLS.BaseClasses, GLS.SimpleNavigation;

type
  TForm3 = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    ActorDumni: TGLDummyCube;
    GLActor1: TGLActor;
    GLLightSource3: TGLLightSource;
    GLSphere1: TGLSphere;
    GLSphere2: TGLSphere;
    GLCadencer1: TGLCadencer;
    MatLib: TGLMaterialLibrary;
    GLDummyCube1: TGLDummyCube;
    GLBumpShader1: TGLBumpShader;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GLZShadows1: TGLZShadows;
    caster: TGLDummyCube;
    GLCamera2: TGLCamera;
    GLMemoryViewer1: TGLMemoryViewer;
    GLSceneViewer2: TGLSceneViewer;
    GLFreeForm1: TGLFreeForm;
    GLLightSource1: TGLLightSource;
    GLLightSource2: TGLLightSource;
    GLCylinder1: TGLCylinder;
    GLSimpleNavigation1: TGLSimpleNavigation;
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure GLSceneViewer1BeforeRender(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
  private
  public
    IsInitialized: Boolean;
    zViewer, zCaster: TGLzBuffer;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
  GLBumpShader1.Enabled := CheckBox1.Checked;
end;

procedure TForm3.CheckBox2Click(Sender: TObject);
begin
  GLLightSource1.Shining := CheckBox2.Checked;
end;

procedure TForm3.CheckBox3Click(Sender: TObject);
begin
  GLLightSource2.Shining := CheckBox3.Checked;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  GLFreeForm1.LoadFromFile('mapmain.3ds');
  GLActor1.LoadFromFile('ps2_slave_reference.smd');
  GLActor1.AddDataFromFile('idle1.smd');
  GLActor1.Animations[1].MakeSkeletalTranslationStatic;
  GLActor1.SwitchToAnimation(1);
end;

procedure TForm3.GLCadencer1Progress(Sender: TObject;
  const deltaTime, newTime: Double);
begin
  GLZShadows1.CastShadow;
  ActorDumni.Turn(8 * deltaTime);
  GLSceneViewer1.Invalidate;
end;

procedure TForm3.GLSceneViewer1BeforeRender(Sender: TObject);
begin
  if IsInitialized then
    exit;
  GLBumpShader1.BumpMethod := bmBasicARBFP;
  if GLSceneViewer1.Buffer.LimitOf[limNbTextureUnits] < 3 then
     GLBumpShader1.SpecularMode := smOff;
  IsInitialized := true;
end;

end.
