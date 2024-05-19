program Galaevol;


uses
  Vcl.Forms,
  fGalaevol in 'source\fGalaevol.pas' {FormGalagrid},
  fProjection in 'source\fProjection.pas' {FormProjection},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fOptions in 'source\fOptions.pas' {FormOptions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGalagrid, FormGalagrid);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
