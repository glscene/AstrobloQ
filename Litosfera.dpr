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
  fLitosfera in 'source\fLitosfera.pas' {FormLitosfera},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fParams in 'source\fParams.pas' {FrameParams: TFrame},
  fStarSystem in 'source\fStarSystem.pas' {FormStarSys},
  fProjection in 'source\fProjection.pas' {FormProjection},
  fSolarSystem in 'source\fSolarSystem.pas' {FormSolarSys},
  fNewExosystem in 'source\fNewExosystem.pas' {FormNewSystem},
  fSettings in 'source\fSettings.pas' {FormSettings},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fGenPlanetsys in 'source\fGenPlanetsys.pas' {FormGenPlanetsys},
  uOglObjects in 'source\unit\uOglObjects.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Litosfere';
  Application.CreateForm(TFormLitosfera, FormLitosfera);
  Application.CreateForm(TdfImages, dfImages);
  Application.CreateForm(TFormGenPlanetsys, FormGenPlanetsys);
  Application.Run;
end.
