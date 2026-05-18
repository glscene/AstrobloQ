(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
program Lithoneta_ru;

uses
  Forms,
  flProgress_ru in '..\source\lito\ru\flProgress_ru.pas' {FormProgress},
  flLithoneta_ru in '..\source\lito\ru\flLithoneta_ru.pas' {FormLithoneta},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  flDuneFighter_ru in '..\source\lito\ru\flDuneFighter_ru.pas' {frmDuneFighter},
  flFractalArch_ru in '..\source\lito\ru\flFractalArch_ru.pas' {frmFracArchip};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLithoneta, FormLithoneta);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TFormProgress, FormProgress);
  Application.Run;
end.
