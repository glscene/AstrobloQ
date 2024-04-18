program Galagrid;

uses
  Vcl.Forms,
  fnNoosfera in 'source\noo\fnNoosfera.pas' {FormMilkyway};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMilkyway, FormMilkyway);
  Application.Run;
end.
