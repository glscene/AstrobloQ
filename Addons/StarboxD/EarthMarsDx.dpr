program EarthMarsDx;

uses
  System.StartUpCopy,
  FMX.Forms,
  fdxEarthMars in 'codex\fdxEarthMars.pas' {frmEarthMars};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEarthMars, frmEarthMars);
  Application.Run;
end.
