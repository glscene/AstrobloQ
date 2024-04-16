program Galagrid;

uses
  Vcl.Forms,
  fGalagrid in 'source\fGalagrid.pas' {FormMilkyway};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMilkyway, FormMilkyway);
  Application.Run;
end.
