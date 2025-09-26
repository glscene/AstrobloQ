unit Bio.Force;
(*
  Position modifier
*)
interface

uses
  System.SysUtils,
  System.Math,
  Stage.VectorTypes,
  Stage.VectorGeometry,

  Bio.BaseObject,
  Bio.Coordinates;

type

  // ----------------------------------------------------------------------------
  TaiForce = class(TObject)
  private
    fDeltaX: single;
    fDeltaY: single;
    fDeltaHeight: single;
  public
    // set the force (=)
    procedure SetForce(aDeltaX: single; aDeltaY: single; aDeltaHeight: single); overload;
    procedure SetAngularForce(aXYAngle: single; aHeightAngle: single; aStrength: single);
    procedure SetForce(aVector: TAffineVector); overload;
    // modify the components
    procedure AlterDeltaX(aAmount: single);
    procedure AlterDeltaY(aAmount: single);
    procedure AlterDeltaHeight(aAmount: single);
    // add a force (+)
    procedure ApplyForce(aForce: TaiForce); overload;
    procedure ApplyForce(aDeltaX: single; aDeltaY: single; aDeltaHeight: single); overload;
    procedure ApplyForce(aForce: TAffineVector); overload;
    procedure ApplyAngularForce(aXYAngle: single; aHeightAngle: single; aStrength: single);
      overload;
    procedure ApplyAngularForce(aXYAngle: single; aStrength: single); overload;
    procedure ApplyOppositeForce(aForce: TaiForce);
    // apply a force, accounting for mass
    procedure ApplyMassiveForce(aForce: TaiForce; aMass: single);
    // weakens the force towards 0
    procedure ApplyNeutralizingAngularForce(aXYAngle: single; aHeightAngle: single;
      aStrength: single);
    procedure ApplyNeutralizingForce(aForce: TaiForce);
    procedure Zero; // sets force to 0
    procedure Zero2; // sets force to 0
    function Stale: boolean; // true if strenght = 0
    procedure Shrink(aAmount: single);
    procedure Scale(aFactor: single);
    procedure XYScale(aFactor: single);
    procedure LimitForce;
    procedure LimitSpeed(aMax: single);
    function Length: single;
    procedure Invert;
    procedure InvertXY;
    procedure InvertY;
    procedure InvertX;
    procedure InvertHeight;
    function Strength: single;
    function XYStrength: single;
    function Valid: boolean;
    procedure ReverseY;
    function AsAffineVector: TAffineVector;
    procedure CopyFrom(aForce: TaiForce);
    function OneLineDisplay: string;
    procedure SaveToFile(var aFile: TextFile);
    procedure LoadFromFile(var aFile: TextFile);
    // property
    property DeltaX: single read fDeltaX write fDeltaX;
    property DeltaY: single read fDeltaY write fDeltaY;
    property DeltaHeight: single read fDeltaHeight write fDeltaHeight;
  end;

implementation //=============================================================

uses
  Bio.Globals,
  Bio.Utilities,
  Bio.Things,
  Bio.Grid;

// ----------------------------------------------------------------------------
procedure TaiForce.CopyFrom(aForce: TaiForce);
begin
  fDeltaX := aForce.DeltaX;
  fDeltaY := aForce.DeltaY;
  fDeltaHeight := aForce.DeltaHeight;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.SetForce(aDeltaX: single; aDeltaY: single; aDeltaHeight: single);
begin
  fDeltaX := aDeltaX;
  fDeltaY := aDeltaY;
  fDeltaHeight := aDeltaHeight;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.SetForce(aVector: TAffineVector);
begin
  fDeltaX := aVector.X;
  fDeltaY := aVector.Y;
  fDeltaHeight := aVector.Z;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.SetAngularForce(aXYAngle: single; aHeightAngle: single; aStrength: single);
