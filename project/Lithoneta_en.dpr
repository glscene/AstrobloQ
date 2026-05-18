program Lithoneta_en;

uses
  Forms,
  flLithoneta_en in '..\source\lito\en\flLithoneta_en.pas' {FormLithoneta},
  flProgress_en in '..\source\lito\en\flProgress_en.pas' {FormProgress},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  flDuneFighter_en in '..\source\lito\en\flDuneFighter_en.pas' {frmDuneFighter},
  flFractalArch_en in '..\source\lito\en\flFractalArch_en.pas' {frmFracArchip};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLithoneta, FormLithoneta);
  Application.CreateForm(TFormProgress, FormProgress);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.Run;
end.
