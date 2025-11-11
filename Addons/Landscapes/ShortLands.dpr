program ShortLands;

uses
  Forms,
  fmShortLands in 'code\fmShortLands.pas' {frmShortLands},
  fmTexLand in 'code\fmTexLand.pas' {frmTexland};

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TfrmShortLands, frmShortLands);
  Application.CreateForm(TfrmTexland, frmTexland);
  Application.Run;
end.
