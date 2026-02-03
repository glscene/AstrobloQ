unit LUX.GPU.OpenCL.Argume.Memory.Imager.D3;

interface  

uses cl_version, cl_platform, cl,
     LUX,
     LUX.Code.C,
     LUX.Color,
     LUX.GPU.OpenCL.core,
     LUX.GPU.OpenCL.Argume.Memory,
     LUX.GPU.OpenCL.Argume.Memory.Imager.D2;

type  

     TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class;

     TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class;

     TCLImager3DxBGRAxUInt8 <TCLSystem_,TCLPlatfo_,TCLContex_:class> = class;
     TCLImager3DxBGRAxUFix8 <TCLSystem_,TCLPlatfo_,TCLContex_:class> = class;
     TCLImager3DxRGBAxUInt32<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class;
     TCLImager3DxRGBAxSFlo32<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class;

      

     

     //  TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>

     TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class( TCLImager2D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_> )
     private
       type TCLMemDat_ = TCLMemDat  <TCLSystem_,TCLPlatfo_,TCLContex_>;
            TCLImaDat_ = TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>;
     protected
       _CountZ :Integer;
       
       function NewData :TCLMemDat_; override;
       function GetData :TCLImaDat_; reintroduce; virtual;
       procedure SetData( const Data_:TCLImaDat_ ); reintroduce; virtual;
       function GetMemTyp :T_cl_mem_object_type; override;
       function GetCountZ :Integer; override;
       procedure SetCountZ( const CountZ_:Integer ); override;
     public
       constructor Create; override;
       
       property Data   :TCLImaDat_ read GetData   write SetData  ;
       property CountZ :Integer    read GetCountZ write SetCountZ;
     end;

     //  TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>

     TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class( TCLImaDat2D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_> )
     private
       type TCLImager_ = TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>;
            PValue_    = ^TValue_;
     protected
       
       function GetImager :TCLImager_; reintroduce; virtual;
       function GetValueP( const X_,Y_,Z_:Integer ) :PByte;
       function GetValues( const X_,Y_,Z_:Integer ) :TValue_;
       procedure SetValues( const X_,Y_,Z_:Integer; const Values_:TValue_ );
     public
       
       property Imager                           :TCLImager_ read GetImager                ;
       property ValueP[ const X_,Y_,Z_:Integer ] :PByte      read GetValueP                ;
       property Values[ const X_,Y_,Z_:Integer ] :TValue_    read GetValues write SetValues; default;
     end;

     //  TCLImager3DxBGRAxUInt8<TCLSystem_,TCLPlatfo_,TCLContex_>

     TCLImager3DxBGRAxUInt8<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class( TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TByteRGBA> )
     private
     protected
       
       function GetPixCha :T_cl_channel_order; override;
       function GetPixTyp :T_cl_channel_type; override;
     public
     end;

     //  TCLImager3DxBGRAxUFix8<TCLSystem_,TCLPlatfo_,TCLContex_>

     TCLImager3DxBGRAxUFix8<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class( TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TByteRGBA> )
     private
     protected
       
       function GetPixCha :T_cl_channel_order; override;
       function GetPixTyp :T_cl_channel_type; override;
     public
     end;

     //  TCLImager2DxRGBAxUInt32<TCLSystem_,TCLPlatfo_,TCLContex_>

     TCLImager3DxRGBAxUInt32<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class( TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TUInt32xRGBA> )
     private
     protected
       
       function GetPixCha :T_cl_channel_order; override;
       function GetPixTyp :T_cl_channel_type; override;
     public
     end;

     //  TCLImager3DxRGBAxSFlo32<TCLSystem_,TCLPlatfo_,TCLContex_>

     TCLImager3DxRGBAxSFlo32<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class( TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TSingleRGBA> )
     private
     protected
       
       function GetPixCha :T_cl_channel_order; override;
       function GetPixTyp :T_cl_channel_type; override;
     public
     end;



 

//  

implementation //=========================================

//  

//  

//TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>





//-------------------------------------------------------

function TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.NewData :TCLMemDat_;
begin
     Result := TCLImaDat_.Create( Self );
end;

function TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetData :TCLImaDat_;
begin
     Result := TCLImaDat_( inherited Data );
end;

procedure TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.SetData( const Data_:TCLImaDat_ );
begin
     inherited Data := Data_;
end;

//------------------------------------------------------------------------------

function TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetMemTyp :T_cl_mem_object_type;
begin
     Result := CL_MEM_OBJECT_IMAGE3D;
end;

//------------------------------------------------------------------------------

function TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetCountZ :Integer;
begin
     Result := _CountZ;
end;

procedure TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.SetCountZ( const CountZ_:Integer );
begin
     inherited;

     _CountZ := CountZ_;
end;



constructor TCLImager3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.Create;
begin
     inherited;

     _CountZ := 1;
end;

//TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>





//-------------------------------------------------------

function TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetImager :TCLImager_;
begin
     Result := TCLImager_( Imager );
end;

//------------------------------------------------------------------------------

function TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetValueP( const X_,Y_,Z_:Integer ) :PByte;
begin
     Result := inherited GetValueP( X_, Y_ );

     Inc( Result, _PitchZ * Z_ );
end;

function TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetValues( const X_,Y_,Z_:Integer ) :TValue_;
begin
     Result := PValue_( ValueP[ X_, Y_, Z_ ] )^;
end;

procedure TCLImaDat3D<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.SetValues( const X_,Y_,Z_:Integer; const Values_:TValue_ );
begin
     PValue_( ValueP[ X_, Y_, Z_ ] )^ := Values_;
end;



//TCLImager3DxBGRAxUInt8<TCLSystem_,TCLPlatfo_,TCLContex_>





//-------------------------------------------------------

function TCLImager3DxBGRAxUInt8<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixCha :T_cl_channel_order;
begin
     Result := CL_BGRA;
end;

function TCLImager3DxBGRAxUInt8<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixTyp :T_cl_channel_type;
begin
     Result := CL_UNSIGNED_INT8;
end;



//TCLImager3DxBGRAxUFix8<TCLSystem_,TCLPlatfo_,TCLContex_>





//-------------------------------------------------------

function TCLImager3DxBGRAxUFix8<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixCha :T_cl_channel_order;
begin
     Result := CL_BGRA;
end;

function TCLImager3DxBGRAxUFix8<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixTyp :T_cl_channel_type;
begin
     Result := CL_UNORM_INT8;
end;



//TCLImager3DxRGBAxUInt32<TCLSystem_,TCLPlatfo_,TCLContex_>





//-------------------------------------------------------

function TCLImager3DxRGBAxUInt32<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixCha :T_cl_channel_order;
begin
     Result := CL_RGBA;
end;

function TCLImager3DxRGBAxUInt32<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixTyp :T_cl_channel_type;
begin
     Result := CL_UNSIGNED_INT32;
end;



//TCLImager3DxRGBAxSFlo32<TCLSystem_,TCLPlatfo_,TCLContex_>





//-------------------------------------------------------

function TCLImager3DxRGBAxSFlo32<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixCha :T_cl_channel_order;
begin
     Result := CL_RGBA;
end;

function TCLImager3DxRGBAxSFlo32<TCLSystem_,TCLPlatfo_,TCLContex_>.GetPixTyp :T_cl_channel_type;
begin
     Result := CL_FLOAT;
end;



//  

end.
