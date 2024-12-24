program Stellarfonx;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxStellarfon in 'source\fxStellarfon.pas' {FormStellarfon};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStellarfon, FormStellarfon);
  Application.Run;
end.
