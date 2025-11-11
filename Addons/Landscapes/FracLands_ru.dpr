program FracLands_ru;

uses
  Forms,
  fmProgress_ru in '..\..\source\lito\fmProgress_ru.pas' {frmProgress},
  fmFracLand_ru in '..\..\source\lito\fmFracLand_ru.pas' {frmFracLands};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFracLands, frmFracLands);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.Run;
end.
