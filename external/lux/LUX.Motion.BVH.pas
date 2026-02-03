unit LUX.Motion.BVH;

interface  

uses System.Generics.Collections,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M4, LUX.Data.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Shaper;

type  

     TBoneNode     = class;
       TBoneJoin   = class;
         TBoneRoot = class;
         TBoneEdge = class;
       TBoneLeaf   = class;

      

     //  TMoveKind

     TMoveKind = ( mkNone,
                   mkPosX, mkPosY, mkPosZ,
                   mkRotX, mkRotY, mkRotZ,
                   mkScaX, mkScaY, mkScaZ );

     HMoveKind = record helper for TMoveKind
     private
     public
       class function Create( const Tag_:string ) :TMoveKind; static;
       function ToMatrix( const Value_:Single ) :TSingleM4;
     end;

     //  TMoveTag

     TMoveTag = record
     private
     public
       Node :TBoneNode;
       Kind :TMoveKind;
     end;

     

     //  TBoneNode

     TBoneNode = class( TTreeNode<TBoneNode> )
     private
     protected
       _Name :string;
       _Offs :TSingle3D;
       
       function GetRelaPoses( const I_:Integer ) :TSingleM4; virtual;
       function GetAbsoPoses( const I_:Integer ) :TSingleM4; virtual;
       
       procedure SetFrameN( const FrameN_:Integer ); virtual;
       procedure AddMove( const I_:Integer; const Move_:TSingleM4 ); virtual;
     public
       constructor Create( const Name_:string );
       
       property Name                          :String    read   _Name     ;
       property Offs                          :TSingle3D read   _Offs     ;
       property     Poses[ const I_:Integer ] :TSingleM4 read GetRelaPoses;
       property RelaPoses[ const I_:Integer ] :TSingleM4 read GetRelaPoses;
       property AbsoPoses[ const I_:Integer ] :TSingleM4 read GetAbsoPoses;
     end;

     //  TBoneJoin

     TBoneJoin = class( TBoneNode )
     private
     protected
       _Moves :TArray<TSingleM4>;
       
       function GetMoves( const I_:Integer ) :TSingleM4;
       function GetRelaPoses( const I_:Integer ) :TSingleM4; override;
       
       procedure SetFrameN( const FrameN_:Integer ); override;
       procedure AddMove( const I_:Integer; const Move_:TSingleM4 ); override;
     public
       constructor Create( const Name_:string );
       destructor Destroy; override;
       
       property Moves[ const I_:Integer ] :TSingleM4 read GetMoves;
       
     end;

     //  TBoneRoot

     TBoneRoot = class( TBoneJoin )
     private
     protected
       
       function GetAbsoPoses( const I_:Integer ) :TSingleM4; override;
     public
     end;

     //  TBoneEdge

     TBoneEdge = class( TBoneJoin )
     private
     protected
     public
     end;

     //  TBoneLeaf

     TBoneLeaf = class( TBoneNode )
     private
     protected
     public
     end;

     //  TBones

     TBones = class
     private
     protected
       _Root   :TBoneRoot;
       _FrameN :Integer;
       _FrameT :Single;
       
     public
       constructor Create;
       destructor Destroy; override;
       
       property Root   :TBoneRoot   read _Root;
       property FrameN :Integer read _FrameN;
       property FrameT :Single  read _FrameT;
       
       procedure LoadFromFileBVH( const FileName_:string );
     end;



 

//  

implementation // 

uses System.Classes, System.SysUtils, System.Math;

//  

//HMoveKind

class function HMoveKind.Create( const Tag_:string ) :TMoveKind;
begin
     if Tag_ = 'Xposition' then Result := TMoveKind.mkPosX
                           else
     if Tag_ = 'Yposition' then Result := TMoveKind.mkPosY
                           else
     if Tag_ = 'Zposition' then Result := TMoveKind.mkPosZ
                           else
     if Tag_ = 'Xrotation' then Result := TMoveKind.mkRotX
                           else
     if Tag_ = 'Yrotation' then Result := TMoveKind.mkRotY
                           else
     if Tag_ = 'Zrotation' then Result := TMoveKind.mkRotZ
                           else
     if Tag_ = 'Xscale'    then Result := TMoveKind.mkScaX
                           else
     if Tag_ = 'Yscale'    then Result := TMoveKind.mkScaY
                           else
     if Tag_ = 'Zscale'    then Result := TMoveKind.mkScaZ
                           else Result := TMoveKind.mkNone;
end;

function HMoveKind.ToMatrix( const Value_:Single ) :TSingleM4;
begin
     case Self of
       mkPosX: Result := TSingleM4.Translate( Value_, 0     , 0      );
       mkPosY: Result := TSingleM4.Translate( 0     , Value_, 0      );
       mkPosZ: Result := TSingleM4.Translate( 0     , 0     , Value_ );
       mkRotX: Result := TSingleM4.RotateX( DegToRad( Value_ ) );
       mkRotY: Result := TSingleM4.RotateY( DegToRad( Value_ ) );
       mkRotZ: Result := TSingleM4.RotateZ( DegToRad( Value_ ) );
       mkScaX: Result := TSingleM4.Scale( Value_, 0     , 0      );
       mkScaY: Result := TSingleM4.Scale( 0     , Value_, 0      );
       mkScaZ: Result := TSingleM4.Scale( 0     , 0     , Value_ );
     else      Result := TSingleM4.Identity;
     end;
end;

//  

//TBoneNode





//-------------------------------------------------------

function TBoneNode.GetRelaPoses( const I_:Integer ) :TSingleM4;
begin
     with _Offs do Result := TSingleM4.Translate( X, Y, Z );
