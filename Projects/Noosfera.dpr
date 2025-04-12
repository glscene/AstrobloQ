program Noosfera;

uses
  Vcl.Forms,
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  fnOptions in '..\source\noo\fnOptions.pas' {frmOptions},
  dmBase in '..\source\dmBase.pas' {DataModuleBase: TDataModule},
  dmDialogs in '..\source\dmDialogs.pas' {DataModuleDialogs: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  fnNoosfera in '..\source\noo\fnNoosfera.pas' {frmNoosfera},
  fmForm in '..\source\fmForm.pas' {FormG},
  umUtils in '..\source\umUtils.pas',
  fmAbout in '..\source\fmAbout.pas' {FormAbout},
  umGlobals in '..\source\umGlobals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'AstroViewer';
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TDataModuleDialogs, DataModuleDialogs);
  Application.CreateForm(TfrmNoosfera, frmNoosfera);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.

