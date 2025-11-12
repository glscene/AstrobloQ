program FracLands_ru;

uses
  Forms,
  flProgress_ru in '..\..\source\lito\flProgress_ru.pas' {frmProgress},
  flFracLand_ru in '..\..\source\lito\flFracLand_ru.pas' {frmFracLands};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFracLands, frmFracLands);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.Run;
end.
