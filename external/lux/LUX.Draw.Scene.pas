unit LUX.Draw.Scene;

interface

uses
  System.UITypes,
  System.Math.Vectors,
  FMX.Graphics,
  LUX,
  LUX.D1,
  LUX.D2,
  LUX.Data.Tree;

type

  TDrawNode = class;
  TDrawRoot = class;
  TDrawScene = class;
  TDrawKnot = class;
  TDrawShape = class;
  TDrawCamera = class;
  TDrawCopys = class;
  TDrawPosCopys = class;

  TDrawNode = class(TTreeNode<TDrawNode, TDrawNode>)
  private
  protected
    _RelaArea: TSingleArea2D;
    function GetRelaArea: TSingleArea2D; virtual;
    procedure SetRelaArea(const RelaArea_: TSingleArea2D); virtual;
    function GetRelaPose: TMatrix; virtual; abstract;
    procedure SetRelaPose(const RelaPose_: TMatrix); virtual; abstract;
    function GetAbsoPose: TMatrix; virtual;
    procedure SetAbsoPose(const AbsoPose_: TMatrix); virtual;
    function GetRelaPosi: TSingle2D; virtual;
    procedure SetRelaPosi(const RelaPosi_: TSingle2D); virtual;
    function GetStroke: TStrokeBrush; virtual;
    procedure SetStroke(const Stroke_: TStrokeBrush); virtual;
    function GetFiller: TBrush; virtual;
    procedure SetFiller(const Filler_: TBrush); virtual;
    procedure DrawBegin(const Canvas_: TCanvas); virtual;
    procedure DrawMain(const Canvas_: TCanvas); virtual;
    procedure DrawEnd(const Canvas_: TCanvas); virtual;
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    property RelaArea: TSingleArea2D read GetRelaArea write SetRelaArea;
    property Area: TSingleArea2D read GetRelaArea write SetRelaArea;
    property RelaPose: TMatrix read GetRelaPose write SetRelaPose;
    property Pose: TMatrix read GetRelaPose write SetRelaPose;
    property RelaPosi: TSingle2D read GetRelaPosi write SetRelaPosi;
    property Position: TSingle2D read GetRelaPosi write SetRelaPosi;
    property AbsoPose: TMatrix read GetAbsoPose write SetAbsoPose;
    property Stroke: TStrokeBrush read GetStroke write SetStroke;
    property Filler: TBrush read GetFiller write SetFiller;
    procedure Draw(const Canvas_: TCanvas); virtual;
  end;

  TDrawRoot = class(TDrawNode)
  private
  protected
    function GetStroke: TStrokeBrush; override;
    function GetFiller: TBrush; override;
    function GetRelaPose: TMatrix; override;
    procedure SetRelaPose(const RelaPose_: TMatrix); override;
    function GetAbsoPose: TMatrix; override;
    procedure SetAbsoPose(const AbsoPose_: TMatrix); override;
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    property RelaPose: TMatrix read GetRelaPose;
    property Pose: TMatrix read GetRelaPose;
    property RelaPosi: TSingle2D read GetRelaPosi;
    property Position: TSingle2D read GetRelaPosi;
    property AbsoPose: TMatrix read GetAbsoPose;
  end;

  TDrawScene = class(TDrawRoot)
  private
  protected
    _Stroke: TStrokeBrush;
    _Filler: TBrush;
    _BackColor: TAlphaColor;
    function GetStroke: TStrokeBrush; override;
    procedure SetStroke(const Stroke_: TStrokeBrush); override;
    function GetFiller: TBrush; override;
    procedure SetFiller(const Filler_: TBrush); override;
    function GetBackColor: TAlphaColor;
    procedure SetBackColor(const BackColor_: TAlphaColor);
    procedure DrawBegin(const Canvas_: TCanvas); override;
    procedure DrawMain(const Canvas_: TCanvas); override;
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    property Stroke: TStrokeBrush read GetStroke;
    property Filler: TBrush read GetFiller;
    property BackColor: TAlphaColor read GetBackColor write SetBackColor;
  end;

  TDrawKnot = class(TDrawNode)
  private
    _State: TCanvasSaveState;
  protected
    _Opacity: Single;
    _Stroke: TStrokeBrush;
    _Filler: TBrush;
    function GetOpacity: Single; virtual;
    procedure SetOpacity(const Opacity_: Single); virtual;
    function GetStroke: TStrokeBrush; override;
    procedure SetStroke(const Stroke_: TStrokeBrush); override;
    function GetFiller: TBrush; override;
    procedure SetFiller(const Filler_: TBrush); override;
    procedure DrawBegin(const Canvas_: TCanvas); override;
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    property Opacity: Single read GetOpacity write SetOpacity;
    procedure Draw(const Canvas_: TCanvas); override;
  end;

  TDrawShape = class(TDrawKnot)
  private
  protected
    _RelaPose: TMatrix;
    function GetRelaPose: TMatrix; override;
    procedure SetRelaPose(const RelaPose_: TMatrix); override;
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
  end;

  TDrawCamera = class(TDrawShape)
  private
  protected
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    procedure Render(const Canvas_: TCanvas);
  end;

  TDrawCopys = class(TDrawShape)
  private
  protected
    _Poses: TArray<TMatrix>;
    function GetPoses(const I_: Integer): TMatrix;
    procedure SetPoses(const I_: Integer; const Poses_: TMatrix);
    function GetPosesN: Integer;
    procedure SetPosesN(const PosesN_: Integer);
    procedure DrawMain(const Canvas_: TCanvas); override;
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    property Poses[const I_: Integer]: TMatrix read GetPoses write SetPoses;
    property PosesN: Integer read GetPosesN write SetPosesN;
  end;

  TDrawPosCopys = class(TDrawShape)
  private
  protected
    _Poses: TArray<TSingle2D>;
    function GetPoses(const I_: Integer): TSingle2D;
    procedure SetPoses(const I_: Integer; const Poses_: TSingle2D);
    function GetPosesN: Integer;
    procedure SetPosesN(const PosesN_: Integer);
    procedure DrawMain(const Canvas_: TCanvas); override;
  public
    constructor Create; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    property Poses[const I_: Integer]: TSingle2D read GetPoses write SetPoses;
    property PosesN: Integer read GetPosesN write SetPosesN;
  end;

