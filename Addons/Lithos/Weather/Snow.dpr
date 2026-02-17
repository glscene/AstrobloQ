program Snow;

uses
  Forms,
  fSnow in 'fSnow.pas' {FormSnow};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormSnow, FormSnow);
  Application.Run;
end.
