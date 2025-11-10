unit MSC_Component;

interface

uses
  Classes,
  Wintypes,
  SysUtils,
  MSC_Definitions;

type
   TTime_Change_Event = procedure (Sender: Tobject; time, current_event: Int32) of object;

   EMSC_Component_Error = class (EMSC_Error);

   TMSC_Component = class (TComponent)
   end; // Class: TMSC_Component //

implementation //=============================================================

end. // Unit: MSC_Component //
