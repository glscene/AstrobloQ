unit LUX.Brep.Wire.M2;

interface  

uses LUX, LUX.D2, LUX.M2, LUX.Brep.Poin, LUX.Brep.Wire;

type  

     TWireM2<_TPoin_:TPoin<TSingleM2>> = class;

      

     

     //  TWireM2<_TPos_>

     TWireM2<_TPoin_:TPoin<TSingleM2>> = class( TWire<TSingleM2,_TPoin_> )
     private
     protected
     public
     end;

     //  TWireModelM2<_TPos_>

     TWireModelM2<_TPoin_:TPoin<TSingleM2>;
                  _TWire_:TWireM2<_TPoin_>> = class( TWireModel<TSingleM2,_TPoin_,_TWire_> )
     private
     protected
     public
     end;



 

//  

implementation // 

//  

//  

//TWireM2<_TPoin_>





//-------------------------------------------------------



//TWireModelM2<_TPoin_,_TWire_>







//  

// 

initialization // 

finalization // 

end.
