program ApexP;

uses
  Vcl.Forms,
  fpApex in 'pascal\fpApex.pas' {FormApex},
  fpCoco in 'pascal\fpCoco.pas' {FormCoco},
  fpComet in 'pascal\fpComet.pas' {FormComet},
  fpControl in 'pascal\fpControl.pas' {FormControl},
  fpEclipse in 'pascal\fpEclipse.pas' {FormEclipse},
  fpEcltimer in 'pascal\fpEcltimer.pas' {FormEcltimer},
  fpFoto in 'pascal\fpFoto.pas' {FormFoto},
  fpLuna in 'pascal\fpLuna.pas' {FormLuna},
  fpNewmoon in 'pascal\fpNewmoon.pas' {FormNewmoon},
  fpNumint in 'pascal\fpNumint.pas' {FormNumint},
  fpOccult in 'pascal\fpOccult.pas' {FormOccult},
  fpOrbdet in 'pascal\fpOrbdet.pas' {FormOrbdet},
  fpPhys in 'pascal\fpPhys.pas' {FormPhys},
  fpPlanetpos in 'pascal\fpPlanetpos.pas' {FormPlanetpos},
  fpPlanetrise in 'pascal\fpPlanetrise.pas' {FormPlanetrise},
  fpSunset in 'pascal\fpSunset.pas' {FormSunset},
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
