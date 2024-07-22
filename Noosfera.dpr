program Noosfera;

(*
  Tehnosfera
  Purpose: Shows exoplanets with technospheres!
*)


uses
  Forms,
  Noo.Globals in 'source\noo\Noo.Globals.pas',
  uMoveCamera in 'source\uMoveCamera.pas',
  uSkyBodies in 'source\uSkyBodies.pas',
  Noo.BoneUtils in 'source\noo\Noo.BoneUtils.pas',
  ftRobot in 'source\teh\ftRobot.pas' {FormLoadSmdMdl},
  ftCyborg in 'source\teh\ftCyborg.pas' {FormCyborg},
  fnMeshEditor in 'source\noo\fnMeshEditor.pas' {FormMeshShow},
  fnMeshData in 'source\noo\fnMeshData.pas' {FormMeshData},
  ftTehnosfera in 'source\teh\ftTehnosfera.pas' {FormMehanizm},
  ftStarPilot in 'source\teh\ftStarPilot.pas' {FormSpacePilot},
  fnLocations in 'source\noo\fnLocations.pas' {FormLocations},
  fnNoosfera in 'source\noo\fnNoosfera.pas' {FormNoosfera},
  fnAbout in 'source\noo\fnAbout.pas' {FormAbout},
  uGlobals in 'source\uGlobals.pas',
  Teh.BoneUtils in 'source\teh\Teh.BoneUtils.pas',
  fForm in 'source\fForm.pas' {FormI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TFormNoosfera, FormNoosfera);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormCyborg, FormCyborg);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormMeshData, FormMeshData);
  Application.CreateForm(TFormTehnosfera, FormTehnosfera);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.
