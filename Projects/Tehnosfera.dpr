(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Tehnosfera;
uses
  Forms,
  ftMeshEditor in '..\source\teh\ftMeshEditor.pas' {FormMeshShow},
  ftMeshData in '..\source\teh\ftMeshData.pas' {FormMeshData},
  ftStarPilot in '..\source\teh\ftStarPilot.pas' {FormSpacePilot},
  ftLocationsR in '..\source\teh\ftLocationsR.pas' {FormLocations},
  fmForm in '..\source\fmForm.pas' {FormG},
  ftCyborg in '..\source\teh\ftCyborg.pas' {FormCyborg},
  ftRobot in '..\source\teh\ftRobot.pas' {FormLoadSmdMdl},
  ftCETI in '..\source\teh\ftCETI.pas' {FormTehnosfera},
  Teh.BoneUtils in '..\source\teh\Teh.BoneUtils.pas',
  Teh.Globals in '..\source\teh\Teh.Globals.pas',
  umUtils in '..\source\umUtils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  ftOptions in '..\source\teh\ftOptions.pas' {frmOptions},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  umCamera in '..\source\umCamera.pas',
  umGlobals in '..\source\umGlobals.pas',
  umSkyBodies in '..\source\umSkyBodies.pas',
  ftTehnosfera in '..\source\teh\ftTehnosfera.pas' {frmTehnosfera};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmTehnosfera, frmTehnosfera);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
