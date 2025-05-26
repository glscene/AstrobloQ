program Stellarfon;

uses
  Vcl.Forms,
  uGlobals in 'source\uGlobals.pas',
  uSound in 'source\uSound.pas',
  uConstellations in 'source\uConstellations.pas',
  fsStellarfon in 'source\fsStellarfon.pas' {FormStellarfon},
  fmFormI in '..\..\source\fmFormI.pas' {FormI},
  fsSettings in 'source\fsSettings.pas' {frmSettings},
  fsMidikeys in 'source\fsMidikeys.pas' {FormMidikeys},
  fsColorwheel in 'source\fsColorwheel.pas' {FormColorwheel},
  fsAbout in 'source\fsAbout.pas' {FormAbout},
  dmImages in '..\..\source\dmImages.pas' {DataModuleImages: TDataModule},
  dmBase in '..\..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //InitLanguage;
  Application.CreateForm(TFormStellarfon, FormStellarfon);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.Run;
end.
