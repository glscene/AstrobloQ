program Lithoneta_en;

uses
  Forms,
  flFracLand_en in '..\source\lito\en\flFracLand_en.pas' {frmFracLands},
  flProgress_en in '..\source\lito\en\flProgress_en.pas' {frmProgress},
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
