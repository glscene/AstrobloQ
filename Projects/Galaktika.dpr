program Galaktika;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgAnalyser in '..\Source\galaxy\fgAnalyser.pas' {FormAnalyser},
  fgMonitor in '..\Source\galaxy\fgMonitor.pas' {FormMonitor},
  fgParadox in '..\Source\galaxy\fgParadox.pas' {FormParadox},
  fgExoplanets in '..\Source\galaxy\fgExoplanets.pas' {FormExoplanets},
  fmForm in '..\source\fmForm.pas' {FormI},
  fgStarcube in '..\Source\galaxy\fgStarcube.pas' {FormNewStarcube},
  fgGalaktika in '..\source\galaxy\fgGalaktika.pas' {frmGalaktika},
  umUtils in '..\source\umUtils.pas',
  fStarProj in '..\Addons\StarProj\fStarProj.pas' {FormProjection},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions in '..\source\galaxy\fgOptions.pas' {frmOption},
  fmSettings in '..\source\fmSettings.pas' {FormSettings},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  umGlobals in '..\source\umGlobals.pas',
  umSkyBodies in '..\source\umSkyBodies.pas';

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGalaktika, frmGalaktika);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmOption, frmOption);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.

