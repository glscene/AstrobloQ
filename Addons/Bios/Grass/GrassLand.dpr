program GrassLand;

uses
  Forms,
  fbGrassLand in 'fbGrassLand.pas' {frmTexland};

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TfrmShortLands, frmShortLands);
  Application.CreateForm(TfrmTexland, frmTexland);
  Application.Run;
end.
