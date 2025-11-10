program MIDI_Sequencer_ru;
(*
   Originally based on MIDI Sequencer Components (MSC) by Arnold Reinders

   MSC is free software: you can redistribute it
   and/or modify it under the terms of the Lesser General Public License as
   published by the Free Software Foundation, either version 3 of the License,
   or (at your option) any later version.
   MSC is distributed in the hope that it will be
   useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)


uses
  Forms,
  MSC.ControllerView in 'MSC.ControllerView.pas',
  fsSequencer_ru in 'fsSequencer_ru.pas' {frmSequencer},
  MSC.ResourcesView in 'MSC.ResourcesView.pas',
  MSC.Slider in 'MSC.Slider.pas' {Component_Slider: TFrame},
  MSC_Circular_Buffer in 'MSC_Circular_Buffer.pas',
  MSC_Component in 'MSC_Component.pas',
  MSC_Container in 'MSC_Container.pas',
  MSC_Controllers in 'MSC_Controllers.pas',
  MSC_Definitions in 'MSC_Definitions.pas',
  MSC_Delphi_MIDI_Callback in 'MSC_Delphi_MIDI_Callback.pas',
  MSC_Device in 'MSC_Device.pas',
  MSC_In_Device in 'MSC_In_Device.pas',
  MSC_In_File in 'MSC_In_File.pas',
  MSC_Out_Device in 'MSC_Out_Device.pas',
  MSC_Out_File in 'MSC_Out_File.pas',
  MSC_Player in 'MSC_Player.pas',
  MSC_Recorder in 'MSC_Recorder.pas',
  MSC_Resources in 'MSC_Resources.pas',
  MSC_Sequencer in 'MSC_Sequencer.pas',
  MSC_Timer in 'MSC_Timer.pas',
  MSC_View_Base in 'MSC_View_Base.pas' {View_Base: TFrame},
  MSC_View_Piano_Roll in 'MSC_View_Piano_Roll.pas' {View_Piano_Roll: TFrame},
  MSC_View_Slider in 'MSC_View_Slider.pas' {View_Slider: TFrame},
  Publish_Subscribe in 'Publish_Subscribe.pas',
  MSC.LogUtilities in 'MSC.LogUtilities.pas',
  MSC.MathUtilities in 'MSC.MathUtilities.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSequencer, frmSequencer);
  Application.Run;
end.
