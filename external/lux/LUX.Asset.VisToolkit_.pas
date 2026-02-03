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
       
       property ID :Integer read _ID write _ID;
     end;



 

//  

implementation //=========================================

//  

//  

//TvtkElem







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

initialization //===================== 


finalization // 

end.
