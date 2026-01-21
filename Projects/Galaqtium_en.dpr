program Galaqtium_en;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgGalaqtium in '..\source\galaxy\fgGalaqtium.pas' {frmGalaqtium},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions in '..\source\galaxy\fgOptions.pas' {frmOption},
  fmAbout_en in '..\source\fmAbout_en.pas' {FormAbout},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  fgAstrocube in '..\source\galaxy\fgAstrocube.pas' {FormAstrocube},
  fgExoplanets in '..\source\galaxy\fgExoplanets.pas' {FormExoplanets},
  fgMonitor in '..\source\galaxy\fgMonitor.pas' {FormMonitor},
  fgParadox in '..\source\galaxy\fgParadox.pas' {FormParadox},
  fgAnalyser in '..\source\galaxy\fgAnalyser.pas' {FormAnalyser},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  fmSettings_en in '..\source\fmSettings_en.pas' {frmSettings},
  fgStarProj in '..\source\galaxy\fgStarProj.pas' {FormProjection};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGalaqtium, frmGalaqtium);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmOption, frmOption);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormProjection, FormProjection);
  Application.Run;
end.

