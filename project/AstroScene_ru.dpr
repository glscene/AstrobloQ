(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program AstroScene_ru;



uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  faAstroScene_ru in '..\source\astro\faAstroScene_ru.pas' {FormAstroScene},
  faOptions_ru in '..\source\astro\faOptions_ru.pas' {FormOptions},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {frmAbout},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst},
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  flTexCombine_ru in '..\source\lito\flTexCombine_ru.pas' {frmTexCombine},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas',
  fmSettings_ru in '..\source\fmSettings_ru.pas' {FormSettings},
  flCoordinates_ru in '..\source\lito\flCoordinates_ru.pas' {frmCoordinates},
  flPointto_ru in '..\source\lito\flPointto_ru.pas' {frmPointto},
  Litho.Utils in '..\source\lito\Litho.Utils.pas',
  faStellarSys_ru in '..\source\astro\faStellarSys_ru.pas' {frmStellarSys},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  frParams_ru in '..\source\astro\frParams_ru.pas' {FrameParamsR: TFrame},
  faSkyPolygons_ru in '..\source\astro\faSkyPolygons_ru.pas' {frmSkyPolygons},
  faConstAtlas_ru in '..\source\astro\faConstAtlas_ru.pas' {frmConstAtlas};

{$R *.res}

begin
  Application.Initialize;
 // TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TFormAstroScene, FormAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TfrmSkyPolygons, frmSkyPolygons);
  Application.CreateForm(TfrmConstAtlas, frmConstAtlas);
  Application.Run;
end.
