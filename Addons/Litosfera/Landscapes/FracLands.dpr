program FracLands;

uses
  Forms,
  flFracLand in '..\..\..\source\lito\flFracLand.pas' {frmFracLands},
  flProgress in '..\..\..\source\lito\flProgress.pas' {frmProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFracLands, frmFracLands);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.Run;
end.
