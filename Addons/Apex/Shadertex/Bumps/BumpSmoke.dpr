program BumpSmoke;

uses
  Forms,
  fdBumpSmoke in 'fdBumpSmoke.pas' {Main},
  Bump.OffSet in 'Bump.OffSet.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
