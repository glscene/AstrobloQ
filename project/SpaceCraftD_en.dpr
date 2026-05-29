program SpaceCraftD_en;

uses
  Vcl.Forms,
  fsCrafts_en in '..\source\craft\en\fsCrafts_en.pas' {FormCrafts},
  fsSkyship_en in '..\source\craft\en\fsSkyship_en.pas' {FormSkyship},
  fsSubmarine_en in '..\source\craft\en\fsSubmarine_en.pas' {FormSubmarine},
  fsGravijet_en in '..\source\craft\en\fsGravijet_en.pas' {FormGravijet},
  fsPhotonjet_en in '..\source\craft\en\fsPhotonjet_en.pas' {FormPhotonjet},
  fsAstrodron_en in '..\source\craft\en\fsAstrodron_en.pas' {FormAstrodron};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCrafts, FormCrafts);
  Application.CreateForm(TFormSkyship, FormSkyship);
  Application.CreateForm(TFormSubmarine, FormSubmarine);
  Application.CreateForm(TFormGravijet, FormGravijet);
  Application.CreateForm(TFormPhotonjet, FormPhotonjet);
  Application.CreateForm(TFormAstrodron, FormAstrodron);
  Application.Run;
end.
