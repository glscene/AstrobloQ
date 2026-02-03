unit LUX.GPU.OpenCL.Argume.Memory.Buffer;

interface  

uses cl_version, cl_platform, cl,
     LUX,
     LUX.Code.C,
     LUX.GPU.OpenCL.core,
     LUX.GPU.OpenCL.Queuer,
     LUX.GPU.OpenCL.Argume.Memory;

type  

     TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class;
     
     TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class;

      

     

     //  TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>

     TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class( TCLMemory<TCLSystem_,TCLPlatfo_,TCLContex_> )
     private
       type TCLMemDat_ = TCLMemDat<TCLSystem_,TCLPlatfo_,TCLContex_>;
            TCLBufDat_ = TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>;
     protected
       _Count :Integer;
       
       function GetKind :T_cl_mem_flags; override;
       function NewData :TCLMemDat_; override;
       function GetData :TCLBufDat_; reintroduce; virtual;
       procedure SetData( const Data_:TCLBufDat_ ); reintroduce; virtual;
       function GetSize :T_size_t; override;
       function GetCount :Integer; virtual;
       procedure SetCount( const Count_:Integer ); virtual;
       
       function CreateHandle :T_cl_int; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       
       property Data  :TCLBufDat_ read GetData  write SetData ;
       property Count :Integer    read GetCount write SetCount;
     end;

     //  TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>

     TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_:class;TValue_:record> = class( TCLMemDat<TCLSystem_,TCLPlatfo_,TCLContex_> )
     private
       type TCLBuffer_ = TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>;
            PValue_    = ^TValue_;
     protected
       
       function GetBuffer :TCLBuffer_; virtual;
       function GetValueP( const I_:Integer ) :PValue_; virtual;
       function GetValues( const I_:Integer ) :TValue_; virtual;
       procedure SetValues( const I_:Integer; const Values_:TValue_ ); virtual;
       
       function CreateHandle :T_cl_int; override;
     public
       
       property Buffer                     :TCLBuffer_ read GetBuffer                ;
       property ValueP[ const I_:Integer ] :PValue_    read GetValueP                ;
       property Values[ const I_:Integer ] :TValue_    read GetValues write SetValues; default;
     end;



 

//  

implementation // 

uses LUX.GPU.OpenCL.Contex;

//  

//  

//TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>





//-------------------------------------------------------

function TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetKind :T_cl_mem_flags;
begin
     Result := _Kind or CL_MEM_ALLOC_HOST_PTR;
end;

//------------------------------------------------------------------------------

function TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.NewData :TCLMemDat_;
begin
     Result := TCLBufDat_.Create( Self );
end;

function TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetData :TCLBufDat_;
begin
     Result := TCLBufDat_( inherited Data );
end;

procedure TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.SetData( const Data_:TCLBufDat_ );
begin
     inherited Data := Data_;
end;

//------------------------------------------------------------------------------

function TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetSize :T_size_t;
begin
     Result := SizeOf( TValue_ ) * _Count;
end;

//------------------------------------------------------------------------------

function TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetCount :Integer;
begin
     Result := _Count;
end;

procedure TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.SetCount( const Count_:Integer );
begin
     Handle := nil;

     _Count := Count_;
end;

//-------------------------------------------------------

function TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.CreateHandle :T_cl_int;
begin
     _Handle := clCreateBuffer( TCLContex<TCLSystem_,TCLPlatfo_>( Contex ).Handle, Kind, Size, nil, @Result );
end;



constructor TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.Create;
begin
     inherited;

     _Count := 1;
end;

destructor TCLBuffer<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.Destroy;
begin
      Handle := nil;

     inherited;
end;

//TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>



//-------------------------------------------------------

function TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetBuffer :TCLBuffer_;
begin
     Result := TCLBuffer_( Memory );
end;

function TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetValueP( const I_:Integer ) :PValue_;
begin
     Result := Handle;  Inc( Result, I_ );
end;

function TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.GetValues( const I_:Integer ) :TValue_;
begin
     Result := ValueP[ I_ ]^;
end;

procedure TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.SetValues( const I_:Integer; const Values_:TValue_ );
begin
     ValueP[ I_ ]^ := Values_;
end;

//-------------------------------------------------------

function TCLBufDat<TCLSystem_,TCLPlatfo_,TCLContex_,TValue_>.CreateHandle :T_cl_int;
begin
     inherited;

     _Handle := clEnqueueMapBuffer( Queuer.Handle, Buffer.Handle, CL_TRUE, Mode, 0, Buffer.Size, 0, nil, nil, @Result );
end;



//  

end.
