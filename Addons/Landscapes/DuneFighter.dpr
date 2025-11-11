program DuneFighter;

uses
  Forms,
  fmDuneFighter in 'code\fmDuneFighter.pas' {frmDuneFighter};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDuneFighter, frmDuneFighter);
  Application.Run;
end.
