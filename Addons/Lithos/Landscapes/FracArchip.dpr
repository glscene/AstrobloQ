(*
  This demo illustrate the use of the TGLFractalArchipelago, an infinite random
  landscape made of fractal islands. The crucial procedures are :
  - FormCreate: Landscape instanciation, hooking to TerrainRenderer and texture loading
  - FormActivate: Setting up landscape parameters and initialisation
  - AsyncTimer1Timer: Updating
  - OnDrawTexture: Land-cover drawing. This is where you define which texture is
  used depending on elevation, slope, aspect and position.

  Please consider testing the FractalLandscape first to understand how fractal
  landscapes are built and what the various parameters are controlling.
  Alexandre Hirzel, (c) June 2003
*)

program FracArchip;

uses
  Forms,
  Winapi.MMSystem,
  flFractalArch in '..\..\..\source\lito\flFractalArch.pas' {frmFracArchip},
  flShortLands in '..\..\..\source\lito\flShortLands.pas' {frmShortLands};

{$R *.res}

var
  TimeCaps: TTimeCaps;
  NeedToChangeTimerPrecsion: Boolean;

begin
  // starts high precision timer
  NeedToChangeTimerPrecsion := False;
  if timeGetDevCaps(@TimeCaps, SizeOf(TTimeCaps)) = TIMERR_NOERROR then
    NeedToChangeTimerPrecsion := timeBeginPeriod(TimeCaps.wPeriodMin) = TIMERR_NOERROR;

  Application.Initialize;
  Application.CreateForm(TfrmShortLands, frmShortLands);
///  Application.CreateForm(TfrmFracArchip, frmFracArchip);
  Application.Run;

  // stops high precision timer
  if NeedToChangeTimerPrecsion then
    timeEndPeriod(TimeCaps.wPeriodMin);
end.
