unit Bio.Globals;

interface

uses
  Bio.Space,
  Bio.Reality,
  Bio.Environment,
  Bio.Position,
  Bio.Things,
  Bio.Force;

var

gPlanetRadius: single;
gPlanetHeight: integer;
gPlanetWidth: integer;
gWidthSingle: single;
gHeightSingle: single;
gHalfWidthSingle: single;
gHalfHeightSingle: single;

gWorldWidth: single;
gWorldHeight: single;
gHalfWorldWidth: single;
gHalfWorldHeight: single;
gOneQuarterWorldHeight: single;
gThreeQuartersWorldHeight: single;

gUniqueHandle: integer;

gReality: AIReality;
gEnvironment: AIEnvironment;
gSpace: AISpace;
gThings: TaiThingList;

gGravity: AIForce;
gAirFriction: AIForce;
gLandFriction: AIForce;
gWaterFriction: AIForce;

gVersion: integer;

function UniqueHandle: integer;

//gWorldState: AIWorldState; ??

//============================================================================
implementation

// 0 is null handle
function UniqueHandle: integer;
begin
  gUniqueHandle := gUniqueHandle + 1;
  result := gUniqueHandle;
end;


end.
