unit LUX.Random.Xoshiro.B32.P128;

interface  

uses LUX, LUX.D4,
     LUX.Random,
     LUX.Random.Xoshiro,
     LUX.Random.Xoshiro.B32;

type  

     TRandom32XOS128p       = class;
     TRandom32XOS128ss      = class;
     TRandom32XOS128x64     = class;
       TRandom32XOS128x64p  = class;
       TRandom32XOS128x64ss = class;

      

     

     //  TRandom32XOS128p

     TRandom32XOS128p = class( TRandom32XOS128 )
     private
     protected
       
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //  TRandom32XOS128ss

     TRandom32XOS128ss = class( TRandom32XOS128 )
     private
     protected
       
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //  TRandom32XOS128x64

     TRandom32XOS128x64 = class( TRandom32XOS128 )
     private
     protected
       
       procedure CalcNextSeed; override;
     public
     end;

     //  TRandom32XOS128x64p

     TRandom32XOS128x64p = class( TRandom32XOS128x64 )
     private
     protected
       
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //  TRandom32XOS128x64ss

     TRandom32XOS128x64ss = class( TRandom32XOS128x64 )
     private
     protected
       
       function CalcRandInt32u :Int32u; override;
     public
     end;



 

//  

implementation //=========================================

uses System.SysUtils;

//  

//  

//TRandom32XOS128p

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }





//-------------------------------------------------------

function TRandom32XOS128p.CalcRandInt32u :UInt32;
begin
     with _Seed do Result := X + W;
end;



//TRandom32XOS128ss

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }





//-------------------------------------------------------

function TRandom32XOS128ss.CalcRandInt32u :UInt32;
begin
     Result := rotl( _Seed.X * 5, 7 ) * 9;
end;



//TRandom32XOS128x64





//-------------------------------------------------------

procedure TRandom32XOS128x64.CalcNextSeed;
const
     JUMP :array [ 0..4-1 ] of Int32u = ( $8764000b,
                                          $f542d2d3,
                                          $6fa035c3,
                                          $77f2db5b );
var
   S :TInt32u4D;
   I, B :Int32s;
begin
     S := TInt32u4D.Create( 0, 0, 0, 0 );

     for I := 0 to 4-1 do
     begin
          for B := 0 to 32 - 1 do
          begin
               if JUMP[ I ] and ( 1 shl B ) = 1 then
               begin
                    with S do
                    begin
                         X := X xor _Seed.X;
                         Y := Y xor _Seed.Y;
                         Z := Z xor _Seed.Z;
                         W := W xor _Seed.W;
                    end;
               end;

               inherited CalcNextSeed;
          end;
     end;

     _Seed := S;
end;



//TRandom32XOS128x64p

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }





//-------------------------------------------------------

function TRandom32XOS128x64p.CalcRandInt32u :UInt32;
begin
     with _Seed do Result := X + W;
end;



//TRandom32XOS128x64ss

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }





//-------------------------------------------------------

function TRandom32XOS128x64ss.CalcRandInt32u :UInt32;
begin
     Result := rotl( _Seed.X * 5, 7 ) * 9;
end;



//  

// 

initialization //===================== 


finalization // 

end.
