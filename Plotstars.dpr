program Plotstars;

uses
  Forms,
  faGridOptions in 'source\astro\faGridOptions.pas' {FormGridOptions},
  faCoordOptions in 'source\astro\faCoordOptions.pas',
  faDerivativeOptions in 'source\astro\faDerivativeOptions.pas',
  faGridColors in 'source\astro\faGridColors.pas',
  faPlotColors in 'source\astro\faPlotColors.pas',
  faAddPlotColors in 'source\astro\faAddPlotColors.pas',
  Astro.Parser in 'source\astro\Astro.Parser.pas',
  Astro.Global in 'source\astro\Astro.Global.pas',
  faPlotStars in 'source\astro\faPlotStars.pas' {FormPlotStars},
  faFunctions in 'source\astro\faFunctions.pas' {FunctionsForm},
  faAbout in 'source\astro\faAbout.pas' {AboutForm},
  faEvaluate in 'source\astro\faEvaluate.pas' {EvaluateForm};

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
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
