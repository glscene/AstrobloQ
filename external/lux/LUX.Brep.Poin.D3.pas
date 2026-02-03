unit LUX.Brep.Poin.D3;

interface  

uses LUX, LUX.D3, LUX.Brep.Poin;

type  

     TPoin3D = class;

      

     

     //  TPoin3D

     TPoin3D = class( TPoin<TSingle3D> )
     private
     protected
     public
     end;

     //  TPoinModel3D<_TPoin_>

     TPoinModel3D<_TPoin_:TPoin<TSingle3D>> = class( TPoinModel<TSingle3D,_TPoin_> )
     private
     protected
       
       function GetBarycenter :TSingle3D;
     public
       
       property Barycenter :TSingle3D read GetBarycenter;
       
       function GetBoundingBox :TSingleArea3D;
     end;



 

//  

implementation //=========================================

//  

//  

//TPoin3D







//TPoinModel3D<_TPoin_>





//-------------------------------------------------------

function TPoinModel3D<_TPoin_>.GetBarycenter :TSingle3D;
var
   I :Integer;
begin
     Result := TSingle3D.Create( 0, 0, 0 );

     for I := 0 to ChildsN-1 do
     begin
          Result := Result + Childs[ I ].Pos;
     end;

     Result := Result / ChildsN;
end;



//-------------------------------------------------------

function TPoinModel3D<_TPoin_>.GetBoundingBox :TSingleArea3D;
var
   I :Integer;
begin
     Result := TSingleArea3D.NeInf;

     for I := 0 to ChildsN-1 do
     begin
          with Childs[ I ].Pos do
          begin
               if X < Result.Min.X then Result.Min.X := X;
               if Y < Result.Min.Y then Result.Min.Y := Y;
               if Z < Result.Min.Z then Result.Min.Z := Z;

               if Result.Max.X < X then Result.Max.X := X;
               if Result.Max.Y < Y then Result.Max.Y := Y;
               if Result.Max.Z < Z then Result.Max.Z := Z;
          end;
     end;
end;

//  

// 

initialization //===================== 


finalization // 

end.
