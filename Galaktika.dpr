program Galaktika;


uses
  Vcl.Forms,
  uGlobals in 'source\uGlobals.pas',
  fGalaktika in 'source\fGalaktika.pas' {FormGalaktika},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fOptions in 'source\fOptions.pas' {FormOptions},
  fProjection in 'plugins\Projection\fProjection.pas' {FormProjection},
  fProjectionEn in 'plugins\Projection\fProjectionEn.pas' {FormProjectionEn};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  if isEnglish = False then
    Application.CreateForm(TFormGalaktika, FormGalaktika);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.

