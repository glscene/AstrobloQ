unit LUX.GenPoints;

interface

uses
  LUX;

type
  TGenPoints = class
  private
    procedure MakePoins;
  protected
    _MinI: Integer;
    _MaxI: Integer;
    _MinY: Single;
    _MaxY: Single;
    _Verts: TArray2<Single>;
    function GetMinI: Integer;
    procedure SetMinI(const MinI_: Integer);
    function GetMaxI: Integer;
    procedure SetMaxI(const MaxI_: Integer);
    function GetMinY: Single;
    procedure SetMinY(const MinY_: Single);
    function GetMaxY: Single;
    procedure SetMaxY(const MaxY_: Single);
    function GetVerts(const Y_, X_: Integer): Single;
    procedure SetVerts(const Y_, X_: Integer; const Verts_: Single);
  public
    constructor Create;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    property MinI: Integer read GetMinI write SetMinI;
    property MaxI: Integer read GetMaxI write SetMaxI;
    property MinY: Single read GetMinY write SetMinY;
    property MaxY: Single read GetMaxY write SetMaxY;
    property Verts[const X_, Y_: Integer]: Single read GetVerts write SetVerts;
    function Poins(const I_: Integer; const Td_: Single): Single;
    procedure Next;
  end;

implementation  //============================================================

uses
  LUX.Curve.BSpline;

// ----------------------------------------------------------------------------
procedure TGenPoints.MakePoins;
var
  I: Integer;
  W: Single;
begin
  SetLength(_Verts, 4, MaxI - MinI + 1);

  W := _MaxY - _MinY;

  for I := MinI to MaxI do
  begin
    Verts[-1, I] := W * Random + _MinY;
    Verts[0, I] := W * Random + _MinY;
    Verts[+1, I] := W * Random + _MinY;
    Verts[+2, I] := W * Random + _MinY;
  end;
end;

// ----------------------------------------------------------------------------
function TGenPoints.GetMinI: Integer;
begin
  Result := _MinI;
end;

// ----------------------------------------------------------------------------
procedure TGenPoints.SetMinI(const MinI_: Integer);
begin
  _MinI := MinI_;
  MakePoins;
end;

// ----------------------------------------------------------------------------
function TGenPoints.GetMaxI: Integer;
begin
  Result := _MaxI;
end;

// ----------------------------------------------------------------------------
procedure TGenPoints.SetMaxI(const MaxI_: Integer);
begin
  _MaxI := MaxI_;
  MakePoins;
end;

// ----------------------------------------------------------------------------
function TGenPoints.GetMinY: Single;
begin
  Result := _MinY;
end;

// ----------------------------------------------------------------------------
procedure TGenPoints.SetMinY(const MinY_: Single);
begin
  _MinY := MinY_;
  MakePoins;
end;

// ----------------------------------------------------------------------------
function TGenPoints.GetMaxY: Single;
begin
  Result := _MaxY;
end;

// ----------------------------------------------------------------------------
procedure TGenPoints.SetMaxY(const MaxY_: Single);
begin
  _MaxY := MaxY_;
  MakePoins;
end;

// ----------------------------------------------------------------------------
function TGenPoints.GetVerts(const Y_, X_: Integer): Single;
begin
  Result := _Verts[1 + Y_, X_ - _MinI];
end;

// ----------------------------------------------------------------------------
procedure TGenPoints.SetVerts(const Y_, X_: Integer; const Verts_: Single);
begin
  _Verts[1 + Y_, X_ - _MinI] := Verts_;
end;

// ----------------------------------------------------------------------------
constructor TGenPoints.Create;
begin
  inherited;

end;

// ----------------------------------------------------------------------------
procedure TGenPoints.AfterConstruction;
begin
  inherited;

  MinI := 0;
  MaxI := 8;

  MinY := -1.5;
  MaxY := +1.5;
end;

// ----------------------------------------------------------------------------
destructor TGenPoints.Destroy;
begin

  inherited;
end;

// ----------------------------------------------------------------------------
function TGenPoints.Poins(const I_: Integer; const Td_: Single): Single;
begin
  Result := BSpline4(Verts[-1, I_], Verts[0, I_], Verts[+1, I_],
    Verts[+2, I_], Td_);
end;

// ----------------------------------------------------------------------------
procedure TGenPoints.Next;
var
  I: Integer;
  W: Single;
begin
  W := _MaxY - _MinY;

  for I := MinI to MaxI do
  begin
    Verts[-1, I] := Verts[0, I];
    Verts[0, I] := Verts[+1, I];
    Verts[+1, I] := Verts[+2, I];
    Verts[+2, I] := W * Random + _MinY;
  end;
end;

initialization // -------------------------------------------------------------

finalization

end.
