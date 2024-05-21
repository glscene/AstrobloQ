program Projections;

uses
  Forms,
  fProjectionEn in 'fProjectionEn.pas' {FormProjectionEn},
  fProjection in 'fProjection.pas' {FormProjection};

{$R *.res}

const
  isEnglish: Boolean = False;

begin
  Application.Initialize;
  if isEnglish then
   Application.CreateForm(TFormProjectionEn, FormProjectionEn)
  else
   Application.CreateForm(TFormProjection, FormProjection);
   Application.Run;
end.
