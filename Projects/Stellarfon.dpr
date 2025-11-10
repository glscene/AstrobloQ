program Stellarfon;

uses
  Vcl.Forms,
  fsStellarfon in '..\source\stell\fsStellarfon.pas' {frmStellarfon},
  fsMidikeys in '..\source\stell\fsMidikeys.pas' {FormMidikeys},
  fsAbout in '..\source\stell\fsAbout.pas' {FormAbout},
  fsFirstForm in '..\source\stell\fsFirstForm.pas' {frmFirst},
  fsSettings in '..\source\stell\fsSettings.pas' {frmSettings},
  Vcl.Themes,
  Vcl.Styles,
  Stell.Musickeys in '..\source\stell\Stell.Musickeys.pas',
  fsColorFigures in '..\source\stell\fsColorFigures.pas' {FormColorFigures},
  fsSetColors in '..\source\stell\fsSetColors.pas' {frmSetColors},
  fsMediaPlayer in '..\source\stell\fsMediaPlayer.pas' {frmMediaPlayer},
  fsSequencer in '..\Addons\Sequencer\fsSequencer.pas' {FormSequencer},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  uConstellations in '..\src\uConstellations.pas',
  uSound in '..\src\uSound.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmStellarfon, frmStellarfon);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TfrmSetColors, frmSetColors);
  Application.CreateForm(TfrmMediaPlayer, frmMediaPlayer);
  Application.CreateForm(TFormSequencer, FormSequencer);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.Run;
end.
