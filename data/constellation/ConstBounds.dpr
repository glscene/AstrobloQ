program ConstBounds;

uses
  Forms,
  fConstBounds in 'fConstBounds.pas' {FormConversion};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormConversion, FormConversion);
  Application.Run;
end.
