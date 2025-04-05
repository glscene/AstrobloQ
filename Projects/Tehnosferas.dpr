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
  ftTehnosfera in '..\source\teh\ftTehnosfera.pas' {FormNoosfera},
  fForm in '..\source\fForm.pas' {FormG},
  uMoveCamera in '..\Source\uMoveCamera.pas',
  uSkyBodies in '..\Source\uSkyBodies.pas',
  ftCyborg in '..\source\teh\ftCyborg.pas' {FormCyborg},
  ftRobot in '..\source\teh\ftRobot.pas' {FormLoadSmdMdl},
  ftCETI in '..\source\teh\ftCETI.pas' {FormTehnosfera},
  Teh.BoneUtils in '..\source\teh\Teh.BoneUtils.pas',
  Teh.Globals in '..\source\teh\Teh.Globals.pas',
  fAbout in '..\Source\fAbout.pas' {FormAbout},
  uUtils in '..\Source\uUtils.pas',
  uGlobals in '..\source\uGlobals.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TFormNoosfera, FormNoosfera);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormMeshData, FormMeshData);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormCyborg, FormCyborg);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormTehnosfera, FormTehnosfera);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
