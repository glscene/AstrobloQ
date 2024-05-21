program GalaxyMW;


uses
  Vcl.Forms,
  fGalaxyMW in 'source\fGalaxyMW.pas' {FormGalaxyMW},
  fProjection in 'plugins\Projection\fProjection.pas' {FormProjection},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fOptions in 'source\fOptions.pas' {FormOptions},
  uGlobals in 'source\uGlobals.pas',
  fProjectionEn in 'plugins\Projection\fProjectionEn.pas' {FormProjectionEn};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  if isEnglish = False then
    Application.CreateForm(TFormGalaxyMW, FormGalaxyMW)
//  else
    // Application.CreateForm(TFormGalaxyMWEn, FormGalaxyMWEn)
  ;
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
Application.CreateForm(TFormGalaxyMWmw, FormGalaxyMWmw);

Application.CreateForm(TFormGalagrid, FormGalagrid);

