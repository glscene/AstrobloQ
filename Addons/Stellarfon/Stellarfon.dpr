program Stellarfon;

uses
  Vcl.Forms,
  uGlobals in 'source\uGlobals.pas',
  uSound in 'source\uSound.pas',
  fStellarfon in 'source\fStellarfon.pas' {frmStellarfon},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fColorwheel in 'source\fColorwheel.pas' {FormColorwheel},
  uConstellations in 'source\uConstellations.pas',
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  fGLInfosD in 'source\fGLInfosD.pas' {FormInfos},
  fForm in 'source\fForm.pas' {FormI},
  fSettings in 'source\fSettings.pas' {frmSettings},
  fMidikeys in 'source\fMidikeys.pas' {FormMidikeys},
  uUtils in '..\..\Source\uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //InitLanguage;
  Application.CreateForm(TfrmStellarfon, frmStellarfon);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
