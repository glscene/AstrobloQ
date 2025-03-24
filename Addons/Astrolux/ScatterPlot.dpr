program ScatterPlot;

uses
  System.StartUpCopy,
  FMX.Forms,
  fmScatterPlot in 'sourcex\fmScatterPlot.pas',
  LUX.FMX.ScatterPlotFrame in 'lux\LUX.FMX.ScatterPlotFrame.pas' {ScatterPlotFrame: TFrame};

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
