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
  Vcl.ToolWin,

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
  GLS.Material,

  fAbout,
  fOptions,
  fProjection, Vcl.Samples.Spin, Vcl.StdCtrls, Vcl.NumberBox;

type
  TFormGalagrid = class(TForm)
    GLScene: TGLScene;
    StatusBar1: TStatusBar;
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
    miSettings: TMenuItem;
    miViewPanelHide: TMenuItem;
    miViewPanelShow: TMenuItem;
    miN5: TMenuItem;
    Help1: TMenuItem;
    miWiki: TMenuItem;
    About1: TMenuItem;
    miN6: TMenuItem;
    camGal: TGLCamera;
    LightGal: TGLLightSource;
    dcGalaxy: TGLDummyCube;
    dcSol: TGLDummyCube;
    ArrowZ: TGLArrowLine;
    ArrowY: TGLArrowLine;
    ArrowX: TGLArrowLine;
    StarCube: TGLCube;
    XYZGrid: TGLXYZGrid;
    N7: TMenuItem;
    N8: TMenuItem;
    ControlBar1: TControlBar;
    diskGalaxy: TGLDisk;
    GLMatLib: TGLMaterialLibrary;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PageControl1: TPageControl;
    tsSolacube: TTabSheet;
    tsGalacube: TTabSheet;
    svGal: TGLSceneViewer;
    tvGalaxy: TTreeView;
    PanelLeft: TPanel;
    svSol: TGLSceneViewer;
    camSol: TGLCamera;
    LightSol: TGLLightSource;
    GLSimpleNavigation: TGLSimpleNavigation;
    dcAxis: TGLDummyCube;
    PanelRight: TPanel;
    ButtonStars: TButton;
    gbStars: TGroupBox;
    shO: TShape;
    shB: TShape;
    shA: TShape;
    shG: TShape;
    shK: TShape;
    shF: TShape;
    shM: TShape;
    Label1: TLabel;
    Label2: TLabel;
    chbO: TCheckBox;
    chbB: TCheckBox;
    chbA: TCheckBox;
    chbF: TCheckBox;
    chbG: TCheckBox;
    chbK: TCheckBox;
    chbM: TCheckBox;
    chbAll: TCheckBox;
    nbO: TNumberBox;
    nbB: TNumberBox;
    nbA: TNumberBox;
    nbF: TNumberBox;
    nbG: TNumberBox;
    nbK: TNumberBox;
    nbM: TNumberBox;
    nbAn: TNumberBox;
    nbMn: TNumberBox;
    nbKn: TNumberBox;
    nbGn: TNumberBox;
    nbFn: TNumberBox;
    nbBn: TNumberBox;
    nbOn: TNumberBox;
    SpinEdit: TSpinEdit;
    chbSmoothStars: TCheckBox;
    chbOnClasses: TCheckBox;
    ButtonClear: TButton;
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
    procedure svGalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure svGalMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miSettingsClick(Sender: TObject);
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
  FormGalagrid: TFormGalagrid;

implementation

{$R *.dfm}

procedure TFormGalagrid.FormCreate(Sender: TObject);
begin
  tvGalaxy.FullExpand;

  Screen.Cursors[crRotate] := LoadCursor(HInstance, 'ROTATE');
  Screen.Cursors[crZoom] := LoadCursor(HInstance, 'ZOOM');
end;

procedure TFormGalagrid.GLAsyncTimerTimer(Sender: TObject);
begin
//  diskGalaxy.Roll(0.01);
end;

procedure TFormGalagrid.GLCadencerProgress(Sender: TObject; const DeltaTime,
  NewTime: Double);
begin
  diskGalaxy.Roll(0.001);
end;

procedure TFormGalagrid.svGalMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crRotate;
end;

procedure TFormGalagrid.svGalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

procedure TFormGalagrid.miViewPanelHideClick(Sender: TObject);
begin
  PanelLeft.Visible := False;
  PanelRight.Visible := False;
end;

procedure TFormGalagrid.miExitClick(Sender: TObject);
begin
  Close();
end;

procedure TFormGalagrid.miSettingsClick(Sender: TObject);
begin
   with TFormOptions.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalagrid.N8Click(Sender: TObject);
begin
   with TFormProjection.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormGalagrid.Open1Click(Sender: TObject);
begin
 //
end;

procedure TFormGalagrid.miViewPanelShowClick(Sender: TObject);
begin
  PanelLeft.Visible := True;
  PanelRight.Visible := True;
end;


procedure TFormGalagrid.About1Click(Sender: TObject);
begin
  with TFormAbout.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


end.
