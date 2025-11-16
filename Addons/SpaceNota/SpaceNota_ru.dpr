program SpaceNota_ru;

uses
  Vcl.Forms,
  fsStellarfon_ru in 'code\fsStellarfon_ru.pas' {frmStellarfon},
  fsAbout_ru in 'code\fsAbout_ru.pas' {FormAbout},
  fsColorFigures_ru in 'code\fsColorFigures_ru.pas' {FormColorFigures},
  Vcl.Themes,
  Vcl.Styles,
  fsMidikeys_ru in 'code\fsMidikeys_ru.pas' {FormMidikeys},
  GLS.MusicKeys in 'code\GLS.MusicKeys.pas',
  fsSetColors_ru in 'code\fsSetColors_ru.pas' {frmSetColors},
  fsSettings_ru in 'code\fsSettings_ru.pas' {frmSettings},
  dmBase in '..\..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fsFirstForm_ru in 'code\fsFirstForm_ru.pas' {frmFirst},
  Astro.Utils in '..\..\source\astro\Astro.Utils.pas',
  Astro.ReadHyg in '..\..\source\astro\Astro.ReadHyg.pas',
  Astro.Globals in '..\..\source\astro\Astro.Globals.pas',
  Bass.Sound in 'code\Bass.Sound.pas',
  fsMediaPlayer_ru in 'code\fsMediaPlayer_ru.pas' {frmMediaPlayer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

//  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmStellarfon, frmStellarfon);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TfrmMediaPlayer, frmMediaPlayer);
  Application.CreateForm(TfrmSetColors, frmSetColors);
  Application.Run;
end.
