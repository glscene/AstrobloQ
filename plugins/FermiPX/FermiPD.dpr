program FermiPD;

uses
  Vcl.Forms,
  fdSpace in 'fdSpace.pas' {frmFermi},
  fdData in 'fdData.pas' {FormTables},
  fdAbout in 'fdAbout.pas' {FormAbout},
  udExecApps in 'udExecApps.pas',
  udFindPaths in 'udFindPaths.pas',
  fdSettings in 'fdSettings.pas' {FormSettings},
  udGlobals in 'udGlobals.pas',
  fdDrake in 'fdDrake.pas' {FormDrake};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fermi Paradox Simulator';
  Application.CreateForm(TfrmFermi, frmFermi);
  Application.Run;
end.
