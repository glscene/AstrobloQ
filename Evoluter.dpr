program Evoluter;

uses
  Vcl.Forms,
  feEvoluter in 'source\evo\feEvoluter.pas' {FormEvoluter},
  fProjection in 'source\fProjection.pas' {FormProjection},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEvoluter, FormEvoluter);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
