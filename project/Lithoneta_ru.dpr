program Lithoneta_ru;

uses
  Forms,
  flProgress_ru in '..\source\lito\ru\flProgress_ru.pas' {frmProgress},
  flFracLand_ru in '..\source\lito\ru\flFracLand_ru.pas' {frmFracLands},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFracLands, frmFracLands);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.Run;
end.
