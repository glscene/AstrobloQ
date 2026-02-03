unit LUX.Random.Xoshiro.B64.P512;

interface  

uses LUX, LUX.D2, LUX.D4,
     LUX.Random,
     LUX.Random.Xoshiro,
     LUX.Random.Xoshiro.B64;

type  

     TRandom64XOS512p  = class;
     TRandom64XOS512ss = class;

      

     

     //  TRandom64XOS512p

     TRandom64XOS512p = class( TRandom64XOS512 )
     private
     protected
       
       function CalcRandInt64u :Int64u; override;
     public
     end;

     //  TRandom64XOS512ss

     TRandom64XOS512ss = class( TRandom64XOS512 )
     private
     protected
       
       function CalcRandInt64u :Int64u; override;
     public
     end;



 

//  

implementation //=========================================

uses System.SysUtils;

//  

//  

//TRandom64XOS512p

{ http://xoshiro.di.unimi.it/xoshiro256plus.c }





//-------------------------------------------------------

function TRandom64XOS512p.CalcRandInt64u :Int64u;
begin
     with _Seed do Result := s[ 0 ] + s[ 2 ];
end;



//TRandom64XOS512ss

{ http://xoshiro.di.unimi.it/xoshiro256starstar.c }





//-------------------------------------------------------

function TRandom64XOS512ss.CalcRandInt64u :Int64u;
begin
     Result := rotl( _Seed.s[ 1 ] * 5, 7 ) * 9;
end;



//  

// 

initialization //===================== 


finalization // 

end.
