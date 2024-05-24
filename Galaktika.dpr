program Galaktika;


uses
  Vcl.Forms,
  fGalaktika in 'source\fGalaktika.pas' {FormGalaktika},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fOptions in 'source\fOptions.pas' {FormOptions},
  fProjection in 'plugins\Projection\fProjection.pas' {FormProjection},
  fAbout in 'source\fAbout.pas' {FormAbout},
  uGlobals in 'source\uGlobals.pas',
  fGLOptions in 'source\fGLOptions.pas' {FormGLOptions},
  fGLForm in 'source\fGLForm.pas' {GLForm},
  fGLDialog in 'source\fGLDialog.pas' {GLDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdfImages, dfImages);
  Application.CreateForm(TFormGalaktika, FormGalaktika);
  Application.CreateForm(TGLForm, GLForm);
  Application.CreateForm(TGLDialog, GLDialog);
  Application.Run;
end.

