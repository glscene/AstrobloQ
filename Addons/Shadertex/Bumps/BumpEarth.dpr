program BumpEarth;

uses
  Forms,
  fdBumpEarth in 'fdBumpEarth.pas' {FBumpEarth};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFBumpEarth, FBumpEarth);
  Application.Run;
end.
