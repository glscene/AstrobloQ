program FishTank;

uses
  Forms,
  fdFishTank in 'fdFishTank.pas' {FormFishTank};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormFishTank, FormFishTank);
  Application.Run;
end.
