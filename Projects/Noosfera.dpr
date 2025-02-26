program Noosfera;

uses
  Vcl.Forms,
  udVsop2013 in '..\source\astro\udVsop2013.pas',
  fdAbout in '..\Source\astro\fdAbout.pas' {FormAbout},
  udConstBayers in '..\source\astro\udConstBayers.pas',
  udEphemerides in '..\source\astro\udEphemerides.pas',
  fdCoordinates in '..\source\astro\fdCoordinates.pas' {FormCoords},
  fdPointto in '..\source\astro\fdPointto.pas' {FormPointto},
  udHygmain in '..\source\astro\udHygmain.pas',
  udHiputils in '..\source\astro\udHiputils.pas',
  fdConstPolygons in '..\source\astro\fdConstPolygons.pas' {FormConstBorders},
  ddImages in '..\source\astro\ddImages.pas' {dmImages: TDataModule},
  udGlobals in '..\Source\ucode\udGlobals.pas',
  fdSettings in '..\source\astro\fdSettings.pas' {frmSettings},
  fdNoosfera in '..\Source\astro\fdNoosfera.pas' {frmUniverse},
  udGenRandom in '..\source\astro\udGenRandom.pas',
  udUtils in '..\Source\ucode\udUtils.pas',
  fdMixTextures in '..\source\astro\fdMixTextures.pas' {FormTexCombine},
  fdAstromif in '..\source\astro\fdAstromif.pas' {FormAstromif},
  fdForm in '..\source\astro\fdForm.pas' {FormI},
  ddBase in '..\source\astro\ddBase.pas' {dmBase: TDataModule},
  ddDialogs in '..\source\astro\ddDialogs.pas' {dmDialogs: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmUniverse, frmUniverse);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.Run;
end.

