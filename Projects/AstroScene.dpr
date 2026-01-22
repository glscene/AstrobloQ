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
  fmAstroScene in '..\source\fmAstroScene.pas' {frmAstroScene},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  fmGenStarsys in '..\source\fmGenStarsys.pas' {FormGenStarsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Vcl.Themes,
  Vcl.Styles,
  faOptions in '..\source\astro\faOptions.pas' {frmOptions},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  fmStellarSys in '..\source\fmStellarSys.pas' {FormStellarSys},
  frParams in '..\source\frParams.pas' {FrameParams: TFrame},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  faConstells in '..\source\astro\faConstells.pas' {frmConstells},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  faHipparcos in '..\source\astro\faHipparcos.pas' {FormHipparcos},
  faHercRussel in '..\source\astro\faHercRussel.pas' {FormHercrussel},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  faPointto in '..\source\astro\faPointto.pas' {FormPointto},
  faSkyAreas in '..\source\astro\faSkyAreas.pas' {FormConstPolygons},
  faCoordinates in '..\source\astro\faCoordinates.pas' {FormCoords},
  fmSettings in '..\source\fmSettings.pas' {frmSettings},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas',
  faMixTextures in '..\source\astro\faMixTextures.pas' {FormTexCombine};

{$R *.res}

begin
  Application.Initialize;
 // TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmAstroScene, frmAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
