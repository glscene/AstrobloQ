program Terranets;

uses
  Vcl.Forms,
  fTerranets in 'fTerranets.pas' {FormTerranets};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTerranets, FormTerranets);
  Application.Run;
end.
