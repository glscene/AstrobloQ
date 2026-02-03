unit LUX.Complex.D1;

interface  

uses LUX, LUX.D1, LUX.Complex;

type  

      

     

     //  TDoubleCIter1D

     TDoubleCIter1D = class( TTransIter1D< TDoubleC, TSingleC > )
     private
     protected
       
       function GetValue :TDoubleC; override;
       procedure SetValue( const Value_:TDoubleC ); override;
     public
     end;



 

//  

implementation //=========================================

//  

//  

//TDoubleCIter1D





function TDoubleCIter1D.GetValue :TDoubleC;
begin
     Result := _Iter.Value;
end;

procedure TDoubleCIter1D.SetValue( const Value_:TDoubleC );
begin
     _Iter.Value := Value_;
end;



//  

// 

initialization //===================== 


finalization // 

end.
