(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program AstroScene;



uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  fmAstroScene in '..\source\fmAstroScene.pas' {frmAstroScene},
  faOptions in '..\source\astro\faOptions.pas' {frmOptions},
  fmGenStarsys in '..\source\fmGenStarsys.pas' {FormGenStarsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  frParams in '..\source\frParams.pas' {FrameParamsR: TFrame},
  fmStellarSys in '..\source\fmStellarSys.pas' {FormStellarSys},
  faConstells in '..\source\astro\faConstells.pas' {FormConstells},
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  faMixTextures in '..\source\astro\faMixTextures.pas' {FormTexCombine},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas',
  fmSettings in '..\source\fmSettings.pas' {frmSettings},
  faSkyAreas in '..\source\astro\faSkyAreas.pas' {FormSkyAreas};

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
