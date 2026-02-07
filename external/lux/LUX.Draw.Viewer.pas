unit LUX.Draw.Viewer;

interface

uses
  System.Types,
  System.UITypes,
  System.Classes,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  LUX,
  LUX.D1,
  LUX.D2,
  LUX.Draw.Scene,
  FMX.Types,
  FMX.Objects;

type

  TDrawViewer = class;

  TDrawViewer = class(TFrame)
  private
  protected
    _Camera: TDrawCamera;
    function GetCamera: TDrawCamera;
    procedure SetCamera(const Camera_: TDrawCamera);
    procedure Paint; override;
  public
    constructor Create(Owner_: TComponent); override;
    destructor Destroy; override;
    property Camera: TDrawCamera read GetCamera write SetCamera;
  end;

implementation //==============================================================

{$R *.fmx}

uses
  System.Math.Vectors;

// ----------------------------------------------------------------------------
function TDrawViewer.GetCamera: TDrawCamera;
begin
  Result := _Camera;
end;

// ----------------------------------------------------------------------------
procedure TDrawViewer.SetCamera(const Camera_: TDrawCamera);
begin
  _Camera := Camera_;
end;

// ----------------------------------------------------------------------------
procedure TDrawViewer.Paint;
var
  V: TVector;
  S: Single;
  M: TMatrix;
begin
  inherited;

  if Assigned(_Camera) then
  begin
    V := LocalToAbsoluteVector(Vector(Width, Height));

    if V.X * _Camera.Area.SizeY <= V.Y * _Camera.Area.SizeX then
    begin
      // ┏━━━┓
      // ┠───┨
      // ┃      ┃
      // ┠───┨
      // ┗━━━┛

      S := V.X / _Camera.Area.SizeX;
    end
    else
    begin
      // ┏┯━┯┓
      // ┃│  │┃
      // ┃│  │┃
      // ┃│  │┃
      // ┗┷━┷┛

      S := V.Y / _Camera.Area.SizeY;
    end;

    with M do
    begin
      m11 := +S;
      m12 := 0;
      m13 := 0;
      m21 := 0;
      m22 := -S;
      m23 := 0;

      m31 := V.X / 2 - S * _Camera.Area.CentX;
      m32 := V.Y / 2 + S * _Camera.Area.CentY;
      m33 := 1;
    end;

    Canvas.MultiplyMatrix(M);

    _Camera.Render(Canvas);
  end;
end;

// ----------------------------------------------------------------------------
constructor TDrawViewer.Create(Owner_: TComponent);
begin
  inherited;
  AutoCapture := True;
  _Camera := nil;
end;

// ----------------------------------------------------------------------------
destructor TDrawViewer.Destroy;
begin
  inherited;
end;

end.
