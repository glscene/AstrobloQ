(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Noosfera;
uses
  Forms,
  fnMeshEditor in '..\source\noo\fnMeshEditor.pas' {frmMeshEditor},
  fnMeshData in '..\source\noo\fnMeshData.pas' {FormMeshData},
  fnSpacePilot in '..\source\noo\fnSpacePilot.pas' {frmSpacePilot},
  fmForm in '..\source\fmForm.pas' {FormI},
  fnCyborg in '..\source\noo\fnCyborg.pas' {frmCyborg},
  fnRobot in '..\source\noo\fnRobot.pas' {frmRobot},
  Noo.BoneUtils in '..\source\noo\Noo.BoneUtils.pas',
  Noo.Globals in '..\source\noo\Noo.Globals.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Space.Globals in '..\source\Space.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fnNoosfera in '..\source\noo\fnNoosfera.pas' {frmNoosfera},
  fnLocations in '..\source\noo\fnLocations.pas' {FormLocations},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  fnCETInet in '..\source\noo\fnCETInet.pas' {FormCETI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmNoosfera, frmNoosfera);
  Application.CreateForm(TfrmMeshEditor, frmMeshEditor);
  Application.CreateForm(TfrmCyborg, frmCyborg);
  Application.CreateForm(TfrmRobot, frmRobot);
  Application.CreateForm(TfrmSpacePilot, frmSpacePilot);
  Application.CreateForm(TFormCETI, FormCETI);
  Application.Run;
end.
