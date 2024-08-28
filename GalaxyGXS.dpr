program GalaxyGXS;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxGalaxy in 'source\astrod\fxGalaxy.pas' {frmGalaxy},
  fxSettings in 'source\astrod\fxSettings.pas' {frmSettings},
  fxForm in 'source\astrod\fxForm.pas' {FormO},
  fxAbout in 'source\astrod\fxAbout.pas' {FormAbout},
  Astro.Material in 'source\astrod\Astro.Material.pas',
  fxAstrogen in 'source\astrod\fxAstrogen.pas' {FormAstrogen},
  LUX.FMX.Material in 'source\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in 'source\lux\LUX.FMX.Types3D.pas',
  LUX in 'source\lux\LUX.pas',
  gnuGettext in 'source\ucode\gnuGettext.pas',
  dxDialogs in 'source\astrod\dxDialogs.pas' {dmDialogs: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGalaxy, frmGalaxy);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.Run;
end.
