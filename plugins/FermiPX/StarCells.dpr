program StarCells;

uses
  Vcl.Forms,
  fdStarcells in 'src\fdStarcells.pas' {FormPD},
  fdDataset in 'src\fdDataset.pas' {FormDataset},
  fdAbout in 'src\fdAbout.pas' {FormAbout},
  udExecApps in 'code\udExecApps.pas',
  udFindPaths in 'code\udFindPaths.pas',
  fdOptions in 'src\fdOptions.pas' {FormSettings},
  udGlobals in 'code\udGlobals.pas',
  fdDrake in 'src\fdDrake.pas' {FormDrake};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fermi Paradox Simulator';
  Application.CreateForm(TFormPD, FormPD);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
