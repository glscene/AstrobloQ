(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program TehnosferaR;
uses
  Forms,
  ftMeshEditorR in '..\source\teh\ftMeshEditorR.pas' {FormMeshShow},
  ftMeshDataR in '..\source\teh\ftMeshDataR.pas' {FormMeshData},
  ftStarPilotR in '..\source\teh\ftStarPilotR.pas' {FormSpacePilot},
  ftLocationsR in '..\source\teh\ftLocationsR.pas' {FormLocations},
  fmForm in '..\source\fmForm.pas' {FormG},
  ftCyborgR in '..\source\teh\ftCyborgR.pas' {FormCyborg},
  ftRobotR in '..\source\teh\ftRobotR.pas' {FormLoadSmdMdl},
  ftCETI in '..\source\teh\ftCETI.pas' {FormTehnosfera},
  Teh.BoneUtils in '..\source\teh\Teh.BoneUtils.pas',
  Teh.Globals in '..\source\teh\Teh.Globals.pas',
  umUtils in '..\source\umUtils.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  ftOptionsR in '..\source\teh\ftOptionsR.pas' {frmOptions},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  umCamera in '..\source\umCamera.pas',
  umGlobals in '..\source\umGlobals.pas',
  umSkyBodies in '..\source\umSkyBodies.pas',
  ftTehnosferaR in '..\source\teh\ftTehnosferaR.pas' {frmTehnosfera};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmTehnosfera, frmTehnosfera);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
