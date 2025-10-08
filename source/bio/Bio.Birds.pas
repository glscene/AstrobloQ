unit Bio.Birds;

interface

uses
  System.Classes,
  System.Contnrs,
  System.Types,
  System.SysUtils,
  System.Math,

  Stage.VectorGeometry,

  Bio.BaseObject,
  Bio.Things,
  Bio.Position,
  Bio.Life,
  Bio.Link,
  Bio.Creature,
  Bio.Community,
  Bio.Mating;

const
  cFlockNoPattern = 0;        // fly normally
  cFlockEclipse = 1;          // fly in a horizontal eclipse
  cFlockEclipseReverse = 2;   // fly other way eclipse
  cFlockRight = 3;
  cFlockLeft = 4;

  cGoalNone = 0;
  cGoalTarget = 1;
  cGoalEat = 2;
  cGoalMate = 3;

const
  cHawkBaby = 0;
  cHawkAdult = 256;

  cHawkDesireNone = 0;
  cHawkDesireWander = 1;
  cHawkDesireFood = 2;
  cHawkDesireRest = 3;

  cHawkGoalNone = 0;
  cHawkGoalMove = 1;
  cHawkGoalEat = 2;
  cHawkGoalAttack = 3;

  cHawkMove = 0;
  cHawkRest = 1;
  cHawkJoinFlock = 2;
  cHawkForage = 3;
  cHawkEatFood = 4;
  cHawkAttack = 5;
  cHawkNoGoal = 6;
  cHawkFindNest = 7;
  cHawkFollow = 8;
  cHawkSpeed = 0.01;

type

(* A group of birds *)
TaiFlock = class(TaiLivingGroup)
private
  fFlightPattern: integer;
  fFlockCenter: TAffineVector;
  fFlockVelocity: TAffineVector;
  fFlockAngle: single;  // direction flock is flying
protected
  procedure CalculateCenters;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure FullDisplay(aList: TStrings); override;
  procedure Fuel; override;
  // property
  property FlightPattern: integer read fFlightPattern write fFlightPattern;
  property FlockCenter: TAffineVector read fFlockCenter;
  property FlockVelocity: TAffineVector read fFlockVelocity;
  property FlockAngle: single read fFlockAngle write fFlockAngle;
end;

(* An individual bird *)
TaiBird = class(TaiCreature)
private
  fFlock: TaiLink;        // flock
  fFlying: boolean;       // is it flying?
  fMature: boolean;       // can have kids
  fGender: boolean;       // male, female
  fMatingTimer: integer;  // timer for mating
protected
  function FlockAvoidance: TAffineVector;
  procedure FlyWithFlock;
  procedure FindFruit;
  procedure JoinFlock;
  procedure LeaveFlock;
  procedure MatingBehaviour;
  procedure FindMate;
  procedure CreateBaby;
  function ValidMate(aMate: TaiBird): boolean;
  function InMatingCondition: boolean;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure Fuel; override;
  procedure Die; override;
  procedure Cease; override;
  procedure FlapWings;
  procedure Hop;
  procedure Walk;
  procedure Swim;
  procedure ReaffirmFlock; // for loading
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
  // property
  property Flock: TaiLink read fFlock;
  property Flying: boolean read fFlying write fFlying;
  property Mature: boolean read fMature write fMature;
  property Gender: boolean read fGender write fGender;
  property MatingTimer: integer read fMatingTimer write fMatingTimer;
end;

(* Duck *)
TaiDuck = class(TaiMatingCreature)
protected
  procedure FloatWithCommunity;
  procedure Float;
  procedure DevelopIntoBaby; override;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure Fuel; override;
end;

(* Hawk *)
TaiHawk = class(TaiCreature)
private
  fFlying: boolean;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;
  procedure Fuel; override;
  procedure Hop;
  procedure FlapWings;
  function IsPredator: boolean; override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
  // property
  property Flying: boolean read fFlying write fFlying;
end;

implementation // =============================================================

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Flora,
  Bio.Vibes,
  Bio.Utilities,
  Bio.Pisces;

