(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Tehnosfera_ru;
uses
  Forms,
  ftMeshEditor_ru in '..\source\teh\ftMeshEditor_ru.pas' {frmMeshEditor},
  ftMeshData_ru in '..\source\teh\ftMeshData_ru.pas' {frmMeshData},
  ftSpacePilot_ru in '..\source\teh\ftSpacePilot_ru.pas' {frmSpacePilot},
  ftLocations_ru in '..\source\teh\ftLocations_ru.pas' {FormLocations},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  ftCyborg_ru in '..\source\teh\ftCyborg_ru.pas' {frmCyborg},
  ftRobot_ru in '..\source\teh\ftRobot_ru.pas' {frmLoadModel},
  ftCETInet_ru in '..\source\teh\ftCETInet_ru.pas' {FormCETI},
  Teh.BoneUtils in '..\source\teh\Teh.BoneUtils.pas',
  Teh.Globals in '..\source\teh\Teh.Globals.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTehnosfera_ru in '..\source\teh\ftTehnosfera_ru.pas' {frmTehnosfera},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmTehnosfera, frmTehnosfera);
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
