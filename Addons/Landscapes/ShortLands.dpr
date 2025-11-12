program ShortLands;

uses
  Forms,
  flShortLands in '..\..\source\lito\flShortLands.pas' {frmShortLands},
  flTexLand in '..\..\source\lito\flTexLand.pas' {frmTexland};

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TfrmShortLands, frmShortLands);
  Application.CreateForm(TfrmTexland, frmTexland);
  Application.Run;
end.
