program Noosferas;

uses
  Vcl.Forms,
  udVsop2013 in '..\source\astro\udVsop2013.pas',
  udConstBayers in '..\source\astro\udConstBayers.pas',
  udEphemerides in '..\source\astro\udEphemerides.pas',
  fdCoordinates in '..\source\astro\fdCoordinates.pas' {FormCoords},
  fdPointto in '..\source\astro\fdPointto.pas' {FormPointto},
  udHygmain in '..\source\astro\udHygmain.pas',
  udHiputils in '..\source\astro\udHiputils.pas',
  fdConstPolygons in '..\source\astro\fdConstPolygons.pas' {FormConstBorders},
  ddImages in '..\source\astro\ddImages.pas' {dmImages: TDataModule},
  udGlobals in '..\Source\udGlobals.pas',
  fnSettings in '..\Source\noo\fnSettings.pas' {frmSettings},
  udGenRandom in '..\source\astro\udGenRandom.pas',
  fdMixTextures in '..\source\astro\fdMixTextures.pas' {FormTexCombine},
  fdAstromif_ru in '..\Source\astro\fdAstromif_ru.pas' {FormAstromif},
  fdForm in '..\Source\fdForm.pas' {FormI},
  ddBase in '..\source\astro\ddBase.pas' {dmBase: TDataModule},
  ddDialogs in '..\source\astro\ddDialogs.pas' {dmDialogs: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  fnNoosfera in '..\Source\noo\fnNoosfera.pas' {frmUniverse},
  fAbout in '..\Source\fAbout.pas' {FormAbout},
  fForm in '..\Source\fForm.pas' {FormG},
  uUtils in '..\Source\uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TfrmUniverse, frmUniverse);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.

