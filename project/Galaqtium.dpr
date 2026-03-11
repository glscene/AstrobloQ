program Galaqtium;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgGalaqtium in '..\source\galaxy\fgGalaqtium.pas' {FormGalaqtium},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions in '..\source\galaxy\fgOptions.pas' {FormOptions},
  fmAbout in '..\source\fmAbout.pas' {frmAbout},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  fgNewStarblock in '..\source\galaxy\fgNewStarblock.pas' {frmNewStarblock},
  fgExoplanets in '..\source\galaxy\fgExoplanets.pas' {frmOpenExoplanets},
  fgMonitor in '..\source\galaxy\fgMonitor.pas' {frmMonitor},
  fgParadox in '..\source\galaxy\fgParadox.pas' {frmParadox},
  fgCETInet in '..\source\galaxy\fgCETInet.pas' {frmCETInet},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  fmSettings in '..\source\fmSettings.pas' {FormSettings},
  fgDiagramHR in '..\source\galaxy\fgDiagramHR.pas' {frmDiagramHR},
  fgEquations in '..\source\galaxy\fgEquations.pas' {frmEquations},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fgProjections in '..\source\galaxy\fgProjections.pas' {frmProjections},
  fgViewSolarblock in '..\source\galaxy\fgViewSolarblock.pas' {frmStarblock};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGalaqtium, FormGalaqtium);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.

