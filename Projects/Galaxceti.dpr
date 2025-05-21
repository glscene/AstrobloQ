program Galaxceti;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgGalaxceti in '..\source\galaxy\fgGalaxceti.pas' {frmGalaxeti},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fStarProj in '..\Addons\StarProj\fStarProj.pas' {FormProjection},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions in '..\source\galaxy\fgOptions.pas' {frmOption},
  fmSettings in '..\source\fmSettings.pas' {FormSettings},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Space.Globals in '..\source\Space.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormI in '..\source\fmFormI.pas' {frmI},
  fgAstrocube in '..\source\galaxy\fgAstrocube.pas' {FormAstrocube},
  fgExoplanets in '..\source\galaxy\fgExoplanets.pas' {FormExoplanets},
  fgMonitor in '..\source\galaxy\fgMonitor.pas' {FormMonitor},
  fgParadox in '..\source\galaxy\fgParadox.pas' {FormParadox},
  fgAnalyser in '..\source\galaxy\fgAnalyser.pas' {FormAnalyser},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas';

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGalaxeti, frmGalaxeti);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmOption, frmOption);
  Application.CreateForm(TfrmI, frmI);
  Application.Run;
end.