// ----------------------------------------------------------------------------
constructor TaiBird.Create(aParent: pointer);
begin
  inherited Create(aParent);
  Kind := cBird;
  Position.SetSize(0.5, 0.5, 0.2, true);
  Position.SetProperties(1, 0.2, 0.75);
  Position.Collider := true;
  // create flock link
  fFlock := gEnvironment.References.NewLink(self);
  Flying := true;
  fMature := false;
  fMature := true;
  Health := 1500;
  Desire := cDesireWander;
  Size := 15;
  fMatingTimer := gReality.Time + 1024;
  // male or female
  if Random(2) = 0 then
    fGender := true
  else
    fGender := false;
end;

// ----------------------------------------------------------------------------
destructor TaiBird.Destroy;
begin
  LeaveFlock;
  gEnvironment.References.Remove(fFlock);
  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.Fuel;
begin
  inherited Fuel;
  // calculate new desire based on past desire
  case Desire of
    cDesireFood:
    begin
      // if healthy, then change desire
      if Health > 3000 then
      begin
        // wander around
        Desire := cDesireWander;
      end;
      // if holding something, eat it
      if Grabber.Holding then
        Desire := cDesireEat;
    end;
    cDesireWander, cDesireEat:
    begin
      // mate if possible
      if InMatingCondition then
        Desire := cDesireMate;
      // look for food if hungry
      if (Health < 1000) and (not Grabber.Holding) then
        Desire := cDesireFood;
    end;
    cDesireMate:
    begin
      // look for food if hungry
      if (Health < 800) then
      begin
        Desire := cDesireFood;
        Eyes.InvalidateTarget;
      end;
    end;
  end;

  // enact desire
  case Desire of
    cDesireWander, cDesireEat:
      FlyWithFlock;
    cDesireFood:
      FindFruit;
    cDesireMate:
      if Eyes.ValidTarget then
        MatingBehaviour
      else
      begin
        FlyWithFlock;
        FindMate;
      end;
  end;

// if not Mature and (Age > 1000) then
//    Mature := true;
  // in water
  if Position.UnderWater then
  begin
    Flying := false;
    Swim;
  end;
  // eat
  if Grabber.Holding then
  begin
    if Grabber.Target.Kind <> cBird then
      Eat(4)
    else
    begin
      CreateBaby;
      Drop;
      Desire := cDesireWander;
      exit;
    end;
    if Grabber.Empty and (Size < 1024) then
    begin
      Noise(cNoiseEat, 1);
      //Size := Size + 1;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.Die;
begin
  inherited Die;

  Noise(cNoiseSquawk, 1);
  LeaveFlock;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.Cease;
begin
  if Exists then
    LeaveFlock;
  inherited Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.FlapWings;
begin
  if (Random(2048) = 0) then
    Noise(cNoiseBirdChirp, 1);
  if Position.Velocity.DeltaHeight < 0.1 then
    Position.Acceleration.AlterDeltaHeight(0.035);  // 0.025
end;

// ----------------------------------------------------------------------------
procedure TaiBird.Hop;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, QuarterPi, 0.2);
end;

// ----------------------------------------------------------------------------
procedure TaiBird.Walk;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.1);
end;

// ----------------------------------------------------------------------------
procedure TaiBird.Swim;
var
  myThing: TaiThing;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.02);
  if Eyes.ValidTarget then
  begin
    myThing := Eyes.Target;
    if myThing.Position.Height < Position.Height then
    // swim down
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight - 0.03
    else // swim up
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.04;
  end
  else  // get out of the water
  begin
    Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.04;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeFileBoolean(aFile, fFlying);
  fFlock.SaveToFile(aFile);
end;

// ----------------------------------------------------------------------------
procedure TaiBird.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  fFlying := readFileBoolean(aFile);
  fFlock.LoadFromFile(aFile);
end;

// ----------------------------------------------------------------------------
constructor TaiFlock.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cFlock;
  fFlightPattern := cFlockEclipse;
  Maximum := Random(32) + 8;
  Position.Tangible := false;
  Position.Collider := false;
end;

// ----------------------------------------------------------------------------
destructor TaiFlock.Destroy;
begin
  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiFlock.Fuel;
