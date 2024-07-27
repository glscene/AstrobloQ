program Galaktos;


uses
  Vcl.Forms,
  fGalaktos in 'source\fGalaktos.pas' {FormGalaktika},
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fSettings in 'source\fSettings.pas' {FormSettings},
  fStarProj in 'plugins\StarProj\fStarProj.pas' {FormProjection},
  dDialogs in 'source\dDialogs.pas' {dmDialogs: TDataModule},
  dBase in 'source\dBase.pas' {dmBase: TDataModule},
  fAnalyser in 'source\fAnalyser.pas' {FormAnalyser},
  fMonitor in 'source\fMonitor.pas' {FormMonitor},
  fParadox in 'source\fParadox.pas' {FormParadox},
  Vcl.Themes,
  Vcl.Styles,
  fForm in 'source\fForm.pas' {FormI},
  fExoplanets in 'source\fExoplanets.pas' {FormExoplanets},
  uGlobals in 'source\univer\uGlobals.pas';

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TFormGalaktika, FormGalaktika);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.

