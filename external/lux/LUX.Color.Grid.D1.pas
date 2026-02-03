unit LUX.Color.Grid.D1;

interface  

uses System.UITypes,
     FMX.Graphics,
     LUX,
     LUX.Data.Grid.T1,
     LUX.Color;

type  

      

     

     //  TPoinColorGrid1D<_TItem_>

     TPoinColorGrid1D<_TItem_> = class( TPoinArray1D<_TItem_> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TAlphaColor> ); overload;
     public
     end;

     //  TCellColorGrid1D<_TItem_>

     TCellColorGrid1D<_TItem_> = class( TCellArray1D<_TItem_> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TAlphaColor> ); overload;
     public
     end;



 

//  

implementation // 

//  

//  

//TPoinColorGrid1D<_TItem_>





//-------------------------------------------------------

procedure TPoinColorGrid1D<_TItem_>.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TAlphaColor> );
var
   B :TBitmapData;
   P :PAlphaColor;
   X :Integer;
begin
     BMP_.SetSize( PoinsX, 1 );

     BMP_.Map( TMapAccess.Write, B );

     P := B.GetScanline( 0 );

     for X := 0 to PoinsX-1 do
     begin
          P^ := Func_( X );  Inc( P );
     end;

     BMP_.Unmap( B );
end;



//TCellColorGrid1D





//-------------------------------------------------------

procedure TCellColorGrid1D<_TItem_>.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TAlphaColor> );
var
   B :TBitmapData;
   P :PAlphaColor;
   X :Integer;
begin
     BMP_.SetSize( CellsX, 1 );

     BMP_.Map( TMapAccess.Write, B );

     P := B.GetScanline( 0 );

     for X := 0 to CellsX-1 do
     begin
          P^ := Func_( X );  Inc( P );
     end;

     BMP_.Unmap( B );
end;



//  

// 

initialization // 

finalization // 

end.
