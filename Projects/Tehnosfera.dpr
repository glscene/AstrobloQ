(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Tehnosfera;
uses
  Forms,
  ftMeshEditor in '..\source\teh\ftMeshEditor.pas' {frmMeshEditor},
  ftMeshData in '..\source\teh\ftMeshData.pas' {FormMeshData},
  ftSpacePilot in '..\source\teh\ftSpacePilot.pas' {frmSpacePilot},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  ftCyborg in '..\source\teh\ftCyborg.pas' {frmCyborg},
  ftRobot in '..\source\teh\ftRobot.pas' {frmRobot},
  Teh.BoneUtils in '..\source\teh\Teh.BoneUtils.pas',
  Teh.Globals in '..\source\teh\Teh.Globals.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Space.Globals in '..\source\Space.Globals.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTehnosfera in '..\source\teh\ftTehnosfera.pas' {frmTehnosfera},
  ftLocations in '..\source\teh\ftLocations.pas' {FormLocations},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  ftCETInet in '..\source\teh\ftCETInet.pas' {FormCETI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmTehnosfera, frmTehnosfera);
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
