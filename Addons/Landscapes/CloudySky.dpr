(*
cg Sky Shaders, key:
d - day
n - night
c - clear weather
s - cloudy weather
*)
program CloudySky;

uses
  Forms,
  fdCloudySky in 'fdCloudySky.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
