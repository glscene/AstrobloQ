(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program Litosferas;



uses
  Forms,
  flLitosferas in '..\source\lito\flLitosferas.pas' {frmLitosphere},
  flParams in '..\source\lito\flParams.pas' {FrameParams: TFrame},
  flStellarSystem in '..\source\lito\flStellarSystem.pas' {FormStarSys},
  flSolarSystem in '..\source\lito\flSolarSystem.pas' {FormSolarSys},
  flOptions in '..\source\lito\flOptions.pas' {frmOptions},
  flGenExosys in '..\source\lito\flGenExosys.pas' {FormGenPlanetsys},
  fForm in '..\source\fForm.pas' {FormG},
  uMoveCamera in '..\Source\uMoveCamera.pas',
  uSkyBodies in '..\Source\uSkyBodies.pas',
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  uGlobals in '..\source\uGlobals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLitosphere, frmLitosphere);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.Run;
end.
