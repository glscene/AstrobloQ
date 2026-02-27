program Galaqtium_ru;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fgMonitor_ru in '..\source\galaxy\fgMonitor_ru.pas' {FormMonitor},
  fgParadox_ru in '..\source\galaxy\fgParadox_ru.pas' {FormParadox},
  fgExoplanets_ru in '..\source\galaxy\fgExoplanets_ru.pas' {FormExoplanets},
  fgAstrocube_ru in '..\source\galaxy\fgAstrocube_ru.pas' {FormNewStarcube},
  fgOptions_ru in '..\source\galaxy\fgOptions_ru.pas' {frmOptions},
  fgGalaqtium_ru in '..\source\galaxy\fgGalaqtium_ru.pas' {frmGalaqtium},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {FormAbout},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  fgStarProj in '..\source\galaxy\fgStarProj.pas' {FormProjection},
  fgDiagramHR_ru in '..\source\galaxy\fgDiagramHR_ru.pas' {FormDiagramHR},
  fmSettings_ru in '..\source\fmSettings_ru.pas' {frmSettings},
  fgCETInet_ru in '..\source\galaxy\fgCETInet_ru.pas' {FormCETInet},
  fgEquations_ru in '..\source\galaxy\fgEquations_ru.pas' {FormEquations},
  fgStatistics_ru in '..\source\galaxy\fgStatistics_ru.pas' {FormStatistics};

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
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.

