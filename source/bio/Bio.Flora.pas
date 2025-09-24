unit Bio.Flora;
(*
  Trees: apple, orange etc
*)
interface

uses
  System.Classes,
  System.SysUtils,
  Bio.BaseObject,
  Bio.Space,
  Bio.Things,
  Bio.Life;

const
  cTreeSapling = 0;
  cTreeFlowering = 64;
  cTreeTeenager = 128;
  cTreeAdult = 256;
  cTreeDeath = 2560;

  cFruitDeath = 256;
  cSeedSprout = 256+128;

type

//----------------------------------------------------------------------------
TaiPlant = class(TaiLivingThing)
public
  function IsPlant: boolean; override;
end;

//----------------------------------------------------------------------------
TaiTree = class(TaiPlant)
private
  fFruitTimer: integer;
  procedure BearFruit;
public
  constructor Create(aParent: pointer);
  property FruitTimer: integer read fFruitTimer write fFruitTimer;
  procedure Fuel; override;
  procedure Cease; override;
  procedure Perform(aActivity: integer); override;
  function Digest(const aAmount: integer): integer; override;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

//----------------------------------------------------------------------------
TaiFruit = class(TaiPlant)
private
  fCarryingSeed: boolean;
  procedure DropSeed;
public
  property CarryingSeed: boolean read fCarryingSeed write fCarryingSeed;
  procedure Fuel; override;
  procedure Cease; override;
  function IsFruit: boolean; override;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

//----------------------------------------------------------------------------
TaiSeed = class(TaiPlant)
private
  procedure Sprout;
public
  function Digest(const aAmount: integer): integer; override;
  procedure Fuel; override;
  procedure Cease; override;
end;

//----------------------------------------------------------------------------
TaiAquaPlant = class(TaiPlant)
private
  fFruitTimer: integer;
  procedure BearFruit;
public
  constructor Create(aParent: pointer);
  property FruitTimer: integer read fFruitTimer write fFruitTimer;
  function Digest(const aAmount: integer): integer; override;
  procedure Fuel; override;
  procedure Perform(aActivity: integer); override;
  procedure FullDisplay(aList: TStrings); override;
  procedure SaveToFile(var aFile: TextFile); override;
  procedure LoadFromFile(var aFile: TextFile); override;
end;

//----------------------------------------------------------------------------
TaiGrass = class(TaiPlant)
private
public
  constructor Create(aParent: pointer);
  procedure Fuel; override;
  procedure Grow;
  function IsFruit: boolean; override;
end;


implementation //==============================================================

uses
  Bio.Reality,
  Bio.Environment,
  Bio.Grid,
  Bio.Utilities,
  Bio.Vibes,
  Bio.Globals,
  Bio.Position;

// ----------------------------------------------------------------------------
constructor TaiTree.Create(aParent: pointer);
begin
  inherited Create(aParent);

  fFruitTimer := cTreeAdult;
  Water := Random*1;
  Health := 64;
  Position.DirectionXY := Random*TwoPi;
  Position.Collider := false;
end;

// ----------------------------------------------------------------------------
procedure TaiTree.Fuel;
begin
  inherited Fuel;

// turn towards wind
//  if AIGrid(Position.Location).Windy then Position.TurnTowardsVector(AIGrid(Position.Location).Wind, ca1);

// suck water from land
  if (Water < 1.5) and (TaiGrid(Position.Location).Water > 0.005)
      and not (Position.Underwater) and (Position.Binding = bindLand) then
  begin
    gSpace.QueueChange(Position.Location, cEventAddWater, -0.005);
    Water := Water + 0.005; // modify to be put into an event!!!
  end;

  // bear fruit
  if (Age > fFruitTimer) then//and (TaiGrid(Position.Location).Temperature > 5) then
  begin
    if (Water > 0.25) then
      BearFruit;
    fFruitTimer := Age + (Random(128)+64);
    gSpace.QueueChange(Position.Location, cEventAddHumidity, 0.2);
    Water := Water - 0.2;
  end;

  // die
  if (Age > cTreeDeath) or (Water <= 0) then
    Die;

  // increase health if all is good
  if (Position.Binding = bindLand) and not (Position.UnderWater) then
    Health := Health + 1;
end;

// ----------------------------------------------------------------------------
procedure TaiTree.BearFruit;
var
  myFruit: TaiFruit;
