(*
   TerraPlanets - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program Geosfera;

uses
  Forms,
  fgGeosfera in 'source\geo\fgGeosfera.pas' {FormGeosfera},
  fgAbout in 'source\geo\fgAbout.pas' {FormAbout},
  fgParams in 'source\geo\fgParams.pas' {FrameParams: TFrame},
  fStarSystem in 'source\fStarSystem.pas' {FormStarSys},
  fgProjection in 'source\geo\fgProjection.pas' {FormProjection},
  fgSolarSystem in 'source\geo\fgSolarSystem.pas' {FormSolarSys},
  fgNewSystem in 'source\geo\fgNewSystem.pas' {FormNewSystem},
  fgSettings in 'source\geo\fgSettings.pas' {frmSettings},
  dImages in 'source\dImages.pas' {dfImages: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'LithoSphere';
  Application.CreateForm(TFormGeosfera, FormGeosfera);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
