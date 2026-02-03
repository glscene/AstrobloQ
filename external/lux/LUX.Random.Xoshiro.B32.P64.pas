unit LUX.Random.Xoshiro.B32.P64;

interface  

uses LUX,
     LUX.Random,
     LUX.Random.Xoshiro,
     LUX.Random.Xoshiro.B32;

type  

     TRandom32ROS64s  = class;
     TRandom32ROS64ss = class;

      

     

     //  TRandom32ROS64s

     TRandom32ROS64s = class( TRandom32ROS64 )
     private
     protected
       
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //  TRandom32ROS64ss

     TRandom32ROS64ss = class( TRandom32ROS64 )
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

//TRandom32ROS64s

{ http://xoshiro.di.unimi.it/xoroshiro64star.c }





//-------------------------------------------------------

function TRandom32ROS64s.CalcRandInt32u :Int32u;
begin
	   Result := _Seed.X * $9E3779BB;
end;



//TRandom32ROS64ss

{ http://xoshiro.di.unimi.it/xoroshiro64starstar.c }





//-------------------------------------------------------

function TRandom32ROS64ss.CalcRandInt32u :Int32u;
begin
	   Result := rotl( _Seed.X * $9E3779BB, 5 ) * 5;
end;



//  

// 

initialization //===================== 


finalization // 

end.
