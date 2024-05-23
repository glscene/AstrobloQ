program Projections;

uses
  Forms,
  fProjection in 'fProjection.pas' {FormProjection};

{$R *.res}

var
  isEnglish: Boolean = True;

begin
  Application.Initialize;
  Application.CreateForm(TFormProjection, FormProjection);
  Application.Run;
end.
