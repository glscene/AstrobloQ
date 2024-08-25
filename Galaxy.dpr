program Galaxy;

uses
  System.StartUpCopy,
  FMX.Forms,
  fdGalaxy in 'source\astrod\fdGalaxy.pas' {frmGalaxy},
  fdSettings in 'source\astrod\fdSettings.pas' {frmSettings},
  fdForm in 'source\astrod\fdForm.pas' {FormO},
  fdAbout in 'source\astrod\fdAbout.pas' {FormAbout},
  Astro.Material in 'source\astrod\Astro.Material.pas',
  fdAstrogen in 'source\astrod\fdAstrogen.pas' {FormAstrogen},
  LUX.FMX.Material in 'source\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in 'source\lux\LUX.FMX.Types3D.pas',
  LUX in 'source\lux\LUX.pas',
  gnuGettext in 'source\ucode\gnuGettext.pas',
  ddDialogs in 'source\astrod\ddDialogs.pas' {dmDialogs: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGalaxy, frmGalaxy);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.Run;
end.
