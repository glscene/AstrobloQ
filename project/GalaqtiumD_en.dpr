program GalaqtiumD_en;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgGalaqtium_en in '..\source\galaxy\en\fgGalaqtium_en.pas' {FormGalaqtium},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions_en in '..\source\galaxy\en\fgOptions_en.pas' {FormOptions},
  fmAbout_en in '..\source\fmAbout_en.pas' {frmAbout},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  fgMonitor_en in '..\source\galaxy\en\fgMonitor_en.pas' {frmMonitor},
  fgParadox_en in '..\source\galaxy\en\fgParadox_en.pas' {frmParadox},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  fgSettings_en in '..\source\galaxy\en\fgSettings_en.pas' {FormSettings},
  fgDiagramHR_en in '..\source\galaxy\en\fgDiagramHR_en.pas' {frmDiagramHR},
  fgEquations_en in '..\source\galaxy\en\fgEquations_en.pas' {frmEquations},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fgGlobulars_en in '..\source\galaxy\en\fgGlobulars_en.pas' {frmGlobulars},
  fgViewGalablock_en in '..\source\galaxy\en\fgViewGalablock_en.pas' {frmGalablock},
  fgGenGalablock_en in '..\source\galaxy\en\fgGenGalablock_en.pas' {frmNewStarblock},
  fgTechnets_en in '..\source\galaxy\en\fgTechnets_en.pas' {frmTechnets};

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
  Application.CreateForm(TfrmGalablock, frmGalablock);
  Application.CreateForm(TfrmNewStarblock, frmNewStarblock);
  Application.CreateForm(TfrmTechnets, frmTechnets);
  Application.Run;
end.

