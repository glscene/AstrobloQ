program Universum_ru;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversum_ru in '..\source\univer\fxUniversum_ru.pas' {FormUniversum},
  fxSettings_ru in '..\source\univer\fxSettings_ru.pas' {FormSettings},
  fxAbout_ru in '..\source\univer\fxAbout_ru.pas' {FrmAbout},
  fxAstrogen_ru in '..\source\univer\fxAstrogen_ru.pas' {FormAstrogen},
  Uni.Material in '..\Source\univer\Uni.Material.pas',
  fxScatterPlot_ru in '..\source\univer\fxScatterPlot_ru.pas' {FormScatterPlot},
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
  Application.CreateForm(TFormX, FormX);
  Application.Run;
end.
