program Galaktikox;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxGalaktikox in 'source\fxGalaktikox.pas' {FormGalaktikox};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaktikox, FormGalaktikox);
  Application.Run;
end.
