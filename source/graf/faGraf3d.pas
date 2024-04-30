unit faGraf3d;

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

  GLS.AsyncTimer,
  GLS.Material,
  GLS.Cadencer,
  GLS.SceneViewer,
  GLS.BaseClasses,
  GLS.Scene;

type
  TFormGraf3d = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCadencer1: TGLCadencer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    GLAsyncTimer1: TGLAsyncTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGraf3d: TFormGraf3d;

implementation

{$R *.dfm}

end.
