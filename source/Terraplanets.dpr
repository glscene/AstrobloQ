program Terraplanets;

uses
  Vcl.Forms,
  fTerraplanets in 'fTerraplanets.pas' {FormTerranets};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTerranets, FormTerranets);
  Application.Run;
end.
