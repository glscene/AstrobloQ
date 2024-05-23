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
  fnRobot in 'source\noo\fnRobot.pas' {FormLoadSmdMdl},
  fnCyborg in 'source\noo\fnCyborg.pas' {FormKiborg},
  fnMeshEditor in 'source\noo\fnMeshEditor.pas' {FormMeshShow},
  fnMeshData in 'source\noo\fnMeshData.pas' {FormMeshData},
  fnMehanizm in 'source\noo\fnMehanizm.pas' {FormMehanizm},
  fnStarPilot in 'source\noo\fnStarPilot.pas' {FormSpacePilot},
  fnLocations in 'source\noo\fnLocations.pas' {FormLocations},
  fnNoosfera in 'source\noo\fnNoosfera.pas' {FormNoosfera},
  fnAbout in 'source\noo\fnAbout.pas' {FormAbout},
  fnNoosfera_en in 'source\noo\fnNoosfera_en.pas' {FormNoosfera_en},
  fnLocations_en in 'source\noo\fnLocations_en.pas' {FormLocations_en};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TFormNoosfera, FormNoosfera);
  Application.CreateForm(TFormLocations_en, FormLocations_en);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormKiborg, FormKiborg);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormMeshData, FormMeshData);
  Application.CreateForm(TFormMehanizm, FormMehanizm);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormNoosfera_en, FormNoosfera_en);
  Application.Run;
end.
