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
  flSettings in 'source\lito\flSettings.pas' {FormSettings},
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  flGenExosys in 'source\lito\flGenExosys.pas' {FormGenPlanetsys},
  flAbout in 'source\lito\flAbout.pas' {FormAbout},
  fForm in 'source\fForm.pas' {FormI},
  uMoveCamera in 'source\univer\uMoveCamera.pas',
  uSkyBodies in 'source\univer\uSkyBodies.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLitosfera, FormLitosfera);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.
