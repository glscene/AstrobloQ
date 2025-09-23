unit Bio.Fox;
(*
 The fox
*)

interface

uses
  System.Classes,
  System.SysUtils,
  Bio.BaseObject,
  Bio.Things,
  Bio.Creature,
  Bio.Position,
  Bio.Life,
  Bio.Link,
  Bio.GeneticCreature;

type

// ============================================================================
// an individual Fox
AIFox = class(AIGeneticCreature)
protected
  procedure DevelopIntoBaby; override;
  procedure FindFood(aKind: integer; aSpeed: single);
  procedure Move;
public
  constructor Create(aParent: pointer);
  destructor Destroy; override;

  procedure Fuel; override;
  function IsPredator: boolean; override;
end;

implementation

uses
  Bio.Reality,
  Bio.Globals,
  Bio.Flora,
  Bio.Bird,
  Bio.Vibes,
  Bio.Utilities;

// ----------------------------------------------------------------------------
constructor AIFox.Create(aParent: pointer);
begin
  Kind := cFox;

  inherited Create(aParent);

  Size := 2;
  Position.SetSize(2, 2, 2, true);
  Position.SetProperties(10, 0.1, 0.25);

  Health := 512;
  Desire := cDesireWander;
end;

// ----------------------------------------------------------------------------
destructor AIFox.Destroy;
begin

  inherited Destroy;
end;

// ----------------------------------------------------------------------------
procedure AIFox.Fuel;
begin
  inherited Fuel;

  Health := Health - 4;

//  desire := cDesireNone;
  if (Health < 2048) and not Grabber.Holding then
    desire := cDesireFood
  else
    desire := cDesireMate;

  if Age > 3000 then Die;

  // eat
  if Grabber.Holding then
  begin
    Eat(64);
    if Grabber.Empty then
      Noise(cNoiseEat, 1);
  end;

  // find food
  case desire of
    cDesireFood:
    begin
      FindFood(DNA.PreferredFood, 0.1*Position.Mass);
    end;
    cDesireMate:
    begin
      MatingBehaviour;
      if Partner.ValidTarget then
        Move;
    end;
  end;
end;

// ----------------------------------------------------------------------------
function AIFox.IsPredator: boolean;
begin
  result := true;
end;

// ----------------------------------------------------------------------------
procedure AIFox.Move;
begin
  if Position.Velocity.XYStrength < 0.2 then
    Position.Acceleration.ApplyAngularForce(Position.DirectionXY, 0.05*Position.Mass);
end;

// ----------------------------------------------------------------------------
procedure AIFox.DevelopIntoBaby;
begin
  Size := 2;
  Position.SetSize(Size, Size, Size);
  Position.Buoyancy := DNA.Buoyancy;
  Position.Bounce := DNA.Bounce;
end;

// ----------------------------------------------------------------------------
// find and grab food
procedure AIFox.FindFood(aKind: integer; aSpeed: single);
var
  myThing: TaiThing;
begin
  if not Grabber.Holding then
  begin
    // check validity of sight
    if Eyes.ValidTarget then
    begin
      myThing := Eyes.Target;
      // see if another creature got it
      if myThing.Position.Carried then
        Eyes.InvalidateTarget;
    end;

    // an apple is in sight
    if Eyes.ValidTarget then
    begin
      myThing := Eyes.Target;
      // grab the apple
      if CloseEnoughToGrab(myThing) then
        Grab(myThing)
      else // go to it
      begin
        Position.TurnTowardsTarget(myThing.Position, ca30);
        if Position.Velocity.XYStrength < aSpeed then
          Position.Acceleration.ApplyAngularForce(Position.DirectionXY, aSpeed);
      end;
    end
    else // dont see an apple, try to find an apple
    begin
      Eyes.AssignTarget(gEnvironment.Things.Prey.NearestAvailableThing(Position));
//      if not Eyes.ValidTarget then
//        Eyes.AssignTarget(gEnvironment.Things.Fruits.NearestAvailableThing(Position));
    end;
  end;
end;

