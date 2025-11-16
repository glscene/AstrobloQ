program StarSyx;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxStarSyx in 'codex\fxStarSyx.pas' {FormPlanetMoons};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPlanetMoons, FormPlanetMoons);
  Application.Run;
end.