begin
  fDeltaX := cos(aXYAngle) * sin(aHeightAngle) * aStrength;
  fDeltaY := sin(aXYAngle) * sin(aHeightAngle) * aStrength;
  fDeltaHeight := cos(aHeightAngle) * aStrength;
  { fDeltaX := cos(aXYAngle) * aStrength;
    fDeltaY := sin(aXYAngle) * aStrength;
    fDeltaHeight := cos(aHeightAngle) * sin(aHeightAngle) * aStrength; }
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyAngularForce(aXYAngle: single; aHeightAngle: single; aStrength: single);
begin
  fDeltaX := fDeltaX + cos(aXYAngle) * sin(aHeightAngle) * aStrength;
  fDeltaY := fDeltaY + sin(aXYAngle) * sin(aHeightAngle) * aStrength;
  fDeltaHeight := fDeltaHeight + cos(aHeightAngle) * aStrength;
  { fDeltaX := fDeltaX + cos(aXYAngle) * aStrength;
    fDeltaY := fDeltaY + sin(aXYAngle) * aStrength;
    fDeltaHeight := fDeltaHeight + cos(aHeightAngle) * sin(aHeightAngle) * aStrength;
  }
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyAngularForce(aXYAngle: single; aStrength: single);
begin
  fDeltaX := fDeltaX + cos(aXYAngle) * aStrength;
  fDeltaY := fDeltaY + sin(aXYAngle) * aStrength;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyForce(aForce: TaiForce);
begin
  fDeltaX := fDeltaX + aForce.DeltaX;
  fDeltaY := fDeltaY + aForce.DeltaY;
  fDeltaHeight := fDeltaHeight + aForce.DeltaHeight;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyOppositeForce(aForce: TaiForce);
begin
  fDeltaX := fDeltaX - aForce.DeltaX;
  fDeltaY := fDeltaY - aForce.DeltaY;
  fDeltaHeight := fDeltaHeight - aForce.DeltaHeight;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyForce(aDeltaX: single; aDeltaY: single; aDeltaHeight: single);
begin
  fDeltaX := fDeltaX + aDeltaX;
  fDeltaY := fDeltaY + aDeltaY;
  fDeltaHeight := fDeltaHeight + aDeltaHeight;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyForce(aForce: TAffineVector);
begin
  fDeltaX := fDeltaX + aForce.X;
  fDeltaY := fDeltaY + aForce.Y;
  fDeltaHeight := fDeltaHeight + aForce.Z;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.Zero;
begin
  fDeltaX := 0.0; // crashed here once twice
  fDeltaY := 0.0;
  fDeltaHeight := 0.0;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.Zero2;
begin
  fDeltaX := 0.0; // crashed here once twice
  fDeltaY := 0.0;
  fDeltaHeight := 0.0;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyNeutralizingForce(aForce: TaiForce);
begin
  fDeltaX := AdjustValue(fDeltaX, 0.0, aForce.DeltaX);
  fDeltaY := AdjustValue(fDeltaY, 0.0, aForce.DeltaY);
  fDeltaHeight := AdjustValue(fDeltaHeight, 0.0, aForce.DeltaHeight);
end;

// ----------------------------------------------------------------------------
procedure TaiForce.Scale(aFactor: single);
begin
  fDeltaX := fDeltaX * aFactor;
  fDeltaY := fDeltaY * aFactor;
  fDeltaHeight := fDeltaHeight * aFactor;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.XYScale(aFactor: single);
begin
  fDeltaX := fDeltaX * aFactor;
  fDeltaY := fDeltaY * aFactor;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyNeutralizingAngularForce(aXYAngle: single; aHeightAngle: single;
  aStrength: single);
var
  dX, dY, dH: single;
begin
  dX := cos(aXYAngle) * aStrength;
  dY := sin(aXYAngle) * aStrength;
  dH := cos(aHeightAngle) * sin(aHeightAngle) * aStrength;

  fDeltaX := AdjustValue(fDeltaX, 0.0, dX);
  fDeltaY := AdjustValue(fDeltaY, 0.0, dY);
  fDeltaHeight := AdjustValue(fDeltaHeight, 0.0, dH);
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ReverseY;
begin
  fDeltaY := fDeltaY * -1.0;
end;

// ----------------------------------------------------------------------------
function TaiForce.Strength: single;
begin
  result := abs(fDeltaX) + abs(fDeltaY) + abs(fDeltaHeight);
end;

// ----------------------------------------------------------------------------
function TaiForce.XYStrength: single;
begin
  result := abs(fDeltaX) + abs(fDeltaY);
end;

// ----------------------------------------------------------------------------
procedure TaiForce.Invert;
begin
  fDeltaX := fDeltaX * -1.0;
  fDeltaY := fDeltaY * -1.0;
  fDeltaHeight := fDeltaHeight * -1.0;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.InvertXY;
begin
  fDeltaX := fDeltaX * -1.0;
  fDeltaY := fDeltaY * -1.0;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.InvertY;
begin
  fDeltaY := fDeltaY * -1.0;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.InvertX;
