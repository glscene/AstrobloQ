program Noosfera;

(*
  Tehnosfera
  Purpose: Shows exoplanets with technospheres!
*)


uses
  Forms,
  uGlobals in 'source\uGlobals.pas',
  uMoveCamera in 'source\uMoveCamera.pas',
  uSkyBodies in 'source\uSkyBodies.pas',
  uBoneUtils in 'source\uBoneUtils.pas',
  fnNoosfera in 'source\noo\fnNoosfera.pas' {FormNoosfera},
  fnLocations in 'source\noo\fnLocations.pas' {FormLocations},
  fnRobot in 'source\noo\fnRobot.pas' {FormLoadSmdMdl},
  fnCyborg in 'source\noo\fnCyborg.pas' {FormKiborg},
  fnMeshEditor in 'source\noo\fnMeshEditor.pas' {FormMeshShow},
  fnMeshData in 'source\noo\fnMeshData.pas' {FormMeshData},
  fnMehanizm in 'source\noo\fnMehanizm.pas' {FormMehanizm},
  fnStarPilot in 'source\noo\fnStarPilot.pas' {FormSpacePilot},
  fAbout in 'source\fAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TFormNoosfera, FormNoosfera);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormMehanizm, FormMehanizm);
  Application.CreateForm(TFormKiborg, FormKiborg);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
