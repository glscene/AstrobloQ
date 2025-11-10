unit MSC_Timer;

interface

uses
  Windows,
  MMSystem,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs;

type
  TCallBack = procedure (uTimerID, uMessage: UINT; dwUser, dw1, dw2: DWORD);

  EHiResTimer = class (Exception);

{$M+}
  THiResTimer = class (TObject)
  private
     nID: uInt32;
     FEnabled: boolean;
     FInterval: uInt32;
     FResolution: uInt32;
     FOnTimer: TNotifyEvent;
     procedure CreateTimer;

  protected
     procedure SetEnabled (value: boolean);

  public
     constructor Create;
     destructor Destroy; override;

  published
     property Enabled: boolean read FEnabled write SetEnabled default FALSE;
     property Interval: uInt32 read FInterval write FInterval default 100;
     property Resolution: uInt32 read FResolution write FResolution default 100;
     property OnTimer: TNotifyEvent read FOnTimer write FOnTimer;
  end; // Class: HiResTimer //
                        
implementation

procedure TimerCallback (uTimerID, uMessage: uInt32; dwUser, dw1, dw2: uInt32); stdcall;
var hr: THiResTimer;
begin
  hr := THiResTimer (dwUser);
  if Assigned (hr.FOnTimer) then hr.FOnTimer (hr);
end; // TimerCallback //

constructor THiResTimer.Create;
begin
   inherited Create;

   FEnabled := False;
   FInterval := 500;
   FResolution := 2;
end; // Create //

destructor THiResTimer.Destroy;
begin
   Enabled := False;

   inherited Destroy;
end; // Destroy //

procedure THiResTimer.SetEnabled (value: boolean);
var return: Int32;
begin
   if value <> FEnabled then
   begin
      if value then
      begin
         return := timeBeginperiod (FResolution);
         if return = TIMERR_NOCANDO then
         begin
            FEnabled := False;
            raise EHiResTimer.Create ('THiResTimer.SetEnabled - timer_nocando');
         end; // if
         CreateTimer;
      end else
      begin
         timeKillEvent (nID);
         timeEndperiod (FResolution);
      end; // if
      FEnabled := value;
   end; // if
end; // SetEnabled //

procedure THiResTimer.CreateTimer;
var
  lpTimerProc: TFNTimeCallBack;
begin
{$T-} // Switch off type checked pointers
   lpTimerProc := @TimerCallback;
{$T+} // Switch on again   
   nID := timeSetEvent (FInterval, FResolution, lpTimerProc, uInt32 (self), TIME_PERIODIC);
   if nID = 0 then
   begin
      FEnabled := FALSE;
      raise EHiResTimer.Create ('THiResTimer.CreateTimer - Unable to create a timer');
   end; // if
end; // CreateTimer //

end.
