program Galaktika;


uses
  Vcl.Forms,
  fGalaktika in 'src\fGalaktika.pas' {FormGalaktika},
  dImages in 'src\dImages.pas' {dfImages: TDataModule},
  fAbout in 'src\fAbout.pas' {FormAbout},
  uGlobals in 'src\uGlobals.pas',
  fSettings in 'src\fSettings.pas' {FormSettings},
  fGLForm in 'src\fGLForm.pas' {FormGL},
  fStarProj in 'plugins\StarProj\fStarProj.pas' {FormProjection};

{$R *.res}
{$SetPEFlags $20}  // Allows up to 4GB address space with FastMM

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdfImages, dfImages);
  Application.CreateForm(TFormGalaktika, FormGalaktika);
  Application.Run;
end.

