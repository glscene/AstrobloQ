program SpaceCrafts_ru;

uses
  Vcl.Forms,
  fsCrafts_ru in '..\source\craft\ru\fsCrafts_ru.pas' {FormCrafts},
  fsSkyship_ru in '..\source\craft\ru\fsSkyship_ru.pas' {FormSkyship},
  fsSubmarine_ru in '..\source\craft\ru\fsSubmarine_ru.pas' {FormSubmarine},
  fsGravijet_ru in '..\source\craft\ru\fsGravijet_ru.pas' {FormGravijet},
  fsPhotonjet_ru in '..\source\craft\ru\fsPhotonjet_ru.pas' {FormPhotonjet};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCrafts, FormCrafts);
  Application.CreateForm(TFormSkyship, FormSkyship);
  Application.CreateForm(TFormSubmarine, FormSubmarine);
  Application.CreateForm(TFormGravijet, FormGravijet);
  Application.CreateForm(TFormPhotonjet, FormPhotonjet);
  Application.Run;
end.
