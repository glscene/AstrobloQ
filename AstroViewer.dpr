program AstroViewer;

uses
  Vcl.Forms,
  udVsop2013 in 'source\delphi\udVsop2013.pas',
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
  fdAbout in 'source\delphi\fdAbout.pas' {FormAbout},
  udConstBayers in 'source\delphi\udConstBayers.pas',
  udEphemerides in 'source\delphi\udEphemerides.pas',
  sofa in 'source\sofa\sofa.pas',
  fdCoordinates in 'source\delphi\fdCoordinates.pas' {FormCoords},
  fdPointto in 'source\delphi\fdPointto.pas' {FormPointto},
  fdHercRussel in 'source\delphi\fdHercRussel.pas' {FormHercrussel},
  fdHipparcos in 'source\delphi\fdHipparcos.pas' {FormHipparcos},
  udHygmain in 'source\delphi\udHygmain.pas',
  udHiputils in 'source\delphi\udHiputils.pas',
  fdConstPolygons in 'source\delphi\fdConstPolygons.pas' {FormConstBorders},
  ddImages in 'source\delphi\ddImages.pas' {dmImages: TDataModule},
  udGlobals in 'source\delphi\udGlobals.pas',
  fdSettings in 'source\delphi\fdSettings.pas' {frmSettings},
  fdAstroViewer in 'source\delphi\fdAstroViewer.pas' {frmAstroViewer},
  udGenRandom in 'source\delphi\udGenRandom.pas',
  udUtils in 'source\delphi\udUtils.pas',
  fdMixTextures in 'source\delphi\fdMixTextures.pas' {FormTexCombine},
  fdAstromif in 'source\delphi\fdAstromif.pas' {FormAstromif},
  fdForm in 'source\delphi\fdForm.pas' {FormI},
  ddBase in 'source\delphi\ddBase.pas' {dmBase: TDataModule},
  ddDialogs in 'source\delphi\ddDialogs.pas' {dmDialogs: TDataModule},
  GLS.SkyDome in 'source\delphi\GLS.SkyDome.pas',
  Vcl.Themes,
  Vcl.Styles,
  gnuGettext in 'source\delphi\gnuGettext.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmAstroViewer, frmAstroViewer);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.Run;
end.

