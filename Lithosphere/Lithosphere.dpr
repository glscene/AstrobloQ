program Lithosphere;

uses
  System.StartUpCopy,
  FMX.Forms,
  fenLithosphere in 'src\fenLithosphere.pas' {FormLithosphere},
  Astro.Material in 'src\Astro.Material.pas',
  LUX.FMX.Material in '..\source\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in '..\source\lux\LUX.FMX.Types3D.pas',
  LUX in '..\source\lux\LUX.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TFormLithosphere, FormLithosphere);
  Application.Run;
end.
