program Noosferas;

uses
  Vcl.Forms,
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fnOptions in '..\source\noo\fnOptions.pas' {frmOptions},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  fnNoosferas in '..\source\noo\fnNoosferas.pas' {frmNoosferas},
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  fmForm in '..\source\fmForm.pas' {FormG},
  uUtils in '..\Source\uUtils.pas',
  uGlobals in '..\source\uGlobals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmNoosferas, frmNoosferas);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.

