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
  flStellarSystem in 'source\lito\flStellarSystem.pas' {FormStarSys},
  flSolarSystem in 'source\lito\flSolarSystem.pas' {FormSolarSys},
  flOptions in 'source\lito\flOptions.pas' {FormOptions},
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  flGenExosys in 'source\lito\flGenExosys.pas' {FormGenPlanetsys},
  uMoveCamera in 'source\uMoveCamera.pas',
  uSkyBodies in 'source\uSkyBodies.pas',
  flAbout in 'source\lito\flAbout.pas' {FormAbout},
  fGLForm in 'source\fGLForm.pas' {FormGL};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Litosfera';
  Application.CreateForm(TFormLitosfera, FormLitosfera);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormGL, FormGL);
  Application.Run;
end.
