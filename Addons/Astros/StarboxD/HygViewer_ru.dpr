program HygViewer_ru;

uses
  Vcl.Forms,
  fgHygViewer_ru in 'code\fgHygViewer_ru.pas' {FormHygViewer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHygViewer, FormHygViewer);
  Application.Run;
end.
