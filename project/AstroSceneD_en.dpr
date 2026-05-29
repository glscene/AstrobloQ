(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
program AstroSceneD_en;

uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  faAstroScene_en in '..\source\astro\en\faAstroScene_en.pas' {FormAstroScene},
  fmFormFirst in '..\source\fmFormFirst.pas' {FormFirst: TDataModule},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fmAbout_en in '..\source\fmAbout_en.pas' {frmAbout},
  faMakeStarsys_en in '..\source\astro\en\faMakeStarsys_en.pas' {frmMakeStarsys},
  Astro.Camera in '..\source\astro\Astro.Camera.pas',
  Astro.SkyBodies in '..\source\astro\Astro.SkyBodies.pas',
  faOptions_en in '..\source\astro\en\faOptions_en.pas' {FormOptions},
  Astro.Globals in '..\source\astro\Astro.Globals.pas',
  faStarsys_en in '..\source\astro\en\faStarsys_en.pas' {frmStellarSys},
  frParams_en in '..\source\astro\en\frParams_en.pas' {FrameParams: TFrame},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  faConstAtlas_en in '..\source\astro\en\faConstAtlas_en.pas' {frmConstells},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  faConstBorders_en in '..\source\astro\en\faConstBorders_en.pas' {frmSkyPolygons},
  Astro.ReadCSV in '..\source\astro\Astro.ReadCSV.pas',
  faGenStarblock_en in '..\source\astro\en\faGenStarblock_en.pas' {frmGenStarblock};

{$R *.res}

begin
  Application.Initialize;
 // TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TFormAstroScene, FormAstroScene);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TfrmStellarSys, frmStellarSys);
  Application.Run;
end.
