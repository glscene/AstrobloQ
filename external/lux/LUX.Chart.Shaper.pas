unit LUX.Chart.Shaper;

interface  

uses System.Types, System.UITypes,
     FMX.Controls, FMX.Graphics,
     LUX, LUX.D1, LUX.D2,
     LUX.FMX.Graphics,
     LUX.Chart.Viewer;

type  

     TChartPoin = class;
     TChartCurv = class;
     TChartScal = class;
       TChartScaX = class;
       TChartScaY = class;

     //  TChartPoin

     TChartPoin = class( TChartNode )
     private
     protected
       _Pos    :TSingle2D;
       _Radius :Single;
       _Border :Single;
       
       function GetPos :TSingle2D;
       procedure SetPos( const Pos_:TSingle2D );
       function GetRadius :Single;
       procedure SetRadius( const Radius_:Single );
       function GetBorder :Single;
       procedure SetBorder( const Border_:Single );
       
       procedure DrawMain; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       
       property Pos    :TSingle2D read GetPos    write SetPos   ;
       property Radius :Single    read GetRadius write SetRadius;
       property Border :Single    read GetBorder write SetBorder;
     end;

     //  TChartCurv

     TChartCurv = class( TChartNode )
     private
       _Path :TPathData;
     protected
       _Poins   :TArray<TSingle2D>;
       _PoinsN  :Integer;
       
       function GetPoins( const I_:Integer ) :TSingle2D;
       procedure SetPoins( const I_:Integer; const Value_:TSingle2D );
       function GetPoinsN :Integer;
       procedure SetPoinsN( const ValuesN_:Integer );
       
       procedure DrawMain; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       
       property Poins[ const I_:Integer ] :TSingle2D read GetPoins  write SetPoins ; default;
       property PoinsN                    :Integer   read GetPoinsN write SetPoinsN;
     end;

     //  TChartScal

     TChartScal = class( TChartNode )
     protected
       _Interv :Single;
       
       function GetInterv :Single;
       procedure SetInterv( const Interv_:Single );
     public
       constructor Create; override;
       destructor Destroy; override;
       
       property Interv :Single read GetInterv write SetInterv;
     end;

     //  TChartScaX

     TChartScaX = class( TChartScal )
     protected
       
       procedure DrawMain; override;
     public
       constructor Create; override;
       destructor Destroy; override;
     end;

     //  TChartScaY

     TChartScaY = class( TChartScal )
     protected
       
       procedure DrawMain; override;
     public
       constructor Create; override;
       destructor Destroy; override;
     end;

     //  TChartAxis

     TChartAxis = class( TChartNode )
     protected
       
       procedure DrawMain; override;
     public
       constructor Create; override;
       destructor Destroy; override;
     end;

implementation //=========================================

uses System.Math;

//TChartPoin





//-------------------------------------------------------

function TChartPoin.GetPos :TSingle2D;
begin
     Result := _Pos;
end;

procedure TChartPoin.SetPos( const Pos_:TSingle2D );
begin
     _Pos := Pos_;
end;

//------------------------------------------------------------------------------

function TChartPoin.GetRadius :Single;
begin
     Result := _Radius;
end;

procedure TChartPoin.SetRadius( const Radius_:Single );
begin
     _Radius := Radius_;
end;

function TChartPoin.GetBorder :Single;
begin
     Result := _Border;
end;

procedure TChartPoin.SetBorder( const Border_:Single );
begin
     _Border := Border_;
end;

//-------------------------------------------------------

procedure TChartPoin.DrawMain;
begin
     inherited;

     with Viewer.Canvas do
     begin
          DrawCircle( _Pos, _Radius, _Opacity );
     end;
end;



constructor TChartPoin.Create;
begin
     inherited;

     _Pos    := TSingle2D.Create( 0, 0 );
     _Radius := 5;
     _Border := 0;
end;

destructor TChartPoin.Destroy;
begin

     inherited;
end;

//TChartCurv





//-------------------------------------------------------

function TChartCurv.GetPoins( const I_:Integer ) :TSingle2D;
begin
     Result := _Poins[ I_ ];
end;

