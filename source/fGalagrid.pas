unit fGalagrid;

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

  fAbout,
  fProjection, GLS.Material, Vcl.ToolWin;

type
  TFormEvolutor = class(TForm)
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
    miN2: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    GoTo1: TMenuItem;
    Object1: TMenuItem;
    miN1: TMenuItem;
    miN3: TMenuItem;
    miN4: TMenuItem;
    miView: TMenuItem;
    Tile1: TMenuItem;
    miViewPanelHide: TMenuItem;
    miViewPanelShow: TMenuItem;
    miN5: TMenuItem;
    Help1: TMenuItem;
    miWiki: TMenuItem;
    About1: TMenuItem;
    miN6: TMenuItem;
    Camera: TGLCamera;
    LightSource: TGLLightSource;
    DummyCube: TGLDummyCube;
    dcSol: TGLDummyCube;
    ArrowZ: TGLArrowLine;
    ArrowY: TGLArrowLine;
    ArrowX: TGLArrowLine;
    Cube: TGLCube;
    GLSimpleNavigation: TGLSimpleNavigation;
    XYZGrid: TGLXYZGrid;
    N7: TMenuItem;
    N8: TMenuItem;
    tvGalaxy: TTreeView;
    ControlBar1: TControlBar;
    diskGalaxy: TGLDisk;
    GLMatLib: TGLMaterialLibrary;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure miExitClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure miViewPanelHideClick(Sender: TObject);
    procedure miViewPanelShowClick(Sender: TObject);
    procedure GLAsyncTimerTimer(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime,
      NewTime: Double);
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    AtStart: Boolean;
  public
    MousePoint: TPoint;
  end;

const
  crLightxz = 1;
  crLightyz = 2;
  crLightxy = 3;
  crSlidexy = 4;
  crSlideyz = 5;
  crSlidexz = 6;
  crRotate = 7;
  crZoom = 8;
  crHandMove = 9;
  crSlidezy = 10;

var
  FormEvolutor: TFormEvolutor;

implementation

{$R *.dfm}

procedure TFormEvolutor.FormCreate(Sender: TObject);
begin
  tvGalaxy.FullExpand;

  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');
end;

procedure TFormEvolutor.GLAsyncTimerTimer(Sender: TObject);
begin
//  diskGalaxy.Roll(0.01);
end;

procedure TFormEvolutor.GLCadencerProgress(Sender: TObject; const DeltaTime,
  NewTime: Double);
begin
  diskGalaxy.Roll(0.001);
end;

procedure TFormEvolutor.GLSceneViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TFormEvolutor.GLSceneViewerMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

procedure TFormEvolutor.miViewPanelHideClick(Sender: TObject);
begin
  PanelLeft.Visible := False;
  PanelRight.Visible := False;
end;

procedure TFormEvolutor.miExitClick(Sender: TObject);
begin
  Close();
end;

procedure TFormEvolutor.N8Click(Sender: TObject);
begin
   with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormEvolutor.Open1Click(Sender: TObject);
begin
 //
end;

procedure TFormEvolutor.miViewPanelShowClick(Sender: TObject);
begin
  PanelLeft.Visible := True;
  PanelRight.Visible := True;
end;


procedure TFormEvolutor.About1Click(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


end.
