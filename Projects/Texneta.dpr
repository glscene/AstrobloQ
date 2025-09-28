(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Texneta;
uses
  Forms,
  ftMeshEditor in '..\source\tex\ftMeshEditor.pas' {frmMeshEditor},
  ftMeshData in '..\source\tex\ftMeshData.pas' {FormMeshData},
  ftSpacePilot in '..\source\tex\ftSpacePilot.pas' {frmSpacePilot},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  ftCyborg in '..\source\tex\ftCyborg.pas' {frmCyborg},
  ftRobot in '..\source\tex\ftRobot.pas' {frmRobot},
  Tex.BoneUtils in '..\source\tex\Tex.BoneUtils.pas',
  Tex.Globals in '..\source\tex\Tex.Globals.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTexneta in '..\source\tex\ftTexneta.pas' {frmTexneta},
  ftLocations in '..\source\tex\ftLocations.pas' {FormLocations},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  ftCETInet in '..\source\tex\ftCETInet.pas' {FormCETI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehneta';
  Application.CreateForm(TfrmTexneta, frmTexneta);
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
