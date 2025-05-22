program StellarfonR;

uses
  Vcl.Forms,
  uGlobals in 'source\uGlobals.pas',
  uSound in 'source\uSound.pas',
  fsStellarfonR in 'source\fsStellarfonR.pas' {FormStellarfon},
  fsAboutR in 'source\fsAboutR.pas' {FormAbout},
  fsColorwheelR in 'source\fsColorwheelR.pas' {FormColorwheel},
  uConstellations in 'source\uConstellations.pas',
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  fsSettingsR in 'source\fsSettingsR.pas' {frmSettings},
  fsMidikeysR in 'source\fsMidikeysR.pas' {FormMidikeys},
  fmFormI in '..\..\source\fmFormI.pas' {FormI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //InitLanguage;
  Application.CreateForm(TFormStellarfon, FormStellarfon);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.
