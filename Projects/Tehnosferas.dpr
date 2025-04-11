(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Tehnosferas;
uses
  Forms,
  ftMeshEditor in '..\source\teh\ftMeshEditor.pas' {FormMeshShow},
  ftMeshData in '..\source\teh\ftMeshData.pas' {FormMeshData},
  ftStarPilot in '..\source\teh\ftStarPilot.pas' {FormSpacePilot},
  ftLocations in '..\source\teh\ftLocations.pas' {FormLocations},
  ftTehnosferas in '..\source\teh\ftTehnosferas.pas' {frmTehnosferas},
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
  umSkyBodies in '..\source\umSkyBodies.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TfrmTehnosferas, frmTehnosferas);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormMeshData, FormMeshData);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormCyborg, FormCyborg);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormTehnosfera, FormTehnosfera);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
