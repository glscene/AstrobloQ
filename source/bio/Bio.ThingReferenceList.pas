unit Bio.ThingReferenceList;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  Bio.BaseObject,
  Bio.Coordinates,
  Bio.Position,

  Stage.VectorTypes,
  Stage.VectorGeometry;

type

// ----------------------------------------------------------------------------
TaiThingReferenceList = class(TaiReferenceList)
public
  procedure FullDisplay(aList: TStrings); override;
  // basic operations
  function RandomThing: pointer;
  function NearestThing(aPosition: TaiPosition): pointer; overload;
  function NearestThing(aPosition: TaiPosition; aRange: single): pointer; overload;
  function SimpleNearestThing(aPosition: TaiPosition): pointer;
  function NearestAvailableThing(aPosition: TaiPosition): pointer;
  function HasKind(aKind: integer): boolean;
  function HasKindAtLocation(aLocation: pointer; aKind: integer): boolean;
  function HasKindWithinDistance(aKind: integer; aPosition: TaiPosition; aDistance: single): boolean;
  function HasKindWithinXY(aKind: integer; aX: single; aY: single; aDistance: single): boolean;
  function AmountOfKind(aKind: integer): integer;
  function FirstOfKind(aKind: integer): pointer;
  function RandomOfKind(aKind: integer): pointer;
  function FarthestOfKind(aPosition: TaiPosition; aKind: integer): pointer;
  function LastOfKind(aKind: integer): pointer;
  function NearestThing(aGrabber: pointer; aPosition: TaiPosition; aRange: single): pointer; overload;
  function NearestOfKind(aKind: integer; aPosition: TaiPosition; aRange: single): pointer; overload;
  function NearestOfKind(aKind: integer; aPosition: TaiPosition): pointer; overload;
  function NearestOfClass(aClass: TaiBaseClass; aPosition: TaiPosition; aRange: single): pointer;
  function NearestAvailableOfKind(aKind: integer; aPosition: TaiPosition; aRange: single): pointer;
  function NearestAvailableUnderwaterThing(aPosition: TaiPosition; aNotKind: integer): pointer;
  function NearestAvailableNotUnderwaterThing(aPosition: TaiPosition): pointer;
  function SimpleNearestAvailableOfKind(aKind: integer; aPosition: TaiPosition; aRange: single): pointer;
  procedure ApplyOriginatingForceToAll(aOrigin: TaiPosition; aStrength: single; aRadius: single);
  procedure ApplyDamage(aOrigin: TaiPosition; aDamage: integer; aRadius: single);
  procedure KillEverything;
  procedure KillEveryKind(aKind: integer);
  function AreAllAtLocation(aLocation: pointer): boolean;
  procedure ShakeLand(aStrength: single);
  procedure KillAllPlantsAtLocation(aLocation: pointer);
  procedure KillAllLifeAtLocation(aLocation: pointer);
  procedure CeaseEverythingLocation(aLocation: pointer);
  function DistanceToNearest(aPosition: TaiPosition): single;
  // community
  function CommunityWithRoom(aKind: integer): pointer;
  procedure NotifyAllCommunitiesOfDeath(aThing: pointer);
  procedure NearestNeighbours(aPosition: TaiPosition; aRange: single; aList: TaiThingReferenceList);
  procedure ReportAll;
  procedure ReportAllCreatures;
end;

TaiThingTables = array of TaiThingReferenceList;
TaiLocationTables = array of array of TaiThingReferenceList;

implementation // =============================================================

uses
  Bio.Things,
  Bio.Satellites,
  Bio.Globals,
  Bio.Community,
  Bio.Utilities,
  Bio.Life, Bio.Creature;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.AreAllAtLocation(aLocation: pointer): boolean;
var
  i: integer;
begin
  result := true;
  for i := 0 to Count - 1 do
    if not (TaiThing(Items[i]).Position.Location = aLocation) then
      result := false
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.HasKind(aKind: integer): boolean;
var
  i: integer;
  myThing: TaiThing;
begin
  result := false;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);

    if (myThing.Kind = aKind) then
      result := true;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.HasKindWithinDistance(
  aKind: integer;
  aPosition: TaiPosition;
  aDistance: single): boolean;
var
  i: integer;
  myThing: TaiThing;
begin
  result := false;

  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);

    if (myThing.Kind = aKind) and (aPosition.DistancePlusHeightTo(myThing.Position) <= aDistance) then
      result := true;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.AmountOfKind(aKind: integer): integer;
var
  i: integer;
begin
  result := 0;

  for i := 0 to Count - 1 do
    if (TaiThing(Items[i]).Kind = aKind) then
      result := result + 1;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.FirstOfKind(aKind: integer): pointer;
var
  i: integer;
begin
  result := nil;
  for i := 0 to Count - 1 do
    if (TaiThing(Items[i]).Kind = aKind) then
    begin
      result := Items[i];
      exit;
    end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.RandomOfKind(aKind: integer): pointer;
var
  i: integer;
  want: integer;
  pos: integer;
begin
  result := nil;
  pos := 0;
  want := Random(gThings.Counters[aKind]);
