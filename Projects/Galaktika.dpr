program Galaktika;


uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  dImages in '..\source\dImages.pas' {dmImages: TDataModule},
  fAbout in '..\Source\fAbout.pas' {FormAbout},
  fStarProj in '..\plugins\StarProj\fStarProj.pas' {FormProjection},
  dDialogs in '..\source\dDialogs.pas' {dmDialogs: TDataModule},
  dBase in '..\source\dBase.pas' {dmBase: TDataModule},
  fgAnalyser in '..\Source\galaxy\fgAnalyser.pas' {FormAnalyser},
  fgMonitor in '..\Source\galaxy\fgMonitor.pas' {FormMonitor},
  fgParadox in '..\Source\galaxy\fgParadox.pas' {FormParadox},
  fgExoplanets in '..\Source\galaxy\fgExoplanets.pas' {FormExoplanets},
  uGlobals in '..\Source\uGlobals.pas',
  fForm in '..\source\fForm.pas' {FormG},
  fgStarcube in '..\Source\galaxy\fgStarcube.pas' {FormNewStarcube},
  uSkyBodies in '..\Source\uSkyBodies.pas',
  fdForm in '..\Source\fdForm.pas' {FormI},
  udUtils in '..\Source\udUtils.pas',
  fgGalaxy in '..\Source\galaxy\fgGalaxy.pas' {frmGalaxy},
  fgSettings in '..\Source\galaxy\fgSettings.pas' {frmSettings};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGalaxy, frmGalaxy);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.

