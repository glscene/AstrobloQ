unit flTexCombine;

interface

uses
  Winapi.OpenGL,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.Jpeg,
  Vcl.ExtCtrls,

  GLS.Scene,
  GLS.Texture,
  GLS.Objects,
  GLS.SceneViewer,
  GLSL.TextureShaders,
  GLS.HUDObjects,
  GLS.Material,
  GLS.Coordinates,

  GLS.BaseClasses,
  GLS.SimpleNavigation;

type
  TfrmTexCombine = class(TForm)
    GLScene: TGLScene;
    SceneViewer: TGLSceneViewer;
    Image1: TImage;
    Image2: TImage;
    BUApply: TButton;
    GLCamera: TGLCamera;
    GLDummyCube: TGLDummyCube;
    GLMaterialLibrary: TGLMaterialLibrary;
    Label1: TLabel;
    GLTexCombineShader: TGLTexCombineShader;
    PATex1: TPanel;
    CBTex0: TCheckBox;
    CBTex1: TCheckBox;
    Label4: TLabel;
    Panel1: TPanel;
    MECombiner: TMemo;
    Label2: TLabel;
    ColorDialog: TColorDialog;
    PAPrimary: TPanel;
    GLSimpleNavigation1: TGLSimpleNavigation;
    GLPlane: TGLPlane;
    procedure FormCreate(Sender: TObject);
    procedure BUApplyClick(Sender: TObject);
    procedure SceneViewerPostRender(Sender: TObject);
    procedure CBTex0Click(Sender: TObject);
    procedure PAPrimaryClick(Sender: TObject);
  private
    DataPath: TFileName;
  public

  end;

var
  frmTexCombine: TfrmTexCombine;

implementation //------------------------------------------------------------

{$R *.dfm}

procedure TfrmTexCombine.FormCreate(Sender: TObject);
begin
  // load the textures
  SetCurrentDir(DataPath + '\map');

  Image1.Picture.LoadFromFile('starmap.jpg');
  GLMaterialLibrary.Materials.Items[0].Material.Texture.Image.Assign(Image1.Picture);
  Image2.Picture.LoadFromFile('constellation_boundaries.jpg');
  GLMaterialLibrary.Materials.Items[1].Material.Texture.Image.Assign(Image2.Picture);

  GLMaterialLibrary.Materials.Items[2].Material.Texture.Image.LoadFromFile('constellation_figures.jpg');
  GLMaterialLibrary.Materials.Items[3].Material.Texture.Image.LoadFromFile('celestial_grid.jpg');
(*
  Image3.Picture.LoadFromFile('constellation_figures.jpg');
  GLMaterialLibrary.Materials.Items[2].Material.Texture.Image.Assign(Image3.Picture);
  Image4.Picture.LoadFromFile('celestial_grid.jpg');
  GLMaterialLibrary.Materials.Items[3].Material.Texture.Image.Assign(Image4.Picture);
*)

  BUApplyClick(Sender);
  Application.HintHidePause := 30000;
end;

procedure TfrmTexCombine.BUApplyClick(Sender: TObject);
begin
  // Apply new combiner code
  // Depending on shader and hardware, errors may be triggered during render
  GLTexCombineShader.Combiners.Clear();
  GLTexCombineShader.Combiners.AddStrings(MECombiner.Lines);
end;

//-----------------------------------------------------------------

procedure TfrmTexCombine.SceneViewerPostRender(Sender: TObject);
begin
  // disable whatever texture units are not supported by the local hardware
  var n: integer := SceneViewer.Buffer.LimitOf[limNbTextureUnits];
  PATex1.Visible := (n < 2);
  CBTex1.Enabled := (n >= 2);
  CBTex1.Checked := (CBTex1.Checked and CBTex1.Enabled);
end;

//-----------------------------------------------------------------

procedure TfrmTexCombine.CBTex0Click(Sender: TObject);
var
  libMat: TGLLibMaterial;
begin
  // This event is used for all 4 checkboxes of the 4 texture units
  libMat := GLMaterialLibrary.Materials.GetLibMaterialByName
    ((Sender as TCheckBox).Caption);
  if Assigned(libMat) then
    libMat.Material.Texture.Enabled := TCheckBox(Sender).Checked;
end;

//-----------------------------------------------------------------

procedure TfrmTexCombine.PAPrimaryClick(Sender: TObject);
begin
  // Allow choosing the primary color
  ColorDialog.Color := PAPrimary.Color;
  if (ColorDialog.Execute()) then
  begin
    PAPrimary.Color := ColorDialog.Color;
    GLMaterialLibrary.Materials[0].Material.FrontProperties.Diffuse.AsWinColor := ColorDialog.Color;
    SceneViewer.Invalidate();
  end;
end;

end.