procedure TChartCurv.SetPoins( const I_:Integer; const Value_:TSingle2D );
begin
     _Poins[ I_ ] := Value_;
end;

function TChartCurv.GetPoinsN :Integer;
begin
     Result := _PoinsN;
end;

procedure TChartCurv.SetPoinsN( const ValuesN_:Integer );
begin
     _PoinsN := ValuesN_;

     SetLength( _Poins, _PoinsN );
end;



constructor TChartCurv.Create;
begin
     inherited;

     _Path := TPathData.Create;

     PoinsN := 100;
end;

destructor TChartCurv.Destroy;
begin
     _Path.Free ;

     inherited;
end;

//-------------------------------------------------------

procedure TChartCurv.DrawMain;
var
   I :Integer;
begin
     inherited;

     with Viewer do
     begin
          with _Path do
          begin
               Clear;

               MoveTo( PosToScr( _Poins[ 0 ] ) );

               for I := 1 to _PoinsN-1 do LineTo( PosToScr( _Poins[ I ] ) );
          end;

          Canvas.DrawPath( _Path, _Opacity );
     end;
end;

//TChartGrid





//-------------------------------------------------------

function TChartScal.GetInterv :Single;
begin
     Result := _Interv;
end;

procedure TChartScal.SetInterv( const Interv_:Single );
begin
     _Interv := Interv_;
end;



constructor TChartScal.Create;
begin
     inherited;

     _Interv := 0.1;
end;

destructor TChartScal.Destroy;
begin

     inherited;
end;

//TChartScaX





//-------------------------------------------------------



constructor TChartScaX.Create;
begin
     inherited;

end;

destructor TChartScaX.Destroy;
begin

     inherited;
end;

//-------------------------------------------------------

procedure TChartScaX.DrawMain;
var
   I0, I1, I :Integer;
   X :Single;
   P0, P1 :TSingle2D;
begin
     inherited;

     with Viewer do
     begin
          I0 := Ceil ( MinX / _Interv );
          I1 := Floor( MaxX / _Interv );

          P0.Y := MinY;
          P1.Y := MaxY;
          for I := I0 to I1 do
          begin
               X := I * _Interv;

               P0.X := X;
               P1.X := X;

               Canvas.DrawLine( PosToScr( P0 ), PosToScr( P1 ), _Opacity );
          end;
     end;
end;

//TChartScaY





//-------------------------------------------------------



constructor TChartScaY.Create;
begin
     inherited;

end;

destructor TChartScaY.Destroy;
begin

     inherited;
end;

//-------------------------------------------------------

procedure TChartScaY.DrawMain;
var
   I0, I1, I :Integer;
   Y :Single;
   P0, P1 :TSingle2D;
begin
     inherited;

     with Viewer do
     begin
          I0 := Ceil ( MinY / _Interv );
          I1 := Floor( MaxY / _Interv );

          P0.X := MinX;
          P1.X := MaxX;
          for I := I0 to I1 do
          begin
               Y := I * _Interv;

               P0.Y := Y;
               P1.Y := Y;

               Canvas.DrawLine( PosToScr( P0 ), PosToScr( P1 ), _Opacity );
          end;
     end;
end;

//TChartAxis





//-------------------------------------------------------

//-------------------------------------------------------

procedure TChartAxis.DrawMain;
var
   P0, P1 :TSingle2D;
begin
     inherited;

     with Viewer do
     begin
          with Canvas do
          begin
               P0.X := MinX;  P0.Y := 0;
               P1.X := MaxX;  P1.Y := 0;

               DrawLine( PosToScr( P0 ), PosToScr( P1 ), _Opacity );

               P0.X := 0;  P0.Y := MinY;
               P1.X := 0;  P1.Y := MaxY;

               DrawLine( PosToScr( P0 ), PosToScr( P1 ), _Opacity );
          end;
     end;
end;



constructor TChartAxis.Create;
begin
     inherited;

     _Stroke.Color := TAlphaColorF.Create( 1/2, 1/2, 1/2 ).ToAlphaColor;
end;

destructor TChartAxis.Destroy;
begin

     inherited;
end;

end.
