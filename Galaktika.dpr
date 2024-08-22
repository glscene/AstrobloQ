program Galaktika;


uses
  Vcl.Forms,
  fGalaxy in 'source\fGalaxy.pas' {frmGalaxy},
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fSettings in 'source\fSettings.pas' {frmSettings},
  fStarProj in 'plugins\StarProj\fStarProj.pas' {FormProjection},
  dDialogs in 'source\dDialogs.pas' {dmDialogs: TDataModule},
  dBase in 'source\dBase.pas' {dmBase: TDataModule},
  fAnalyser in 'source\fAnalyser.pas' {FormAnalyser},
  fMonitor in 'source\fMonitor.pas' {FormMonitor},
  fParadox in 'source\fParadox.pas' {FormParadox},
  Vcl.Themes,
  Vcl.Styles,
  fExoplanets in 'source\fExoplanets.pas' {FormExoplanets},
  uGlobals in 'source\ucode\uGlobals.pas',
  fForm in 'source\fForm.pas' {FormI},
  fNewStarcube in 'source\fNewStarcube.pas' {FormNewStarcube},
  GnuGetText in 'source\ucode\GnuGetText.pas',
  uSkyBodies in 'source\ucode\uSkyBodies.pas';

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmGalaxy, frmGalaxy);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.

