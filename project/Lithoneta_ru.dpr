(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program Lithoneta_ru;



uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  flLithoneta_ru in '..\source\lito\flLithoneta_ru.pas' {frmAstroScene},
  flOptions_ru in '..\source\lito\flOptions_ru.pas' {frmOptions},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {FormAbout},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  flMixTextures_ru in '..\source\lito\flMixTextures_ru.pas' {FormTexCombine},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas',
  fmSettings_ru in '..\source\fmSettings_ru.pas' {frmSettings},
  flCoordinates_ru in '..\source\lito\flCoordinates_ru.pas' {FormCoords},
  flPointto_ru in '..\source\lito\flPointto_ru.pas' {FormPointto},
  Litho.Utils in '..\source\lito\Litho.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
 // TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmAstroScene, frmAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
