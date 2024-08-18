program Galaxy;

uses
  System.StartUpCopy,
  FMX.Forms,
  fenGalaxy in 'source\aid\fenGalaxy.pas' {FormGalaqtiqa},
  fenSettings in 'source\aid\fenSettings.pas' {FormSettings},
  fenForm in 'source\aid\fenForm.pas' {FormI},
  fenAbout in 'source\aid\fenAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaqtiqa, FormGalaqtiqa);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
