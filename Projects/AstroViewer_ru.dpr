program AstroViewer_ru;

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
  fdAstroViewer_ru in '..\Source\astro\fdAstroViewer_ru.pas' {frmAstroViewer},
  udGenRandom in '..\source\astro\udGenRandom.pas',
  fdMixTextures in '..\source\astro\fdMixTextures.pas' {FormTexCombine},
  fdAstromif_ru in '..\Source\astro\fdAstromif_ru.pas' {FormAstromif},
  fdForm in '..\Source\fdForm.pas' {FormI},
  ddBase in '..\source\astro\ddBase.pas' {dmBase: TDataModule},
  ddDialogs in '..\source\astro\ddDialogs.pas' {dmDialogs: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  fdHercRussel in '..\Source\astro\fdHercRussel.pas' {FormHercrussel},
  fdHipparcos in '..\source\astro\fdHipparcos.pas' {FormHipparcos},
  udGlobals in '..\Source\udGlobals.pas',
  fdSettings_ru in '..\Source\astro\fdSettings_ru.pas' {frmSettings},
  fAbout in '..\Source\fAbout.pas' {FormAbout},
  fForm in '..\Source\fForm.pas' {FormG},
  uUtils in '..\Source\uUtils.pas',
  sofa in '..\Externals\sofa\sofa.pas',
  astronomy in '..\Externals\astronomy\astronomy.pas',
  Apc.DE in '..\Addons\Apex\apc\Apc.DE.pas',
  Apc.Kepler in '..\Addons\Apex\apc\Apc.Kepler.pas',
  Apc.Math in '..\Addons\Apex\apc\Apc.Math.pas',
  Apc.Moon in '..\Addons\Apex\apc\Apc.Moon.pas',
  Apc.Phys in '..\Addons\Apex\apc\Apc.Phys.pas',
  Apc.Planets in '..\Addons\Apex\apc\Apc.Planets.pas',
  Apc.PrecNut in '..\Addons\Apex\apc\Apc.PrecNut.pas',
  Apc.Spheric in '..\Addons\Apex\apc\Apc.Spheric.pas',
  Apc.Sun in '..\Addons\Apex\apc\Apc.Sun.pas',
  Apc.Time in '..\Addons\Apex\apc\Apc.Time.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmAstroViewer, frmAstroViewer);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormG, FormG);
  Application.Run;
end.

