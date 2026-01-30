program SuperGems;

uses
  Forms,
  fdSuperGems in 'fdSuperGems.pas' {frmSuperGems};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSuperGems, frmSuperGems);
  Application.Run;
end.
