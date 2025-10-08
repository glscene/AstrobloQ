(*
  The Fractalandscape demonstrates the used of the TGLFractalHDS and other functions
  included into the GLS.RandomHDS unit. The dialogbox interfaces almost all object
  properties allowing you to get a feeling about what they are controlling.

  The TGLFractalHDS is used in the same way as the other GLScene HDS. You must
  link it to a TGLTerrainRenderer to see something. But it does much more as it
  actually:
  1) builds its own HDS on the base of a few user-chosen parameters,
  2) computes lighting and
  3) computes its own texture. The user really has not
  much to do apart choosing the parameter combination that fits its needs. Its
  creativity is to be used in the OnDrawtexture event which defines how colors will
  be draped on the heightfield according to coordinates and topography.

  To understand how everything works, give a look at the agGLRandomHDS unit and
  at the following methods of the present unit:
  - FormCreate: How to declare and create the FractalHDS (not a plug-and-play component)
  - btApplyClick: Setting the properties
  - GenerateLandscape: How to load textures, build the landscape and free them
  afterward
  - OnDrawTexture: This function select the right color to display at a particular
  cell on the landscape, depending on its coordinates, elevation and slope. This
  function use the textures loaded in the GenerateLandscape procedure to drape
  them on the height field. Although the Drawtexture allows you to completely
  control the look of your landscape and to produce the most dramatic effects,
  it is not mandatory. If no OnDrawTexture event handler is supplied to the
  TGLFractalHDS, a default function will be used.

  All the other methods on this form are just maintenance code for the demo;
  they are not related directly to landscape generation.

  The code of this demo was originally based on the demo SynthTerr, although
  there is not much of it still to be seen.

  Alexandre Hirzel, June 2003

  History
  *******
  25.06.2003
  - Added new land-cover types
  22.06.2003
  - DummyCube for scaling
  - Cadencer replaced by an TGLAsyncTimer
  21.06.2003:
  - First implementation
*)

program FracLands;

uses
  Forms,
  fmProgress in 'interface\fmProgress.pas' {frmProgress},
  fmFracLand in 'interface\fmFracLand.pas' {frmFracLands};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFracLands, frmFracLands);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.Run;
end.
