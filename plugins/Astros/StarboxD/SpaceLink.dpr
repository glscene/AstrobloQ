program SpaceLink;

uses
  Forms,
  fdSpaceLink in 'code\fdSpaceLink.pas' {frmConnector};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConnector, frmConnector);
  Application.Run;
end.
