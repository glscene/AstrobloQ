program StellarViewer;

uses
  Vcl.Forms,
  udVsop2013 in '..\source\astro\udVsop2013.pas',
  Apc.DE in '..\Externals\apc\Apc.DE.pas',
  Apc.Kepler in '..\Externals\apc\Apc.Kepler.pas',
  Apc.Math in '..\Externals\apc\Apc.Math.pas',
  Apc.Moon in '..\Externals\apc\Apc.Moon.pas',
  Apc.Phys in '..\Externals\apc\Apc.Phys.pas',
  Apc.Planets in '..\Externals\apc\Apc.Planets.pas',
  Apc.PrecNut in '..\Externals\apc\Apc.PrecNut.pas',
  Apc.Spheric in '..\Externals\apc\Apc.Spheric.pas',
  Apc.Sun in '..\Externals\apc\Apc.Sun.pas',
  Apc.Time in '..\Externals\apc\Apc.Time.pas',
  fdAbout in '..\source\astro\fdAbout.pas' {FormAbout},
  udConstBayers in '..\source\astro\udConstBayers.pas',
  udEphemerides in '..\source\astro\udEphemerides.pas',
  sofa in '..\Externals\sofa\sofa.pas',
  fdCoordinates in '..\source\astro\fdCoordinates.pas' {FormCoords},
  fdPointto in '..\source\astro\fdPointto.pas' {FormPointto},
  udHygmain in '..\source\astro\udHygmain.pas',
  udHiputils in '..\source\astro\udHiputils.pas',
  fdConstPolygons in '..\source\astro\fdConstPolygons.pas' {FormConstBorders},
  ddImages in '..\source\astro\ddImages.pas' {dmImages: TDataModule},
  fdUniverse in '..\Source\astro\fdUniverse.pas' {frmUniverse},
  udGenRandom in '..\source\astro\udGenRandom.pas',
  fdMixTextures in '..\source\astro\fdMixTextures.pas' {FormTexCombine},
  fdAstromif in '..\source\astro\fdAstromif.pas' {FormAstromif},
  fdForm in '..\Source\fdForm.pas' {FormI},
  ddBase in '..\source\astro\ddBase.pas' {dmBase: TDataModule},
  ddDialogs in '..\source\astro\ddDialogs.pas' {dmDialogs: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  gnuGettext in '..\source\astro\gnuGettext.pas',
  astronomy in '..\Externals\astronomy\astronomy.pas',
  fdHercRussel in '..\Source\astro\fdHercRussel.pas' {FormHercrussel},
  fdHipparcos in '..\source\astro\fdHipparcos.pas' {FormHipparcos},
  udGlobals in '..\Source\udGlobals.pas',
  udUtils in '..\Source\udUtils.pas',
  fdSettings in '..\Source\astro\fdSettings.pas' {FormSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmUniverse, frmUniverse);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.

