program GalaxcetiR;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgMonitorR in '..\source\galaxy\fgMonitorR.pas' {FormMonitor},
  fgParadoxR in '..\source\galaxy\fgParadoxR.pas' {FormParadox},
  fgExoplanetsR in '..\source\galaxy\fgExoplanetsR.pas' {FormExoplanets},
  fgAstrocubeR in '..\source\galaxy\fgAstrocubeR.pas' {FormNewStarcube},
  fgOptionsR in '..\source\galaxy\fgOptionsR.pas' {frmOptions},
  fgGalaxcetiR in '..\source\galaxy\fgGalaxcetiR.pas' {frmGalaxceti},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fStarProj in '..\Addons\StarProj\fStarProj.pas' {FormProjection},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmSettingsR in '..\source\fmSettingsR.pas' {FormSettings},
  fmAboutR in '..\source\fmAboutR.pas' {FormAbout},
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormI in '..\source\fmFormI.pas' {frmI},
  fgAnalyserR in '..\source\galaxy\fgAnalyserR.pas' {FormAnalyser},
  Space.Globals in '..\source\Space.Globals.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas';

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGalaxceti, frmGalaxceti);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmI, frmI);
  Application.Run;
end.

