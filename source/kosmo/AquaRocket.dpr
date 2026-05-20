program AquaRocket;

uses
  Forms,
  fkAquaRocket_ru in 'ru\fkAquaRocket_ru.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Sub';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
