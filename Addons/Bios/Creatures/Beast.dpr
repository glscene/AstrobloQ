program Beast;

uses
  Forms,
  fdBeast in 'fdBeast.pas' {FormBeast};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormBeast, FormBeast);
  Application.Run;
end.
