unit flShortLands;
(*
  This unit shows how to set up a fractal landscape.
  Objects created at design time have comments.

  Basically, you need a SceneViewer, a Scene, a Camera, a MaterialLibrary and
  a TerrainRenderer; make the latter child of a DummyCube if you want to be able
  to rescale it (to create wider perspective). All these objects must be linked properly as shown in other tutorials.
  This code just build and display a landscape. You can't navigate it nor rotate the angle
  of view.
  Originally created by Alexandre Hirzel, 2003
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
    GLMaterialLibrary1: TGLMaterialLibrary; // Linked to the terrain renderer
    GLCamera1: TGLCamera; // Linked to the Scene Viewer
    GLDummyCube1: TGLDummyCube;
    // Contains the terrain renderer. Allows to change its scale
    GLTerrainRenderer1: TGLTerrainRenderer;
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

procedure TfrmShortLands.FormCreate(Sender: TObject);
begin
  MediaPath := LowerCase(ExtractFilePath(ParamStr(0)));
  MediaPath := IncludeTrailingPathDelimiter(MediaPath); // + '\media';
  Delete(MediaPath, Pos('astrobloq', MediaPath), Length(MediaPath)); // if litosfera dir for exe
  MediaPath := MediaPath + 'astrobloq\assets\media\';
  SetCurrentDir(MediaPath) ;

  (* Setting up terrain renderer. This could be done at design time but you have
    missed it. These transformations are needed because, in a HDS, the z vector
    is pointing upward. *)
  GLTerrainRenderer1.Up.SetVector(0, 0, 1);
  GLTerrainRenderer1.Direction.SetVector(0, 1, 0);

  // Position the camera to have an interesting view
  GLCamera1.Position.SetPoint(-64, 16, 64);

  // Creation and minimal set-up of a fractal landscape
  hdsLandscape := TGLFractalHDS.Create(Self);
  with hdsLandscape do
  begin
    TerrainRenderer := GLTerrainRenderer1;
    Depth := 8;
    // 3 < Depth < 10,  Not needed but gives a nicer landscape (default depth is 4)
    Cyclic := True; // Not needed but give a "infinite" landscape
    BuildLandscape; // Build a landscape with the default parameters
  end; // with
end;

procedure TfrmShortLands.GLSceneViewer1DblClick(Sender: TObject);
begin
  // Random landscapes
end;

procedure TfrmShortLands.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

procedure TfrmShortLands.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssLeft in Shift then
    GLCamera1.MoveAroundTarget(my - Y, mx - X);
  mx := X;
  my := Y;
end;

procedure TfrmShortLands.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  GLCamera1.AdjustDistanceToTarget(Power(1.03, WheelDelta / 120));
end;

end.
