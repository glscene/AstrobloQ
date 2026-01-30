program StarMotion;

uses
  Vcl.Forms,
  fdStarMotion in 'fdStarMotion.pas' {frmPlanetFF};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPlanetFF, frmPlanetFF);
  Application.Run;
end.
