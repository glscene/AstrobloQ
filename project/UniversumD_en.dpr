program UniversumD_en;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversum_en in '..\source\univer\en\fxUniversum_en.pas' {FormUniverse},
  fxSettings_en in '..\source\univer\en\fxSettings_en.pas' {frmSettings},
  fxAbout_en in '..\source\univer\en\fxAbout_en.pas' {FormAbout},
  fxAstrogen_en in '..\source\univer\en\fxAstrogen_en.pas' {FormAstrogen},
  Uni.Material in '..\source\univer\Uni.Material.pas',
  fxScatterPlot_en in '..\source\univer\en\fxScatterPlot_en.pas' {FormScatterPlot},
  LUX.FMX.ScatterPlotFrame in '..\external\lux\LUX.FMX.ScatterPlotFrame.pas' {ScatterPlotFrame: TFrame},
  LUX in '..\external\lux\LUX.pas',
  LUX.D2 in '..\external\lux\LUX.D2.pas',
  LUX.D1 in '..\external\lux\LUX.D1.pas',
  LUX.FMX in '..\external\lux\LUX.FMX.pas',
  LUX.D3 in '..\external\lux\LUX.D3.pas',
  LIB.Material in '..\external\lux\LIB.Material.pas',
  LUX.FMX.Material in '..\external\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in '..\external\lux\LUX.FMX.Types3D.pas',
  Uni.Utils in '..\source\univer\Uni.Utils.pas',
  fxVolumeRender_en in '..\source\univer\en\fxVolumeRender_en.pas' {FormTexture3D},
  fxFormFirst_en in '..\source\univer\en\fxFormFirst_en.pas' {FormX};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormUniverse, FormUniverse);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormX, FormX);
  Application.Run;
end.
