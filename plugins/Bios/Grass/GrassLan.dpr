program GrassLan;

uses
  Forms,
  fdGrassLan in 'fdGrassLan.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
