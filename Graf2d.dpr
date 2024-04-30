program Graf2d;




uses
  Forms,
  faGridOptions in 'source\graf\faGridOptions.pas' {FormGridOptions},
  faCoordOptions in 'source\graf\faCoordOptions.pas',
  faDerivativeOptions in 'source\graf\faDerivativeOptions.pas',
  faGridColors in 'source\graf\faGridColors.pas',
  faPlotColors in 'source\graf\faPlotColors.pas',
  faAddPlotColors in 'source\graf\faAddPlotColors.pas',
  Graf.Parser2d in 'source\graf\Graf.Parser2d.pas',
  Graf.Global2d in 'source\graf\Graf.Global2d.pas',
  faGraf2d in 'source\graf\faGraf2d.pas' {FormPlotStars},
  faFunctions in 'source\graf\faFunctions.pas' {FunctionsForm},
  faEvaluate in 'source\graf\faEvaluate.pas' {EvaluateForm},
  fAbout in 'source\fAbout.pas' {FormAbout},
  dImages in 'source\dImages.pas' {dfImages: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPlotStars, FormPlotStars);
  Application.CreateForm(TFunctionsForm, FunctionsForm);
  Application.CreateForm(TFormGridOptions, FormGridOptions);
  Application.CreateForm(TEvaluateForm, EvaluateForm);
  Application.CreateForm(TCoordsForm, CoordsForm);
  Application.CreateForm(TDerivativesForm, DerivativesForm);
  Application.CreateForm(TGridColorsForm, GridColorsForm);
  Application.CreateForm(TPlotColorsForm, PlotColorsForm);
  Application.CreateForm(TAddPlotColorsForm, AddPlotColorsForm);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
