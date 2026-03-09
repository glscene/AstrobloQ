program Galaqtium_ru;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fgMonitor_ru in '..\source\galaxy\fgMonitor_ru.pas' {frmMonitor},
  fgParadox_ru in '..\source\galaxy\fgParadox_ru.pas' {frmParadox},
  fgExoplanets_ru in '..\source\galaxy\fgExoplanets_ru.pas' {frmOpenExoplanets},
  fgNewStarblock_ru in '..\source\galaxy\fgNewStarblock_ru.pas' {frmNewStarblock},
  fgOptions_ru in '..\source\galaxy\fgOptions_ru.pas' {FormOptions},
  fgGalaqtium_ru in '..\source\galaxy\fgGalaqtium_ru.pas' {frmGalaqtium},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {frmAbout},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  fgProjections_ru in '..\source\galaxy\fgProjections_ru.pas' {frmProjections},
  fgDiagramHR_ru in '..\source\galaxy\fgDiagramHR_ru.pas' {frmDiagramHR},
  fmSettings_ru in '..\source\fmSettings_ru.pas' {FormSettings},
  fgCETInet_ru in '..\source\galaxy\fgCETInet_ru.pas' {frmCETInet},
  fgEquations_ru in '..\source\galaxy\fgEquations_ru.pas' {frmEquations},
  fgStatistics_ru in '..\source\galaxy\fgStatistics_ru.pas' {frmStatistics},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fgStarBlock_ru in '..\source\galaxy\fgStarBlock_ru.pas' {frmStarblock};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmGalaqtium, frmGalaqtium);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.