begin
  if Kind = cAppleTree then
    myFruit := TaiFruit(gThings.NewThing(cApple))
  else
    myFruit := TaiFruit(gThings.NewThing(cOrange));

  if Assigned(myFruit) then
  begin
    Noise(cNoisePop, 1);
    myFruit.CarryingSeed := true;
    myFruit.Position.CopyCoords(Position);
    myFruit.Position.Height := Position.Height + (7.5/2 * Water);
    myFruit.Position.Acceleration.SetAngularForce(Random * TwoPi, Random * HalfPi, 0.01 + Random * 0.25);
    myFruit.Health := Random(Age) + 256;
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiTree.Perform(aActivity: integer);
begin
  BearFruit;
end;

// ----------------------------------------------------------------------------
procedure TaiTree.Cease;
begin
  if Exists then
  begin
    if (Water > 0) then
      gSpace.QueueChange(Position.Location, cEventAddWater, Water);
    Noise(cNoiseForest, 1);
  end;

  inherited Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiFruit.Fuel;
begin
  inherited Fuel;

//  if Health < 1024 then Health := 1024; // this makes the fruit invincible

  if Health <= 0 then
    Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiFruit.Cease;
begin
  if CarryingSeed then
    DropSeed;

  inherited Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiFruit.DropSeed;
var
  mySeed: TaiSeed;
begin
  if Kind = cApple then
    mySeed := TaiSeed(gThings.NewThing(cAppleSeed))
  else //orange
    mySeed := TaiSeed(gThings.NewThing(cOrangeSeed));

  if Assigned(mySeed) then
  begin
    mySeed.Position.CopyCoords(Position);
    mySeed.Position.Velocity.CopyFrom(Position.Velocity);
    mySeed.Position.Acceleration.CopyFrom(Position.Acceleration);
  end;

  fCarryingSeed := false;
end;

// ----------------------------------------------------------------------------
procedure TaiSeed.Fuel;
begin
  inherited Fuel;

  if Age > cSeedSprout then
    Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiSeed.Cease;
begin
  if Exists then
  begin
    if (Position.Binding = bindLand) and not (Position.UnderWater) and (TaiGrid(Position.Location).Water >= 0.5) then
      Sprout;
  end;

  inherited Cease;
end;

// ----------------------------------------------------------------------------
procedure TaiSeed.Sprout;
var
  myTree: TaiTree;
//  myLocation: TaiGrid;
begin
  myTree := nil;

  Noise(cNoiseCricket, 1);

//  myLocation := Position.Location;
  // must be warm
//  if myLocation.Temperature < 2 then
//    exit;
  // must be on land
  if Position.Binding <> bindLand then
    exit;

    if Kind = cAppleSeed then
    begin
      if gThings.CanTreeGrowHere(Position) then
        myTree := TaiGrid(Position.Location).NewThing(cAppleTree);
    end;

    if Kind = cOrangeSeed then
    begin
      if gThings.CanTreeGrowHere(Position) then
        myTree := TaiGrid(Position.Location).NewThing(cOrangeTree);
    end;

    if Assigned(myTree) then
    begin
      myTree.Position.CopyCoords(Position);
      myTree.Water := 0.01;
    end;
end;

// ----------------------------------------------------------------------------
procedure TaiFruit.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeFileBoolean(aFile, fCarryingSeed);
end;

// ----------------------------------------------------------------------------
procedure TaiFruit.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  fCarryingSeed := readFileBoolean(aFile);
end;

// ----------------------------------------------------------------------------
function TaiFruit.IsFruit: boolean;
begin
  result := true;
end;

// ----------------------------------------------------------------------------
procedure TaiTree.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fFruitTimer);
end;

// ----------------------------------------------------------------------------
procedure TaiTree.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fFruitTimer);
end;

// ----------------------------------------------------------------------------
procedure TaiTree.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);
  aList.Add('FruitTimer: ' + IntToStr(fFruitTimer));
end;

// ----------------------------------------------------------------------------
procedure TaiFruit.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);

  aList.Add('CarryingSeed: ' + BoolToYesNoStr(fCarryingSeed));
end;

// ----------------------------------------------------------------------------
constructor TaiAquaPlant.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cAquaPlant;
  Health := 32;
  Position.Mass := 100;
  Position.DirectionXY := Random*TwoPi;
  fFruitTimer := gReality.Time + Random(256);
  Position.Collider := false;
  Position.DirectionH := 0;
