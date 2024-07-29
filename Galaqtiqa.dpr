program Galaqtiqa;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxGalaqtiqa in 'source\aigui\fxGalaqtiqa.pas' {FormGalaktis};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaktis, FormGalaktis);
  Application.Run;
end.
