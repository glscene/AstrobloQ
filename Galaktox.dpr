program Galaktox;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxGalaktox in 'source\fxGalaktox.pas' {FormGalaktox};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaktox, FormGalaktox);
  Application.Run;
end.
