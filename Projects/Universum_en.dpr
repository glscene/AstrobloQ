program Universum_en;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversum in '..\Source\univer\fxUniversum.pas' {frmUniversum},
  fxSettings in '..\Source\univer\fxSettings.pas' {frmSettings},
  fxAbout in '..\Source\univer\fxAbout.pas' {FormAbout},
  fxAstrogen in '..\Source\univer\fxAstrogen.pas' {FormAstrogen},
  Uni.Material in '..\Source\univer\Uni.Material.pas',
  fxScatterPlot in '..\Source\univer\fxScatterPlot.pas' {FormScatterPlot},
  LUX.FMX.ScatterPlotFrame in '..\externals\lux\LUX.FMX.ScatterPlotFrame.pas' {ScatterPlotFrame: TFrame},
  LUX in '..\externals\lux\LUX.pas',
  LUX.D2 in '..\externals\lux\LUX.D2.pas',
  LUX.D1 in '..\externals\lux\LUX.D1.pas',
  LUX.FMX in '..\externals\lux\LUX.FMX.pas',
  LUX.D3 in '..\externals\lux\LUX.D3.pas',
  LIB.Material in '..\externals\lux\LIB.Material.pas',
  LUX.FMX.Material in '..\externals\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in '..\externals\lux\LUX.FMX.Types3D.pas',
  fxForm in '..\Source\univer\fxForm.pas' {FormX},
  Uni.Utils in '..\source\univer\Uni.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmUniversum, frmUniversum);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormX, FormX);
  Application.Run;
end.