implementation

uses
  System.Math;

function TDrawNode.GetRelaArea: TSingleArea2D;
begin
  Result := _RelaArea;
end;

procedure TDrawNode.SetRelaArea(const RelaArea_: TSingleArea2D);
begin
  _RelaArea := RelaArea_;
end;

// ------------------------------------------------------------------------------

function TDrawNode.GetAbsoPose: TMatrix;
begin
  Result := Paren.AbsoPose * RelaPose;
end;

procedure TDrawNode.SetAbsoPose(const AbsoPose_: TMatrix);
begin
  RelaPose := Paren.AbsoPose.Inverse * AbsoPose_;
end;

// ------------------------------------------------------------------------------

function TDrawNode.GetRelaPosi: TSingle2D;
begin
  Result.X := RelaPose.m31;
  Result.Y := RelaPose.m32;
end;

procedure TDrawNode.SetRelaPosi(const RelaPosi_: TSingle2D);
var
  M: TMatrix;
begin
  M := RelaPose;

  M.m31 := RelaPosi_.X;
  M.m32 := RelaPosi_.Y;

  RelaPose := M;
end;

// ------------------------------------------------------------------------------

function TDrawNode.GetStroke: TStrokeBrush;
begin
  Result := nil;
end;

procedure TDrawNode.SetStroke(const Stroke_: TStrokeBrush);
begin

end;

// ------------------------------------------------------------------------------

function TDrawNode.GetFiller: TBrush;
begin
  Result := nil;
end;

procedure TDrawNode.SetFiller(const Filler_: TBrush);
begin

end;

procedure TDrawNode.DrawBegin(const Canvas_: TCanvas);
begin

end;

procedure TDrawNode.DrawMain(const Canvas_: TCanvas);
begin

end;

procedure TDrawNode.DrawEnd(const Canvas_: TCanvas);
var
  I: Integer;
begin
  for I := 0 to ChildsN - 1 do
    Childs[I].Draw(Canvas_);
end;

constructor TDrawNode.Create;
begin
  inherited;

end;

procedure TDrawNode.AfterConstruction;
begin
  inherited;

  Area := TSingleArea2D.Create(-1, -1, +1, +1);
