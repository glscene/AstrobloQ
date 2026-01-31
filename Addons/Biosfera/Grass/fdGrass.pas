unit fdGrass;

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
  Vcl.Imaging.Jpeg,

  Stage.VectorTypes,
  Stage.VectorGeometry,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.Cadencer,
  GLS.Objects,
  GLS.Texture,
  GLS.Material,
  GLS.Coordinates,

  GLS.BaseClasses,
  GLS.VectorFileObjects,
  GLS.File3DS,
  GLS.FileDDS;

type
  TForm1 = class(TForm)
    GLScene1: TGLScene;
    Cadencer: TGLCadencer;
    SceneViewer: TGLSceneViewer;
    cam: TGLCamera;
    dc_pl: TGLDummyCube;
    GLPlane1: TGLPlane;
    MatLib: TGLMaterialLibrary;
    light: TGLLightSource;
    back: TGLSphere;
    GLPlane2: TGLPlane;
    GLPlane3: TGLPlane;
    GLPlane4: TGLPlane;
    GLPlane5: TGLPlane;
    GLPlane6: TGLPlane;
    GLPlane7: TGLPlane;
    GLPlane8: TGLPlane;
    GLPlane9: TGLPlane;
    GLPlane10: TGLPlane;
    dc_cam: TGLDummyCube;
    dc_ff: TGLDummyCube;
    ff: TGLFreeForm;
    GLPlane11: TGLPlane;
    procedure CadencerProgress(Sender: TObject; const deltaTime, newTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
     MediaPath, FileDDS: TFileName;
  end;

var
  Form1: TForm1;

implementation //=============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TForm1.FormCreate;
begin
  MediaPath := LowerCase(ExtractFilePath(ParamStr(0)));
  MediaPath := IncludeTrailingPathDelimiter(MediaPath); // + '\media';
  Delete(MediaPath, Pos('biosfera', MediaPath), Length(MediaPath)); // if litosfera dir for exe
  MediaPath := MediaPath + 'biosfera\media\model\';
  SetCurrentDir(MediaPath);


  FileDDS := MediaPath + 'grass.dds';
  if FileExists(FileDDS, true) then
  begin
     DDSTex(matlib, 'grass', 'grass.dds');
     DDSTex(matlib, 'dirt', 'dirt.dds');
     ff.LoadFromFile('grass.3ds');
     ff.Scale.Scale(8 / ff.BoundingSphereRadius);
  end
  else
    Exit;
end;

//----------------------------------------------------------------------------
procedure TForm1.CadencerProgress;
begin
  dc_pl.Turn(deltaTime * 10);
  dc_ff.Turn(deltaTime * 10);
end;

//----------------------------------------------------------------------------
procedure TForm1.FormResize;
begin
  SceneViewer.FieldOfView := 145;
end;

end.
