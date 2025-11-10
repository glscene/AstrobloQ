unit MSC_Device;

interface

uses
  Classes,
  SysUtils,
  WinTypes,
  Messages,
  WinProcs,
  MMSystem,
  MSC_Definitions,
  MSC_Component;

type
   EMSC_Device_Error = class (EMSC_Error);

   TMIDI_Device = class (TMSC_Component)
   private

   protected
      Handle: THandle;           // Window handle used for callback notification
      FError: uInt16;            // Last MMSYSTEM error
      FDeviceID: Int32;          // MIDI device ID
      FNumdevs: Int32;           // Number of MIDI output devices on system
      FDriverVersion: Version;   // Driver version from midioutGetDevCaps
      FProductName: string;      // product name
      FMID: uInt16;              // Manufacturer ID
      FPID: uInt16;              // Product ID

      procedure SetDeviceID (DeviceID: Int32); virtual; abstract;
      procedure SetProductName (ProductName: string); virtual; abstract;

   public
      constructor Create (AOwner:TComponent); override;
      destructor Destroy; override;

      function Open: Boolean; virtual; abstract;
      function Close: Boolean; virtual; abstract;
      function is_opened: boolean; virtual; abstract;
      function is_closed: boolean; virtual; abstract;

      property Error: uInt16 read FError; // Last MMSystem error
      property DriverVersion: Version read FDriverVersion; // Version number of the driver
      property MID: uInt16 read FMID;     // Manufacturer ID
      property PID: uInt16 read FPID;     // Product ID

   published
      property NumDevs: Int32 read FNumDevs;
      property DeviceID: Int32 read FDeviceID write SetDeviceID default 0;
      property ProductName: String read FProductName write SetProductName;
   end; // Class: TMIDI_Device //

implementation

constructor TMIDI_Device.Create (AOwner:TComponent);
begin
   inherited Create (AOwner);
end; // Create //

destructor TMIDI_Device.Destroy;
begin
   inherited Destroy;
end; // Destroy //

end. // Unit: MSC_Device //
