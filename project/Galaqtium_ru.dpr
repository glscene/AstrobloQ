(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
program Galaqtium_ru;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fgMonitor_ru in '..\source\galaxy\ru\fgMonitor_ru.pas' {frmMonitor},
  fgParadox_ru in '..\source\galaxy\ru\fgParadox_ru.pas' {frmParadox},
  fgOptions_ru in '..\source\galaxy\ru\fgOptions_ru.pas' {FormOptions},
  fgGalaqtium_ru in '..\source\galaxy\ru\fgGalaqtium_ru.pas' {FormGalaqtium},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {frmAbout},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  fgGlobulars_ru in '..\source\galaxy\ru\fgGlobulars_ru.pas' {frmProjections},
  fgDiagramHR_ru in '..\source\galaxy\ru\fgDiagramHR_ru.pas' {frmDiagramHR},
  fgSettings_ru in '..\source\galaxy\ru\fgSettings_ru.pas' {FormSettings},
  fgEquations_ru in '..\source\galaxy\ru\fgEquations_ru.pas' {frmEquations},
  fgStatistics_ru in '..\source\galaxy\ru\fgStatistics_ru.pas' {frmStatistics},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fgSolving_ru in '..\source\galaxy\ru\fgSolving_ru.pas' {frmSolving},
  fgNewGalablock_ru in '..\source\galaxy\ru\fgNewGalablock_ru.pas' {frmNewStarblock},
  fgViewGalablock_ru in '..\source\galaxy\ru\fgViewGalablock_ru.pas' {frmStarblock},
  fgTechnets_ru in '..\source\galaxy\ru\fgTechnets_ru.pas' {frmTechnets},
  fgNavigator_ru in '..\source\galaxy\ru\fgNavigator_ru.pas' {frmNavigator};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TFormGalaqtium, FormGalaqtium);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TfrmNewStarblock, frmNewStarblock);
  Application.CreateForm(TfrmStarblock, frmStarblock);
  Application.CreateForm(TfrmTechnets, frmTechnets);
  Application.Run;
end.

