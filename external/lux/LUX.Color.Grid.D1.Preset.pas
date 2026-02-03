unit LUX.Color.Grid.D1.Preset;

interface  

uses System.UITypes,
     FMX.Graphics,
     LUX, LUX.Color, LUX.Color.Grid.D1;

type  

      

     

     //  TPoinColorGrid1D_TSingleRGB

     TPoinColorGrid1D_TSingleRGB = class( TPoinColorGrid1D<TSingleRGB> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;

     //  TCellColorGrid1D_TSingleRGB

     TCellColorGrid1D_TSingleRGB = class( TCellColorGrid1D<TSingleRGB> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;

     //  TPoinColorGrid1D_TByteRGBE

     TPoinColorGrid1D_TByteRGBE = class( TPoinColorGrid1D<TByteRGBE> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;

     //  TCellColorGrid1D_TByteRGBE

     TCellColorGrid1D_TByteRGBE = class( TCellColorGrid1D<TByteRGBE> )
     private
     protected
       
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;



 

//  

implementation // 

uses System.Threading;

//  

//  

//TPoinColorGrid1D_TSingleRGB





//-------------------------------------------------------

procedure TPoinColorGrid1D_TSingleRGB.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;



//-------------------------------------------------------

procedure TPoinColorGrid1D_TSingleRGB.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TSingleRGB
     begin
          Result := Poins[ X ];

     end, Gamm_, Tone_ );
end;


//TCellColorGrid1D_TSingleRGB





//-------------------------------------------------------

procedure TCellColorGrid1D_TSingleRGB.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;



//-------------------------------------------------------

procedure TCellColorGrid1D_TSingleRGB.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TSingleRGB
     begin
          Result := Cells[ X ];

     end, Gamm_, Tone_ );
end;

//TPoinColorGrid1D_TByteRGBE





//-------------------------------------------------------

procedure TPoinColorGrid1D_TByteRGBE.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;



//-------------------------------------------------------

procedure TPoinColorGrid1D_TByteRGBE.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TByteRGBE
     begin
          Result := Poins[ X ];

     end, Gamm_, Tone_ );
end;

//TCellColorGrid1D_TByteRGBE





//-------------------------------------------------------

procedure TCellColorGrid1D_TByteRGBE.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;



//-------------------------------------------------------

procedure TCellColorGrid1D_TByteRGBE.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X:Integer ) :TByteRGBE
     begin
          Result := Cells[ X ];

     end, Gamm_, Tone_ );
end;

//  

// 

initialization // 

finalization // 

end.
