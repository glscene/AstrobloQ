program ApexP;

uses
  Vcl.Forms,
  fpApex in 'pascal\fpApex.pas' {FormApex},
  Apc.DE in '..\source\apc\Apc.DE.pas',
  Apc.Kepler in '..\source\apc\Apc.Kepler.pas',
  Apc.Moon in '..\source\apc\Apc.Moon.pas',
  Apc.Planets in '..\source\apc\Apc.Planets.pas',
  Apc.PrecNut in '..\source\apc\Apc.PrecNut.pas',
  Apc.Spheric in '..\source\apc\Apc.Spheric.pas',
  Apc.Sun in '..\source\apc\Apc.Sun.pas',
  Apc.Time in '..\source\apc\Apc.Time.pas',
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
  Apc.Math in '..\source\apc\Apc.Math.pas',
  Apc.Phys in '..\source\apc\Apc.Phys.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormApex, FormApex);
  Application.Run;
end.
