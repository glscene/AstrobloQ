(*
  The ThorFX special effect basic sample by René Lindsay
  The code is largely based on the FireFX code 10/3/2001.
*)
program Lightning;

uses
  Forms,
  fsLightning in 'fsLightning.pas' {FormThor};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormThor, FormThor);
  Application.Run;
end.
