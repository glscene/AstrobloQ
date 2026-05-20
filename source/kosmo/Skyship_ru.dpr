(* Basic terrain rendering demo.

  The base terrain renderer uses a hybrid ROAM/brute-force approach to
  rendering terrain, by requesting height data tiles, then rendering them
  using either triangle strips (for those below "QualityDistance") or ROAM
  tessellation.
  Controls:
  Direction keys move the came nora (shift to speedup)
  PageUp/PageDown move the camera up and down
  Orient the camera freely by holding down the left button
  Toggle wireframe mode with 'w'
  Increase/decrease the viewing distance with '+'/'-'.
  Increase/decrease CLOD precision with '*' and '/'.
  Increase/decrease QualityDistance with '9' and '8'.

  When increasing the range, or moving after having increased the range you
  may notice a one-time slowdown, this originates in the base height data
  being duplicated to create the illusion of an "infinite" terrain (at max
  range the visible area covers 1024x1024 height samples, and with tiles of
  size 16 or less, this is a lot of tiles to prepare).
*)
program Skyship_ru;

uses
  Forms,
  fkSkyship_ru in 'ru\fkSkyship_ru.pas' {FormSkyship};

{.$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormSkyship, FormSkyship);
  Application.Run;
end.
