program ApexD_en;

uses
  Vcl.Forms,
  fdApex_en in '..\pas\en\fdApex_en.pas' {FormApex},
  fpCoco_en in '..\pas\en\fpCoco_en.pas' {frmCoco},
  fpComet_en in '..\pas\en\fpComet_en.pas' {FormComet},
  fpControl_en in '..\pas\en\fpControl_en.pas' {FormControl},
  fpEclipse_en in '..\pas\en\fpEclipse_en.pas' {frmEclipse},
  fpEcltimer_en in '..\pas\en\fpEcltimer_en.pas' {frmEcltimer},
  fpFoto_en in '..\pas\en\fpFoto_en.pas' {frmFoto},
  fpLuna_en in '..\pas\en\fpLuna_en.pas' {frmLuna},
  fpNewmoon_en in '..\pas\en\fpNewmoon_en.pas' {frmNewmoon},
  fpNumint_en in '..\pas\en\fpNumint_en.pas' {frmNumint},
  fpOccult_en in '..\pas\en\fpOccult_en.pas' {frmOccult},
  fpOrbdet_en in '..\pas\en\fpOrbdet_en.pas' {frmOrbdet},
  fpPhys_en in '..\pas\en\fpPhys_en.pas' {frmPhys},
  fpPlanetpos_en in '..\pas\en\fpPlanetpos_en.pas' {frmPlanetpos},
  fpPlanetrise_en in '..\pas\en\fpPlanetrise_en.pas' {frmPlanetrise},
  fpSunset_en in '..\pas\en\fpSunset_en.pas' {frmSunset},
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
