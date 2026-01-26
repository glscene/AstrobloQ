program ApexPas;

uses
  Vcl.Forms,
  fdApex in '..\pas\fdApex.pas' {FormApex},
  fpCoco in '..\pas\fpCoco.pas' {FormCoco},
  fpComet in '..\pas\fpComet.pas' {FormComet},
  fpControl in '..\pas\fpControl.pas' {FormControl},
  fpEclipse in '..\pas\fpEclipse.pas' {FormEclipse},
  fpEcltimer in '..\pas\fpEcltimer.pas' {FormEcltimer},
  fpFoto in '..\pas\fpFoto.pas' {FormFoto},
  fpLuna in '..\pas\fpLuna.pas' {FormLuna},
  fpNewmoon in '..\pas\fpNewmoon.pas' {FormNewmoon},
  fpNumint in '..\pas\fpNumint.pas' {FormNumint},
  fpOccult in '..\pas\fpOccult.pas' {FormOccult},
  fpOrbdet in '..\pas\fpOrbdet.pas' {FormOrbdet},
  fpPhys in '..\pas\fpPhys.pas' {FormPhys},
  fpPlanetpos in '..\pas\fpPlanetpos.pas' {FormPlanetpos},
  fpPlanetrise in '..\pas\fpPlanetrise.pas' {FormPlanetrise},
  fpSunset in '..\pas\fpSunset.pas' {FormSunset},
  Apc.DE in '..\pas\Apc.DE.pas',
  Apc.Kepler in '..\pas\Apc.Kepler.pas',
  Apc.Math in '..\pas\Apc.Math.pas',
  Apc.Moon in '..\pas\Apc.Moon.pas',
  Apc.Phys in '..\pas\Apc.Phys.pas',
  Apc.Planets in '..\pas\Apc.Planets.pas',
  Apc.PrecNut in '..\pas\Apc.PrecNut.pas',
  Apc.Spheric in '..\pas\Apc.Spheric.pas',
  Apc.Sun in '..\pas\Apc.Sun.pas',
  Apc.Time in '..\pas\Apc.Time.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormApex, FormApex);
  Application.Run;
end.
