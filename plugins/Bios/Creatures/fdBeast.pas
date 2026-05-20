unit fdBeast;

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
  GLS.BaseClasses,
  GLS.SimpleNavigation;

type
  TFormBeast = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    Camera1: TGLCamera;
    ActorDumni: TGLDummyCube;
    acCreature: TGLActor;
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
    Camera2: TGLCamera;
    GLMemoryViewer1: TGLMemoryViewer;
    GLSceneViewer2: TGLSceneViewer;
    ffMap: TGLFreeForm;
    LightSource1: TGLLightSource;
    LightSource2: TGLLightSource;
    Cylinder: TGLCylinder;
    GLSimpleNavigation1: TGLSimpleNavigation;
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure GLSceneViewer1BeforeRender(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
  private
    MediaPath, FileJpg: TFileName;
  public
    IsInitialized: Boolean;
    zViewer, zCaster: TGLzBuffer;
  end;

var
  FormBeast: TFormBeast;

implementation //==============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TFormBeast.CheckBox1Click(Sender: TObject);
begin
  GLBumpShader1.Enabled := CheckBox1.Checked;
end;

//----------------------------------------------------------------------------
procedure TFormBeast.CheckBox2Click(Sender: TObject);
begin
  LightSource1.Shining := CheckBox2.Checked;
end;

//----------------------------------------------------------------------------
procedure TFormBeast.CheckBox3Click(Sender: TObject);
begin
  LightSource2.Shining := CheckBox3.Checked;
end;

//----------------------------------------------------------------------------
procedure TFormBeast.FormCreate(Sender: TObject);
begin
  MediaPath := LowerCase(ExtractFilePath(ParamStr(0)));
  MediaPath := IncludeTrailingPathDelimiter(MediaPath); // + '\media';
//  Delete(MediaPath, Pos('biosfera', MediaPath), Length(MediaPath)); // if litosfera dir for exe
  MediaPath := MediaPath + 'media\model\';
  SetCurrentDir(MediaPath) ;


  FileJpg := MediaPath + 'sand_cav.tga';

  if FileExists(FileJpg, true) then
    ffMap.Material.Texture.Image.LoadFromFile(FileJpg)
  else
    Exit;

  ffMap.LoadFromFile('mapmain.3ds');
  acCreature.LoadFromFile('ps2_slave_reference.smd');
  acCreature.AddDataFromFile('idle1.smd');
  acCreature.Animations[1].MakeSkeletalTranslationStatic;
  acCreature.SwitchToAnimation(1);
end;

//----------------------------------------------------------------------------
procedure TFormBeast.GLCadencer1Progress(Sender: TObject;
  const deltaTime, newTime: Double);
begin
  GLZShadows1.CastShadow;
  ActorDumni.Turn(8 * deltaTime);
  GLSceneViewer1.Invalidate;
end;

//----------------------------------------------------------------------------
procedure TFormBeast.GLSceneViewer1BeforeRender(Sender: TObject);
begin
  if IsInitialized then
    exit;
  GLBumpShader1.BumpMethod := bmBasicARBFP;
  if GLSceneViewer1.Buffer.LimitOf[limNbTextureUnits] < 3 then
     GLBumpShader1.SpecularMode := smOff;
  IsInitialized := true;
end;

end.
