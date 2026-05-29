(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program TechnetaD_en;
uses
  Forms,
  ftMeshEditor_en in '..\source\tech\en\ftMeshEditor_en.pas' {frmMeshEditor},
  ftMeshData_en in '..\source\tech\en\ftMeshData_en.pas' {FormMeshData},
  ftAstroPilot_en in '..\source\tech\en\ftAstroPilot_en.pas' {frmSpacePilot},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  ftCyborg_en in '..\source\tech\en\ftCyborg_en.pas' {frmCyborg},
  ftRobot_en in '..\source\tech\en\ftRobot_en.pas' {frmRobot},
  Tech.BoneUtils in '..\source\tech\Tech.BoneUtils.pas',
  Tech.Globals in '..\source\tech\Tech.Globals.pas',
  Tech.Utils in '..\source\tech\Tech.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_en in '..\source\fmAbout_en.pas' {frmAbout},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTechneta_en in '..\source\tech\en\ftTechneta_en.pas' {FormTechneta},
  ftLocations_en in '..\source\tech\en\ftLocations_en.pas' {FormLocations},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  ftEmpire_en in '..\source\tech\en\ftEmpire_en.pas' {FormCETI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Techneta';
  Application.CreateForm(TFormTechneta, FormTechneta);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmMeshEditor, frmMeshEditor);
  Application.CreateForm(TfrmCyborg, frmCyborg);
  Application.CreateForm(TfrmRobot, frmRobot);
  Application.CreateForm(TfrmSpacePilot, frmSpacePilot);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TFormCETI, FormCETI);
  Application.Run;
end.
