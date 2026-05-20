program ForestHills;

uses
  Forms,
  fdForestHills in 'fdForestHills.pas' {FormForestHills};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormForestHills, FormForestHills);
  Application.Run;
end.
