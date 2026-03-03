(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program Lithoneta;

uses
  Forms,
  flLithoneta in '..\source\lito\flLithoneta.pas' {frmAstroScene},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  fmGenStarsys in '..\source\fmGenStarsys.pas' {FormGenStarsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Vcl.Themes,
  Vcl.Styles,
  flOptions in '..\source\lito\flOptions.pas' {frmOptions},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  flPointto in '..\source\lito\flPointto.pas' {FormPointto},
  flCoordinates in '..\source\lito\flCoordinates.pas' {FormCoords},
  fmSettings in '..\source\fmSettings.pas' {frmSettings},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas',
  flMixTextures in '..\source\lito\flMixTextures.pas' {FormTexCombine},
  Litho.Utils in '..\source\lito\Litho.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
 // TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmAstroScene, frmAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
