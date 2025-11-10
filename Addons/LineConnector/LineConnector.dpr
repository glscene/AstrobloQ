program LineConnector;

uses
  Forms,
  fmLineConnector in 'fmLineConnector.pas' {frmConnector};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConnector, frmConnector);
  Application.Run;
end.