end;

destructor TDrawNode.Destroy;
begin

  inherited;
end;

procedure TDrawNode.Draw(const Canvas_: TCanvas);
begin
  DrawBegin(Canvas_);
  DrawMain(Canvas_);
  DrawEnd(Canvas_);
end;

function TDrawRoot.GetStroke: TStrokeBrush;
begin
  Result := nil;
end;

// ------------------------------------------------------------------------------

function TDrawRoot.GetFiller: TBrush;
begin
  Result := nil;
end;

// ------------------------------------------------------------------------------

function TDrawRoot.GetRelaPose: TMatrix;
begin
  Result := TMatrix.Identity;
end;

procedure TDrawRoot.SetRelaPose(const RelaPose_: TMatrix);
begin

end;

// ------------------------------------------------------------------------------

function TDrawRoot.GetAbsoPose: TMatrix;
begin
  Result := RelaPose;
end;

procedure TDrawRoot.SetAbsoPose(const AbsoPose_: TMatrix);
begin

end;

constructor TDrawRoot.Create;
begin
  inherited;

end;

procedure TDrawRoot.AfterConstruction;
begin
  inherited;

end;

destructor TDrawRoot.Destroy;
begin

  inherited;
end;

function TDrawScene.GetStroke: TStrokeBrush;
begin
  Result := _Stroke;
end;

procedure TDrawScene.SetStroke(const Stroke_: TStrokeBrush);
begin

end;

// ------------------------------------------------------------------------------

function TDrawScene.GetFiller: TBrush;
begin
  Result := _Filler;
end;

procedure TDrawScene.SetFiller(const Filler_: TBrush);
begin

end;

// ------------------------------------------------------------------------------

function TDrawScene.GetBackColor: TAlphaColor;
begin
  Result := _BackColor;
end;

procedure TDrawScene.SetBackColor(const BackColor_: TAlphaColor);
begin
  _BackColor := BackColor_;
end;

procedure TDrawScene.DrawBegin(const Canvas_: TCanvas);
begin
  with Canvas_ do
  begin
    Stroke.Assign(_Stroke);
    Fill.Assign(_Filler);
  end;
end;

procedure TDrawScene.DrawMain(const Canvas_: TCanvas);
begin
  inherited;

  Canvas_.Clear(_BackColor);
end;

constructor TDrawScene.Create;
begin
  inherited;

  _Stroke := TStrokeBrush.Create(TBrushKind.Solid, TAlphaColors.Black);
  _Filler := TBrush.Create(TBrushKind.Solid, TAlphaColors.White);
end;

procedure TDrawScene.AfterConstruction;
begin
  inherited;

  with Stroke do
  begin
    Join := TStrokeJoin.Round;
    Thickness := 0.02;
  end;

  BackColor := TAlphaColors.White;
end;

destructor TDrawScene.Destroy;
begin
  _Stroke.Free;
  _Filler.Free;

  inherited;
end;

function TDrawKnot.GetOpacity: Single;
begin
  Result := _Opacity;
end;

procedure TDrawKnot.SetOpacity(const Opacity_: Single);
begin
  _Opacity := Opacity_;
end;

// ------------------------------------------------------------------------------

function TDrawKnot.GetStroke: TStrokeBrush;
begin
  if Assigned(_Stroke) then
    Result := _Stroke
  else
    Result := Paren.Stroke;
end;

procedure TDrawKnot.SetStroke(const Stroke_: TStrokeBrush);
begin
  _Stroke := Stroke_;
end;

// ------------------------------------------------------------------------------

function TDrawKnot.GetFiller: TBrush;
begin
  if Assigned(_Filler) then
    Result := _Filler
  else
    Result := Paren.Filler;
end;

procedure TDrawKnot.SetFiller(const Filler_: TBrush);
begin
  _Filler := Filler_;
end;

procedure TDrawKnot.DrawBegin(const Canvas_: TCanvas);
begin
  inherited;

  with Canvas_ do
  begin
    MultiplyMatrix(RelaPose);

    if Assigned(_Stroke) then
      Stroke.Assign(_Stroke);
    if Assigned(_Filler) then
      Fill.Assign(_Filler);
  end;
