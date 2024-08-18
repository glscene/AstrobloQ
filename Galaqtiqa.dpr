program Galaqtiqa;

uses
  System.StartUpCopy,
  FMX.Forms,
  fruGalaxy in 'source\aid\fruGalaxy.pas' {FormGalaqtiqa},
  fruSettings in 'source\aid\fruSettings.pas' {FormSettings},
  fruAbout in 'source\aid\fruAbout.pas' {FormAbout},
  fruForm in 'source\aid\fruForm.pas' {FormI};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaqtiqa, FormGalaqtiqa);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.
