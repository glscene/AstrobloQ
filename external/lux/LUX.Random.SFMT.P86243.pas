unit LUX.Random.SFMT.P86243;

interface  

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type  

      

     

     //  TRandom32SMT86243

     TRandom32SMT86243 = class( TRandom32SMT )
     private const
     private
     protected
       
       function GetSFMT_MEXP :Int32s; override;
       function GetSFMT_POS1 :Int32s; override;
       function GetSFMT_SL1 :Int32s; override;
       function GetSFMT_SL2 :Int32s; override;
       function GetSFMT_SR1 :Int32s; override;
       function GetSFMT_SR2 :Int32s; override;
       function GetSFMT_MSK1 :Int32u; override;
       function GetSFMT_MSK2 :Int32u; override;
       function GetSFMT_MSK3 :Int32u; override;
       function GetSFMT_MSK4 :Int32u; override;
       function GetSFMT_PARITY1 :Int32u; override;
       function GetSFMT_PARITY2 :Int32u; override;
       function GetSFMT_PARITY3 :Int32u; override;
       function GetSFMT_PARITY4 :Int32u; override;
       function GetSFMT_IDSTR :String; override;
     public
     end;

     //  TRandom64SMT86243

     TRandom64SMT86243 = class( TRandom64SMT )
     private const
     private
     protected
       
       function GetSFMT_MEXP :Int32s; override;
       function GetSFMT_POS1 :Int32s; override;
       function GetSFMT_SL1 :Int32s; override;
       function GetSFMT_SL2 :Int32s; override;
       function GetSFMT_SR1 :Int32s; override;
       function GetSFMT_SR2 :Int32s; override;
       function GetSFMT_MSK1 :Int32u; override;
       function GetSFMT_MSK2 :Int32u; override;
       function GetSFMT_MSK3 :Int32u; override;
       function GetSFMT_MSK4 :Int32u; override;
       function GetSFMT_PARITY1 :Int32u; override;
       function GetSFMT_PARITY2 :Int32u; override;
       function GetSFMT_PARITY3 :Int32u; override;
       function GetSFMT_PARITY4 :Int32u; override;
       function GetSFMT_IDSTR :String; override;
     public
     end;



 

//  

implementation //=========================================

uses System.SysUtils;

//  

//  

//TRandom32SMT86243





function TRandom32SMT86243.GetSFMT_MEXP :Int32s;
begin
     Result := 86243;
end;

function TRandom32SMT86243.GetSFMT_POS1 :Int32s;
begin
     Result := 366;
end;

function TRandom32SMT86243.GetSFMT_SL1 :Int32s;
begin
     Result := 6;
end;

function TRandom32SMT86243.GetSFMT_SL2 :Int32s;
begin
     Result := 7;
end;

function TRandom32SMT86243.GetSFMT_SR1 :Int32s;
begin
     Result := 19;
end;

function TRandom32SMT86243.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom32SMT86243.GetSFMT_MSK1 :Int32u;
begin
     Result := $fdbffbff;
end;

function TRandom32SMT86243.GetSFMT_MSK2 :Int32u;
begin
     Result := $bff7ff3f;
end;

function TRandom32SMT86243.GetSFMT_MSK3 :Int32u;
begin
     Result := $fd77efff;
end;

function TRandom32SMT86243.GetSFMT_MSK4 :Int32u;
begin
     Result := $bf9ff3ff;
end;

function TRandom32SMT86243.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom32SMT86243.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT86243.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT86243.GetSFMT_PARITY4 :Int32u;
begin
     Result := $e9528d85;
end;

function TRandom32SMT86243.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-86243:366-6-7-19-1:fdbffbff-bff7ff3f-fd77efff-bf9ff3ff';
end;



//TRandom64SMT86243





function TRandom64SMT86243.GetSFMT_MEXP :Int32s;
begin
     Result := 86243;
end;

function TRandom64SMT86243.GetSFMT_POS1 :Int32s;
begin
     Result := 366;
end;

function TRandom64SMT86243.GetSFMT_SL1 :Int32s;
begin
     Result := 6;
end;

function TRandom64SMT86243.GetSFMT_SL2 :Int32s;
begin
     Result := 7;
end;

function TRandom64SMT86243.GetSFMT_SR1 :Int32s;
begin
     Result := 19;
end;

function TRandom64SMT86243.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom64SMT86243.GetSFMT_MSK1 :Int32u;
begin
     Result := $fdbffbff;
end;

function TRandom64SMT86243.GetSFMT_MSK2 :Int32u;
begin
     Result := $bff7ff3f;
end;

function TRandom64SMT86243.GetSFMT_MSK3 :Int32u;
begin
     Result := $fd77efff;
end;

function TRandom64SMT86243.GetSFMT_MSK4 :Int32u;
begin
     Result := $bf9ff3ff;
end;

function TRandom64SMT86243.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom64SMT86243.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT86243.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT86243.GetSFMT_PARITY4 :Int32u;
begin
     Result := $e9528d85;
end;

function TRandom64SMT86243.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-86243:366-6-7-19-1:fdbffbff-bff7ff3f-fd77efff-bf9ff3ff';
end;



//  

// 

initialization //===================== 


finalization // 

end.