(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
program UniversumD_ru;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxUniversum_ru in '..\source\univer\ru\fxUniversum_ru.pas' {FormUniverse},
  fxSettings_ru in '..\source\univer\ru\fxSettings_ru.pas' {frmSettings},
  fxAbout_ru in '..\source\univer\ru\fxAbout_ru.pas' {FrmAbout},
  fxAstrogen_ru in '..\source\univer\ru\fxAstrogen_ru.pas' {FormAstrogen},
  fxScatterPlot_ru in '..\source\univer\ru\fxScatterPlot_ru.pas' {FormScatterPlot},
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
  Uni.Material in '..\source\univer\Uni.Material.pas',
  fxFormFirst_ru in '..\source\univer\ru\fxFormFirst_ru.pas' {FormX};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormUniverse, FormUniverse);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormX, FormX);
  Application.Run;
end.
