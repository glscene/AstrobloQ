(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program TehnosferaR;
uses
  Forms,
  ftMeshEditorR in '..\source\teh\ftMeshEditorR.pas' {frmMeshEditor},
  ftMeshDataR in '..\source\teh\ftMeshDataR.pas' {frmMeshData},
  ftSpacePilotR in '..\source\teh\ftSpacePilotR.pas' {frmSpacePilot},
  ftLocationsR in '..\source\teh\ftLocationsR.pas' {FormLocations},
  fmFormI in '..\source\fmFormI.pas' {FormI},
  ftCyborgR in '..\source\teh\ftCyborgR.pas' {frmCyborg},
  ftRobotR in '..\source\teh\ftRobotR.pas' {frmLoadModel},
  ftCETInetR in '..\source\teh\ftCETInetR.pas' {FormCETI},
  Teh.BoneUtils in '..\source\teh\Teh.BoneUtils.pas',
  Teh.Globals in '..\source\teh\Teh.Globals.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  ftTehnosferaR in '..\source\teh\ftTehnosferaR.pas' {FormTehnosfera},
  fmAboutR in '..\source\fmAboutR.pas' {FrmAbout};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TFormTehnosfera, FormTehnosfera);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormCETI, FormCETI);
  Application.CreateForm(TfrmMeshData, frmMeshData);
  Application.CreateForm(TfrmLoadModel, frmLoadModel);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmMeshEditor, frmMeshEditor);
  Application.CreateForm(TfrmSpacePilot, frmSpacePilot);
  Application.CreateForm(TfrmCyborg, frmCyborg);
  Application.Run;
end.
