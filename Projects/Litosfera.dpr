(*
   Lithosphere - terrestrial exoplanets for near solar stars.
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
  flLitosfera in '..\source\lito\flLitosfera.pas' {frmLitosphere},
  flParams in '..\source\lito\flParams.pas' {FrameParams: TFrame},
  flStellarSystem in '..\source\lito\flStellarSystem.pas' {FormStarSys},
  flSolarSystem in '..\source\lito\flSolarSystem.pas' {FormSolarSys},
  flSettings in '..\source\lito\flSettings.pas' {frmSettingsLito},
  dImages in '..\source\dImages.pas' {dmImages: TDataModule},
  flGenExosys in '..\source\lito\flGenExosys.pas' {FormGenPlanetsys},
  fForm in '..\source\fForm.pas' {FormG},
  uMoveCamera in '..\Source\uMoveCamera.pas',
  uSkyBodies in '..\Source\uSkyBodies.pas',
  fdForm in '..\Source\fdForm.pas' {FormI},
  fAbout in '..\Source\fAbout.pas' {FormAbout},
  udGlobals in '..\Source\udGlobals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLitosphere, frmLitosphere);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmSettingsLito, frmSettingsLito);
  Application.CreateForm(TFormG, FormG);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
