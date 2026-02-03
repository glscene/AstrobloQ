unit LUX.Asset.VisToolkit.Poin;

interface  

uses LUX, LUX.D1, LUX.D2, LUX.D3,
     LUX.Asset.VisToolkit_;

type  

      

     

     //  TvtkPoin

     TvtkPoin = class( TvtkElem )
     private
     protected
       _Pos :TSingle3D;
       _Scalar :Single;
       _Vector :TSingle3D;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Pos    :TSingle3D read _Pos    write _Pos   ;
       property Scalar :Single    read _Scalar write _Scalar;
       property Vector :TSingle3D read _Vector write _Vector;
     end;

//const // 

//var //$$ 

//  

implementation // 

//  

//  

// %%%%% TvtkPoin

//  private

//  protected

// & public

constructor TvtkPoin.Create;
begin
     inherited;

end;

destructor TvtkPoin.Destroy;
begin

     inherited;
end;

//  

// 

initialization // 

finalization // 

end. // 
