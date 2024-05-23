(*
   EarthPlanets - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program Litosfera;



uses
  Forms,
  flLitosfera in 'source\lito\flLitosfera.pas' {FormLitosfera},
  flParams in 'source\lito\flParams.pas' {FrameParams: TFrame},
  flStarSystem in 'source\lito\flStarSystem.pas' {FormStarSys},
  flSolarSystem in 'source\lito\flSolarSystem.pas' {FormSolarSys},
  flSettings in 'source\lito\flSettings.pas' {FormSettings},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  flGenExosys in 'source\lito\flGenExosys.pas' {FormGenPlanetsys},
  uMoveCamera in 'source\uMoveCamera.pas',
  uSkyBodies in 'source\uSkyBodies.pas',
  flAbout in 'source\lito\flAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Litosfere';
  Application.CreateForm(TFormLitosfera, FormLitosfera);
  Application.CreateForm(TdfImages, dfImages);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