end;

function TBoneNode.GetAbsoPoses( const I_:Integer ) :TSingleM4;
begin
     Result := Paren.AbsoPoses[ I_ ] * RelaPoses[ I_ ];
end;

//-------------------------------------------------------

procedure TBoneNode.SetFrameN( const FrameN_:Integer );
begin

end;

procedure TBoneNode.AddMove( const I_:Integer; const Move_:TSingleM4 );
begin

end;



constructor TBoneNode.Create( const Name_:string );
begin
     inherited Create;

     _Name := Name_;
end;

//TBoneJoin





//-------------------------------------------------------

function TBoneJoin.GetMoves( const I_:Integer ) :TSingleM4;
begin
     Result := _Moves[ I_ ];
end;

function TBoneJoin.GetRelaPoses( const I_:Integer ) :TSingleM4;
begin
     Result := inherited * _Moves[ I_ ];
end;

//-------------------------------------------------------

procedure TBoneJoin.SetFrameN( const FrameN_:Integer );
var
   I :Integer;
begin
     inherited;

     SetLength( _Moves, FrameN_ );

     for I := 0 to FrameN_ - 1 do _Moves[ I ] := TSingleM4.Identity;

     for I := 0 to ChildsN-1 do Childs[ I ].SetFrameN( FrameN_ );
end;

procedure TBoneJoin.AddMove( const I_:Integer; const Move_:TSingleM4 );
var
   P :^TSingleM4;
begin
     inherited;

     P := @_Moves[ I_ ];  P^ := P^ * Move_;
end;



constructor TBoneJoin.Create( const Name_:string );
begin
     inherited;

end;

destructor TBoneJoin.Destroy;
begin

     inherited;
end;

//TBoneRoot





//-------------------------------------------------------

function TBoneRoot.GetAbsoPoses( const I_:Integer ) :TSingleM4;
begin
     Result := RelaPoses[ I_ ];
end;



//TBoneEdge







//TBoneLeaf







//TBones







constructor TBones.Create;
begin
     inherited;

     _Root := TBoneRoot.Create( '' );
end;

destructor TBones.Destroy;
begin
     _Root.DisposeOf;

     inherited;
end;

//-------------------------------------------------------//////////////

procedure TBones.LoadFromFileBVH( const FileName_:string );
var
   F :TStreamReader;
   W :TArray<string>;
//······································
     procedure SplitRead;
     begin
          W := F.ReadLine.Trim.Split( [ ' ' ], TStringSplitOptions.ExcludeEmpty );
     end;
//······································
var
   L :TList<TMoveTag>;
   S :TStack<TBoneNode>;
   B :TBoneNode;
   I, J :Integer;
   T :TMoveTag;
begin
     _Root.DeleteChilds;

     F := TStreamReader.Create( FileName_ );

     while not F.EndOfStream do
     begin
          SplitRead;

          if W[ 0 ] = 'HIERARCHY' then Break;
     end;

     while not F.EndOfStream do
     begin
          SplitRead;

          if W[ 0 ] = 'ROOT' then
          begin
               _Root._Name := W[ 1 ];

               Break;
          end;
     end;

     L := TList<TMoveTag>.Create;

     S := TStack<TBoneNode>.Create;

     S.Push( _Root );

     while not F.EndOfStream do
     begin
          SplitRead;

          if W[ 0 ] = 'JOINT' then
          begin
               B := TBoneEdge.Create( W[ 1 ] );

               B.Paren := S.Peek;

               S.Push( B );
          end
          else
          if W[ 0 ] = 'End' then
          begin
               B := TBoneLeaf.Create( W[ 1 ] );

               B.Paren := S.Peek;

               S.Push( B );
          end
          else
          if W[ 0 ] = 'OFFSET' then
          begin
               with S.Peek._Offs do
               begin
                    X := StrToFloat( W[ 1 ] );
                    Y := StrToFloat( W[ 2 ] );
                    Z := StrToFloat( W[ 3 ] );
               end;
          end
          else
          if W[ 0 ] = 'CHANNELS' then
          begin
               for I := 2 to High( W ) do
               begin
                    with T do
                    begin
                         Node := S.Peek;
                         Kind := TMoveKind.Create( W[ I ] );
                    end;

                    L.Add( T );
               end;
          end
          else
          if W[ 0 ] = '}' then
          begin
               S.Extract;

               if S.Count = 0 then Break;
          end
     end;

     S.DisposeOf;

     while not F.EndOfStream do
     begin
          SplitRead;

          if W[ 0 ] = 'MOTION' then Break;
     end;

     while not F.EndOfStream do
     begin
          SplitRead;

          if W[ 0 ] = 'Frames:' then
          begin
               _FrameN := StrToInt( W[ 1 ] );

               Break;
          end;
     end;

     while not F.EndOfStream do
     begin
          SplitRead;

          if ( W[ 0 ] = 'Frame' ) and ( W[ 1 ] = 'Time:' ) then
          begin
               _FrameT := StrToFloat( W[ 2 ] );

               Break;
          end;
     end;

     _Root.SetFrameN( _FrameN );

     for J := 0 to _FrameN - 1 do
     begin
          SplitRead;

          for I := 0 to L.Count - 1 do
          begin
               with L.Items[ I ] do
               begin
                    Node.AddMove( J, Kind.ToMatrix( StrToFloat( W[ I ] ) ) );
               end;
          end;
     end;

     L.DisposeOf;

     F.DisposeOf;
end;

//  

// 

initialization // 

finalization // 

end.
