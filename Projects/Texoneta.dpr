(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Texoneta;
uses
  Forms,
  ftMeshEditor in '..\source\texo\ftMeshEditor.pas' {frmMeshEditor},
  ftMeshData in '..\source\texo\ftMeshData.pas' {FormMeshData},
  ftSpacePilot in '..\source\texo\ftSpacePilot.pas' {frmSpacePilot},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  ftCyborg in '..\source\texo\ftCyborg.pas' {frmCyborg},
  ftRobot in '..\source\texo\ftRobot.pas' {frmRobot},
  Texo.BoneUtils in '..\source\texo\Texo.BoneUtils.pas',
  Texo.Globals in '..\source\texo\Texo.Globals.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTexoneta in '..\source\texo\ftTexoneta.pas' {frmTexoneta},
  ftLocations in '..\source\texo\ftLocations.pas' {FormLocations},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  ftCETInet in '..\source\texo\ftCETInet.pas' {FormCETI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehneta';
  Application.CreateForm(TfrmTexoneta, frmTexoneta);
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
