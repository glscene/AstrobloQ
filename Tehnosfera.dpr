program Tehnosfera;

(*
  Tehnosfera
  Purpose: Shows exoplanets with technospheres!
*)


uses
  Forms,
  utGlobals in 'source\tehno\utGlobals.pas',
  uOglObjects in 'source\uOglObjects.pas',
  uSkyBodies in 'source\uSkyBodies.pas',
  utBoneUtils in 'source\tehno\utBoneUtils.pas',
  ftTehnosfera in 'source\tehno\ftTehnosfera.pas' {FormNoosphere},
  ftLocations in 'source\tehno\ftLocations.pas' {FormLocations},
  ftRobot in 'source\tehno\ftRobot.pas' {FormLoadSmdMdl},
  ftKiborg in 'source\tehno\ftKiborg.pas' {FormSMDqc},
  ftMeshEditor in 'source\tehno\ftMeshEditor.pas' {FormMeshShow},
  ftMeshData in 'source\tehno\ftMeshData.pas' {FormMeshData},
  ftMehanizm in 'source\tehno\ftMehanizm.pas' {FormGLSViewer},
  ftStarPilot in 'source\tehno\ftStarPilot.pas' {FormSpacePilot},
  fAbout in 'source\fAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TFormNoosphere, FormNoosphere);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormGLSViewer, FormGLSViewer);
  Application.CreateForm(TFormSMDqc, FormSMDqc);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
