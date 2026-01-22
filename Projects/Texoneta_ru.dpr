(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Texoneta_ru;
uses
  Forms,
  ftMeshEditor_ru in '..\source\texo\ftMeshEditor_ru.pas' {frmMeshEditor},
  ftMeshData_ru in '..\source\texo\ftMeshData_ru.pas' {frmMeshData},
  ftSpacePilot_ru in '..\source\texo\ftSpacePilot_ru.pas' {frmSpacePilot},
  ftLocations_ru in '..\source\texo\ftLocations_ru.pas' {FormLocations},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  ftCyborg_ru in '..\source\texo\ftCyborg_ru.pas' {frmCyborg},
  ftRobot_ru in '..\source\texo\ftRobot_ru.pas' {frmLoadModel},
  ftCETInet_ru in '..\source\texo\ftCETInet_ru.pas' {FormCETI},
  Texo.BoneUtils in '..\source\texo\Texo.BoneUtils.pas',
  Texo.Globals in '..\source\texo\Texo.Globals.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTexoneta_ru in '..\source\texo\ftTexoneta_ru.pas' {frmTexoneta},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {FormAbout},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Texneta';
  Application.CreateForm(TfrmTexoneta, frmTexoneta);
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
