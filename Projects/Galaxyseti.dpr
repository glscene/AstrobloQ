program Galaxyseti;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgGalaxyseti in '..\source\galaxy\fgGalaxyseti.pas' {FormGalaxyseti},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fStarProj in '..\Addons\StarProj\fStarProj.pas' {FormProjection},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions in '..\source\galaxy\fgOptions.pas' {frmOption},
  fmAbout in '..\source\fmAbout.pas' {FrmAbout},
  Space.Globals in '..\source\Space.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormI in '..\source\fmFormI.pas' {FormI},
  fgAstrocube in '..\source\galaxy\fgAstrocube.pas' {FormAstrocube},
  fgExoplanets in '..\source\galaxy\fgExoplanets.pas' {FormExoplanets},
  fgMonitor in '..\source\galaxy\fgMonitor.pas' {FormMonitor},
  fgParadox in '..\source\galaxy\fgParadox.pas' {FormParadox},
  fgAnalyser in '..\source\galaxy\fgAnalyser.pas' {FormAnalyser},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  fmSettings in '..\source\fmSettings.pas' {FormSettings};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGalaxyseti, FormGalaxyseti);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmOption, frmOption);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.

