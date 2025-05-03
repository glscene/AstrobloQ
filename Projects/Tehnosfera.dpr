(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Tehnosfera;
uses
  Forms,
  ftMeshEditor in '..\source\teh\ftMeshEditor.pas' {frmSculptor},
  ftMeshData in '..\source\teh\ftMeshData.pas' {FormMeshData},
  ftStarPilot in '..\source\teh\ftStarPilot.pas' {FormSpacePilot},
  fmForm in '..\source\fmForm.pas' {FormI},
  ftCyborg in '..\source\teh\ftCyborg.pas' {FormCyborg},
  ftRobot in '..\source\teh\ftRobot.pas' {FormLoadSmdMdl},
  ftCETI in '..\source\teh\ftCETI.pas' {FormTehnosfera},
  Teh.BoneUtils in '..\source\teh\Teh.BoneUtils.pas',
  Teh.Globals in '..\source\teh\Teh.Globals.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  ftOptions in '..\source\teh\ftOptions.pas' {frmOptions},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Space.Globals in '..\source\Space.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTehnosfera in '..\source\teh\ftTehnosfera.pas' {frmTehnosfera},
  ftLocations in '..\source\teh\ftLocations.pas' {FormLocations},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmTehnosfera, frmTehnosfera);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmSculptor, frmSculptor);
  Application.Run;
end.