begin
  fDeltaX := fDeltaX * -1.0;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.InvertHeight;
begin
  fDeltaHeight := fDeltaHeight * -1.0;
end;

// ----------------------------------------------------------------------------
function TaiForce.OneLineDisplay: string;
begin
  result := Format('dX=%0.2f, dY=%0.2f, dH=%0.2f', [fDeltaX, fDeltaY, fDeltaHeight]);
end;

// ----------------------------------------------------------------------------
procedure TaiForce.SaveToFile(var aFile: TextFile);
begin
  writeln(aFile, fDeltaX);
  writeln(aFile, fDeltaY);
  writeln(aFile, fDeltaHeight);
end;

// ----------------------------------------------------------------------------
procedure TaiForce.LoadFromFile(var aFile: TextFile);
begin
  readln(aFile, fDeltaX);
  readln(aFile, fDeltaY);
  readln(aFile, fDeltaHeight);
end;

// ----------------------------------------------------------------------------
procedure TaiForce.ApplyMassiveForce(aForce: TaiForce; aMass: single);
begin
  if not(aForce.DeltaX = 0.0) then
    fDeltaX := fDeltaX + aForce.DeltaX / aMass;

  if not(aForce.DeltaY = 0.0) then
    fDeltaY := fDeltaY + aForce.DeltaY / aMass;

  if not(aForce.DeltaHeight = 0.0) then
    fDeltaHeight := fDeltaHeight + aForce.DeltaHeight / aMass;
end;

// ----------------------------------------------------------------------------
function TaiForce.Stale: boolean;
begin
  result := ((fDeltaX = 0.0) and (fDeltaY = 0.0) and (fDeltaHeight = 0.0));
end;

// ----------------------------------------------------------------------------
procedure TaiForce.LimitForce;
begin
  if (fDeltaX > 5.0) then
    fDeltaX := 5.0;
  if (fDeltaX < -5.0) then
    fDeltaX := -5.0;

  if (fDeltaY > 5.0) then
    fDeltaY := 5.0;
  if (fDeltaY < -5.0) then
    fDeltaY := -5.0;

  if (fDeltaHeight > 5.0) then
    fDeltaHeight := 5.0;
  if (fDeltaHeight < -5.0) then
    fDeltaHeight := -5.0;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.Shrink(aAmount: single);
var
  n: TAffineVector;
begin
  n.X := fDeltaX;
  n.Y := fDeltaY;
  n.Z := fDeltaHeight;
  NormalizeVector(n);
  ScaleVector(n, aAmount);

  if abs(n.X) < abs(fDeltaX) then
  begin
    fDeltaX := fDeltaX - n.X;
    fDeltaY := fDeltaY - n.Y;
    fDeltaHeight := fDeltaHeight - n.Z;
  end
  else
  begin
    fDeltaX := 0.0;
    fDeltaY := 0.0;
    fDeltaHeight := 0.0;
  end;
end;

// ----------------------------------------------------------------------------
function TaiForce.Length: single;
begin
  result := sqrt(fDeltaX * fDeltaX + fDeltaY * fDeltaY + fDeltaHeight * fDeltaHeight);
end;

// ----------------------------------------------------------------------------
function TaiForce.AsAffineVector: TAffineVector;
begin
  result.X := fDeltaX;
  result.Y := fDeltaY;
  result.Z := fDeltaHeight;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.LimitSpeed(aMax: single);
var
  mySpeed: single;
begin
  mySpeed := Length;

  if mySpeed > aMax then
  begin
    fDeltaX := (fDeltaX / mySpeed) * aMax;
    fDeltaY := (fDeltaY / mySpeed) * aMax;
    fDeltaHeight := (fDeltaHeight / mySpeed) * aMax;
  end;
end;

// ----------------------------------------------------------------------------
function TaiForce.Valid: boolean;
begin
  result := not(IsNan(fDeltaX) or IsNan(fDeltaY) or IsNan(fDeltaHeight));
end;

// ----------------------------------------------------------------------------
procedure TaiForce.AlterDeltaX(aAmount: single);
begin
  DeltaX := DeltaX + aAmount;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.AlterDeltaY(aAmount: single);
begin
  DeltaY := DeltaY + aAmount;
end;

// ----------------------------------------------------------------------------
procedure TaiForce.AlterDeltaHeight(aAmount: single);
begin
  DeltaHeight := DeltaHeight + aAmount;
end;

end.
