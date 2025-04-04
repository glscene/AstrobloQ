program AstroViewer;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Apc.Kepler in '..\Addons\Apex\apc\Apc.Kepler.pas',
  Apc.Math in '..\Addons\Apex\apc\Apc.Math.pas',
  Apc.Moon in '..\Addons\Apex\apc\Apc.Moon.pas',
  Apc.Phys in '..\Addons\Apex\apc\Apc.Phys.pas',
  Apc.Planets in '..\Addons\Apex\apc\Apc.Planets.pas',
  Apc.PrecNut in '..\Addons\Apex\apc\Apc.PrecNut.pas',
  Apc.Spheric in '..\Addons\Apex\apc\Apc.Spheric.pas',
  Apc.Sun in '..\Addons\Apex\apc\Apc.Sun.pas',
  Apc.Time in '..\Addons\Apex\apc\Apc.Time.pas',
  udConstBayers in '..\source\astro\udConstBayers.pas',
  udEphemerides in '..\source\astro\udEphemerides.pas',
  fdCoordinates in '..\source\astro\fdCoordinates.pas' {FormCoords},
  fdPointto in '..\source\astro\fdPointto.pas' {FormPointto},
  udHygmain in '..\source\astro\udHygmain.pas',
  udHiputils in '..\source\astro\udHiputils.pas',
  fdConstPolygons in '..\source\astro\fdConstPolygons.pas' {FormConstBorders},
  ddImages in '..\source\astro\ddImages.pas' {dmImages: TDataModule},
  fdAstroViewer in '..\Source\astro\fdAstroViewer.pas' {frmAstroViewer},
  udGenRandom in '..\source\astro\udGenRandom.pas',
  fdMixTextures in '..\source\astro\fdMixTextures.pas' {FormTexCombine},
  fdForm in '..\Source\fdForm.pas' {FormI},
  ddBase in '..\source\astro\ddBase.pas' {dmBase: TDataModule},
  ddDialogs in '..\source\astro\ddDialogs.pas' {dmDialogs: TDataModule},
  fdHercRussel in '..\Source\astro\fdHercRussel.pas' {FormHercrussel},
  fdHipparcos in '..\source\astro\fdHipparcos.pas' {FormHipparcos},
  udGlobals in '..\Source\udGlobals.pas',
  udVsop2013 in '..\source\astro\udVsop2013.pas',
  fdSettings in '..\Source\astro\fdSettings.pas' {frmSettings},
  fdAstromif in '..\Source\astro\fdAstromif.pas' {FormAstromif},
  fAbout in '..\Source\fAbout.pas' {FormAbout},
  fForm in '..\source\fForm.pas' {FormG},
  sofa in '..\Externals\sofa\sofa.pas',
  astronomy in '..\Externals\astronomy\astronomy.pas',
  uUtils in '..\Source\uUtils.pas';

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

