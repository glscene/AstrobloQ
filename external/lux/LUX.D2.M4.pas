unit LUX.D2.M4;

interface  

uses LUX, LUX.D1, LUX.D2;

type  

      

     //  TSingle2DM4

     TSingle2DM4 = record
     private
       
       function GetM( const Y_,X_:Integer ) :TSingle2D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TSingle2D ); inline;
     public
       
       property M[ const Y_,X_:Integer ] :TSingle2D read GetM write SetM; default;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TSingle2D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TSingle2D; );
     end;

     //  TDouble2DM4

     TDouble2DM4 = record
     private
       
       function GetM( const Y_,X_:Integer ) :TDouble2D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TDouble2D ); inline;
     public
       
       property M[ const Y_,X_:Integer ] :TDouble2D read GetM write SetM; default;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TDouble2D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TDouble2D; );
     end;

     //  TdSingle2DM4

     TdSingle2DM4 = record
     private
       
       function GetM( const Y_,X_:Integer ) :TdSingle2D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TdSingle2D ); inline;
     public
       
       property M[ const Y_,X_:Integer ] :TdSingle2D read GetM write SetM; default;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TdSingle2D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TdSingle2D; );
     end;

     //  TdDouble2DM4

     TdDouble2DM4 = record
     private
       
       function GetM( const Y_,X_:Integer ) :TdDouble2D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TdDouble2D ); inline;
     public
       
       property M[ const Y_,X_:Integer ] :TdDouble2D read GetM write SetM; default;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TdDouble2D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TdDouble2D; );
     end;

     



 

//  

implementation //=========================================

//  

//TSingle2DM4



//-------------------------------------------------------

function TSingle2DM4.GetM( const Y_,X_:Integer ) :TSingle2D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TSingle2DM4.SetM( const Y_,X_:Integer; const M_:TSingle2D );
begin
     _[ Y_, X_ ] := M_;
end;



//TDouble2DM4



//-------------------------------------------------------

function TDouble2DM4.GetM( const Y_,X_:Integer ) :TDouble2D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TDouble2DM4.SetM( const Y_,X_:Integer; const M_:TDouble2D );
begin
     _[ Y_, X_ ] := M_;
end;

//TdSingle2DM4



//-------------------------------------------------------

function TdSingle2DM4.GetM( const Y_,X_:Integer ) :TdSingle2D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdSingle2DM4.SetM( const Y_,X_:Integer; const M_:TdSingle2D );
begin
     _[ Y_, X_ ] := M_;
end;



//TdDouble2DM4



//-------------------------------------------------------

function TdDouble2DM4.GetM( const Y_,X_:Integer ) :TdDouble2D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdDouble2DM4.SetM( const Y_,X_:Integer; const M_:TdDouble2D );
begin
     _[ Y_, X_ ] := M_;
end;



//  

//  

// 

initialization //===================== 


finalization // 

end.