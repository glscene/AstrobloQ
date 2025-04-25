program Galaktika;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgGalaktika in '..\source\galaxy\fgGalaktika.pas' {frmGalaktika},
  MWS.Utils in '..\source\MWS.Utils.pas',
  fStarProj in '..\Addons\StarProj\fStarProj.pas' {FormProjection},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fgOptions in '..\source\galaxy\fgOptions.pas' {frmOption},
  fmSettings in '..\source\fmSettings.pas' {FormSettings},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Space.Globals in '..\source\Space.Globals.pas',
  MWS.SkyBodies in '..\source\MWS.SkyBodies.pas',
  fmForm in '..\source\fmForm.pas' {FormI},
  fgAstrocube in '..\source\galaxy\fgAstrocube.pas' {FormAstrocube},
  fgExoplanets in '..\source\galaxy\fgExoplanets.pas' {FormExoplanets},
  fgMonitor in '..\source\galaxy\fgMonitor.pas' {FormMonitor},
  fgParadox in '..\source\galaxy\fgParadox.pas' {FormParadox},
  fgAnalyser in '..\source\galaxy\fgAnalyser.pas' {FormAnalyser};

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
  Application.Run;
end.

