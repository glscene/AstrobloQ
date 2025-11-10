program SuperGems;

uses
  Forms,
  fsGems in 'fsGems.pas' {frmSuperGems};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSuperGems, frmSuperGems);
  Application.Run;
end.
