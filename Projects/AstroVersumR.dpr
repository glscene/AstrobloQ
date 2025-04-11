program AstroVersumR;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uaVsop2013 in '..\source\astro\uaVsop2013.pas',
  uaConstBayers in '..\source\astro\uaConstBayers.pas',
  uaEphemerides in '..\source\astro\uaEphemerides.pas',
  faCoordinates in '..\source\astro\faCoordinates.pas' {FormCoords},
  faPointto in '..\source\astro\faPointto.pas' {FormPointto},
  uaHygmain in '..\source\astro\uaHygmain.pas',
  uaHiputils in '..\source\astro\uaHiputils.pas',
  faConstPolygons in '..\source\astro\faConstPolygons.pas' {FormConstBorders},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  faMixTextures in '..\source\astro\faMixTextures.pas' {FormTexCombine},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  faHercRussel in '..\source\astro\faHercRussel.pas' {FormHercrussel},
  faHipparcos in '..\source\astro\faHipparcos.pas' {FormHipparcos},
  faOptionsR in '..\source\astro\faOptionsR.pas' {frmOptions},
  fmForm in '..\source\fmForm.pas' {FormI},
  umUtils in '..\source\umUtils.pas',
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
  Apc.Time in '..\Addons\Apex\apc\Apc.Time.pas',
  faAstroVersumR in '..\source\astro\faAstroVersumR.pas' {frmAstroVersum},
  faAstromif_ru in '..\source\astro\faAstromif_ru.pas' {FormAstromif},
  fmAboutR in '..\source\fmAboutR.pas' {FormAbout},
  umGlobals in '..\source\umGlobals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TfrmAstroVersum, frmAstroVersum);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.

