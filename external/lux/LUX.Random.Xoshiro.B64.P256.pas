unit LUX.Random.Xoshiro.B64.P256;

interface  

uses LUX, LUX.D2, LUX.D4,
     LUX.Random,
     LUX.Random.Xoshiro,
     LUX.Random.Xoshiro.B64;

type  

     TRandom64XOS256p        = class;
     TRandom64XOS256ss       = class;
     TRandom64XOS256x128     = class;
       TRandom64XOS256x128p  = class;
       TRandom64XOS256x128ss = class;

      

     

     //  TRandom64XOS256p

     TRandom64XOS256p = class( TRandom64XOS256 )
     private
     protected
       
       function CalcRandInt64u :Int64u; override;
     public
     end;

     //  TRandom64XOS256ss

     TRandom64XOS256ss = class( TRandom64XOS256 )
     private
     protected
       
       function CalcRandInt64u :Int64u; override;
     public
     end;

     //  TRandom64XOS256x128

     TRandom64XOS256x128 = class( TRandom64XOS256 )
     private
     protected
       
       procedure CalcNextSeed; override;
     public
     end;

     //  TRandom64XOS256x128p

     TRandom64XOS256x128p = class( TRandom64XOS256x128 )
     private
     protected
       
       function CalcRandInt64u :Int64u; override;
     public
     end;

     //  TRandom64XOS256x128ss

     TRandom64XOS256x128ss = class( TRandom64XOS256x128 )
     private
     protected
       
       function CalcRandInt64u :Int64u; override;
     public
     end;



 

//  

implementation // 

uses System.SysUtils;

//  

//  

//TRandom64XOS256p

{ http://xoshiro.di.unimi.it/xoshiro256plus.c }





//-------------------------------------------------------

function TRandom64XOS256p.CalcRandInt64u :Int64u;
begin
     with _Seed do Result := X + W;
end;



//TRandom64XOS256ss

{ http://xoshiro.di.unimi.it/xoshiro256starstar.c }





//-------------------------------------------------------

function TRandom64XOS256ss.CalcRandInt64u :Int64u;
begin
     Result := rotl( _Seed.Y * 5, 7 ) * 9;
end;



//TRandom64XOS256x128





//-------------------------------------------------------

procedure TRandom64XOS256x128.CalcNextSeed;
const
     JUMP :array [ 0..4-1 ] of Int64u = ( $180ec6d33cfd0aba,
                                          $d5a61266f0c9392c,
                                          $a9582618e03fc9aa,
                                          $39abdc4529b1661c );
var
   S :TInt64u4D;
   I, B :Int64u;
begin
     S := TInt64u4D.Create( 0, 0, 0, 0 );

     for I := 0 to 4-1 do
     begin
          for B := 0 to 64-1 do
          begin
               if JUMP[ I ] and ( 1 shl B ) = 0 then
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



//TRandom64XOS256x128p

{ http://xoshiro.di.unimi.it/xoshiro256plus.c }





//-------------------------------------------------------

function TRandom64XOS256x128p.CalcRandInt64u :Int64u;
begin
     with _Seed do Result := X + W;
end;



//TRandom64XOS256x128ss

{ http://xoshiro.di.unimi.it/xoshiro256starstar.c }





//-------------------------------------------------------

function TRandom64XOS256x128ss.CalcRandInt64u :Int64u;
begin
     Result := rotl( _Seed.Y * 5, 7 ) * 9;
end;



//  

// 

initialization // 

finalization // 

end.
