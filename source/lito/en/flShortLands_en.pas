unit flShortLands_en;
(*
  This unit shows how to set up a fractal landscape.
  Objects created at design time have comments.

  Basically, you need a Scene, a Camera, a SceneViewer, a MaterialLibrary and
  a TerrainRenderer; make the latter child of a DummyCube if you want to be able
  to rescale it (to create wider perspective). All these objects must be linked properly as shown in other tutorials.
  This code just build and display a landscape. You can't navigate it nor rotate the angle
  of view. Originally designed by Alexandre Hirzel.
*)

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  GLS.Scene,
  GLS.TerrainRenderer,
  GLS.Objects,
  GLS.Texture,
  GLS.SceneViewer,
  GLS.Material,
  GLS.Coordinates,
  GLS.BaseClasses,

  GLS.RandomHDS;

type
  TfrmShortLands = class(TForm)
    // These are the minimum objects needed. Built àt design time
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLMaterialLibrary1: TGLMaterialLibrary;
    Camera: TGLCamera; // Linked to the Scene Viewer
    GLDummyCube1: TGLDummyCube;
    TerrainRenderer: TGLTerrainRenderer;
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure GLSceneViewer1DblClick(Sender: TObject);
  private
    DataPath, MediaPath, FileJpg: TFileName;
    hdsLandscape: TGLFractalHDS; // Declare the landscape manually
    mx, my: Integer;
  public

  end;

var
  frmShortLands: TfrmShortLands;

implementation // =============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TfrmShortLands.FormCreate(Sender: TObject);
begin
  MediaPath := LowerCase(ExtractFilePath(ParamStr(0)));
  MediaPath := IncludeTrailingPathDelimiter(MediaPath); // + '\media';
//  Delete(MediaPath, Pos('litosfera', MediaPath), Length(MediaPath)); // if litosfera dir for exe
  MediaPath := MediaPath + 'media\';
  SetCurrentDir(MediaPath) ;

  (* Setting up terrain renderer. This could be done at design time but you have
    missed it. These transformations are needed because, in a HDS, the z vector
    is pointing upward. *)
  TerrainRenderer.Up.SetVector(0, 0, 1);
  TerrainRenderer.Direction.SetVector(0, 1, 0);

  // Position the camera to have an interesting view
  Camera.Position.SetPoint(-64, 16, 64);

  // Creation and minimal set-up of a fractal landscape
  hdsLandscape := TGLFractalHDS.Create(Self);
// with hdsLandscape do
// begin
     hdsLandscape.TerrainRenderer := TerrainRenderer;
     hdsLandscape.Depth := 8;
     // 3 < Depth < 10,  Not needed but gives a nicer landscape (default depth is 4)
     hdsLandscape.Cyclic := True; // Not needed but give a "infinite" landscape
     hdsLandscape.BuildLandscape; // Build a landscape with the default parameters
// end;
end;

//----------------------------------------------------------------------------
procedure TfrmShortLands.GLSceneViewer1DblClick(Sender: TObject);
begin
  // Random landscapes  // changing on space
end;

//----------------------------------------------------------------------------
procedure TfrmShortLands.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

//----------------------------------------------------------------------------
procedure TfrmShortLands.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssLeft in Shift then
    Camera.MoveAroundTarget(my - Y, mx - X);
  mx := X;
  my := Y;
end;

//----------------------------------------------------------------------------
procedure TfrmShortLands.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Camera.AdjustDistanceToTarget(Power(1.03, WheelDelta / 120));
end;

end.