begin
  inherited Fuel;
  fFlockAngle := fFlockAngle + ca2;
  if fFlockAngle >= TwoPi then
  begin
    fFlockAngle := 0;
    fFlightPattern := Random(5);
  end;
  CalculateCenters;
end;

// ----------------------------------------------------------------------------
// finds center of flock (avg of all birds)
// and finds velocity of flock (avg of all birds)
procedure TaiFlock.CalculateCenters;
var
  myBird: TaiBird;
  i, RigidCount, FlockingCount: integer;
begin
  FlockingCount := 0;
  // reset to 0
  fFlockCenter.X := 0;
  fFlockCenter.Y := 0;
  fFlockCenter.Z := 0;
  fFlockVelocity.X := 0;
  fFlockVelocity.Y := 0;
  fFlockVelocity.Z := 0;
  // for all birds
  RigidCount := Members.Count;
  for i := 0 to RigidCount-1 do
  begin
    myBird := TaiBird(Members.Items[i]);
    // add to center
    fFlockCenter.X := fFlockCenter.X + myBird.Position.X;
    fFlockCenter.Y := fFlockCenter.Y + myBird.Position.Y;
    fFlockCenter.Z := fFlockCenter.Z + myBird.Position.Height;
    // if bird is flocking then add it to flock count
    if not (myBird.Desire = cDesireFood) then
    begin
      // add to velocity, if the bird is flocking
      fFlockVelocity.X := fFlockVelocity.X + myBird.Position.Velocity.DeltaX;
      fFlockVelocity.Y := fFlockVelocity.Y + myBird.Position.Velocity.DeltaY;
      fFlockVelocity.Z := fFlockVelocity.Z + myBird.Position.Velocity.DeltaHeight;
      FlockingCount := FlockingCount + 1;
    end;
  end;
  // calculate the average center position
  fFlockCenter.X := fFlockCenter.X / (RigidCount);
  fFlockCenter.Y := fFlockCenter.Y / (RigidCount);
  fFlockCenter.Z := fFlockCenter.Z / (RigidCount);

  case fFlightPattern of
    cFlockEclipse:
    begin
      fFlockCenter.X := fFlockCenter.X + 25*sin(fFlockAngle) + 2;
      fFlockCenter.Y := fFlockCenter.Y - 5*cos(fFlockAngle);
      fFlockCenter.Z := fFlockCenter.Z;
    end;
    cFlockEclipseReverse:
    begin
      fFlockCenter.X := fFlockCenter.X + 25*cos(fFlockAngle) - 2;
      fFlockCenter.Y := fFlockCenter.Y - 5*sin(fFlockAngle);
      fFlockCenter.Z := fFlockCenter.Z;
    end;
    cFlockRight:
      fFlockCenter.X := fFlockCenter.X + 2;
    cFlockLeft:
      fFlockCenter.X := fFlockCenter.X - 2;
  end;

  // calculate the average velocity
  if FlockingCount > 0 then
  begin
    fFlockVelocity.X := fFlockVelocity.X / (FlockingCount*80);
    fFlockVelocity.Y := fFlockVelocity.Y / (FlockingCount*80);
    fFlockVelocity.Z := fFlockVelocity.Z / (FlockingCount*80);
  end;
end;

// ----------------------------------------------------------------------------
// assumes in a flock avoid any nearby birds
// ----------------------------------------------------------------------------
function TaiBird.FlockAvoidance: TAffineVector;
var
  myBird: TaiBird;
  i: integer;
  myFlock: TaiFlock;
begin
  myFlock := TaiFlock(Flock.Target);
  result.X := 0;
  result.Y := 0;
  result.Z := 0;
  for i := 0 to myFlock.Members.Count - 1 do
  begin
    myBird := TaiBird(myFlock.Members.Items[i]);
    if (myBird <> self) then
    begin
      if Position.DistancePlusHeightTo(myBird.Position) < 2 then
//      if Position.SimpleDistanceTo(myBird.Position) < 2 then
      begin
        result.X := result.X + (Position.X - myBird.Position.X)/50;
        result.Y := result.Y + (Position.Y - myBird.Position.Y)/50;
        result.Z := result.Z + (Position.Height - myBird.Position.Height)/50;
      end;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.FlyWithFlock;
