unit LUX.Color.Grid.D2;

interface  

uses System.UITypes,
     FMX.Graphics,
     LUX,
     LUX.Data.Grid.T2,
     LUX.Color;

type  

      

     

     //  TPoinColorGrid2D<_TItem_>

     TPoinColorGrid2D<_TItem_> = class( TPoinArray2D<_TItem_> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TAlphaColor> ); overload;
       procedure DrawFrom( const BMP_:TBitmap; const Func_:TConstFunc<TAlphaColor,_TItem_> ); overload;
     public
     end;

     //  TCellColorGrid2D<_TItem_>

     TCellColorGrid2D<_TItem_> = class( TCellArray2D<_TItem_> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TAlphaColor> ); overload;
       procedure DrawFrom( const BMP_:TBitmap; const Func_:TConstFunc<TAlphaColor,_TItem_> ); overload;
     public
     end;



 

//  

implementation //=========================================

uses System.Threading;

//  

//  

//TPoinColorGrid2D<_TItem_>





//-------------------------------------------------------

procedure TPoinColorGrid2D<_TItem_>.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TAlphaColor> );
var
   B :TBitmapData;
begin
     BMP_.SetSize( PoinsX, PoinsY );

     BMP_.Map( TMapAccess.Write, B );

     TParallel.For( 0, PoinsY-1, procedure( Y:Integer )
     var
        P :PAlphaColor;
        X :Integer;
     begin
          P := B.GetScanline( Y );

          for X := 0 to PoinsX-1 do
          begin
               P^ := Func_( X, Y );  Inc( P );
          end;
     end );

     BMP_.Unmap( B );
end;

procedure TPoinColorGrid2D<_TItem_>.DrawFrom( const BMP_:TBitmap; const Func_:TConstFunc<TAlphaColor,_TItem_> );
var
   B :TBitmapData;
begin
     PoinsX := BMP_.Width ;
     PoinsY := BMP_.Height;

     BMP_.Map( TMapAccess.Read, B );

     TParallel.For( 0, PoinsY-1, procedure( Y:Integer )
     var
        P :PAlphaColor;
        X :Integer;
     begin
          P := B.GetScanline( Y );

          for X := 0 to PoinsX-1 do
          begin
               Poins[ X, Y ] := Func_( P^ );  Inc( P );
          end;
     end );

     BMP_.Unmap( B );
end;



//TCellColorGrid2D





//-------------------------------------------------------

procedure TCellColorGrid2D<_TItem_>.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TAlphaColor> );
var
   B :TBitmapData;
begin
     BMP_.SetSize( CellsX, CellsY );

     BMP_.Map( TMapAccess.Write, B );

     TParallel.For( 0, CellsY-1, procedure( Y:Integer )
     var
        P :PAlphaColor;
        X :Integer;
     begin
          P := B.GetScanline( Y );

          for X := 0 to CellsX-1 do
          begin
               P^ := Func_( X, Y );  Inc( P );
          end;
     end );

     BMP_.Unmap( B );
end;


procedure TCellColorGrid2D<_TItem_>.DrawFrom( const BMP_:TBitmap; const Func_:TConstFunc<TAlphaColor,_TItem_> );
var
   B :TBitmapData;
begin
     CellsX := BMP_.Width ;
     CellsY := BMP_.Height;

     BMP_.Map( TMapAccess.Read, B );

     TParallel.For( 0, CellsY-1, procedure( Y:Integer )
     var
        P :PAlphaColor;
        X :Integer;
     begin
          P := B.GetScanline( Y );

          for X := 0 to CellsX-1 do
          begin
               Cells[ X, Y ] := Func_( P^ );  Inc( P );
          end;
     end );

     BMP_.Unmap( B );
end;



//  

// 

initialization //===================== 


finalization // 

end.
