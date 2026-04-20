program Galaqtium_en;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgGalaqtium in '..\source\galaxy\fgGalaqtium.pas' {FormGalaqtium},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions in '..\source\galaxy\fgOptions.pas' {FormOptions},
  fmAbout_en in '..\source\fmAbout_en.pas' {frmAbout},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  fgMonitor in '..\source\galaxy\fgMonitor.pas' {frmMonitor},
  fgParadox in '..\source\galaxy\fgParadox.pas' {frmParadox},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  fgSettings_en in '..\source\galaxy\fgSettings_en.pas' {FormSettings},
  fgDiagramHR in '..\source\galaxy\fgDiagramHR.pas' {frmDiagramHR},
  fgEquations in '..\source\galaxy\fgEquations.pas' {frmEquations},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fgGlobulars in '..\source\galaxy\fgGlobulars.pas' {frmGlobulars},
  fgViewGalablock in '..\source\galaxy\fgViewGalablock.pas' {frmGalablock},
  fgNewGalablock in '..\source\galaxy\fgNewGalablock.pas' {frmNewStarblock},
  fgTechnets in '..\source\galaxy\fgTechnets.pas' {frmTechnets};

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

