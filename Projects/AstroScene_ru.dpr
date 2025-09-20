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
  fmAstroScene_ru in '..\source\fmAstroScene_ru.pas' {FormAstroScene},
  fmOptions_ru in '..\source\fmOptions_ru.pas' {FormOptions},
  fmGenStarsys_ru in '..\source\fmGenStarsys_ru.pas' {frmGenStarsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Space.Globals in '..\source\Space.Globals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {frmAbout},
  fmFormI in '..\source\fmFormI.pas' {FormI},
  frParams_ru in '..\source\frParams_ru.pas' {FrameParamsR: TFrame},
  fmStarsys_ru in '..\source\fmStarsys_ru.pas' {frmStarsys},
  fmSolarsys_ru in '..\source\fmSolarsys_ru.pas' {frmSolarsys},
  fmConstells_ru in '..\source\fmConstells_ru.pas' {frmConstells},
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  fmMixTextures in '..\source\fmMixTextures.pas' {FormTexCombine},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Space.ReadCSV in '..\source\Space.ReadCSV.pas',
  fmSettings_ru in '..\source\fmSettings_ru.pas' {FormSettings};

{$R *.res}

begin
  Application.Initialize;
//  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TFormAstroScene, FormAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
