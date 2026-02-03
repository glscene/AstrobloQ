unit LUX.Asset.VisToolkit_;

interface  

uses LUX;

type  

      

     

     //  TvtkElem

     TvtkElem = class
     private
     protected
       _ID :Integer;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property ID :Integer read _ID write _ID;
     end;

//const // 

//var //$$ 

//  

implementation // 

//  

//  

// %%%%% TvtkElem

//  private

//  protected

// & public

constructor TvtkElem.Create;
begin
     inherited;

end;

destructor TvtkElem.Destroy;
begin

     inherited;
end;

//  

// 

initialization // 

finalization // 

end. // 
