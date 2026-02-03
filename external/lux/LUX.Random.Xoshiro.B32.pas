unit LUX.Random.Xoshiro.B32;

interface  

uses LUX, LUX.D2, LUX.D4,
     LUX.Random,
     LUX.Random.Xoshiro;

type  

     TRandom32ROS64  = class;
     TRandom32XOS128 = class;

      

     

     //  TRandom32ROS64

     IRandom32ROS64 = interface( IRandom<TInt32u2D> )
     ['{E6D4EE10-CCC9-4E35-AD85-D94987524CDF}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandom32ROS64 = class( TRandom32SHI<TInt32u2D>, IRandom32ROS64 )
     private
     protected
       
       procedure CalcNextSeed; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //  TRandom32XOS128

     IRandom32XOS128 = interface( IRandom<TInt32u4D> )
     ['{3A1CEE71-C699-4F5F-BCF8-1ABEC365DC82}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandom32XOS128 = class( TRandom32SHI<TInt32u4D>, IRandom32XOS128 )
     private
     protected
       
       procedure CalcNextSeed; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;



 

//  

implementation // 

uses System.SysUtils;

//  

//  

//TRandom32ROS64





//-------------------------------------------------------

procedure TRandom32ROS64.CalcNextSeed;
var
   S :TInt32u2D;
begin
     S := _Seed;

     with S do
     begin
          Y := Y xor X;

          _Seed.X := rotl( X, 26 ) xor Y xor ( Y shl 9 );  // a, b
          _Seed.Y := rotl( Y, 13 );                        // c
     end;
end;



constructor TRandom32ROS64.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u2D.Create( Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u ) );
end;

//TRandom32XOS128





//-------------------------------------------------------

procedure TRandom32XOS128.CalcNextSeed;
var
   T :Int32u;
begin
     with _Seed do
     begin
          T := Y shl 9;

          Z := Z xor X;
          W := W xor Y;
          Y := Y xor Z;
          X := X xor W;

          Z := Z xor T;

          W := rotl( W, 11 );
     end;
end;



constructor TRandom32XOS128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u4D.Create( Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u ) );
end;

//  

// 

initialization // 

finalization // 

end.
