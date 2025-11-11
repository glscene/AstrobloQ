program Stellarfon;

uses
  Vcl.Forms,
  fsStellarfon in 'code\fsStellarfon.pas' {frmStellarfon},
  fsMidikeys in 'code\fsMidikeys.pas' {FormMidikeys},
  fsAbout in 'code\fsAbout.pas' {FormAbout},
  fsFirstForm in 'code\fsFirstForm.pas' {frmFirst},
  fsSettings in 'code\fsSettings.pas' {frmSettings},
  Vcl.Themes,
  Vcl.Styles,
  GLS.MusicKeys in 'code\GLS.MusicKeys.pas',
  fsColorFigures in 'code\fsColorFigures.pas' {FormColorFigures},
  fsSetColors in 'code\fsSetColors.pas' {frmSetColors},
  fsMediaPlayer in 'code\fsMediaPlayer.pas' {frmMediaPlayer},
  fsSequencer in '..\Sequencer\fsSequencer.pas' {FormSequencer},
  dmBase in '..\..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\..\source\dmImages.pas' {DataModuleImages: TDataModule},
  Astro.ReadHyg in '..\..\source\astro\Astro.ReadHyg.pas',
  Astro.Globals in '..\..\source\astro\Astro.Globals.pas',
  Astro.Utils in '..\..\source\astro\Astro.Utils.pas',
  Bass.Sound in 'code\Bass.Sound.pas';

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
