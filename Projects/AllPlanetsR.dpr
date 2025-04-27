(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program AllPlanetsR;



uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  fmAllPlanetsR in '..\source\fmAllPlanetsR.pas' {frmAllplanets},
  fmStarSystemR in '..\source\fmStarSystemR.pas' {FormStarSys},
  fmSolarSystemR in '..\source\fmSolarSystemR.pas' {FormSolarSys},
  fmOptionsR in '..\source\fmOptionsR.pas' {frmOptions},
  fmGenExosysR in '..\source\fmGenExosysR.pas' {FormGenPlanetsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Space.Globals in '..\source\Space.Globals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAboutR in '..\source\fmAboutR.pas' {FormAbout},
  fmForm in '..\source\fmForm.pas' {FormI},
  fmParamsR in '..\source\fmParamsR.pas' {FrameParamsR: TFrame};

{$R *.res}

begin
  Application.Initialize;
//  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmAllplanets, frmAllplanets);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.Run;
end.