var
  myFlock: TaiFlock;
  myCenter: TAffineVector;
begin
  // in a flock?
  if Flock.ValidTarget then
  begin
    myFlock := TaiFlock(Flock.Target);
    // Boids
    // http://www.vergenet.net/~conrad/boids/pseudocode.html
    // Rule 1: Boids try to fly towards the centre of mass of neighbouring boids.
    myCenter.X := (myFlock.FlockCenter.X - Position.X) / 100;
    myCenter.Y := (myFlock.FlockCenter.Y - Position.Y) / 100;
    myCenter.Z := (myFlock.FlockCenter.Z - Position.Height) / 100;
    Position.Velocity.ApplyForce(myCenter);
    // Rule 2: Boids try to keep a small distance away from other objects (including other boids).
    Position.Velocity.ApplyForce(FlockAvoidance);
    // Rule 3: Boids try to match velocity with near boids.
    Position.Velocity.ApplyForce(myFlock.FlockVelocity);
    // Limiting the speed
    Position.Velocity.LimitSpeed(0.4);
    // Face direction of flight
    Position.FaceVelocity;
  end
  else // not in a flock
    JoinFlock;
  Flying := (Position.Binding = bindAtmosphere);
  if Position.HeightAbove < 10 then
  begin
    if Position.Velocity.DeltaHeight < 0 then
      Position.Velocity.DeltaHeight := 0;
    FlapWings;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.FindFruit;
var
  myThing: TaiThing;
begin
    // has food in sight
    if Eyes.ValidTarget then
    begin
      myThing := Eyes.Target;
      // turn towards food
      Position.FaceTarget(myThing.Position);
      // fly towards food if far away
      Flying := (Position.DistanceTo(myThing.Position) > 5);
      // if close to food, then pick it up
      if CloseEnoughToGrab(myThing) then
//      if (Position.DistancePlusHeightTo(myThing.Position) < 1.5) then
      begin
        if (Random(16) = 0) then
          Noise(cNoiseBirdHappy, 1);
        // put food in beak
        Grab(myThing);
        Flying := true;
      end;
      // something else has it
      if myThing.Position.Carried then
      begin
        Eyes.InvalidateTarget;
        // find a fruit
        if Random(16) <> 1 then
          Eyes.AssignTarget(gThings.Fruits.NearestAvailableThing(Position))
        else
        // or maybe get a fish
          Eyes.AssignTarget(gThings.Prey.NearestAvailableThing(Position));
      end;
    end
    else // find something to eat
    begin
      Flying := true;
      // make hungry noise
      if (Health < 512) and ((Health mod 128) = 0) then
        Noise(cNoiseBirdHungry, 1);
      // find a fruit
      if Random(16) <> 1 then
        Eyes.AssignTarget(gThings.Fruits.NearestAvailableThing(Position))
      else
      // or maybe get a fish
        Eyes.AssignTarget(gThings.Prey.NearestAvailableThing(Position));
    end;
  // move
  if Flying then
  begin
    if Position.Binding = bindLand then
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.4;
    if (Position.Binding = bindAtmosphere) and (Position.HeightAbove < 10) then
      FlapWings;
    Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.05);
    if Position.Velocity.Length > 0.2 then
      Position.Velocity.Shrink(0.05);
  end
  else // not flying
  begin
    if (Position.Binding = bindLand) and (Age mod 2 = 0) then
      if Random(3) = 0 then
        Hop else Walk;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.JoinFlock;
var
  myFlock: TaiFlock;
begin
  // if there are no flocks, create one
  if (gThings.Counters[cFlock] = 0) then
    gThings.NewThing(cFlock);
  // find a vacant flock
  with gThings.Tables[cFlock] do
  begin
    First;
    repeat
      myFlock := ActiveItem;
    until myFlock.Vacancy or not Next;
  end;
  // if the last flock is full, try to create a new one
  if myFlock.Full then
    if gThings.CanAdd(cFlock) then
      myFlock := TaiFlock(gThings.NewThing(cFlock));
  // if the flock has a vacancy, then join it
  if myFlock.Vacancy then
  begin
    // add self to flock member list
    if myFlock.AddMember(self) then
      Flock.AssignTarget(myFlock);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.LeaveFlock;
