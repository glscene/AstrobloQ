program Universum;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversum in '..\Source\universum\fxUniversum.pas' {frmUniverse},
  fxSettings in '..\Source\universum\fxSettings.pas' {frmSettings},
  fxForm in '..\Source\universum\fxForm.pas' {FormO},
  fxAbout in '..\Source\universum\fxAbout.pas' {FormAbout},
  fxAstrogen in '..\Source\universum\fxAstrogen.pas' {FormAstrogen},
  Uni.Material in '..\Source\universum\Uni.Material.pas',
  fxScatterPlot in '..\Source\universum\fxScatterPlot.pas' {FormScatterPlot},
  LUX.FMX.ScatterPlotFrame in '..\externals\lux\LUX.FMX.ScatterPlotFrame.pas' {ScatterPlotFrame: TFrame},
  LUX in '..\externals\lux\LUX.pas',
  LUX.D2 in '..\externals\lux\LUX.D2.pas',
  LUX.D1 in '..\externals\lux\LUX.D1.pas',
  LUX.FMX in '..\externals\lux\LUX.FMX.pas',
  LUX.D3 in '..\externals\lux\LUX.D3.pas',
  LIB.Material in '..\externals\lux\LIB.Material.pas',
  LUX.FMX.Material in '..\externals\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in '..\externals\lux\LUX.FMX.Types3D.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmUniverse, frmUniverse);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormO, FormO);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormAstrogen, FormAstrogen);
  Application.Run;
end.
