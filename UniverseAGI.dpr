program UniverseAGI;

uses
  Vcl.Forms,
  udVsop2013 in 'source\astro\udVsop2013.pas',
  astronomy in 'source\astronomy\astronomy.pas',
  Apc.DE in 'source\apc\Apc.DE.pas',
  Apc.Kepler in 'source\apc\Apc.Kepler.pas',
  Apc.Math in 'source\apc\Apc.Math.pas',
  Apc.Moon in 'source\apc\Apc.Moon.pas',
  Apc.Phys in 'source\apc\Apc.Phys.pas',
  Apc.Planets in 'source\apc\Apc.Planets.pas',
  Apc.PrecNut in 'source\apc\Apc.PrecNut.pas',
  Apc.Spheric in 'source\apc\Apc.Spheric.pas',
  Apc.Sun in 'source\apc\Apc.Sun.pas',
  Apc.Time in 'source\apc\Apc.Time.pas',
  fdAbout in 'source\astro\fdAbout.pas' {FormAbout},
  udConstBayers in 'source\astro\udConstBayers.pas',
  udEphemerides in 'source\astro\udEphemerides.pas',
  sofa in 'source\sofa\sofa.pas',
  fdCoordinates in 'source\astro\fdCoordinates.pas' {FormCoords},
  fdPointto in 'source\astro\fdPointto.pas' {FormPointto},
  fdHercRussel in 'source\astro\fdHercRussel.pas' {FormHercrussel},
  fdHipparcos in 'source\astro\fdHipparcos.pas' {FormHipparcos},
  udHygmain in 'source\astro\udHygmain.pas',
  udHiputils in 'source\astro\udHiputils.pas',
  fdConstPolygons in 'source\astro\fdConstPolygons.pas' {FormConstBorders},
  ddImages in 'source\astro\ddImages.pas' {dmImages: TDataModule},
  udGlobals in 'source\astro\udGlobals.pas',
  fdSettings in 'source\astro\fdSettings.pas' {frmSettings},
  fdUniverse in 'Source\astro\fdUniverse.pas' {frmUniverse},
  udGenRandom in 'source\astro\udGenRandom.pas',
  udUtils in 'source\astro\udUtils.pas',
  fdMixTextures in 'source\astro\fdMixTextures.pas' {FormTexCombine},
  fdAstromif in 'source\astro\fdAstromif.pas' {FormAstromif},
  fdForm in 'source\astro\fdForm.pas' {FormI},
  ddBase in 'source\astro\ddBase.pas' {dmBase: TDataModule},
  ddDialogs in 'source\astro\ddDialogs.pas' {dmDialogs: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  gnuGettext in 'source\astro\gnuGettext.pas';

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

