program Astrosfera;

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
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  faCoordinates in '..\source\astro\faCoordinates.pas' {FormCoords},
  faPointto in '..\source\astro\faPointto.pas' {FormPointto},
  uaHiputils in '..\source\astro\uaHiputils.pas',
  faConstPolygons in '..\source\astro\faConstPolygons.pas' {FormConstBorders},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  faAstrosfera in '..\source\astro\faAstrosfera.pas' {frmAstrosfera},
  faMixTextures in '..\source\astro\faMixTextures.pas' {FormTexCombine},
  fmForm in '..\source\fmForm.pas' {FormI},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  faHercRussel in '..\source\astro\faHercRussel.pas' {FormHercrussel},
  faHipparcos in '..\source\astro\faHipparcos.pas' {FormHipparcos},
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  faOptions in '..\source\astro\faOptions.pas' {frmOptions},
  sofa in '..\Externals\sofa\sofa.pas',
  astronomy in '..\Externals\astronomy\astronomy.pas',
  umUtils in '..\source\umUtils.pas',
  faAstromif in '..\source\astro\faAstromif.pas' {FormAstromif},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  umGlobals in '..\source\umGlobals.pas',
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Astrosfera';
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TfrmAstrosfera, frmAstrosfera);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.

