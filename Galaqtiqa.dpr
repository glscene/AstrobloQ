program Galaqtiqa;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxGalaqtiqa in 'source\aid\fxGalaqtiqa.pas' {FormGalaqtiqa},
  fxAbout in 'source\aid\fxAbout.pas' {FormAbout},
  fxSettings in 'source\aid\fxSettings.pas' {FormSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaqtiqa, FormGalaqtiqa);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.
