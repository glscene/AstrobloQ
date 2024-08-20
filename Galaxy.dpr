program Galaxy;

uses
  System.StartUpCopy,
  FMX.Forms,
  fenGalaxy in 'source\astrod\fenGalaxy.pas' {FormGalaxy},
  fenSettings in 'source\astrod\fenSettings.pas' {FormSettings},
  fenForm in 'source\astrod\fenForm.pas' {FormI},
  fenAbout in 'source\astrod\fenAbout.pas' {FormAbout},
  Astro.Material in 'source\astrod\Astro.Material.pas',
  fenAstrogen in 'source\astrod\fenAstrogen.pas' {FormAstrogen},
  LUX.FMX.Material in 'source\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in 'source\lux\LUX.FMX.Types3D.pas',
  LUX in 'source\lux\LUX.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaxy, FormGalaxy);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.
