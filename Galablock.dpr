program Galablock;


uses
  Vcl.Forms,
  fGalablock in 'src\fGalablock.pas' {FormGalablock},
  dImages in 'src\dImages.pas' {DataModuleImages: TDataModule},
  fAbout in 'src\fAbout.pas' {FormAbout},
  uGlobals in 'src\uGlobals.pas',
  fSettings in 'src\fSettings.pas' {FormSettings},
  fGLForm in 'src\fGLForm.pas' {FormGL},
  fStarProj in 'plugins\StarProj\fStarProj.pas' {FormProjection},
  dDialogs in 'src\dDialogs.pas' {DataModuleDialogs: TDataModule},
  dBase in 'src\dBase.pas' {DataModuleBase: TDataModule},
  fAnalyzer in 'src\fAnalyzer.pas' {FormAnalyzer},
  fMonitor in 'src\fMonitor.pas' {FormMonitor};

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

