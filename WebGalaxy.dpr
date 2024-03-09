program WebGalaxy;

uses
  Forms,
  fwGalaxy in 'source\web\fwGalaxy.pas' {FormGalaxy};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGalaxy, FormGalaxy);
  Application.Run;
end.
