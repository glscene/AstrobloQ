(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program AllPlanets;



uses
  Forms,
  fmAllPlanets in '..\source\fmAllPlanets.pas' {frmAllplanets},
  fmParams in '..\source\fmParams.pas' {FrameParams: TFrame},
  fmStarSystem in '..\source\fmStarSystem.pas' {FormStarSys},
  fmSolarSystem in '..\source\fmSolarSystem.pas' {FormSolarSys},
  fmOptions in '..\source\fmOptions.pas' {frmOptions},
  fmForm in '..\source\fmForm.pas' {FormG},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  fmGenExosystem in '..\source\fmGenExosystem.pas' {FormGenPlanetsys},
  MWS.Camera in '..\source\MWS.Camera.pas',
  Space.Globals in '..\source\Space.Globals.pas',
  MWS.SkyBodies in '..\source\MWS.SkyBodies.pas',
  Vcl.Themes,
  Vcl.Styles,
  Space.ReadCSV in '..\source\Space.ReadCSV.pas';

{$R *.res}

begin
  Application.Initialize;
 // TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TfrmAllplanets, frmAllplanets);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.Run;
end.
