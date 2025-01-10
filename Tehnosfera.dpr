(*
  Tehnosfera - exoplanets with noos and technospheres
*)
program Tehnosfera;
uses
  Forms,
  ftMeshEditor in 'source\teh\ftMeshEditor.pas' {FormMeshShow},
  ftMeshData in 'source\teh\ftMeshData.pas' {FormMeshData},
  ftStarPilot in 'source\teh\ftStarPilot.pas' {FormSpacePilot},
  ftLocations in 'source\teh\ftLocations.pas' {FormLocations},
  ftTehnosfera in 'source\teh\ftTehnosfera.pas' {FormNoosfera},
  ftAbout in 'source\teh\ftAbout.pas' {FormAbout},
  fForm in 'source\fForm.pas' {FormG},
  uMoveCamera in 'source\ucode\uMoveCamera.pas',
  uSkyBodies in 'source\ucode\uSkyBodies.pas',
  ftCyborg in 'source\teh\ftCyborg.pas' {FormCyborg},
  ftRobot in 'source\teh\ftRobot.pas' {FormLoadSmdMdl},
  ftCETI in 'source\teh\ftCETI.pas' {FormTehnosfera},
  Teh.BoneUtils in 'source\teh\Teh.BoneUtils.pas',
  Teh.Globals in 'source\teh\Teh.Globals.pas',
  gnuGettext in 'source\ucode\gnuGettext.pas',
  fdForm in 'source\astro\fdForm.pas' {FormI};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Tehnosfera';
  Application.CreateForm(TFormNoosfera, FormNoosfera);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormMeshData, FormMeshData);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormG, FormG);
  Application.CreateForm(TFormCyborg, FormCyborg);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormTehnosfera, FormTehnosfera);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.
