program ApexD_ru;

uses
  Vcl.Forms,
  fdApex_ru in '..\pas\ru\fdApex_ru.pas' {FormApex},
  fpCoco_ru in '..\pas\ru\fpCoco_ru.pas' {FormCoco},
  fpComet_ru in '..\pas\ru\fpComet_ru.pas' {FormComet},
  fpControl_ru in '..\pas\ru\fpControl_ru.pas' {FormControl},
  fpEclipse_ru in '..\pas\ru\fpEclipse_ru.pas' {FormEclipse},
  fpEcltimer_ru in '..\pas\ru\fpEcltimer_ru.pas' {FormEcltimer},
  fpFoto_ru in '..\pas\ru\fpFoto_ru.pas' {FormFoto},
  fpLuna_ru in '..\pas\ru\fpLuna_ru.pas' {FormLuna},
  fpNewmoon_ru in '..\pas\ru\fpNewmoon_ru.pas' {FormNewmoon},
  fpNumint_ru in '..\pas\ru\fpNumint_ru.pas' {FormNumint},
  fpOccult_ru in '..\pas\ru\fpOccult_ru.pas' {FormOccult},
  fpOrbdet_ru in '..\pas\ru\fpOrbdet_ru.pas' {FormOrbdet},
  fpPhys_ru in '..\pas\ru\fpPhys_ru.pas' {FormPhys},
  fpPlanetpos_ru in '..\pas\ru\fpPlanetpos_ru.pas' {FormPlanetpos},
  fpPlanetrise_ru in '..\pas\ru\fpPlanetrise_ru.pas' {FormPlanetrise},
  fpSunset_ru in '..\pas\ru\fpSunset_ru.pas' {FormSunset},
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
