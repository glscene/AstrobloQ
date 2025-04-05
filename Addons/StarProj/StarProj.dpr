program StarProj;

uses
  Forms,
  fStarProj in 'fStarProj.pas' {FormProjection};

{$R *.res}

var
  isEnglish: Boolean = True;

begin
  Application.Initialize;
  Application.CreateForm(TFormProjection, FormProjection);
  Application.Run;
end.
