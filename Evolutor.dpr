program Evolutor;

uses
  Vcl.Forms,
  feEvolutor in 'source\evo\feEvolutor.pas' {FormEvolutor},
  fProjection in 'source\fProjection.pas' {FormProjection},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEvolutor, FormEvolutor);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
