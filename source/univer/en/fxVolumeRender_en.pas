unit fxVolumeRender_en;

interface

uses
  System.StartUpCopy,
  System.Math,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Math.Vectors,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Types3D,
  FMX.Objects3D,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls3D,
  FMX.Viewport3D,
  FMX.TabControl,
  FMX.Memo.Types,

  LUX,
  LUX.D3,
///  LUX.FMX.Context.DX11,
  LUX.FMX.Types3D,
  LIB.Material;

type
  TFormTexture3D = class(TForm)
    TabControl1: TTabControl;
    TabItemV: TTabItem;
    Viewport3D1: TViewport3D;
    Dummy1: TDummy;
    Dummy2: TDummy;
    Camera1: TCamera;
    Light1: TLight;
    Grid3D1: TGrid3D;
    StrokeCube1: TStrokeCube;
    TabItemS: TTabItem;
    TabControlS: TTabControl;
    TabItemSV: TTabItem;
    TabControlSV: TTabControl;
    TabItemSVC: TTabItem;
    MemoSVC: TMemo;
    TabItemSVE: TTabItem;
    MemoSVE: TMemo;
    TabItemSP: TTabItem;
    TabControlSP: TTabControl;
    TabItemSPC: TTabItem;
    MemoSPC: TMemo;
    TabItemSPE: TTabItem;
    MemoSPE: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Single);
    procedure Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    MouseS: TShiftState;
    MouseP: TPointF;
    function VoxToPos(const V_: TSingle3D): TSingle3D;
    function PosToVox(const P_: TSingle3D): TSingle3D;
  public
    VolumeCube: TVolumeCube;
    procedure DrawSphere(const Center_: TSingle3D; const Radius_: Single;
      const Color_: TAlphaColorF);
    procedure MakeTexture3D;
  end;

var
  FormTexture3D: TFormTexture3D;

//============================================
implementation
//============================================

{$R *.fmx}

function TFormTexture3D.VoxToPos(const V_: TSingle3D): TSingle3D;
begin
  with VolumeCube.Material.Texture3D do
  begin
    Result.X := V_.X / Width;
    Result.Y := V_.Y / Height;
    Result.Z := V_.Z / Depth;
  end;
end;

function TFormTexture3D.PosToVox(const P_: TSingle3D): TSingle3D;
begin
  Result.X := P_.X * VolumeCube.Material.Texture3D.Width;
  Result.Y := P_.Y * VolumeCube.Material.Texture3D.Height;
  Result.Z := P_.Z * VolumeCube.Material.Texture3D.Depth;
end;

procedure TFormTexture3D.DrawSphere(const Center_: TSingle3D; const Radius_: Single;
  const Color_: TAlphaColorF);
var
  P0, P1, V0, V1, V, P: TSingle3D;
  X0, X1, X, Y0, Y1, Y, Z0, Z1, Z: Integer;
begin
  P0.X := Center_.X - Radius_;
  P1.X := Center_.X + Radius_;
  P0.Y := Center_.Y - Radius_;
  P1.Y := Center_.Y + Radius_;
  P0.Z := Center_.Z - Radius_;
  P1.Z := Center_.Z + Radius_;

  V0 := PosToVox(P0);
  V1 := PosToVox(P1);

  with VolumeCube.Material.Texture3D do
  begin
    X0 := Max(0, Floor(V0.X));
    X1 := Min(Ceil(V1.X), Width - 1);
    Y0 := Max(0, Floor(V0.Y));
    Y1 := Min(Ceil(V1.Y), Height - 1);
    Z0 := Max(0, Floor(V0.Z));
    Z1 := Min(Ceil(V1.Z), Depth - 1);

    for Z := Z0 to Z1 do
    begin
      V.Z := Z + 0.5;
      for Y := Y0 to Y1 do
      begin
        V.Y := Y + 0.5;
        for X := X0 to X1 do
        begin
          V.X := X + 0.5;
          P := VoxToPos(V);
          if Distance(Center_, P) < Radius_ then
            Pixels[X, Y, Z] := Color_;
        end;
      end;
    end;
  end;
end;

procedure TFormTexture3D.MakeTexture3D;
var
  N, I: Integer;
  P: TSingle3D;
  R: Single;
  C: TAlphaColorF;
begin
  N := 512;

  with VolumeCube.Material.Texture3D do
  begin
    Width := 64;
    Height := 64;
    Depth := 64;
    for I := 1 to N do
    begin
      P := TSingle3D.Create(Random, Random, Random);
      R := Roo2(2) / Roo3(N) * Pow2(Random);
      C := TAlphaColorF.Create(Random(5) / 4, Random(5) / 4, Random(5) / 4,
        Random(5) / 4);
      DrawSphere(P, R, C);
    end;

    UpdateTexture;
  end;
end;

//---------------------------------------------------------------------------
procedure TFormTexture3D.FormCreate(Sender: TObject);
var
  T: String;
begin
  Assert(Viewport3D1.Context.ClassName = 'TLuxDX11Context',
    'TLuxDX11Context class is not applied!');

  // remake with glsl shaders without DX11 !
  MemoSVC.Lines.LoadFromFile('..\Data\shader\ShaderV.hlsl');
  MemoSPC.Lines.LoadFromFile('..\Data\shader\ShaderP.hlsl');

  VolumeCube := TVolumeCube.Create(Viewport3D1);
  with VolumeCube do
  begin
    Parent := Viewport3D1;

    Width := 10;
    Height := 10;
    Depth := 10;

    with Material do
    begin
      with ShaderV do
      begin
        Source.Text := MemoSVC.Text;
        for T in Errors.Keys do
        begin
          with MemoSVE.Lines do
          begin
            Add('▼ ' + T);
            Add(Errors[T]);
          end;
        end;
      end;

      with ShaderP do
      begin
        Source.Text := MemoSPC.Text;

        for T in Errors.Keys do
        begin
          with MemoSPE.Lines do
          begin
            Add('▼ ' + T);
            Add(Errors[T]);
          end;
        end;
      end;
    end;
  end;
  MakeTexture3D;
end;

// ------------------------------------------------------------------------------

procedure TFormTexture3D.Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  MouseS := Shift;
  MouseP := TPointF.Create(X, Y);
end;

procedure TFormTexture3D.Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Single);
var
  P: TPointF;
begin
  if ssLeft in MouseS then
  begin
    P := TPointF.Create(X, Y);
    with Dummy1.RotationAngle do
      Y := Y + (P.X - MouseP.X) / 2;
    with Dummy2.RotationAngle do
      X := X - (P.Y - MouseP.Y) / 2;
    MouseP := P;
  end;
end;

procedure TFormTexture3D.Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Viewport3D1MouseMove(Sender, Shift, X, Y);
  MouseS := [];
end;

end.
