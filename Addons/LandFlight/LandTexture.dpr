program LandTexture;

uses
  Forms,
  fLandTexture in 'fLandTexture.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
