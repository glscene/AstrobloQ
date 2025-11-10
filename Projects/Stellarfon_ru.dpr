program Stellarfon_ru;

uses
  Vcl.Forms,
  fsStellarfon_ru in '..\source\stell\fsStellarfon_ru.pas' {frmStellarfon},
  fsAbout_ru in '..\source\stell\fsAbout_ru.pas' {FormAbout},
  fsColorFigures_ru in '..\source\stell\fsColorFigures_ru.pas' {FormColorFigures},
  Vcl.Themes,
  Vcl.Styles,
  fsMidikeys_ru in '..\source\stell\fsMidikeys_ru.pas' {FormMidikeys},
  Stell.Musickeys in '..\source\stell\Stell.Musickeys.pas',
  fsMediaPlayer_ru in '..\source\stell\fsMediaPlayer_ru.pas' {frmMediaPlayer},
  fsSetColors_ru in '..\source\stell\fsSetColors_ru.pas' {frmSetColors},
  fsSettings_ru in '..\source\stell\fsSettings_ru.pas' {frmSettings},
  fsSequencer_ru in '..\Addons\Sequencer\fsSequencer_ru.pas' {frmSequencer},
  uConstellations in '..\src\uConstellations.pas',
  uSound in '..\src\uSound.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fsFirstForm_ru in '..\source\stell\fsFirstForm_ru.pas' {frmFirst},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

//  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmStellarfon, frmStellarfon);
  Application.CreateForm(TfrmMediaPlayer, frmMediaPlayer);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.Run;
end.