//  want := Random(AmountOfKind(aKind));
  for i := 0 to Count - 1 do
    if (TaiThing(Items[i]).Kind = aKind) then
    begin
      if pos = want then
        result := Items[i];
      pos := pos + 1;
    end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.LastOfKind(aKind: integer): pointer;
var
  i: integer;
begin
  result := nil;

  for i := Count -1 downto 0 do
    if (TaiThing(Items[i]).Kind = aKind) then
    begin
      result := Items[i];
      exit;
    end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestThing(aGrabber: pointer; aPosition: TaiPosition; aRange: single): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := aRange + 1;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if not (myThing = aGrabber) then
    begin
      distance := aPosition.DistancePlusHeightTo(myThing.Position);
      if (distance <= aRange) and (distance < closest) and not (myThing.Kind = cVibe) then
      begin
        closest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestOfKind(aKind: integer; aPosition: TaiPosition; aRange: single): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := aRange + 1;

  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);

    if (myThing.Kind = aKind) and not (myThing.Position = aPosition) then
    begin
      distance := aPosition.DistancePlusHeightTo(myThing.Position);
      if (distance <= aRange) and (distance < closest) then
      begin
        closest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestOfKind(aKind: integer; aPosition: TaiPosition): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := 100000;

  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing.Kind = aKind) and not (myThing.Position = aPosition) then
    begin
      distance := aPosition.DistancePlusHeightTo(myThing.Position);
      if (distance < closest) then
      begin
        closest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestAvailableOfKind(aKind: integer; aPosition: TaiPosition; aRange: single): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := aRange + 1;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);

    if (myThing.Kind = aKind) and not (myThing.Position = aPosition) and not (myThing.Position.Carried) then
    begin
      distance := aPosition.DistancePlusHeightTo(myThing.Position);
      if (distance <= aRange) and (distance < closest) then
      begin
        closest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.FarthestOfKind(aPosition: TaiPosition; aKind: integer): pointer;
var
  myThing: TaiThing;
  farthest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  farthest := 0;

  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if myThing.Kind = aKind then
    begin
      distance := aPosition.DistancePlusHeightTo(myThing.Position);
      if (distance > farthest) then
      begin
        farthest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.ApplyOriginatingForceToAll(
  aOrigin: TaiPosition;
  aStrength: single;
  aRadius: single);
var
  i: integer;
  distance: single;
  myThing: TaiThing;
  myVect: TGLVector;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);

    if not (myThing.Position = aOrigin) and not (myThing.Kind = cExplosion) then
      begin
      distance := aOrigin.DistancePlusHeightTo(myThing.Position);

      if distance < aRadius then
      begin
        if distance < 1 then distance := 1;
        myVect.X := aStrength * (myThing.Position.X - aOrigin.X) / (distance);
        myVect.Y := aStrength * (myThing.Position.Y - aOrigin.Y) / (distance);
        myVect.Z := aStrength * (myThing.Position.Height - (aOrigin.Height-1)) / (distance);

        myThing.Position.Acceleration.ApplyForce(myVect.X, myVect.Y, myVect.Z);
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.ApplyDamage(aOrigin: TaiPosition; aDamage: integer; aRadius: single);
var
  i: integer;
  distance: single;
  myThing: TaiThing;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if not (myThing.Position = aOrigin) and not (myThing.Kind = cExplosion) then
      begin
      distance := aOrigin.DistancePlusHeightTo(myThing.Position);
      if distance < aRadius then
        myThing.Damage(aDamage);
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.KillEverything;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    TaiThing(Items[i]).Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.KillEveryKind(aKind: integer);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TaiThing(Items[i]).Kind = aKind then
      TaiThing(Items[i]).Cease;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.HasKindWithinXY(
  aKind: integer;
  aX: single; aY: single;
  aDistance: single): boolean;
var
  i: integer;
  myThing: TaiThing;
  dX, dY: single;
begin
  result := false;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing.Kind = aKind) then
    begin
      dx := (aX - myThing.Position.X);
      dy := (aY - myThing.Position.Y);
      if (Sqrt(dx*dx + dy*dy) <= aDistance) then
        result := true;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestOfClass(aClass: TaiBaseClass; aPosition: TaiPosition; aRange: single): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := aRange + 1;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing is aClass) and not (myThing.Position = aPosition) then
    begin
      distance := aPosition.DistancePlusHeightTo(myThing.Position);
      if (distance <= aRange) and (distance < closest) then
      begin
        closest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.RandomThing: pointer;
var
  want: integer;
begin
  result := nil;
  if Count > 0 then
  begin
    want := Random(Count);
    result := Items[want];
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestThing(aPosition: TaiPosition): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := 100000;

  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    distance := aPosition.DistancePlusHeightTo(myThing.Position);
    if (myThing.Position <> aPosition) and (distance < closest) then
    begin
      closest := distance;
      result := myThing;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestThing(aPosition: TaiPosition; aRange: single): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := aRange + 1;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    distance := aPosition.DistancePlusHeightTo(myThing.Position);
    if (distance <= aRange) and (distance < closest) and not (myThing.Kind = cVibe) then
    begin
      closest := distance;
      result := myThing;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.HasKindAtLocation(aLocation: pointer; aKind: integer): boolean;
