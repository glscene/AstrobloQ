program UniverseGXS;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniverse in '..\Source\universe\fxUniverse.pas' {frmGalaxy},
  fxSettings in '..\Source\universe\fxSettings.pas' {frmSettings},
  fxAbout in '..\Source\universe\fxAbout.pas' {FormAbout},
  Astro.Material in '..\source\astro\Astro.Material.pas',
  fxAstrogen in '..\Source\universe\fxAstrogen.pas' {FormAstrogen},
  LUX.FMX.Material in '..\source\astro\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in '..\source\astro\LUX.FMX.Types3D.pas',
  LUX in '..\source\astro\LUX.pas',
  gnuGettext in '..\source\ucode\gnuGettext.pas',
  dxDialogs in '..\Source\universe\dxDialogs.pas' {dmDialogs: TDataModule},
  fxForm in '..\Source\universe\fxForm.pas' {FormO};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGalaxy, frmGalaxy);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TFormO, FormO);
  Application.Run;
end.
