(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program TechnetaD_ru;
uses
  Forms,
  ftMeshEditor_ru in '..\source\tech\ru\ftMeshEditor_ru.pas' {frmMeshEditor},
  ftMeshData_ru in '..\source\tech\ru\ftMeshData_ru.pas' {frmMeshData},
  ftAstroPilot_ru in '..\source\tech\ru\ftAstroPilot_ru.pas' {frmSpacePilot},
  ftLocations_ru in '..\source\tech\ru\ftLocations_ru.pas' {FormLocations},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  ftCyborg_ru in '..\source\tech\ru\ftCyborg_ru.pas' {frmCyborg},
  ftRobot_ru in '..\source\tech\ru\ftRobot_ru.pas' {frmLoadModel},
  ftEmpire_ru in '..\source\tech\ru\ftEmpire_ru.pas' {FormEmpire},
  Tech.BoneUtils in '..\source\tech\Tech.BoneUtils.pas',
  Tech.Globals in '..\source\tech\Tech.Globals.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTechneta_ru in '..\source\tech\ru\ftTechneta_ru.pas' {FormTechneta},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {frmAbout},
  Tech.Utils in '..\source\tech\Tech.Utils.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Techneta';
  Application.CreateForm(TFormTechneta, FormTechneta);
  Application.CreateForm(TfrmMeshData, frmMeshData);
  Application.CreateForm(TfrmLoadModel, frmLoadModel);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmMeshEditor, frmMeshEditor);
  Application.CreateForm(TfrmSpacePilot, frmSpacePilot);
  Application.CreateForm(TfrmCyborg, frmCyborg);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.Run;
end.
