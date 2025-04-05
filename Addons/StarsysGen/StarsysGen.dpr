program StarsysGen;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxStarsysGen in 'fxStarsysGen.pas' {FormPlanetMoons};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPlanetMoons, FormPlanetMoons);
  Application.Run;
end.
