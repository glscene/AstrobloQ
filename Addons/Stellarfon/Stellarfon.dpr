program Stellarfon;

uses
  Vcl.Forms,
  uGlobals in 'source\uGlobals.pas',
  uSound in 'source\uSound.pas',
  uConstellations in 'source\uConstellations.pas',
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  fsStellarfon in 'source\fsStellarfon.pas' {FormStellarfon},
  fmFormI in '..\..\source\fmFormI.pas' {FormI},
  fsSettings in 'source\fsSettings.pas' {frmSettings},
  fsMidikeys in 'source\fsMidikeys.pas' {FormMidikeys},
  fsColorwheel in 'source\fsColorwheel.pas' {FormColorwheel},
  fsAbout in 'source\fsAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //InitLanguage;
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TFormStellarfon, FormStellarfon);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
