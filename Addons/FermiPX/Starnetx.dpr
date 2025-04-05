program Starnetx;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxStarnets in 'srcex\fxStarnets.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