begin
  if Flock.ValidTarget then
  begin
    TaiFlock(Flock.Target).RemoveMember(self);
    Flock.InvalidateTarget;
  end;
end;

// ----------------------------------------------------------------------------
// set eyes to look at a potential mate
procedure TaiBird.FindMate;
var
  myFlock: TaiFlock;
  index: integer;
begin
  // in a flock?
  if Flock.ValidTarget then
    myFlock := TaiFlock(Flock.Target)
  else
    exit;
  // if the flock is full, dont reproduce
  if myFlock.Full then
    exit;
  // find a bird
  index := Random(myFlock.Members.Count);
  Eyes.AssignTarget(TaiBird(myFlock.Members[index]));
  // check to see if looking at a bird or not, just in case
  if not (Eyes.TargetKind = cBird) then
  begin
    Eyes.InvalidateTarget;
    exit;
  end;
  // check to see if its a valid mate
  if not ValidMate(TaiBird(Eyes.Target)) then
    Eyes.InvalidateTarget;
end;

// ----------------------------------------------------------------------------
// find, chase, and sex up another bird
procedure TaiBird.MatingBehaviour;
var
  myMate: TaiBird;
begin
  Flying := true;
  // chase mate
  if Eyes.ValidTarget and (Eyes.Target.Kind = cBird) then
  begin
      myMate := TaiBird(Eyes.Target);
      // turn towards mate
      Position.TurnTowardsTarget(myMate.Position, ca45);
      // fly towards mate
      Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.05);
      if Position.Height < myMate.Position.Height then
        FlapWings;
      if Position.Velocity.Length > 0.2 then
        Position.Velocity.Shrink(0.05);
      // if close to mate, then pick it up
      if (Position.DistancePlusHeightTo(myMate.Position) < 1) then
      begin
        if (Random(16) = 0) then
          Noise(cNoiseBirdHappy, 1);
        // grab mate, if still a valid mate
        if ValidMate(myMate) then
          Grab(myMate);
      end;
      // check to see if valid mate
      if not ValidMate(myMate) then
        Eyes.InvalidateTarget;
  end
  else // find a mate
  begin
    FlyWithFlock;
    FindMate;
  end;
end;

// ----------------------------------------------------------------------------
// have a kid
procedure TaiBird.CreateBaby;
var
  myBaby: TaiBird;
  myFlock: TaiFlock;
begin
  if not Flock.ValidTarget then exit;
  myFlock := TaiFlock(Flock.Target);
  if not Grabber.Holding then exit;
  if not (Grabber.Target is TaiBird) then exit;
  if not gThings.CanAdd(cBird) then exit;
  if not myFlock.Vacancy then exit;
  if not gThings.CanAdd(cBird) then exit;

  fMatingTimer := gReality.Time + 1024;

  myBaby := TaiBird(gThings.NewThing(cBird));
  myBaby.Position.FullCopy(Position);
  myBaby.Position.Height := Position.Height - 1;
  myBaby.Flock.AssignTarget(myFlock);
  myBaby.Health := 512;
  Health := Health - 512;
  myFlock.AddMember(myBaby);
end;

// ----------------------------------------------------------------------------
// is this bird a valid mate?  ;)
function TaiBird.ValidMate(aMate: TaiBird): boolean;
begin
  result := false;
  // is it a bird?
  if not (aMate is TaiBird) then exit;
  // is the bird myself?
  if (aMate = self) then exit;
  // is the bird mature?
  if not aMate.Mature then exit;
  // opposite sex?
  if Gender = aMate.Gender then exit;
  // is the bird healthy?
  if aMate.Health < 1500 then exit;
  // is the bird being carried?
  if aMate.Position.Carried then exit;
  // is the bird holding another bird? note: causes a bug!
  //  if aMate.Grabber.Holding and (aMate.Grabber.Target is TaiBird) then exit;
  result := true;
end;

// ----------------------------------------------------------------------------
// is it time to mate?
function TaiBird.InMatingCondition: boolean;
begin
  result := false;
  // healthy?
