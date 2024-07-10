program Galaktika;


uses
  Vcl.Forms,
  fGalaktika in 'source\fGalaktika.pas' {FormGalaktika},
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  uGlobals in 'source\uGlobals.pas',
  fSettings in 'source\fSettings.pas' {FormSettings},
  fGLForm in 'source\fGLForm.pas' {FormGL},
  fStarProj in 'plugins\StarProj\fStarProj.pas' {FormProjection},
  dDialogs in 'source\dDialogs.pas' {dmDialogs: TDataModule},
  dBase in 'source\dBase.pas' {dmBase: TDataModule},
  fAnalyser in 'source\fAnalyser.pas' {FormAnalyser},
  fMonitor in 'source\fMonitor.pas' {FormMonitor},
  fParadox in 'source\fParadox.pas' {FormParadox},
  Vcl.Themes,
  Vcl.Styles;

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
  Application.Run;
end.

