program Stellarfon;

uses
  Vcl.Forms,
  uGlobals in 'source\uGlobals.pas',
  uSound in 'source\uSound.pas',
  fStellarfon in 'source\fStellarfon.pas' {FormStellarfon},
  fAbout in 'source\fAbout.pas' {FormAbout},
  fColorwheel in 'source\fColorwheel.pas' {FormColorwheel},
  uConstellations in 'source\uConstellations.pas',
  dImages in 'source\dImages.pas' {dmImages: TDataModule},
  fGLInfosD in 'source\fGLInfosD.pas' {FormInfos},
  fForm in 'source\fForm.pas' {FormI},
  fSettings in 'source\fSettings.pas' {FormSettings},
  fMidikeys in 'source\fMidikeys.pas' {FormMidikeys},
  Astro.Utils in '..\..\Source\astro\Astro.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //InitLanguage;
  Application.CreateForm(TFormStellarfon, FormStellarfon);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
