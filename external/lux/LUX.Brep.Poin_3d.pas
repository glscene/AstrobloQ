unit LUX.Brep.Poin_3d;

interface  

uses LUX, LUX.Graph.Tree;

type  

     TPoin<_TPos_>             = class;
     TPoinModel<_TPoin_:class> = class;

      

     

     //  TPoin<_TPos_>

     TPoin<_TPos_> = class( TTreeNode<TPoin<_TPos_>> )
     private
     protected
       _Pos :_TPos_;
       
       function GetPos :_TPos_; virtual;
       procedure SetPos( const Pos_:_TPos_ ); virtual;
     public
       constructor Create( const Pos_:_TPos_ ); overload;
       constructor Create( const Pos_:_TPos_; const Paren_:TTreeNode ); overload;
       
       property Pos :_TPos_ read GetPos write SetPos;
     end;

     //  TPoinModel<_TPos_,_TPoin_>

     TPoinModel<_TPoin_:class> = class( TTreeNode<_TPoin_> )
     private
     protected
     public
     end;



 

//  

implementation //=========================================

//  

//  

//TPoin<_TPos_>





//-------------------------------------------------------

function TPoin<_TPos_>.GetPos :_TPos_;
begin
     Result := _Pos;
end;

procedure TPoin<_TPos_>.SetPos( const Pos_:_TPos_ );
begin
     _Pos := Pos_;
end;



constructor TPoin<_TPos_>.Create( const Pos_:_TPos_ );
begin
     inherited Create;

     _Pos := Pos_;
end;

constructor TPoin<_TPos_>.Create( const Pos_:_TPos_; const Paren_:TTreeNode );
begin
     inherited Create( Paren_ );

     _Pos := Pos_;
end;

//TPoinModel<_TPos_,_TPoin_>







//  

// 

initialization //===================== 


finalization // 

end.
