unit LUX.Motion.BVH.OpenGL;

interface

uses
  System.Generics.Collections,
  LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M4,
  LUX.Motion.BVH,
  LUX.GPU.OpenGL,
  LUX.GPU.OpenGL.Scener,
  LUX.GPU.OpenGL.Shaper,
  LUX.GPU.OpenGL.Shaper.Preset;

type

  TGLBones = class(TGLObject)
  private
    procedure MakeModel;
    procedure InitModel;
  protected
    _Bones: TBones;
    _FrameI: Integer;
    function GetBones: TBones;
    procedure SetBones(const Bones_: TBones);
    function GetFrameI: Integer;
    procedure SetFrameI(const FrameI_: Integer);
  public
    constructor Create; override;
    destructor Destroy; override;
    property Bones: TBones read GetBones write SetBones;
    property FrameI: Integer read GetFrameI write SetFrameI;
  end;

implementation

procedure TGLBones.MakeModel;
// ······································
  procedure AddTree(const NodeOGJ_: TGLObject; const NodeBVH_: TBoneNode);
  var
    P: TGLShaper;
    I: Integer;
  begin
    P := TGLShaperLineCube.Create(NodeOGJ_);

    for I := 0 to NodeBVH_.ChildsN - 1 do
    begin
      AddTree(P, NodeBVH_.Childs[I]);
    end;
  end;

// ······································
var
  I: Integer;
begin
  DeleteChilds;
  for I := 0 to _Bones.Root.ChildsN - 1 do
  begin
    AddTree(Self, _Bones.Root.Childs[I]);
  end;
  _FrameI := 0;
end;

procedure TGLBones.InitModel;
// ······································
  procedure AddTree(const NodeOGJ_: TGLObject; const NodeBVH_: TBoneNode);
  var
    I: Integer;
  begin
    NodeOGJ_.Pose := NodeBVH_.Poses[_FrameI];
    for I := 0 to NodeBVH_.ChildsN - 1 do
    begin
      AddTree(NodeOGJ_.Childs[I], NodeBVH_.Childs[I]);
    end;
  end;

// ······································
begin
  AddTree(Self, _Bones.Root);
end;

function TGLBones.GetBones: TBones;
begin
  Result := _Bones;
end;

procedure TGLBones.SetBones(const Bones_: TBones);
begin
  _Bones := Bones_;
  MakeModel;
  InitModel;
end;

function TGLBones.GetFrameI: Integer;
begin
  Result := _FrameI;
end;

procedure TGLBones.SetFrameI(const FrameI_: Integer);
begin
  _FrameI := FrameI_;
  InitModel;
end;

constructor TGLBones.Create;
begin
  inherited;
  _Bones := nil;
  _FrameI := 1;
end;

destructor TGLBones.Destroy;
begin
  inherited;
end;


initialization

finalization

end.
