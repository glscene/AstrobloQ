program Universum;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversum in '..\source\univer\fxUniversum.pas' {frmUniversum},
  fxSettings in '..\source\univer\fxSettings.pas' {frmSettings},
  fxAbout in '..\source\univer\fxAbout.pas' {FormAbout},
  fxAstrogen in '..\source\univer\fxAstrogen.pas' {FormAstrogen},
  Uni.Material in '..\source\univer\Uni.Material.pas',
  fxScatterPlot in '..\source\univer\fxScatterPlot.pas' {FormScatterPlot},
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
  fxVolumeRender in '..\source\univer\fxVolumeRender.pas' {FormTexture3D};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmUniversum, frmUniversum);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormX, FormX);
  Application.Run;
end.
