unit fnNoosfera;

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
  Vcl.ComCtrls, 
  Vcl.ExtCtrls, 
  Vcl.Menus,
  
  GLS.BaseClasses, 
  GLS.Scene,
  GLS.SceneViewer, 
  GLS.AsyncTimer,
  GLS.Cadencer, 
  GLS.Objects, 
  GLS.Graph, 
  GLS.Coordinates, 
  GLS.GeomObjects,
  GLS.SimpleNavigation,
  GLS.VectorFileObjects,

  fnProjection;

type
  TFormMilkyway = class(TForm)
    GLSceneViewer: TGLSceneViewer;
    GLScene: TGLScene;
    PanelLeft: TPanel;
    StatusBar1: TStatusBar;
    PanelRight: TPanel;
    MainMenu: TMainMenu;
    GLAsyncTimer: TGLAsyncTimer;
    GLCadencer: TGLCadencer;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    miExit: TMenuItem;
    N2: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    GoTo1: TMenuItem;
    Object1: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    miView: TMenuItem;
    Tile1: TMenuItem;
    Hide1: TMenuItem;
    Show1: TMenuItem;
    N5: TMenuItem;
    Help1: TMenuItem;
    miWiki: TMenuItem;
    About1: TMenuItem;
    N6: TMenuItem;
    Camera: TGLCamera;
    LightSource: TGLLightSource;
    DummyCube: TGLDummyCube;
    ObjectsCube: TGLDummyCube;
    ArrowZ: TGLArrowLine;
    ArrowY: TGLArrowLine;
    ArrowX: TGLArrowLine;
    Cube: TGLCube;
    GLSimpleNavigation: TGLSimpleNavigation;
    XYZGrid: TGLXYZGrid;
    GLHexahedron1: TGLHexahedron;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure miExitClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    
  public
    
  end;

var
  FormMilkyway: TFormMilkyway;

implementation

{$R *.dfm}

procedure TFormMilkyway.About1Click(Sender: TObject);
begin
  //
end;

procedure TFormMilkyway.miExitClick(Sender: TObject);
begin
  Close();
end;

procedure TFormMilkyway.N8Click(Sender: TObject);
begin
   with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormMilkyway.Open1Click(Sender: TObject);
begin
 //
end;

end.
