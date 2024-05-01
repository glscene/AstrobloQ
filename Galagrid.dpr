program Galagrid;

{$R 'data\resource\Cursors.res'}

uses
  Vcl.Forms,
  fGalagrid in 'source\fGalagrid.pas' {FormEvolutor},
  fProjection in 'source\fProjection.pas' {FormProjection},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fSettings in 'source\fSettings.pas' {FormSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEvolutor, FormEvolutor);
  Application.CreateForm(TdfImages, dfImages);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
