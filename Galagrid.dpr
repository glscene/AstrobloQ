program Galagrid;


uses
  Vcl.Forms,
  fGalagrid in 'src\fGalagrid.pas' {FormGalaktika},
  dImages in 'src\dImages.pas' {DataModuleImages: TDataModule},
  fAbout in 'src\fAbout.pas' {FormAbout},
  uGlobals in 'src\uGlobals.pas',
  fSettings in 'src\fSettings.pas' {FormSettings},
  fGLForm in 'src\fGLForm.pas' {FormGL},
  fStarProj in 'plugins\StarProj\fStarProj.pas' {FormProjection},
  dDialogs in 'src\dDialogs.pas' {DataModuleDialogs: TDataModule},
  dBase in 'src\dBase.pas' {DataModuleBase: TDataModule};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TFormGalaktika, FormGalaktika);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.Run;
end.

