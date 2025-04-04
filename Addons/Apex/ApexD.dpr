program ApexD;

uses
  Vcl.Forms,
  fpApex in 'delphi\fpApex.pas' {FormApex},
  fpCoco in 'delphi\fpCoco.pas' {FormCoco},
  fpComet in 'delphi\fpComet.pas' {FormComet},
  fpControl in 'delphi\fpControl.pas' {FormControl},
  fpEclipse in 'delphi\fpEclipse.pas' {FormEclipse},
  fpEcltimer in 'delphi\fpEcltimer.pas' {FormEcltimer},
  fpFoto in 'delphi\fpFoto.pas' {FormFoto},
  fpLuna in 'delphi\fpLuna.pas' {FormLuna},
  fpNewmoon in 'delphi\fpNewmoon.pas' {FormNewmoon},
  fpNumint in 'delphi\fpNumint.pas' {FormNumint},
  fpOccult in 'delphi\fpOccult.pas' {FormOccult},
  fpOrbdet in 'delphi\fpOrbdet.pas' {FormOrbdet},
  fpPhys in 'delphi\fpPhys.pas' {FormPhys},
  fpPlanetpos in 'delphi\fpPlanetpos.pas' {FormPlanetpos},
  fpPlanetrise in 'delphi\fpPlanetrise.pas' {FormPlanetrise},
  fpSunset in 'delphi\fpSunset.pas' {FormSunset},
  Apc.DE in 'apc\Apc.DE.pas',
  Apc.Kepler in 'apc\Apc.Kepler.pas',
  Apc.Math in 'apc\Apc.Math.pas',
  Apc.Moon in 'apc\Apc.Moon.pas',
  Apc.Phys in 'apc\Apc.Phys.pas',
  Apc.Planets in 'apc\Apc.Planets.pas',
  Apc.PrecNut in 'apc\Apc.PrecNut.pas',
  Apc.Spheric in 'apc\Apc.Spheric.pas',
  Apc.Sun in 'apc\Apc.Sun.pas',
  Apc.Time in 'apc\Apc.Time.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormApex, FormApex);
  Application.Run;
end.
