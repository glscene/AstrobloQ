unit fgNewStarblock_ru;

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
  Vcl.StdCtrls, Vcl.ExtCtrls, GLS.BaseClasses, GLS.Scene, GLS.SceneViewer,
  GLS.Cadencer, GLS.AsyncTimer, Vcl.Menus;

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

  public

  end;

var
  frmNewStarblock: TfrmNewStarblock;

implementation //=============================================================

{$R *.dfm}

end.
