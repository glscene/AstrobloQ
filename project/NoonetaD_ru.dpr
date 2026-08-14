(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
program NoonetaD_ru;

uses
  Vcl.Forms,
  fnNooneta_ru in '..\source\noo\ru\fnNooneta_ru.pas' {FormCrafts},
  fnSkyship_ru in '..\source\noo\ru\fnSkyship_ru.pas' {FormSkyship},
  fnSubmarine_ru in '..\source\noo\ru\fnSubmarine_ru.pas' {FormSubmarine},
  fnGravijet_ru in '..\source\noo\ru\fnGravijet_ru.pas' {FormGravijet},
  fnPhotonjet_ru in '..\source\noo\ru\fnPhotonjet_ru.pas' {FormPhotonjet},
  fnAstrodron_ru in '..\source\noo\ru\fnAstrodron_ru.pas' {FormAstrodron},
  fnLocator_ru in '..\source\noo\ru\fnLocator_ru.pas' {FormTerraNavi};

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
