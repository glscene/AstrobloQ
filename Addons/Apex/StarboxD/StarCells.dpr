program StarCells;

uses
  Vcl.Forms,
  fdStarcells_ru in 'code\fdStarcells_ru.pas' {frmStarnets},
  fdDataset_ru in 'code\fdDataset_ru.pas' {FormDataset},
  fdAbout_ru in 'code\fdAbout_ru.pas' {FormAbout},
  udExecApps in 'code\udExecApps.pas',
  udFindPaths in 'code\udFindPaths.pas',
  fdOptions_ru in 'code\fdOptions_ru.pas' {frmOptions},
  udGlobals in 'code\udGlobals.pas',
  fdDrake_ru in 'code\fdDrake_ru.pas' {FormDrake};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fermi Paradox Simulator';
  Application.CreateForm(TfrmStarnets, frmStarnets);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
