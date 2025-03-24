program VolumeRender;
uses
  System.StartUpCopy,
  FMX.Forms,
  fmVolumeRender in 'sourcex\fmVolumeRender.pas' {FormTexture3D},
  LIB.Material in 'lux\LIB.Material.pas',
  LUX.FMX.Material in 'lux\LUX.FMX.Material.pas',
  LUX.FMX.Types3D in 'lux\LUX.FMX.Types3D.pas',
  LUX in 'lux\LUX.pas',
  LUX.D3 in 'lux\LUX.D3.pas',
  LUX.FMX.Context.DX11 in 'lux\LUX.FMX.Context.DX11.pas',
  LUX.D1 in 'lux\LUX.D1.pas',
  LUX.D2 in 'lux\LUX.D2.pas',
  LUX.Lattice.T3 in 'lux\LUX.Lattice.T3.pas',
  LUX.Data.Lattice.T3 in 'lux\LUX.Data.Lattice.T3.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TFormTexture3D, FormTexture3D);
  Application.Run;
end.
