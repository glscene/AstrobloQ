program UniversumR;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversumR in '..\source\univer\fxUniversumR.pas' {FormUniversum},
  fxSettingsR in '..\source\univer\fxSettingsR.pas' {FormSettings},
  fxAboutR in '..\source\univer\fxAboutR.pas' {FrmAbout},
  fxAstrogenR in '..\source\univer\fxAstrogenR.pas' {FormAstrogen},
  Uni.Material in '..\Source\univer\Uni.Material.pas',
  fxScatterPlotR in '..\source\univer\fxScatterPlotR.pas' {FormScatterPlot},
  LUX.FMX.ScatterPlotFrame in '..\externals\lux\LUX.FMX.ScatterPlotFrame.pas' {ScatterPlotFrame: TFrame},
  LUX in '..\externals\lux\LUX.pas',
  LUX.D2 in '..\externals\lux\LUX.D2.pas',
  LUX.D1 in '..\externals\lux\LUX.D1.pas',
  LUX.FMX in '..\externals\lux\LUX.FMX.pas',
  LUX.D3 in '..\externals\lux\LUX.D3.pas',
  LIB.Material in '..\externals\lux\LIB.Material.pas',
  LUX.FMX.Material in '..\externals\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in '..\externals\lux\LUX.FMX.Types3D.pas',
  fxForm in '..\source\univer\fxForm.pas' {FormX},
  Uni.Utils in '..\source\univer\Uni.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormUniversum, FormUniversum);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
