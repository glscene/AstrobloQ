unit LUX.Random.WELL;

{ http://www.iro.umontreal.ca/~panneton/WELLRNG.html }

interface  

uses LUX,
     LUX.Random;

type  

      

     

     //  TRandomWEL<_TSeed_>

     IRandomWEL<_TSeed_:record> = interface( IRandom<_TSeed_> )
     ['{D26B5CD1-3A30-4AA0-9F06-4B98B5A38F88}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomWEL<_TSeed_:record> = class( TRandom<_TSeed_>, IRandomWEL<_TSeed_> )
     private
     protected
     public
     end;

//const // 

//var //$$ 

//  

implementation // 

uses System.SysUtils;

//  

//  

// %%%%% TRandomWEL<_TSeed_>

//  private

//  protected

// & public

//  

// 

initialization // 

finalization // 

end. // 