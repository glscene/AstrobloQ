program Noosfera;

(*
! GLSceneSpace! based on Eric Grange's Earth Demo
  Purpose: Shows GLScene users and developers around the world!

  Initial Idea: Alexandre Hirzel, developed by Ivan Lee Herring,
  Modified and improved by Aaron Hochwimmer, Pavel Vassiliev and Jerome Delauney

  Others credits:
  TDOT3BumpShader --> Stuart Gooding
  ...though not here and changed to GLTexCombineShader
  Phillip and many others...

  "GLScene Space" Demo.
  See accompanying Readme.txt for user instructions.
  The atmospheric effect is rendered in GLDirectOpenGL1Render, which essentially
  renders a disk, with color of the vertices computed via ray-tracing. Note that
  the tesselation of the disk has been hand-optimized so as to reduce CPU use
  while retaining quality. On anything < 1 GHz, the rendering is fill-rate limited.

  Stars support is built into the TGLSkyDome, but constellations are rendered
  via a TGLLines, which is filled in the LoadConstellationLines method.
*)


uses
  Forms,
  uGlobals in 'source\unit\uGlobals.pas',
  uOglObjects in 'source\unit\uOglObjects.pas',
  uSkyBodies in 'source\unit\uSkyBodies.pas',
  uSMDstuff in 'source\unit\uSMDstuff.pas',
  fNoosfera in 'source\fNoosfera.pas' {FormNoosphere},
  fLocations in 'source\fLocations.pas' {FormLocations},
  fLoadSMD in 'source\fLoadSMD.pas' {FormLoadSmdMdl},
  fGenPlanetsys in 'source\fGenPlanetsys.pas' {FormGenPlanetsys},
  fSMDqc in 'source\fSMDqc.pas' {FormSMDqc},
  fMeshShow in 'source\fMeshShow.pas' {FormMeshShow},
  fMeshData in 'source\fMeshData.pas' {FormMeshData},
  fGLSViewer in 'source\fGLSViewer.pas' {FormGLSViewer},
  fStarPilot in 'source\fStarPilot.pas' {FormSpacePilot},
  fAbout in 'source\fAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'GLScene Space';
  Application.CreateForm(TFormNoosphere, FormNoosphere);
  Application.CreateForm(TFormLocations, FormLocations);
  Application.CreateForm(TFormMeshShow, FormMeshShow);
  Application.CreateForm(TFormGLSViewer, FormGLSViewer);
  Application.CreateForm(TFormSMDqc, FormSMDqc);
  Application.CreateForm(TFormSpacePilot, FormSpacePilot);
  Application.CreateForm(TFormLoadSmdMdl, FormLoadSmdMdl);
  Application.CreateForm(TFormGenPlanetsys, FormGenPlanetsys);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
