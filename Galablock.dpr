program Galablock;


uses
  Vcl.Forms,
  fGalablock in 'source\fGalablock.pas' {FormGalablock},
  dImages in 'source\dImages.pas' {DataModuleImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  uGlobals in 'source\uGlobals.pas',
  fSettings in 'source\fSettings.pas' {FormSettings},
  fGLForm in 'source\fGLForm.pas' {FormGL},
  fStarProj in 'plugins\StarProj\fStarProj.pas' {FormProjection},
  dDialogs in 'source\dDialogs.pas' {DataModuleDialogs: TDataModule},
  dBase in 'source\dBase.pas' {DataModuleBase: TDataModule},
  fAnalyzer in 'source\fAnalyzer.pas' {FormAnalyzer},
  fMonitor in 'source\fMonitor.pas' {FormMonitor};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Title := 'Galablock';

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TFormGalablock, FormGalablock);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.

