unit LUX.GPU.OpenCL.Argume;

interface  

uses cl_version, cl_platform, cl,
     LUX.Data.List,
     LUX.Code.C,
     LUX.GPU.OpenCL.core;

type  

     TCLArgumes <TCLSystem_,TCLPlatfo_,TCLContex_:class> = class;
       TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class;

      

     

     //  TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_>

     TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class( TListChildr<TCLContex_,TCLArgumes<TCLSystem_,TCLPlatfo_,TCLContex_>> )
     private
       type TCLArgumes_ = TCLArgumes<TCLSystem_,TCLPlatfo_,TCLContex_>;
     protected
       
       function GetHanPtr :P_void; virtual; abstract;
       function GetHanSiz :T_size_t; virtual; abstract;
       
       function CreateHandle :T_cl_int; virtual; abstract;
       function DestroHandle :T_cl_int; virtual; abstract;
     public
       constructor Create; override;
       constructor Create( const Contex_:TCLContex_ ); overload; virtual;
       destructor Destroy; override;
       
       property Contex  :TCLContex_  read GetOwnere;
       property Argumes :TCLArgumes_ read GetParent;
       property HanPtr  :P_void      read GetHanPtr;
       property HanSiz  :T_size_t    read GetHanSiz;
     end;

     //  TCLArgumes<TCLSystem_,TCLPlatfo_,TCLContex_>

     TCLArgumes<TCLSystem_,TCLPlatfo_,TCLContex_:class> = class( TListParent<TCLContex_,TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_>> )
     private
     protected
     public
       
       property Contex :TCLContex_ read GetOwnere;
     end;



 

//  

implementation //=========================================

uses LUX.GPU.OpenCL.Contex;

//  

//  

//TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_>







constructor TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_>.Create;
begin
     inherited;

end;

constructor TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_>.Create( const Contex_:TCLContex_ );
begin
     inherited Create( TCLContex<TCLSystem_,TCLPlatfo_>( Contex_ ).Argumes );
end;

destructor TCLArgume<TCLSystem_,TCLPlatfo_,TCLContex_>.Destroy;
begin

     inherited;
end;

//TCLArgumes<TCLSystem_,TCLPlatfo_,TCLContex_>







//  

end.
