program Submarine_ru;

uses
  Forms,
  fkSubmarine_ru in 'ru\fkSubmarine_ru.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Sub';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
