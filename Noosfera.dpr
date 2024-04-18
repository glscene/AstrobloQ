program Noosfera;

uses
  Vcl.Forms,
  fnNoosfera in 'source\noo\fnNoosfera.pas' {FormMilkyway},
  fnProjection in 'source\noo\fnProjection.pas' {FormProjection};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMilkyway, FormMilkyway);
  Application.Run;
end.
