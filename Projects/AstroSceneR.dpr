(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program AstroSceneR;



uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  fmAstroSceneR in '..\source\fmAstroSceneR.pas' {FormAstroScene},
  fmOptionsR in '..\source\fmOptionsR.pas' {frmOptions},
  fmGenExosysR in '..\source\fmGenExosysR.pas' {FormGenPlanetsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Space.Globals in '..\source\Space.Globals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAboutR in '..\source\fmAboutR.pas' {FrmAbout},
  fmFormI in '..\source\fmFormI.pas' {FormI},
  frParamsR in '..\source\frParamsR.pas' {FrameParamsR: TFrame},
  fmStellarSystemR in '..\source\fmStellarSystemR.pas' {FormStarSys},
  fmSolarSystemR in '..\source\fmSolarSystemR.pas' {FormSolarSys},
  fmConstellationsR in '..\source\fmConstellationsR.pas' {FormConstellations},
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  fmMixTextures in '..\source\fmMixTextures.pas' {FormTexCombine},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Space.ReadCSV in '..\source\Space.ReadCSV.pas';

{$R *.res}

begin
  Application.Initialize;
//  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TFormAstroScene, FormAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
