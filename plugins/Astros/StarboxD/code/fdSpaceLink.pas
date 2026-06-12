(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fdSpaceLink;

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

  GLS.Scene,
  Stage.VectorTypes,
  GLS.Objects,
  GLS.SceneViewer,
  
  Stage.VectorGeometry,
  GLS.Cadencer,
  Stage.Coordinates,
  Stage.BaseClasses;

type
  TfrmConnector = class(TForm)
    GLScene: TGLScene;
    GLSceneViewer: TGLSceneViewer;
    Camera: TGLCamera;
    DummyCube: TGLDummyCube;
    GLCube1: TGLCube;
    Light: TGLLightSource;
    GLCube2: TGLCube;
    c11: TGLCube;
    c12: TGLCube;
    c13: TGLCube;
    c21: TGLCube;
    c22: TGLCube;
    c23: TGLCube;
    Lines: TGLLines;
    GLCadencer: TGLCadencer;
    GLSphere1: TGLSphere;
    procedure GLSceneViewerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLCadencerProgress(Sender: TObject; const deltaTime, newTime: Double);
  end;

var
  frmConnector: TfrmConnector;
  Lastpick, Pick, Select: TGLCustomSceneObject;

implementation //============================================================

{$R *.dfm}

procedure TfrmConnector.GLSceneViewerMouseMove;
begin
  Pick := TGLCustomSceneObject(GLSceneViewer.Buffer.GetPickedObject(X, Y));
  if Pick <> Lastpick then
  begin
    if (lastpick <> nil) and (lastpick <> select) then
      lastpick.Material.FrontProperties.Emission.SetColor(0, 0, 0, 1);
    if (pick <> nil) and (pick.Name[1] = 'c') then
      pick.Material.FrontProperties.Emission.SetColor(1, 0, 0, 1);
    lastpick := Pick;
  end;
  if Pick <> nil then
    GLSceneViewer.cursor := -21
  else
    GLSceneViewer.cursor := 0;
end;

procedure TfrmConnector.GLSceneViewerMouseDown;
begin
  if Pick <> nil then
  begin
    Select := pick;
    Lines.Nodes[0].AsVector := select.AbsolutePosition;
    Lines.Nodes[1].AsVector := Lines.Nodes[0].AsVector;
    Lines.Visible := True;
  end;
end;

procedure TfrmConnector.GLSceneViewerMouseUp;
begin
  if Select <> nil then
  begin
    Select.Material.FrontProperties.Emission.SetColor(0, 0, 0, 1);
    Select := nil;
    if Pick = nil then
      Lines.Visible := False;
  end;
end;

procedure TfrmConnector.GLCadencerProgress;
var
  v: TGSVector;
  p: TPoint;
begin
  if select <> nil then
    if (select <> nil) and (pick <> nil) and (select <> pick) then
      Lines.Nodes[1].AsVector := pick.AbsolutePosition
    else
    begin
      p := screentoclient(mouse.CursorPos);
      GLSceneViewer.Buffer.ScreenVectorIntersectWithPlaneXZ
        (vectormake(p.X, clientheight - p.Y, 0), 0, v);
      Lines.Nodes[1].AsVector := v;
    end;
end;

end.
