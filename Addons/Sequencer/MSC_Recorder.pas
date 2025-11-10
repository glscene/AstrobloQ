unit MSC_Recorder;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  Buttons,
  ToolWin,
  ExtCtrls,
  MMSystem,
  MSC_Definitions,
  MSC_Component,
  MSC_Container,
  MSC_In_Device,
  MSC_Resources;

type
   EMSC_Recorder = class (Exception);

   TMIDI_Recorder = class (TMSC_Component)
   private
      FMIDI_Container: TMIDI_Container;
      FMIDI_Res_In: TMIDI_Resources_In;
      FRecording: boolean;

      procedure set_MIDI_container (value: TMIDI_Container);
      procedure set_MIDI_sound_cards (value: TMIDI_Resources_In);

   protected
      procedure Notification (AComponent: TComponent; Operation: TOperation); override;

      function  get_recording: boolean;
      procedure set_recording (value: boolean);
      procedure set_onmidiinput (value: TOnMidiInput);

   public
      constructor Create (AOwner: TComponent); override;
      destructor Destroy; override;

   published
      property Recording: boolean read get_recording write set_recording;
      property MIDI_Container: TMIDI_Container
               read FMIDI_Container write set_MIDI_Container;
      property MIDI_Res_In: TMIDI_Resources_In
               read FMIDI_Res_In write set_MIDI_sound_cards;
      property OnMidiInput: TOnMidiInput write set_onmidiinput;
   end; // Class: TMIDI_Recorder //

procedure Register;

implementation

procedure Register;
begin
   RegisterComponents (MSC_Package_Name, [TMIDI_Recorder]);
end;

{*******************************************************************
*                                                                  *
* Class TMIDI_Recorder                                             *
*                                                                  *
********************************************************************}

constructor TMIDI_Recorder.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);

// Set properties during design time
   MIDI_Container := nil;
   MIDI_Res_In    := nil;

// And the rest during creation time
   if not (csDesigning in ComponentState) then
   begin
   end; // if
end; // Create //

destructor TMIDI_Recorder.Destroy;
begin
   if not (csDesigning in ComponentState) then
   begin
   end; // if

   inherited destroy;
end; // Destroy //

function TMIDI_Recorder.get_recording: boolean;
begin
   get_recording := FRecording;
end; // get_recording //

procedure TMIDI_Recorder.set_recording (value: boolean);
var MIDI_In: TMIDI_Device_Input;
    port: Int32;
begin
   FRecording := value;

   for port := 0 to MIDI_Res_In.Count - 1 do
   begin
      MIDI_In := MIDI_Res_In.Port_In [port];
      if MIDI_In.Status = misOpen then
      begin
         if FRecording
            then MIDI_In.Start
            else MIDI_In.Stop;
      end; // if
   end; // for
end; // set_recording //

procedure TMIDI_Recorder.set_onmidiinput (value: TOnMidiInput);
begin
   if MIDI_Res_In <> nil then
   begin
      MIDI_Res_In.OnMidiInput := value;
   end; // if
end; // set_onmidiinput //

procedure TMIDI_Recorder.Notification (AComponent: TComponent; Operation: TOperation);
begin
   if Operation = opRemove then
   begin
      if AComponent is TMIDI_Resources_In then MIDI_Res_In    := nil;
   end; // if
end; // Notification //

procedure TMIDI_Recorder.set_MIDI_container (value: TMIDI_Container);
begin
   FMIDI_Container := value;
end; // set_MIDI_container //

procedure TMIDI_Recorder.set_MIDI_sound_cards (value: TMIDI_Resources_In);
begin
   FMIDI_Res_In := value;
end; // set_MIDI_sound_cards //

end. // Unit: MSC_Player //
