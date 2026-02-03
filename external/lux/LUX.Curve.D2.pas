unit LUX.Curve.D2;

interface  

uses LUX,
     LUX.D1,
     LUX.D2,
     LUX.Curve;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

      

     



 

//  

function Delta( const X_,Y_:Single ) :Single; overload;
function Delta( const X_,Y_:Double ) :Double; overload;

function Sinc( const X_,Y_:Single ) :Single; overload;
function Sinc( const X_,Y_:Double ) :Double; overload;

implementation // 

uses LUX.Curve.BSpline, LUX.Curve.Bezier;

//  

//  

//  

function Delta( const X_,Y_:Single ) :Single;
begin
     Result := Delta( Y_ ) * Delta( X_ );
end;

function Delta( const X_,Y_:Double ) :Double;
begin
     Result := Delta( Y_ ) * Delta( X_ );
end;

//------------------------------------------------------------------------------

function Sinc( const X_,Y_:Single ) :Single;
begin
     Result := Sinc( Y_ ) * Sinc( X_ );
end;

function Sinc( const X_,Y_:Double ) :Double;
begin
     Result := Sinc( Y_ ) * Sinc( X_ );
end;

// 

initialization // 

finalization // 

end.
