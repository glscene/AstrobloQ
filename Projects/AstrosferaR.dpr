program AstrosferaR;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Astro.Vsop2013 in '..\source\astro\Astro.Vsop2013.pas',
  Astro.ConstBayers in '..\source\astro\Astro.ConstBayers.pas',
  Astro.Ephemerides in '..\source\astro\Astro.Ephemerides.pas',
  faCoordinatesR in '..\source\astro\faCoordinatesR.pas' {FormCoords},
  faPointtoR in '..\source\astro\faPointtoR.pas' {FormPointto},
  Astro.ReadHyg in '..\source\astro\Astro.ReadHyg.pas',
  uaHiputils in '..\source\astro\uaHiputils.pas',
  faConstellsR in '..\source\astro\faConstellsR.pas' {FormConstBorders},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  faMixTexturesR in '..\source\astro\faMixTexturesR.pas' {FormTexCombine},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  faHercRusselR in '..\source\astro\faHercRusselR.pas' {FormHercrussel},
  faHipparcosR in '..\source\astro\faHipparcosR.pas' {FormHipparcos},
  faOptionsR in '..\source\astro\faOptionsR.pas' {frmOptions},
  Astro.Utils in '..\source\astro\Astro.Utils.pas',
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
  faAstrosferaR in '..\source\astro\faAstrosferaR.pas' {frmAstrosfera},
  faAstromifR in '..\source\astro\faAstromifR.pas' {FormAstromif},
  fmAboutR in '..\source\fmAboutR.pas' {FormAbout},
  Space.Globals in '..\source\Space.Globals.pas',
  fmForm in '..\source\fmForm.pas' {FormI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TfrmAstrosfera, frmAstrosfera);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.

