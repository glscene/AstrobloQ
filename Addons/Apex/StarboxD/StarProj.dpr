program StarProj;

uses
  Forms,
  fdStarProj in 'code\fdStarProj.pas' {FormProjection};

{$R *.res}

var
  isEnglish: Boolean = True;

begin
  Application.Initialize;
  Application.CreateForm(TFormProjection, FormProjection);
  Application.Run;
end.