end;

// ----------------------------------------------------------------------------
procedure TaiAquaPlant.Fuel;
begin
  inherited Fuel;

// face water direction
//  if TaiGrid(Position.Location).Wavy then Position.TurnTowardsVector(TaiGrid(Position.Location).Wave, ca1);

  if gReality.Time > fFruitTimer then
  begin
    BearFruit;
    fFruitTimer := gReality.Time + 256;
  end;

  // increase health if all is good
  if (Position.UnderWater) then
    Health := Health + 1;
end;

// ----------------------------------------------------------------------------
procedure TaiAquaPlant.BearFruit;
var
  myFruit: TaiFruit;
begin
  if Random(3) = 0 then
    myFruit := TaiFruit(gThings.NewThing(cApple))
  else
    myFruit := TaiFruit(gThings.NewThing(cOrange));

  if Assigned(myFruit) then
  begin
    Noise(cNoisePop, 1);
    myFruit.CarryingSeed := false;
    myFruit.Position.CopyCoords(Position);
    myFruit.Position.Height := Position.Height;
    myFruit.Position.Acceleration.SetAngularForce(Random * TwoPi, Random * HalfPi, 0.05 + Random * 0.25);
    myFruit.Health := 1024 + Random(1024);
  end;
end;

// ----------------------------------------------------------------------------
procedure TaiAquaPlant.Perform(aActivity: integer);
begin
  BearFruit;
end;

// ----------------------------------------------------------------------------
function TaiTree.Digest(const aAmount: integer): integer;
begin
  result := -1 * inherited Digest(aAmount);
end;

// ----------------------------------------------------------------------------
function TaiSeed.Digest(const aAmount: integer): integer;
begin
  inherited Digest(aAmount);
  result := 0;
end;

// ----------------------------------------------------------------------------
function TaiAquaPlant.Digest(const aAmount: integer): integer;
begin
  inherited Digest(aAmount);
  result := 0;
end;

// ----------------------------------------------------------------------------
procedure TaiAquaPlant.SaveToFile(var aFile: TextFile);
begin
  inherited SaveToFile(aFile);
  writeln(aFile, fFruitTimer);
end;

// ----------------------------------------------------------------------------
procedure TaiAquaPlant.LoadFromFile(var aFile: TextFile);
begin
  inherited LoadFromFile(aFile);
  readln(aFile, fFruitTimer);
end;

// ----------------------------------------------------------------------------
procedure TaiAquaPlant.FullDisplay(aList: TStrings);
begin
  inherited FullDisplay(aList);
  aList.Add('FruitTimer: ' + IntToStr(fFruitTimer));
end;

// ----------------------------------------------------------------------------
function TaiPlant.IsPlant: boolean;
begin
  result := true;
end;

// ----------------------------------------------------------------------------
constructor TaiGrass.Create(aParent: pointer);
begin
  inherited Create(aParent);

  Kind := cGrass;
  Health := 5024;
  Position.SetSize(1, 0.2, 0.2, true);
  Position.SetProperties(1, 0.1, 0.25);
  Position.Collider := false;

  Water := 0.05;
  Health := 64;
end;

// ----------------------------------------------------------------------------
procedure TaiGrass.Fuel;
begin
  inherited Fuel;

  if (Age mod 128 = 0) then
    Grow;

  if Water < 0.5 then
    Water := Water + 0.01;

  if (Position.Binding = bindLand) and not Position.UnderWater then
    Health := Health + 1;
end;

// ----------------------------------------------------------------------------
procedure TaiGrass.Grow;
var
  myGrass: TaiGrass;
begin
//  if gThings.Existents.HasKindWithinDistance(cGrass, Position, 1) then
//    exit;
  if not gThings.CanAdd(cGrass) then
    exit;

  myGrass := TaiGrass(gThings.NewThing(cGrass));
  myGrass.Position.FullCopy(Position);
  myGrass.Position.DirectionXY := Random * TwoPi;
  myGrass.Position.MoveBy(1);
  myGrass.Position.Height := 0;
end;

// ----------------------------------------------------------------------------
function TaiGrass.IsFruit: boolean;
begin
  result := true;
end;


end.

