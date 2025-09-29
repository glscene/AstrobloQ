(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Texoneta_ru;
uses
  Forms,
  ftMeshEditor_ru in '..\source\tex\ftMeshEditor_ru.pas' {frmMeshEditor},
  ftMeshData_ru in '..\source\tex\ftMeshData_ru.pas' {frmMeshData},
  ftSpacePilot_ru in '..\source\tex\ftSpacePilot_ru.pas' {frmSpacePilot},
  ftLocations_ru in '..\source\tex\ftLocations_ru.pas' {FormLocations},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  ftCyborg_ru in '..\source\tex\ftCyborg_ru.pas' {frmCyborg},
  ftRobot_ru in '..\source\tex\ftRobot_ru.pas' {frmLoadModel},
  ftCETInet_ru in '..\source\tex\ftCETInet_ru.pas' {FormCETI},
  Tex.BoneUtils in '..\source\tex\Tex.BoneUtils.pas',
  Tex.Globals in '..\source\tex\Tex.Globals.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTexoneta_ru in '..\source\tex\ftTexoneta_ru.pas' {frmTexneta},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Texneta';
  Application.CreateForm(TfrmTexneta, frmTexneta);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TfrmMeshData, frmMeshData);
  Application.CreateForm(TfrmLoadModel, frmLoadModel);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmMeshEditor, frmMeshEditor);
  Application.CreateForm(TfrmSpacePilot, frmSpacePilot);
  Application.CreateForm(TfrmCyborg, frmCyborg);
  Application.Run;
end.
