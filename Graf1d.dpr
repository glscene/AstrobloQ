program Graf1d;

uses
  Forms,
  faFunc1d in 'source\astro\faFunc1d.pas',
  faGridOpt1d in 'source\astro\faGridOpt1d.pas',
  faNumeric in 'source\astro\faNumeric.pas',
  faTextBlocks in 'source\astro\faTextBlocks.pas',
  faDerivative in 'source\astro\faDerivative.pas',
  faIntegrateX in 'source\astro\faIntegrateX.pas',
  faIntegrateY in 'source\astro\faIntegrateY.pas',
  faBetween in 'source\astro\faBetween.pas',
  faVolumeX in 'source\astro\faVolumeX.pas',
  faVolumeY in 'source\astro\faVolumeY.pas',
  faBitmap in 'source\astro\faBitmap.pas',
  faPrint in 'source\astro\faPrint.pas',
  faStyle in 'source\astro\faStyle.pas',
  faValueX in 'source\astro\faValueX.pas',
  faValueX1 in 'source\astro\faValueX1.pas',
  faValueX2 in 'source\astro\faValueX2.pas',
  Graf.Canvas1d in 'source\astro\Graf.Canvas1d.pas',
  Graf.Global1d in 'source\astro\Graf.Global1d.pas',
  Graf.Parser1d in 'source\astro\Graf.Parser1d.pas',
  faGraf1d in 'source\astro\faGraf1d.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Графики 1D';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFunctionsForm, FunctionsForm);
  Application.CreateForm(TGridOptionsForm, GridOptionsForm);
  Application.CreateForm(TNumericForm, NumericForm);
  Application.CreateForm(TTextBlocksForm, TextBlocksForm);
  Application.CreateForm(TDerivativeForm, DerivativeForm);
  Application.CreateForm(TIntegrateXForm, IntegrateXForm);
  Application.CreateForm(TIntegrateYForm, IntegrateYForm);
  Application.CreateForm(TBetweenForm, BetweenForm);
  Application.CreateForm(TVolumeXForm, VolumeXForm);
  Application.CreateForm(TVolumeYForm, VolumeYForm);
  Application.CreateForm(TfxValueForm, fxValueForm);
  Application.CreateForm(Tfx1ValueForm, fx1ValueForm);
  Application.CreateForm(Tfx2ValueForm, fx2ValueForm);
  Application.Run;
end.
