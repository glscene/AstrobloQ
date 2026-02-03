unit LUX.FMX.Controls;

interface  

uses System.Types,
     FMX.Controls, FMX.Forms,
     LUX,
     LUX.FMX.Pratform,
     LUX.FMX.Forms;

type  

      

     

     //  HControl

     HControl = class helper for TControl
     private
     protected
     public
       ///// メソッド
       function MousePos :TPointF;
     end;

//const // 

//var //$$ 

//  

implementation // 

//  

//  

// %%%%% HControl

//  private

//  protected

// & public

/////////////////////////////////////////////////////////////////////// メソッド

function HControl.MousePos :TPointF;
begin
     Result := AbsoluteToLocal( ( Root.GetObject as TCommonCustomForm ).MousePos );
end;

//  

// 

initialization // 

finalization // 

end. // 