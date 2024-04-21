program Noosfera;

uses
  Vcl.Forms,
  fnNoosfera in 'source\noo\fnNoosfera.pas' {FormMilkyway},
  fnProjection in 'source\noo\fnProjection.pas' {FormProjection},
  dImages in 'source\dImages.pas' {dfImages: TDataModule},
  fAbout in 'source\fAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMilkyway, FormMilkyway);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
