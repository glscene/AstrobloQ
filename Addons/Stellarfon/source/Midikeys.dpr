program Midikeys;

uses
  Forms,
  fMidikeys in 'fMidikeys.pas' {FormMidikeys},
  fSettings in 'fSettings.pas' {frmSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMidikeys, FormMidikeys);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
