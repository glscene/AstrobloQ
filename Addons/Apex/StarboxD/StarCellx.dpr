program StarCellx;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxStarCells in 'codex\fxStarCells.pas' {frmStarCellx};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmStarCellx, frmStarCellx);
  Application.Run;
end.
