program GalaxyGXS;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxGalaxy in 'source\fmxpas\fxGalaxy.pas' {frmGalaxy},
  fxSettings in 'source\fmxpas\fxSettings.pas' {frmSettings},
  fxForm in 'source\fmxpas\fxForm.pas' {FormO},
  fxAbout in 'source\fmxpas\fxAbout.pas' {FormAbout},
  Astro.Material in 'source\astro\Astro.Material.pas',
  fxAstrogen in 'source\fmxpas\fxAstrogen.pas' {FormAstrogen},
  LUX.FMX.Material in 'source\astro\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in 'source\astro\LUX.FMX.Types3D.pas',
  LUX in 'source\astro\LUX.pas',
  gnuGettext in 'source\ucode\gnuGettext.pas',
  dxDialogs in 'source\fmxpas\dxDialogs.pas' {dmDialogs: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGalaxy, frmGalaxy);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.Run;
end.
