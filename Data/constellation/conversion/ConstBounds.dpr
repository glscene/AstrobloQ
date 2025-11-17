program ConstBounds;

uses
  Forms,
  fdConstBounds in 'fdConstBounds.pas' {FormConversion};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormConversion, FormConversion);
  Application.Run;
end.
