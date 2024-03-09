program Milkyway;

uses
  Vcl.Forms,
  fMilkyway in 'source\fMilkyway.pas' {FormMilkyway};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMilkyway, FormMilkyway);
  Application.Run;
end.
