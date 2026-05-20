program Tetranetx_ru;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxTetranet_ru in 'codex\fxTetranet_ru.pas' {FormTetranet};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormTetranet, FormTetranet);
  Application.Run;
end.
