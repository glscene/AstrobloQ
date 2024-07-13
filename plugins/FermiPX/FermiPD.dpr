program FermiPD;

uses
  Vcl.Forms,
  fdSpace in 'vclforms\fdSpace.pas' {FormPD},
  fdDataset in 'vclforms\fdDataset.pas' {FormDataset},
  fdAbout in 'vclforms\fdAbout.pas' {FormAbout},
  udExecApps in 'code\udExecApps.pas',
  udFindPaths in 'code\udFindPaths.pas',
  fdOptions in 'vclforms\fdOptions.pas' {FormSettings},
  udGlobals in 'code\udGlobals.pas',
  fdDrake in 'vclforms\fdDrake.pas' {FormDrake};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fermi Paradox Simulator';
  Application.CreateForm(TFormPD, FormPD);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