//  if Health < 2000 then exit;
  // mature?
  if not Mature then exit;
  // rested from last mate?
  if gReality.Time < MatingTimer then exit;

  result := true;
end;

// ----------------------------------------------------------------------------
procedure TaiBird.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('Flock: ' + Flock.OneLineDisplayRight);
  aList.Add('Flying: ' + BoolToYesNoStr(fFlying));
  aList.Add('Mature: ' + BoolToYesNoStr(fMature));
  aList.Add('Gender: ' + BoolToYesNoStr(fGender));
  aList.Add('MatingTimer: ' + IntToStr(fMatingTimer));
end;

// ----------------------------------------------------------------------------
procedure TaiBird.ReaffirmFlock;
var
  myFlock: TaiFlock;
begin
  if Flock.ValidTarget then
  begin
    myFlock := TaiFlock(Flock.Target);
    myFlock.AddMember(self);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiFlock.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);
  aList.Add('FlightPattern: ' + IntToStr(fFlightPattern));
  aList.Add('FlockCenter: ' + VectorToString(fFlockCenter));
  aList.Add('FlockVelocity: ' + VectorToString(fFlockVelocity));
  aList.Add(Format('FlockAngle: %0.2f', [fFlockAngle]));
end;

// ------------------------- TaiDuck ------------------------------------------
constructor TaiDuck.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cDuck;

  Size := 1;
  Position.SetSize(1, 0.75, 0.75, true);
  Position.SetProperties(5, 0.1, 4.5);
  Position.Collider := true;

  Health := 4000;
  Desire := cDesireWander;
end;

// ----------------------------------------------------------------------------
destructor TaiDuck.Destroy;
begin
  //
  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiDuck.Fuel;
begin
  inherited Fuel;
  if (Size < 1) and (Health > 1536) then
  begin
    Size := Size + 0.0002; // 5000 ticks to reach 1
    Position.SetSize(Size, Size, Size);
  end;
  Desire := cDesireNone;
  if (Health < 3000) and not Grabber.Holding then
    Desire := cDesireFood
  else
  begin
    case Sexstage of
      cCreatureBaby:  desire := cDesireWander;
      cCreatureAdult: desire := cDesireMate;
      cCreatureElder: desire := cDesireWander;
    end;
  end;

  // find food           yeah i need a new duck quack
  case Desire of
    cDesireFood:
    begin
      case Sexstage of
        cCreatureBaby:  Forage(0.12);
        cCreatureAdult: ForageFruitAndPrey(0.11);
        cCreatureElder: Forage(0.1);
      end;

      if Bump then AvoidNeighbour;
    end;
    cDesireWander: FloatWithCommunity;
    cDesireMate:
    begin
      if Random(512)=0 then
        Noise(cNoiseQuack, 1);
      MatingBehaviour;
      FloatWithCommunity;
    end;
  end;

  if Grabber.Holding then
    if Eat(16) then Noise(cNoiseEat, 1);
end;

// ----------------------------------------------------------------------------
procedure TaiDuck.FloatWithCommunity;
var
  myCommunity: TaiCommunity;
  myForce: TAffineVector;
begin
  // if not Position.UnderWater then exit;
  // in a Community?
  if Community.ValidTarget then
  begin
    myCommunity := TaiCommunity(Community.Target);
    // Boids
    // http://www.vergenet.net/~conrad/boids/pseudocode.html
    // Rule 1: Boids try to fly towards the centre of mass of neighbouring boids.
    myForce.X := (myCommunity.Center.X - Position.X) / 400;
    myForce.Y := (myCommunity.Center.Y - Position.Y) / 400;
    myForce.Z := 0;
    // Rule 2: Boids try to keep a small distance away from other objects (including other boids).
{   if Bump then
    begin
      myForce[0] := myForce[0] + Avoidance[0];
      myForce[1] := myForce[1] + Avoidance[1];
    end;}
    // Rule 3: Boids try to match velocity with near boids.
    myForce.X := myForce.X + myCommunity.Velocity.X;
    myForce.Y := myForce.Y + myCommunity.Velocity.Y;
    myForce.Z := myForce.Z + myCommunity.Velocity.Z;
    // Limiting the speed
    LimitVector(myForce, 0.1);
    // Face direction of velocity
    Position.TurnTowardsVector(myForce, ca15);
    // move
    Position.Acceleration.ApplyAngularForce(Position.DirectionXY, VectorLength(myForce));
    // make sure not to surface from underwater
    if Position.Height < (Position.Water -1) then
      Position.Acceleration.DeltaHeight := Position.Acceleration.DeltaHeight + 0.2;
  end
  else // not in a Community
    JoinCommunity;
