program Galaqtiqa;

uses
  System.StartUpCopy,
  FMX.Forms,
  fruGalaqtiqa in 'source\astrod\fruGalaqtiqa.pas' {FormGalaqtiqa},
  fruSettings in 'source\astrod\fruSettings.pas' {FormSettings},
  fruAbout in 'source\astrod\fruAbout.pas' {FormAbout},
  fruForm in 'source\astrod\fruForm.pas' {FormI},
  Astro.Material in 'source\astrod\Astro.Material.pas',
  fruAstrogen in 'source\astrod\fruAstrogen.pas' {FormAstrogen},
  LUX.FMX.Material in 'source\lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in 'source\lux\LUX.FMX.Types3D.pas',
  LUX in 'source\lux\LUX.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGalaqtiqa, FormGalaqtiqa);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormI, FormI);
  Application.CreateForm(TFormAstrogen, FormAstrogen);
  Application.Run;
end.
