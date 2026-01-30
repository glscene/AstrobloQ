program GrafLingvos;

uses
  Forms,
  fGLForm in 'Source\fGLForm.pas' {GLForm},
  faDialog in 'Source\faDialog.pas' {GLDialog},
  faGrafLingvos in 'Source\faGrafLingvos.pas' {frmGLSViewer},
  Graf.Globals in 'Source\Graf.Globals.pas',
  dImages in 'Source\dImages.pas' {dmImages: TDataModule},
  faAbout in 'Source\faAbout.pas' {GLAbout},
  faOptions in 'Source\faOptions.pas' {FormOptions},
  dDialogs in 'Source\dDialogs.pas' {dmDialogs: TDataModule};

{$R *.res}

begin
 // Application.Initialize;
 // Application.Title := 'GLSViewer';
  Application.CreateForm(TfrmGLSViewer, frmGLSViewer);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.Run;
end.