{
Dave (volunteer human guinea pig) says: hey dushan!
dusanc says: Hah I've got msn to work
Dave   says: sweet
dusanc says: Well it took me 2 weeks
Dave   says: how r u
dusanc says: If you want to use ICQ MSN etc. good client is trillian
Dave   says: yeah
dusanc says: I'm great
Dave   says: trillian keeps crashing my computer
dusanc says: Well I'll see how it does for me
Dave   says: im just making a IsPrey and IsPredator function for all creature
Dave   says: so
Dave   says: Fox would be true for Predator
Dave   says: Rabbit would be true for Prey
dusanc says: Thats great
dusanc says: How would you solve fight
Dave   says: whoever Grabs the first
dusanc says: Maybe there should be diiferent energy cost
dusanc says: eg. for a Trex and ant
Dave   says: true
dusanc says: And did you solve multiple attachments to one creature
Dave   says: no
Dave   says: well
Dave   says: i know how to do it... but im too lazy
dusanc says: true
dusanc says: ?
Dave   says: i was thinking
Dave   says: to make a "string" attachment
Dave   says: if the string gets too long, it breaks
Dave   says: when an object moves, the string "tenses" and drags the attached object
Dave   says: but it took me so long to make the attachments work, i'm too scared to change it
Dave   says: the DNA thing is going great, i am making Fox and Rabbit into genetic creature
dusanc says: well I'm still not satisfied with it
Dave   says: i want you to help, make them have energy etc
Dave   says: see... with the birds and fish and ducks... i dont want to change them
dusanc says: Just wanted to say that
Dave   says: but with fox and rabbits, they need lots of improvement
Dave   says: so you can go nuts and change them if you want
dusanc says: well thats why I was making you to
dusanc says: make dna code universal
dusanc says: so we wouldn't need
Dave   says: yeah, but
dusanc says: to recompile everything
Dave   says: then that gives me alot of work to do
Dave   says: i hate work
dusanc says: hah
dusanc says: I didn't understood you
dusanc says: wwait
dusanc says: could you explain to me
dusanc says: why there could'nt be
Dave   says: i want to keep Birds, Fish, Ducks the same.  then, the GeneticCreature would evolve to be better than them
dusanc says: an array?? of  values in some file
Dave   says: all the values in the file, must be hardcoded into the creature
dusanc says: ok you're the boss
dusanc says: but there's a catch
dusanc says: I would have to learn delphi/pascal from the beggining
Dave   says: true
Dave   says: you should learn, its fun
Dave   says: i learnt while i worked at a company.  but it took my only 1 month
dusanc says: yeh right but I have my exams
Dave   says: ah school
Dave   says: true
Dave   says: i am finished school, so i have free time
dusanc says: ah faculty of mechanical engineering
dusanc says: so I don't have time
Dave   says: thats ok
dusanc says: but i'll try
Dave   says: your ideas are very helpful
dusanc says: well if you'd see what we learn
Dave   says: for example your fox.ini and rabbit.ini, I'm using them
Dave   says: there are alot of limits to delphi
dusanc says: like?
Dave   says: your ideas make alot of sense, but i dont know if you realize the amount of work to do them
Dave   says: im just 1 guy
Dave   says: delphi doesnt have multiple inheritance
Dave   says: and it has no method to access object attributes arbitrarily
Dave   says: also... the LearningCreature is extremely slow, to look for the 5 nearest objects
Dave   says: i dont know how to solve that problem
Dave   says: i dont know how to make it faster
dusanc says: what slows it?
Dave   says: because when there are 1000 objects... it does a Square Root value on all of them
Dave   says: to find the distance
dusanc says: well you could avoid it a little
dusanc says: like this
dusanc says: just to look at the creatures in it's range of sight
dusanc says: but not to recalculate their distance right away
dusanc says: but to say
dusanc says: if range=10
dusanc says: look only at creatures with
Dave   says: hehe... but no matter what.. you have to check all 1000 objects
dusanc says: x-x1<10
Dave   says: because. there is no way to tell what object is what
dusanc says: y-y1<10
Dave   says: yeah
dusanc says: h-h1<10
dusanc says: so you would'nt have to recalculate sqr
Dave   says: that actually goes the same speed as sqrt, if you have a Floating point processor, the sqrt isnt expensive
dusanc says: OK
Dave   says: its not really the sqrt, just the fact that many objects are checked
dusanc says: what if you make something like
dusanc says: that each creature is in some area(those squares)
Dave   says: yes
Dave   says: that is a possible solution too
Dave   says: i tried that
Dave   says: i kept a list of everything in each square
dusanc says: i sense it went bad
Dave   says: but when many objects are moving fast about the squares... it is constantly updating whats in each square... it slows things down a bit
Dave   says: it works good when objects dont move
Dave   says: hmm
dusanc says: ?
Dave   says: just wondering if i should put that back in
dusanc says: well it shouldn't be too precise
Dave   says: but im afraid of adding stuff that will crash
Dave   says: because its so close to v1.0
Dave   says: i want to finish 1.0 at end of august
Dave   says: after that, i want to make major changes
dusanc says: like
Dave   says: oh i have so many dreams...
Dave   says: i want to make the planet true 3d
Dave   says: and use much better physics
Dave   says: collisions
Dave   says: rotation (ODE)
Dave   says: have buildable structures
Dave   says: make objects very "modifiable"
Dave   says: all the creatures have energy, DNA and senses
Dave   says: since i have been working on aiplanet for almost 1 year now, i want to make version 1.0
Dave   says: otherwise, i will go insane
dusanc says: ODE is great but how much do myou now about that? energy takes lot of calculations. I don't know
dusanc says: maybe you already are?
dusanc says:
Dave   says: i have tried using ODE for aiplanet.  but it is a problem for 1000 objects
Dave   says: also, buoyancy with ODE.. looks very real... but very expensive
Dave   says: but ODE has the BEST collision detection
Dave   says: and... ODE doesnt really let me stack cubes into structures
Dave   says: because i want AI "people" to build house out of blocks
Dave   says: have you tried GoalBot
dusanc says: well i really thought that we should make more robust creatures
dusanc says: well i looked  at it a litle
dusanc says: but i'm low on time
Dave   says: thats ok... in goalbot u can stack cubes to make a castle, then blow it up
Dave   says: we will make more robust creature
Dave   says: starting with fox and rabbit
Dave   says: see... it has to be proven with one or two creatures first
Dave   says: if they work, then we can apply the change to more
dusanc says: you type faster than i can reply
Dave   says: thats because i drank coffee
dusanc says: hey if you could open
dusanc says: fox.ini
Dave   says: ok
dusanc says: so  if you look well
dusanc says: if we implement half of that inside
dusanc says: it'll be great
Dave   says: yes
dusanc says: but i wanted to talk
Dave   says: i wont implement Desire at first... because the AI cannot quite handle that yet
dusanc says: to you about some
dusanc says: desire?
Dave   says: desiremate, desirewander etc
dusanc says: but how will creatures work, what will make them, God? (you)
Dave   says: yes
Dave   says: the ai code is too hard to write
Dave   says: i wish i could make it better
Dave   says: its hard to debug
Dave   says: but after we get the rest finish, desire is next
dusanc says: well i thought that desires shoul be in a way which one is the greatest that goes
Dave   says: maybe
Dave   says: DesireForMoreFood = x
Dave   says: where X is the health, if Health goes below X, it starts to look for food
dusanc says: no, you saw in my posts
dusanc says: something like
dusanc says: well mostly i want to get rid of god
dusanc says: in ai planet so
dusanc says: i don't want to put
dusanc says: some artificial boundaries
Dave   says: i know what you mean... but its hard
dusanc says: which would be that value below x
dusanc says: well let me explain
dusanc says: you see if we would have max health for a creature
dusanc says: desire toeat=1-health/maxhealth
dusanc says: so we would have something like desire toeat=0,654
Dave   says: so the desire with highest value, is the desire to do
dusanc says: YEAH
dusanc says: all the desires(well most) would be calculated
Dave   says: ok
dusanc says: other would be in dna or even better
Dave   says: ahh, so if desire to eat gets low, then desire to mate kicks in
dusanc says: in dna would be a factor HowMuchDoILikeToEat
Dave   says: so desireToEat = DNA.DesireToEat * (Health)/MaxHealth
dusanc says: so desireToEat = DNA.DesireToEat *[1- (Health)/MaxHealth]
Dave   says: ah ok
dusanc says: we would like >1%
}

end.

