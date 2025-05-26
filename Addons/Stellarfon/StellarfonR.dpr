program StellarfonR;

uses
  Vcl.Forms,
  uGlobals in 'source\uGlobals.pas',
  uSound in 'source\uSound.pas',
  fsStellarfonR in 'source\fsStellarfonR.pas' {FormStellarfon},
  fsAboutR in 'source\fsAboutR.pas' {FormAbout},
  fsColorwheelR in 'source\fsColorwheelR.pas' {FormColorwheel},
  uConstellations in 'source\uConstellations.pas',
  fsSettingsR in 'source\fsSettingsR.pas' {frmSettings},
  fsMidikeysR in 'source\fsMidikeysR.pas' {FormMidikeys},
  fmFormI in '..\..\source\fmFormI.pas' {FormI},
  dmImages in '..\..\source\dmImages.pas' {DataModuleImages: TDataModule},
  dmBase in '..\..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //InitLanguage;
  Application.CreateForm(TFormStellarfon, FormStellarfon);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.Run;
end.
