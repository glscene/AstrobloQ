program Universum;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversum_ru in '..\source\univer\fxUniversum_ru.pas' {FormUniverse},
  fxSettings_ru in '..\source\univer\fxSettings_ru.pas' {frmSettings},
  fxAbout_ru in '..\source\univer\fxAbout_ru.pas' {FrmAbout},
  fxAstrogen_ru in '..\source\univer\fxAstrogen_ru.pas' {FormAstrogen},
  fxScatterPlot_ru in '..\source\univer\fxScatterPlot_ru.pas' {FormScatterPlot},
  LUX.FMX.ScatterPlotFrame in '..\external\lux\LUX.FMX.ScatterPlotFrame.pas' {ScatterPlotFrame: TFrame},
  LUX in '..\external\lux\LUX.pas',
  LUX.D2 in '..\external\lux\LUX.D2.pas',
  LUX.D1 in '..\external\lux\LUX.D1.pas',
  LUX.FMX in '..\external\lux\LUX.FMX.pas',
  LUX.D3 in '..\external\lux\LUX.D3.pas',
  LIB.Material in '..\external\lux\LIB.Material.pas',
  LUX.FMX.Material in '..\external\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in '..\external\lux\LUX.FMX.Types3D.pas',
  fxForm in '..\source\univer\fxForm.pas' {FormX},
  Uni.Utils in '..\source\univer\Uni.Utils.pas',
  fxVolumeRender in '..\source\univer\fxVolumeRender.pas' {FormTexture3D},
  Uni.Material in '..\source\univer\Uni.Material.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormUniverse, FormUniverse);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
