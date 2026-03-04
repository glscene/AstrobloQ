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
  faAstroScene in '..\source\astro\faAstroScene.pas' {FormAstroScene},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout in '..\source\fmAbout.pas' {frmAbout},
  fmGenStarsys in '..\source\fmGenStarsys.pas' {FormGenStarsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Vcl.Themes,
  Vcl.Styles,
  faOptions in '..\source\astro\faOptions.pas' {frmOptions},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  faStarSys in '..\source\astro\faStarSys.pas' {FormStarSys},
  frParams in '..\source\astro\frParams.pas' {FrameParams: TFrame},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  faConstells in '..\source\astro\faConstells.pas' {frmConstells},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  faSkyAreas in '..\source\astro\faSkyAreas.pas' {FormConstPolygons},
  fmSettings in '..\source\fmSettings.pas' {frmSettings},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas';

{$R *.res}

begin
  Application.Initialize;
 // TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TFormAstroScene, FormAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormStarSys, FormStarSys);
  Application.Run;
end.
