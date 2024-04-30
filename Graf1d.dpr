program Graf1d;



uses
  Forms,
  faFunc1d in 'source\graf\faFunc1d.pas',
  faGridOpt1d in 'source\graf\faGridOpt1d.pas',
  faNumeric in 'source\graf\faNumeric.pas',
  faTextBlocks in 'source\graf\faTextBlocks.pas',
  faDerivative in 'source\graf\faDerivative.pas',
  faIntegrateX in 'source\graf\faIntegrateX.pas',
  faIntegrateY in 'source\graf\faIntegrateY.pas',
  faBetween in 'source\graf\faBetween.pas',
  faVolumeX in 'source\graf\faVolumeX.pas',
  faVolumeY in 'source\graf\faVolumeY.pas',
  faBitmap in 'source\graf\faBitmap.pas',
  faPrint in 'source\graf\faPrint.pas',
  faStyle in 'source\graf\faStyle.pas',
  faValueX in 'source\graf\faValueX.pas',
  faValueX1 in 'source\graf\faValueX1.pas',
  faValueX2 in 'source\graf\faValueX2.pas',
  Graf.Canvas1d in 'source\graf\Graf.Canvas1d.pas',
  Graf.Global1d in 'source\graf\Graf.Global1d.pas',
  Graf.Parser1d in 'source\graf\Graf.Parser1d.pas',
  faGraf1d in 'source\graf\faGraf1d.pas' {MainForm},
  fAbout in 'source\fAbout.pas' {FormAbout};

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
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
