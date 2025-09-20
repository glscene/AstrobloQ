program Galaqtium_ru;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgMonitor_ru in '..\source\galaxy\fgMonitor_ru.pas' {FormMonitor},
  fgParadox_ru in '..\source\galaxy\fgParadox_ru.pas' {FormParadox},
  fgExoplanets_ru in '..\source\galaxy\fgExoplanets_ru.pas' {FormExoplanets},
  fgAstrocube_ru in '..\source\galaxy\fgAstrocube_ru.pas' {FormNewStarcube},
  fgOptions_ru in '..\source\galaxy\fgOptions_ru.pas' {FormOptions},
  fgGalaqtium_ru in '..\source\galaxy\fgGalaqtium_ru.pas' {FormGalaqtium},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  fStarProj in '..\Addons\StarProj\fStarProj.pas' {FormProjection},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {frmAbout},
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fmFormI in '..\source\fmFormI.pas' {FormI},
  fgAnalyser_ru in '..\source\galaxy\fgAnalyser_ru.pas' {FormAnalyser},
  Space.Globals in '..\source\Space.Globals.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas';

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
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.

