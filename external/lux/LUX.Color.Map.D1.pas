unit LUX.Color.Map.D1;

interface

uses
  System.UITypes,
  FMX.Graphics,
  LUX, LUX.Color;

type

  TGradation1D = class
  private
  protected
    _Colors: TArray<TSingleRGBA>;
    _ColorsN: Integer;
    function GetColors(const I_: Integer): TSingleRGBA;
    procedure SetColors(const I_: Integer; const Colors_: TSingleRGBA);
    procedure SetColorsN(const ColorsN_: Integer);
  public
    constructor Create; overload;
    constructor Create(const FileName_: String); overload;
    destructor Destroy; override;
    property Colors[const I_: Integer]: TSingleRGBA read GetColors
      write SetColors;
    property ColorsN: Integer read _ColorsN write SetColorsN;
    procedure LoadFromBitmap(const Bitmap_: TBitmap);
    procedure LoadFromFile(const FileName_: String);
    function Interp(const X_: Single): TSingleRGBA;
  end;

implementation

uses
  System.Math;

function TGradation1D.GetColors(const I_: Integer): TSingleRGBA;
begin
  Result := _Colors[I_];
end;

procedure TGradation1D.SetColors(const I_: Integer; const Colors_: TSingleRGBA);
begin
  _Colors[I_] := Colors_;
end;

procedure TGradation1D.SetColorsN(const ColorsN_: Integer);
begin
  _ColorsN := ColorsN_;
  SetLength(_Colors, _ColorsN);
end;

constructor TGradation1D.Create;
begin
  inherited;

end;

constructor TGradation1D.Create(const FileName_: String);
begin
  Create;
  LoadFromFile(FileName_);
end;

destructor TGradation1D.Destroy;
begin
  inherited;
end;

procedure TGradation1D.LoadFromBitmap(const Bitmap_: TBitmap);
var
  B: TBitmapData;
  I: Integer;
  P: PAlphaColor;
begin
  Bitmap_.Map(TMapAccess.Read, B);

  ColorsN := Bitmap_.Width;

  P := B.GetScanline(0);
  for I := 0 to _ColorsN - 1 do
  begin
    _Colors[I] := P^;
    Inc(P);
  end;

  Bitmap_.Unmap(B);
end;

procedure TGradation1D.LoadFromFile(const FileName_: String);
var
  B: TBitmap;
begin
  B := TBitmap.Create;

  B.LoadFromFile(FileName_);

  LoadFromBitmap(B);

  B.Free;
end;

//-------------------------------------------------------------------------
function TGradation1D.Interp(const X_: Single): TSingleRGBA;
var
  Xi: Integer;
  X, Xd: Single;
  C0, C1: TSingleRGBA;
begin
  if X_ <= 0 then
    Result := _Colors[0]
  else if X_ >= 1 then
    Result := _Colors[_ColorsN - 1]
  else
  begin
    X := (_ColorsN - 1) * X_;

    Xi := Floor(X);
    Xd := X - Xi;

    C0 := _Colors[Xi];
    C1 := _Colors[Xi + 1];

    Result := (C1 - C0) * Xd + C0;
  end;
end;

initialization

finalization

end.
