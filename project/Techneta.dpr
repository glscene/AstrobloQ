(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Techneta;
uses
  Forms,
  ftMeshEditor in '..\source\tech\ftMeshEditor.pas' {frmMeshEditor},
  ftMeshData in '..\source\tech\ftMeshData.pas' {FormMeshData},
  ftAstroPilot in '..\source\tech\ftAstroPilot.pas' {frmSpacePilot},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  ftCyborg in '..\source\tech\ftCyborg.pas' {frmCyborg},
  ftRobot in '..\source\tech\ftRobot.pas' {frmRobot},
  Tech.BoneUtils in '..\source\tech\Tech.BoneUtils.pas',
  Tech.Globals in '..\source\tech\Tech.Globals.pas',
  Tech.Utils in '..\source\tech\Tech.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTechneta in '..\source\tech\ftTechneta.pas' {frmTechnoneta},
  ftLocations in '..\source\tech\ftLocations.pas' {FormLocations},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  ftEmpire in '..\source\tech\ftEmpire.pas' {FormCETI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehneta';
  Application.CreateForm(TfrmTechnoneta, frmTechnoneta);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmMeshEditor, frmMeshEditor);
  Application.CreateForm(TfrmCyborg, frmCyborg);
  Application.CreateForm(TfrmRobot, frmRobot);
  Application.CreateForm(TfrmSpacePilot, frmSpacePilot);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TFormCETI, FormCETI);
  Application.Run;
end.
