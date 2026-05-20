program Submarine_en;

uses
  Forms,
  fkSubmarine_en in 'en\fkSubmarine_en.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Sub';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