end;

// ----------------------------------------------------------------------------
procedure TaiDuck.Float;
begin
  Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.05);
  Position.Velocity.LimitSpeed(0.1);
end;

// ----------------------------------------------------------------------------
procedure TaiDuck.DevelopIntoBaby;
begin
  Size := 0.3;
  Position.SetSize(Size, Size, Size/2);
  Noise(cNoiseDuckling, 1);
end;

// --------------------------  TaiHawk  --------------------------------------
constructor TaiHawk.Create(aParent: pointer);
begin
  inherited Create(aParent);
  Kind := cHawk;
  Position.SetPosition(Random * 10.0, Random * -10.0, 5);
  Position.SetSize(1, 0.75, 0.4, true);
  Health := 5500 + Random(500);
  Flying := true;
end;

// ----------------------------------------------------------------------------
destructor TaiHawk.Destroy;
begin
  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure TaiHawk.Fuel;
var
  myBird: TaiBird;
begin
  inherited Fuel;
  // determine desire
  desire := cHawkDesireNone;
  if Health < 5120 then
    desire := cHawkDesireFood
  else
    desire := cHawkDesireWander;
  // find goal to enact that desire
  if desire = cHawkDesireWander then
  begin
    if Flying then
    begin
      if (Position.Velocity.DeltaHeight <= -0.2) then
        Position.Acceleration.ApplyForce(0, 0, 0.05);
      if (Position.Height < 40) then
        Position.Acceleration.ApplyForce(0, 0, 0.04);
      if Position.Velocity.XYStrength < 0.2 then
        Position.Acceleration.ApplyAngularForce(Pi, 0.05);
    end
    else
      if (Age mod 32) = 0 then
        Hop;
    Position.FaceVelocity;
  end;

  if (desire = cHawkDesireFood) and not Grabber.Holding then
  begin
    if not Eyes.ValidTarget then
    begin
      myBird := gEnvironment.Things.Tables[cBird].RandomThing;
      if not (myBird = nil) then
      begin
        Eyes.AssignTarget(myBird);
        Noise(cNoiseHawk, 1);
      end;
    end;

    // chase bird
    if Eyes.ValidTarget then
    begin
      myBird := TaiBird(Eyes.Target);
      Position.TurnTowardsTarget(myBird.Position, ca75);
      Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.1);
      if (myBird.Position.Height > Position.Height) or (Position.Velocity.DeltaHeight < -0.5) then
        FlapWings;
      if Position.DistancePlusHeightTo(myBird.Position) < 2.0 then
      begin
        if myBird.Position.Carried then
          Bonk
        else
          Grab(myBird);
      end;
    end;
  end;

  Position.Velocity.LimitSpeed(0.8);

  if Grabber.Holding then
  begin
    if Eat(8) then Noise(cNoiseEat, 1);
    if (Position.Height < 15) then
      FlapWings;
    if Position.Velocity.XYStrength < 0.2 then
      Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0, 0.05);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiHawk.Hop;
begin
  if Position.Binding = bindLand then
    Position.Acceleration.ApplyForce(0, 0, 0.2);
end;

// ----------------------------------------------------------------------------
procedure TaiHawk.FlapWings;
begin
//  if Position.Velocity.DeltaHeight < 0.5 then
    Position.Acceleration.ApplyForce(0, 0, 0.03);
end;

// ----------------------------------------------------------------------------
procedure TaiHawk.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeFileBoolean(aFile, fFlying);
end;

// ----------------------------------------------------------------------------
procedure TaiHawk.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  fFlying := readFileBoolean(aFile);
end;

// ----------------------------------------------------------------------------
function TaiHawk.IsPredator: boolean;
begin
  result := true;
end;


end.

