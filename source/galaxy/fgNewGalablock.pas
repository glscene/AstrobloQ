unit fgNewGalablock;

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
  Vcl.StdCtrls,
  Vcl.Menus,
  Vcl.ExtCtrls,
  GLS.AsyncTimer,
  GLS.Cadencer,
  GLS.BaseClasses,
  GLS.Scene,
  GLS.SceneViewer;

type
  TfrmNewStarblock = class(TForm)
    PanelRight: TPanel;
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCadencer1: TGLCadencer;
    GLAsyncTimer1: TGLAsyncTimer;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miSaveAs: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewStarblock: TfrmNewStarblock;

implementation

{$R *.dfm}

end.