var
  i: integer;
  myThing: TaiThing;
begin
  result := false;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing.Kind = aKind) and (myThing.Position = aLocation) then
      result := true;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.CommunityWithRoom(aKind: integer): pointer;
var
  i: integer;
  myCommunity: TaiCommunity;
begin
  result := nil;
  for i := 0 to Count - 1 do
  begin
    myCommunity := TaiCommunity(Items[i]);
    if (myCommunity.Admit = aKind) and (myCommunity.Vacancy) then
      result := myCommunity;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.SimpleNearestThing(aPosition: TaiPosition): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := 100000;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if aPosition <> myThing.Position then
    begin
      distance := aPosition.SimpleDistanceTo(myThing.Position);
      if (distance < closest) then
      begin
        closest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.NotifyAllCommunitiesOfDeath(aThing: pointer);
var
  i: integer;
  myCommunity: TaiCommunity;
begin
  for i := 0 to Count - 1 do
  begin
    myCommunity := TaiCommunity(Items[i]);

    if (myCommunity.Admit = TaiThing(aThing).Kind) then
      myCommunity.NotifyOfDeath(aThing);
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.SimpleNearestAvailableOfKind(aKind: integer; aPosition: TaiPosition; aRange: single): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := aRange + 1;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing.Kind = aKind) and not (myThing.Position = aPosition) and not (myThing.Position.Carried) then
    begin
      distance := aPosition.SimpleDistanceTo(myThing.Position);
      if (distance <= aRange) and (distance < closest) then
      begin
        closest := distance;
        result := myThing;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
// find the n nearest neighbours to aPosition
procedure TaiThingReferenceList.NearestNeighbours(
  aPosition: TaiPosition;
  aRange: single;
  aList: TaiThingReferenceList);
var
  myThing: TaiThing;
  distance: single;
  i: integer;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    distance := aPosition.DistancePlusHeightTo(myThing.Position);
    if (myThing.Position <> aPosition) and (distance < aRange) then
      aList.Add(myThing);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.FullDisplay(aList: TStrings);
var
  myThing: TaiThing;
  i: integer;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    aList.Add(myThing.OneLineDisplay);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.ShakeLand(aStrength: single);
var
  i: integer;
  myThing: TaiThing;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if myThing.Position.Binding = bindLand then
    begin
      myThing.Position.Velocity.ApplyForce(
        RandomSwing*aStrength/2,
        RandomSwing*aStrength/2,
        aStrength);
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestAvailableThing(aPosition: TaiPosition): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := 100000;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    distance := aPosition.DistancePlusHeightTo(myThing.Position);
    if (distance < closest) and (myThing.Position <> aPosition) and (not myThing.Position.Carried) then
    begin
      closest := distance;
      result := myThing;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestAvailableUnderwaterThing(aPosition: TaiPosition; aNotKind: integer): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := 100000;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    distance := aPosition.DistancePlusHeightTo(myThing.Position);
    if (distance < closest) and (myThing.Position.UnderWater) and (myThing.Kind <> aNotKind)
      and (myThing.Position <> aPosition) and (not myThing.Position.Carried) then
    begin
      closest := distance;
      result := myThing;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.NearestAvailableNotUnderwaterThing(aPosition: TaiPosition): pointer;
var
  myThing: TaiThing;
  closest: single;
  distance: single;
  i: integer;
begin
  result := nil;  // closest thing
  closest := 100000;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    distance := aPosition.DistancePlusHeightTo(myThing.Position);
    if (distance < closest) and (not myThing.Position.UnderWater)
      and (not myThing.Position.Carried) then
    begin
      closest := distance;
      result := myThing;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.KillAllPlantsAtLocation(aLocation: pointer);
var
  i: integer;
  myThing: TaiThing;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing.Position.Location = aLocation) and (myThing.IsPlant) then
      myThing.Cease;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.KillAllLifeAtLocation(aLocation: pointer);
var
  i: integer;
  myThing: TaiThing;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing.Position.Location = aLocation) and (myThing is TaiLivingThing)
    and (TaiLivingThing(myThing).Alive) then
      TaiLivingThing(myThing).Die;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.CeaseEverythingLocation(aLocation: pointer);
var
  i: integer;
  myThing: TaiThing;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if (myThing.Position.Location = aLocation)then
      myThing.Cease;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.ReportAll;
var
  i: integer;
  myThing: TaiThing;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    myThing.Report;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiThingReferenceList.ReportAllCreatures;
var
  i: integer;
  myThing: TaiThing;
begin
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    if myThing is TaiCreature then
      myThing.Report;
  end;
end;

// ----------------------------------------------------------------------------
function TaiThingReferenceList.DistanceToNearest(aPosition: TaiPosition): single;
var
  i: integer;
  dist: single;
  myThing: TaiThing;
begin
  result := 100;
  for i := 0 to Count - 1 do
  begin
    myThing := TaiThing(Items[i]);
    dist := aPosition.DistanceToXPlusY(myThing.Position);
    if result > dist then
      result := dist;
  end;
end;

end.
