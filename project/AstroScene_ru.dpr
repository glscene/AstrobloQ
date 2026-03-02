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
  faAstroScene_ru in '..\source\astro\faAstroScene_ru.pas' {frmAstroScene},
  faOptions_ru in '..\source\astro\faOptions_ru.pas' {frmOptions},
  fmGenStarsys_ru in '..\source\fmGenStarsys_ru.pas' {FormGenStarsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_ru in '..\source\fmAbout_ru.pas' {FormAbout},
  fmFormFirst in '..\source\fmFormFirst.pas' {frmFirst},
  frParams_ru in '..\source\astro\frParams_ru.pas' {FrameParamsR: TFrame},
  faStarSys_ru in '..\source\astro\faStarSys_ru.pas' {FormStellarSys},
  faConstells_ru in '..\source\astro\faConstells_ru.pas' {FormConstells},
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas',
  fmSettings_ru in '..\source\fmSettings_ru.pas' {frmSettings},
  faSkyAreas_ru in '..\source\astro\faSkyAreas_ru.pas' {FormSkyAreas},
  Astro.Utils in '..\source\astro\Astro.Utils.pas';

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
  Application.CreateForm(TFormStellarSys, FormStellarSys);
  Application.Run;
end.