end;

constructor TDrawKnot.Create;
begin
  inherited;

  _State := TCanvasSaveState.Create;

  _Stroke := nil;
  _Filler := nil;
end;

procedure TDrawKnot.AfterConstruction;
begin
  inherited;

  Opacity := 1;
end;

destructor TDrawKnot.Destroy;
begin
  if Assigned(_Stroke) then
    _Stroke.Free;
  if Assigned(_Filler) then
    _Filler.Free;

  _State.Free;

  inherited;
end;

procedure TDrawKnot.Draw(const Canvas_: TCanvas);
begin
  _State.Assign(Canvas_);

  inherited;

  Canvas_.Assign(_State);
end;

function TDrawShape.GetRelaPose: TMatrix;
begin
  Result := _RelaPose;
end;

procedure TDrawShape.SetRelaPose(const RelaPose_: TMatrix);
begin
  _RelaPose := RelaPose_;
end;

constructor TDrawShape.Create;
begin
  inherited;

end;

procedure TDrawShape.AfterConstruction;
begin
  inherited;

  RelaPose := TMatrix.Identity;
end;

destructor TDrawShape.Destroy;
begin

  inherited;
end;

constructor TDrawCamera.Create;
begin
  inherited;

end;

procedure TDrawCamera.AfterConstruction;
begin
  inherited;

  Area := TSingleArea2D.Create(-10, -10, +10, +10);
end;

destructor TDrawCamera.Destroy;
begin

  inherited;
end;

procedure TDrawCamera.Render(const Canvas_: TCanvas);
begin
  Canvas_.MultiplyMatrix(AbsoPose.Inverse);

  (Self.RootNode as TDrawScene).Draw(Canvas_);
end;

function TDrawCopys.GetPoses(const I_: Integer): TMatrix;
begin
  Result := _Poses[I_];
end;

procedure TDrawCopys.SetPoses(const I_: Integer; const Poses_: TMatrix);
begin
  _Poses[I_] := Poses_;
end;

function TDrawCopys.GetPosesN: Integer;
begin
  Result := Length(_Poses);
end;

procedure TDrawCopys.SetPosesN(const PosesN_: Integer);
var
  I: Integer;
begin
  SetLength(_Poses, PosesN_);

  for I := 0 to PosesN - 1 do
    _Poses[I] := TMatrix.Identity;
end;

procedure TDrawCopys.DrawMain(const Canvas_: TCanvas);
var
  M: TMatrix;
  I: Integer;
begin
  inherited;

  M := Canvas_.Matrix;

  for I := 0 to PosesN - 1 do
  begin
    Canvas_.SetMatrix(_Poses[I] * M);

    DrawEnd(Canvas_);
  end;
end;

constructor TDrawCopys.Create;
begin
  inherited;

end;

procedure TDrawCopys.AfterConstruction;
begin
  inherited;

  PosesN := 1;
end;

destructor TDrawCopys.Destroy;
begin

  inherited;
end;

function TDrawPosCopys.GetPoses(const I_: Integer): TSingle2D;
begin
  Result := _Poses[I_];
end;

procedure TDrawPosCopys.SetPoses(const I_: Integer; const Poses_: TSingle2D);
begin
  _Poses[I_] := Poses_;
end;

function TDrawPosCopys.GetPosesN: Integer;
begin
  Result := Length(_Poses);
end;

procedure TDrawPosCopys.SetPosesN(const PosesN_: Integer);
begin
  SetLength(_Poses, PosesN_);
end;

procedure TDrawPosCopys.DrawMain(const Canvas_: TCanvas);
var
  M: TMatrix;
  I: Integer;
begin
  inherited;

  M := Canvas_.Matrix;

  for I := 0 to PosesN - 1 do
  begin
    with _Poses[I] do
      Canvas_.SetMatrix(TMatrix.CreateTranslation(X, Y) * M);

    DrawEnd(Canvas_);
  end;
end;

//-------------------------------------------------------------------------

constructor TDrawPosCopys.Create;
begin
  inherited;

end;

procedure TDrawPosCopys.AfterConstruction;
begin
  inherited;

  PosesN := 1;
end;

destructor TDrawPosCopys.Destroy;
begin

  inherited;
end;

end.
