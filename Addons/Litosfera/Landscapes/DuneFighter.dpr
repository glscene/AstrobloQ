program DuneFighter;

uses
  Forms,
  flDuneFighter in '..\..\..\source\lito\flDuneFighter.pas' {frmDuneFighter};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDuneFighter, frmDuneFighter);
  Application.Run;
end.
