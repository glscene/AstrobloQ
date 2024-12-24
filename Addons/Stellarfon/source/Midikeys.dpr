program Midikeys;

uses
  Forms,
  fMidikeys in 'fMidikeys.pas' {FormMidikeys},
  fSettings in 'fSettings.pas' {FormSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMidikeys, FormMidikeys);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
