program Tetranets_ru;

uses
  Vcl.Forms,
  fdTetranet_ru in 'code\fdTetranet_ru.pas' {FormTetranet},
  udExecApps in 'code\udExecApps.pas',
  udFindPaths in 'code\udFindPaths.pas',
  udGlobals in 'code\udGlobals.pas',
  fdOptions_ru in 'code\fdOptions_ru.pas' {frmOptions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fermi Paradox Simulator';
  Application.CreateForm(TFormTetranet, FormTetranet);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
