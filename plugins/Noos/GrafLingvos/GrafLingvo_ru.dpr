program GrafLingvo_ru;

uses
  Forms,
  fGLForm in 'Source\fGLForm.pas' {GLForm},
  faDialog_ru in 'Source\faDialog_ru.pas' {GLDialog},
  faGrafLingvo_ru in 'Source\faGrafLingvo_ru.pas' {frmGLSViewer},
  Graf.Globals in 'Source\Graf.Globals.pas',
  dImages in 'Source\dImages.pas' {dmImages: TDataModule},
  faAbout_ru in 'Source\faAbout_ru.pas' {GLAbout},
  faOptions_ru in 'Source\faOptions_ru.pas' {FormOptions},
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
