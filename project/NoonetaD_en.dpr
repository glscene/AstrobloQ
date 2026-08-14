program NoonetaD_en;

uses
  Vcl.Forms,
  fnNooneta_en in '..\source\noo\en\fnNooneta_en.pas' {FormCrafts},
  fnSkyship_en in '..\source\noo\en\fnSkyship_en.pas' {FormSkyship},
  fnSubmarine_en in '..\source\noo\en\fnSubmarine_en.pas' {FormSubmarine},
  fnGravijet_en in '..\source\noo\en\fnGravijet_en.pas' {FormGravijet},
  fnPhotonjet_en in '..\source\noo\en\fnPhotonjet_en.pas' {FormPhotonjet},
  fnAstrodron_en in '..\source\noo\en\fnAstrodron_en.pas' {FormAstrodron};

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
