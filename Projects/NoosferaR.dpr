(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program NoosferaR;
uses
  Forms,
  fnMeshEditorR in '..\source\noo\fnMeshEditorR.pas' {frmMeshEditor},
  fnMeshDataR in '..\source\noo\fnMeshDataR.pas' {frmMeshData},
  fnSpacePilotR in '..\source\noo\fnSpacePilotR.pas' {frmSpacePilot},
  fnLocationsR in '..\source\noo\fnLocationsR.pas' {frmLocations},
  fmForm in '..\source\fmForm.pas' {FormI},
  fnCyborgR in '..\source\noo\fnCyborgR.pas' {frmCyborg},
  fnRobotR in '..\source\noo\fnRobotR.pas' {frmLoadModel},
  fnCETInetR in '..\source\noo\fnCETInetR.pas' {FormCETI},
  Noo.BoneUtils in '..\source\noo\Noo.BoneUtils.pas',
  Noo.Globals in '..\source\noo\Noo.Globals.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  fnNoosferaR in '..\source\noo\fnNoosferaR.pas' {frmNoosfera},
  fmAboutR in '..\source\fmAboutR.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmNoosfera, frmNoosfera);
  Application.CreateForm(TfrmMeshEditor, frmMeshEditor);
  Application.CreateForm(TfrmSpacePilot, frmSpacePilot);
  Application.CreateForm(TfrmCyborg, frmCyborg);
  Application.CreateForm(TfrmLocations, frmLocations);
  Application.CreateForm(TFormCETI, FormCETI);
  Application.CreateForm(TfrmMeshData, frmMeshData);
  Application.CreateForm(TfrmLoadModel, frmLoadModel);
  Application.Run;
end.
