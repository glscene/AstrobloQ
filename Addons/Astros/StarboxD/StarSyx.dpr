program StarSyx;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxStarSyx in 'codex\fxStarSyx.pas' {FormPlanetMoons},
  fdxEarthMars in 'codex\fdxEarthMars.pas' {frmEarthMars};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEarthMars, frmEarthMars);
  Application.CreateForm(TFormPlanetMoons, FormPlanetMoons);
  Application.Run;
end.
