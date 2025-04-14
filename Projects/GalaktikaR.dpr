program GalaktikaR;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  fgMonitorR in '..\source\galaxy\fgMonitorR.pas' {FormMonitor},
  fgParadoxR in '..\source\galaxy\fgParadoxR.pas' {FormParadox},
  fgExoplanetsR in '..\source\galaxy\fgExoplanetsR.pas' {FormExoplanets},
  fgAstrocubeR in '..\source\galaxy\fgAstrocubeR.pas' {FormNewStarcube},
  fgOptionsR in '..\source\galaxy\fgOptionsR.pas' {frmOptions},
  fgGalaktikaR in '..\source\galaxy\fgGalaktikaR.pas' {frmGalaktika},
  umUtils in '..\source\umUtils.pas',
  fStarProj in '..\Addons\StarProj\fStarProj.pas' {FormProjection},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmSettingsR in '..\source\fmSettingsR.pas' {FormSettings},
  fmAboutR in '..\source\fmAboutR.pas' {FormAbout},
  umGlobals in '..\source\umGlobals.pas',
  umSkyBodies in '..\source\umSkyBodies.pas',
  fmForm in '..\source\fmForm.pas' {FormI},
  fgAnalyserR in '..\source\galaxy\fgAnalyserR.pas' {FormAnalyser};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGalaktika, frmGalaktika);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TFormAnalyser, FormAnalyser);
  Application.Run;
end.

