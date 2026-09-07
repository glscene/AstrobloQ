(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit Galaxy.SpaceObjects;
(*
  Implementation of basic scene objects plus some management routines.
  The registered classes are:
    [TGLStar, TGLStars, TGLStellars]

  All objects declared in this unit are only simple objects
  and should be kept simple and lightweight.
  More complex or more specialized versions should be placed in dedicated
  units where they can grow and prosper untammed.
  "Generic" geometrical objects can be found in GeometryObjects unit.
*)
interface

{$I Stage.Defines.inc}

uses
  Winapi.OpenGL,
  Winapi.OpenGLext,
  System.Types,
  System.Classes,
  System.SysUtils,
  System.Math,

  Stage.OpenGLTokens,
  Stage.VectorGeometry,
  Stage.VectorTypes,
  Stage.Spline,
  Stage.PipelineTransform,
  Stage.PersistentClasses,
  Stage.OpenGLAdapter,
  Stage.BaseClasses,
  Stage.Coordinates,
  Stage.VectorLists,
  Stage.Silhouette,
  Stage.Color,

  GLS.Scene,
  GLS.Context,
  GLS.RenderContextInfo,
  GLS.Objects,
  GLS.Nodes,
  GLS.State;

const
  cDefaultPointSize: Single = 1.0;

type

  TSpectralClass = (scO, scB, scA, scF, scG, scK, scM);
  TPlanetState = (psNone, psLitoneta, psBioneta, psNooneta);

  TPlanetStyle = (psJupiter, psNeptune, psSuperTerra, psTerra, psMiniTerra);
  TPlanetStyles = set of TPlanetStyle;


  (* A rectangular area, perspective projected, but always facing the camera.
    A TGLSprite is perspective projected and as such is scaled with distance,
    if you want a 2D sprite that does not get scaled, see TGLHUDSprite. *)
  TGLSprite = class(TGLSceneObject)
  private
    FSpectralClass: TSpectralClass;
    FPlanetState: TPlanetState;
    FWidth: TGLFloat;
    FHeight: TGLFloat;
    FRotation: TGLFloat;
    FAlphaChannel: Single;
    FMirrorU, FMirrorV: Boolean;
  protected
    procedure SetWidth(const val: TGLFloat);
    procedure SetHeight(const val: TGLFloat);
    procedure SetRotation(const val: TGLFloat);
    procedure SetAlphaChannel(const val: Single);
    function StoreAlphaChannel: Boolean;
    procedure SetMirrorU(const val: Boolean);
    procedure SetMirrorV(const val: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;
    procedure BuildList(var rci: TGLRenderContextInfo); override;
    function AxisAlignedDimensionsUnscaled: TGSVector; override;
    procedure SetSize(const Width, Height: TGLFloat);
    // Set width and height to "size"
    procedure SetSquareSize(const Size: TGLFloat);
  published
    // Sprite Width in 3D world units.
    property Width: TGLFloat read FWidth write SetWidth;
    // Sprite Height in 3D world units.
    property Height: TGLFloat read FHeight write SetHeight;
    (* This the ON-SCREEN rotation of the sprite.
      Rotatation=0 is handled faster. *)
    property Rotation: TGLFloat read FRotation write SetRotation;
    // If different from 1, this value will replace that of Diffuse.Alpha
    property AlphaChannel: Single read FAlphaChannel write SetAlphaChannel
      stored StoreAlphaChannel;
    // Reverses the texture coordinates in the U and V direction to mirror the texture.
    property MirrorU: Boolean read FMirrorU write SetMirrorU default False;
    property MirrorV: Boolean read FMirrorV write SetMirrorV default False;
  end;

  TGLPointStyle = (psSquare, psRound, psSmooth, psSmoothAdditive,
    psSquareAdditive);

  (* Point parameters as in ARB_point_parameters.
    Make sure to read the ARB_point_parameters spec if you want to understand
    what each parameter does. *)
  TGLPointParameters = class(TGSUpdateAbleObject)
  private
    FEnabled: Boolean;
    FMinSize, FMaxSize: Single;
    FFadeTresholdSize: Single;
    FDistanceAttenuation: TGSCoordinates;
  protected
    procedure SetEnabled(const val: Boolean);
    procedure SetMinSize(const val: Single);
    procedure SetMaxSize(const val: Single);
    procedure SetFadeTresholdSize(const val: Single);
    procedure SetDistanceAttenuation(const val: TGSCoordinates);
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadData(Stream: TStream);
    procedure WriteData(Stream: TStream);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Apply;
    procedure UnApply;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property MinSize: Single read FMinSize write SetMinSize stored False;
    property MaxSize: Single read FMaxSize write SetMaxSize stored False;
    property FadeTresholdSize: Single read FFadeTresholdSize
      write SetFadeTresholdSize stored False;
    // Components XYZ are for constant, linear and quadratic attenuation.
    property DistanceAttenuation: TGSCoordinates read FDistanceAttenuation
      write SetDistanceAttenuation;
  end;

  (* Renders a set of non-transparent colored points.
    The points positions and their color are defined through the Positions
    and Colors properties *)
  TGLPoints = class(TGLImmaterialSceneObject)
  private
    FPositions: TGSAffineVectorList;
    FColors: TGSVectorList;
    FSize: Single;
    FStyle: TGLPointStyle;
    FPointParameters: TGLPointParameters;
    FStatic, FNoZWrite: Boolean;
  protected
    function StoreSize: Boolean; inline;
    procedure SetNoZWrite(const val: Boolean);
    procedure SetStatic(const val: Boolean);
    procedure SetSize(const val: Single);
    procedure SetPositions(const val: TGSAffineVectorList); inline;
    procedure SetColors(const val: TGSVectorList);
    procedure SetStyle(const val: TGLPointStyle);
    procedure SetPointParameters(const val: TGLPointParameters);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BuildList(var rci: TGLRenderContextInfo); override;
    // Points positions.  If empty, a single point is assumed at (0, 0, 0)
    property Positions: TGSAffineVectorList read FPositions write SetPositions;
    (* Defines the points colors:
      if empty, point color will be opaque white
      if contains a single color, all points will use that color
      if contains N colors, the first N points (at max) will be rendered
      using the corresponding colors *)
    property Colors: TGSVectorList read FColors write SetColors;
  published
    // If true points do not write their Z to the depth buffer.
    property NoZWrite: Boolean read FNoZWrite write SetNoZWrite;
    (* Tells the component if point coordinates are static.
      If static, changes to the positions should be notified via an
      explicit StructureChanged call, or may not refresh.
      Static sets of points may render faster than dynamic ones. *)
    property Static: Boolean read FStatic write SetStatic;
    // Point size, all points have a fixed size.
    property Size: Single read FSize write SetSize stored StoreSize;
    // Points style.
    property Style: TGLPointStyle read FStyle write SetStyle default psSquare;
    (* Point parameters as of ARB_point_parameters.
      Allows to vary the size and transparency of points depending
      on their distance to the observer. *)
    property PointParameters: TGLPointParameters read FPointParameters
      write SetPointParameters;
  end;

  // Possible aspects for the nodes of a TLine.
  TGLLineNodesAspect = (lnaInvisible, lnaAxes, lnaCube);
  // Available spline modes for a TLine.
  TGLLineSplineMode = (lsmLines, lsmCubicSpline, lsmBezierSpline, lsmNURBSCurve,
    lsmSegments, lsmLoop);
  // Specialized Node for use in a TGLLines objects. Adds a Color property (TGSColor) }

  TGLLinesNode = class(TGLNode)
  private
    FColor: TGSColor;
  protected
    procedure SetColor(const val: TGSColor);
    procedure OnColorChange(Sender: TObject);
    function StoreColor: Boolean;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    (* The node color.
      Can also defined the line color (interpolated between nodes) if
      loUseNodeColorForLines is set (in TGLLines). *)
    property Color: TGSColor read FColor write SetColor stored StoreColor;
  end;

  (* Specialized collection for Nodes in a TGLLines objects. Stores TGLLinesNode items *)
  TGLLinesNodes = class(TGLNodes)
  public
    constructor Create(AOwner: TComponent); overload;
    procedure NotifyChange; override;
  end;

  (* Base class for line objects. Introduces line style properties (width, color...) *)
  TGLLineBase = class(TGLImmaterialSceneObject)
  private
    FLineColor: TGSColor;
    FLinePattern: TGLushort;
    FLineWidth: Single;
    FAntiAliased: Boolean;
  protected
    procedure SetLineColor(const Value: TGSColor);
    procedure SetLinePattern(const Value: TGLushort);
    procedure SetLineWidth(const val: Single);
    function StoreLineWidth: Boolean; inline;
    procedure SetAntiAliased(const val: Boolean);
    (* Setup OpenGL states according to line style.
      You must call RestoreLineStyle after drawing your lines.
      You may use nested calls with SetupLineStyle/RestoreLineStyle *)
    procedure SetupLineStyle(var rci: TGLRenderContextInfo);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure NotifyChange(Sender: TObject); override;
  published
    (* Indicates if OpenGL should smooth line edges.
      Smoothed lines looks better but are poorly implemented in most OpenGL
      drivers and take *lots* of rendering time *)
    property AntiAliased: Boolean read FAntiAliased write SetAntiAliased
      default False;
    // Default color of the lines.
    property LineColor: TGSColor read FLineColor write SetLineColor;
    (* Bitwise line pattern.
      For instance $FFFF (65535) is a white line (stipple disabled), $0000
      is a black line, $CCCC is the stipple used in axes and dummycube, etc. *)
    property LinePattern: TGLushort read FLinePattern write SetLinePattern
      default $FFFF;
    // Default width of the lines.
    property LineWidth: Single read FLineWidth write SetLineWidth
      stored StoreLineWidth;
    property Visible;
  end;

  // Class that defines lines via a series of nodes. Base class, does not render anything
  TGLNodedLines = class(TGLLineBase)
  private
    FNodes: TGLLinesNodes;
    FNodesAspect: TGLLineNodesAspect;
    FNodeColor: TGSColor;
    FNodeSize: Single;
    FOldNodeColor: TGSColorVector;
  protected
    procedure SetNodesAspect(const Value: TGLLineNodesAspect);
    procedure SetNodeColor(const Value: TGSColor);
    procedure OnNodeColorChanged(Sender: TObject);
    procedure SetNodes(const aNodes: TGLLinesNodes);
    procedure SetNodeSize(const val: Single);
    function StoreNodeSize: Boolean;
    procedure DrawNode(var rci: TGLRenderContextInfo; X, Y, Z: Single;
      Color: TGSColor);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function AxisAlignedDimensionsUnscaled: TGSVector; override;
    procedure AddNode(const coords: TGSCoordinates); overload;
    procedure AddNode(const X, Y, Z: TGLFloat); overload;
    procedure AddNode(const Value: TGSVector); overload;
    procedure AddNode(const Value: TAffineVector); overload;
  published
    // Default color for nodes. lnaInvisible and lnaAxes ignore this setting
    property NodeColor: TGSColor read FNodeColor write SetNodeColor;
    // The nodes list.
    property Nodes: TGLLinesNodes read FNodes write SetNodes;
    (* Default aspect of line nodes.
      May help you materialize nodes, segments and control points. *)
    property NodesAspect: TGLLineNodesAspect read FNodesAspect
      write SetNodesAspect default lnaAxes;
    // Size for the various node aspects.
    property NodeSize: Single read FNodeSize write SetNodeSize
      stored StoreNodeSize;
  end;

  TGLLinesOption = (loUseNodeColorForLines, loColorLogicXor);
  TGLLinesOptions = set of TGLLinesOption;

  (* Set of 3D line segments.
    You define a 3D Line by adding its nodes in the "Nodes" property. The line
    may be rendered as a set of segment or as a curve (nodes then act as spline
    control points).
    Alternatively, you can also use it to render a set of spacial nodes (points
    in space), just make the lines transparent and the nodes visible by picking
    the node aspect that suits you. *)
  TGLLines = class(TGLNodedLines)
  private
    FDivision: Integer;
    FSplineMode: TGLLineSplineMode;
    FOptions: TGLLinesOptions;
    FNURBSOrder: Integer;
    FNURBSTolerance: Single;
    FNURBSKnots: TGSSingleList;
  protected
    procedure SetSplineMode(const val: TGLLineSplineMode);
    procedure SetDivision(const Value: Integer);
    procedure SetOptions(const val: TGLLinesOptions);
    procedure SetNURBSOrder(const val: Integer);
    procedure SetNURBSTolerance(const val: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BuildList(var rci: TGLRenderContextInfo); override;
    property NURBSKnots: TGSSingleList read FNURBSKnots;
    property NURBSOrder: Integer read FNURBSOrder write SetNURBSOrder;
    property NURBSTolerance: Single read FNURBSTolerance
      write SetNURBSTolerance;
  published
    (* Number of divisions for each segment in spline modes.
      Minimum 1 (disabled), ignored in lsmLines mode. *)
    property Division: Integer read FDivision write SetDivision default 10;
    // Default spline drawing mode.
    property SplineMode: TGLLineSplineMode read FSplineMode write SetSplineMode
      default lsmLines;
    (* Rendering options for the line.
      loUseNodeColorForLines: if set lines will be drawn using node
      colors (and color interpolation between nodes), if not, LineColor
      will be used (single color).
      loColorLogicXor: enable logic operation for color of XOR type. *)
    property Options: TGLLinesOptions read FOptions write SetOptions;
  end;

  TGLCubePart = (cpTop, cpBottom, cpFront, cpBack, cpLeft, cpRight);
  TGLCubeParts = set of TGLCubePart;

  (* A simple cube object.
    This cube use the same material for each of its faces, ie. all faces look
    the same. If you want a multi-material cube, use a mesh in conjunction
    with a TGLFreeForm and a material library.
    Ref: https://mathworld.wolfram.com/Cube.html *)
  TGLCube = class(TGLSceneObject)
  private
    FCubeSize: TAffineVector;
    FParts: TGLCubeParts;
    FNormalDirection: TGLNormalDirection;
    function GetCubeWHD(const Index: Integer): TGLFloat; inline;
    procedure SetCubeWHD(Index: Integer; aValue: TGLFloat); inline;
    procedure SetParts(aValue: TGLCubeParts); inline;
    procedure SetNormalDirection(aValue: TGLNormalDirection); inline;
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadData(Stream: TStream); inline;
    procedure WriteData(Stream: TStream); inline;
  public
    constructor Create(AOwner: TComponent); override;
    function GenerateSilhouette(const silhouetteParameters
      : TGSSilhouetteParameters): TGSSilhouette; override;
    procedure BuildList(var rci: TGLRenderContextInfo); override;
    procedure Assign(Source: TPersistent); override;
    function AxisAlignedDimensionsUnscaled: TGSVector; override;
    function RayCastIntersect(const rayStart, rayVector: TGSVector;
      intersectPoint: PGSVector = nil; intersectNormal: PGSVector = nil)
      : Boolean; override;
  published
    property CubeWidth: TGLFloat index 0 read GetCubeWHD write SetCubeWHD
      stored False;
    property CubeHeight: TGLFloat index 1 read GetCubeWHD write SetCubeWHD
      stored False;
    property CubeDepth: TGLFloat index 2 read GetCubeWHD write SetCubeWHD
      stored False;
    property NormalDirection: TGLNormalDirection read FNormalDirection
      write SetNormalDirection default ndOutside;
    property Parts: TGLCubeParts read FParts write SetParts
      default [cpTop, cpBottom, cpFront, cpBack, cpLeft, cpRight];
  end;

  (* Determines how and if normals are smoothed.
    - nsFlat : facetted look
    - nsSmooth : smooth look
    - nsNone : unlighted rendering, usefull for decla texturing *)
  TGLNormalSmoothing = (nsFlat, nsSmooth, nsNone);

  (* Base class for quadric objects.
    Introduces some basic Quadric interaction functions (the actual quadric
    math is part of the GLU library). *)
  TGLQuadricObject = class(TGLSceneObject)
  private
    FNormals: TGLNormalSmoothing;
    FNormalDirection: TGLNormalDirection;
  protected
    procedure SetNormals(aValue: TGLNormalSmoothing);
    procedure SetNormalDirection(aValue: TGLNormalDirection);
    procedure SetupQuadricParams(quadric: PGLUquadricObj);
    procedure SetNormalQuadricOrientation(quadric: PGLUquadricObj);
    procedure SetInvertedQuadricOrientation(quadric: PGLUquadricObj);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Normals: TGLNormalSmoothing read FNormals write SetNormals
      default nsSmooth;
    property NormalDirection: TGLNormalDirection read FNormalDirection
      write SetNormalDirection default ndOutside;
  end;

  TGLAngleLimit180 = -90 .. 90;
  TGLAngleLimit360 = 0 .. 360;
  TGLCapType = (ctNone, ctCenter, ctFlat);

  (*
    A star object inherited from sphere.
  *)
  TGLStar = class(TGLSphere)
  private
    FSlices, FStacks: TGLInt;
    FTop: TGLAngleLimit180;
    FBottom: TGLAngleLimit180;
    FStart: TGLAngleLimit360;
    FStop: TGLAngleLimit360;
    FTopCap, FBottomCap: TGLCapType;
    procedure SetBottom(aValue: TGLAngleLimit180);
    procedure SetBottomCap(aValue: TGLCapType);
    procedure SetRadius(const aValue: TGLFloat);
    procedure SetSlices(aValue: TGLInt);
    procedure SetStart(aValue: TGLAngleLimit360);
    procedure SetStop(aValue: TGLAngleLimit360);
    procedure SetStacks(aValue: TGLInt);
    procedure SetTop(aValue: TGLAngleLimit180);
    procedure SetTopCap(aValue: TGLCapType);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;
    procedure BuildList(var rci: TGLRenderContextInfo); override;
    function AxisAlignedDimensionsUnscaled: TGSVector; override;
    function RayCastIntersect(const rayStart, rayVector: TGSVector;
      intersectPoint: PGSVector = nil; intersectNormal: PGSVector = nil)
      : Boolean; override;
    function GenerateSilhouette(const silhouetteParameters
      : TGSSilhouetteParameters): TGSSilhouette; override;
  published
    property Bottom: TGLAngleLimit180 read FBottom write SetBottom default -90;
    property BottomCap: TGLCapType read FBottomCap write SetBottomCap
      default ctNone;
    property Slices: TGLInt read FSlices write SetSlices default 32;
    property Stacks: TGLInt read FStacks write SetStacks default 32;
    property Start: TGLAngleLimit360 read FStart write SetStart default 0;
    property Stop: TGLAngleLimit360 read FStop write SetStop default 360;
    property Top: TGLAngleLimit180 read FTop write SetTop default 90;
    property TopCap: TGLCapType read FTopCap write SetTopCap default ctNone;
  end;

  (* Base class for objects based on a polygon *)
  TGLPolygonBase = class(TGLSceneObject)
  private
    FDivision: Integer;
    FSplineMode: TGLLineSplineMode;
  protected
    FNodes: TGLNodes;
    procedure CreateNodes; dynamic;
    procedure SetSplineMode(const val: TGLLineSplineMode);
    procedure SetDivision(const Value: Integer);
    procedure SetNodes(const aNodes: TGLNodes);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure NotifyChange(Sender: TObject); override;
    procedure AddNode(const coords: TGSCoordinates); overload;
    procedure AddNode(const X, Y, Z: TGLFloat); overload;
    procedure AddNode(const Value: TGSVector); overload;
    procedure AddNode(const Value: TAffineVector); overload;
  published
    // The nodes list.
    property Nodes: TGLNodes read FNodes write SetNodes;
    (* Number of divisions for each segment in spline modes.
      Minimum 1 (disabled), ignored in lsmLines mode. *)
    property Division: Integer read FDivision write SetDivision default 10;
    (* Default spline drawing mode.
      This mode is used only for the curve, not for the rotation path. *)
    property SplineMode: TGLLineSplineMode read FSplineMode write SetSplineMode
      default lsmLines;
  end;

  (* A Superellipsoid object. The Superellipsoid can have top and bottom caps,
    as well as being just a slice of Superellipsoid.
    Ref: https://mathworld.wolfram.com/Superellipse.html  *)
  TGLSuperellipsoid = class(TGLQuadricObject)
  private
    FRadius, FVCurve, FHCurve: TGLFloat;
    FSlices, FStacks: TGLInt;
    FTop: TGLAngleLimit180;
    FBottom: TGLAngleLimit180;
    FStart: TGLAngleLimit360;
    FStop: TGLAngleLimit360;
    FTopCap, FBottomCap: TGLCapType;
    procedure SetBottom(aValue: TGLAngleLimit180);
    procedure SetBottomCap(aValue: TGLCapType);
    procedure SetRadius(const aValue: TGLFloat);
    procedure SetVCurve(const aValue: TGLFloat);
    procedure SetHCurve(const aValue: TGLFloat);
    procedure SetSlices(aValue: TGLInt);
    procedure SetStart(aValue: TGLAngleLimit360);
    procedure SetStop(aValue: TGLAngleLimit360);
    procedure SetStacks(aValue: TGLInt);
    procedure SetTop(aValue: TGLAngleLimit180);
    procedure SetTopCap(aValue: TGLCapType);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;
    procedure BuildList(var rci: TGLRenderContextInfo); override;
    function AxisAlignedDimensionsUnscaled: TGSVector; override;
    function RayCastIntersect(const rayStart, rayVector: TGSVector;
      intersectPoint: PGSVector = nil; intersectNormal: PGSVector = nil)
      : Boolean; override;
    function GenerateSilhouette(const silhouetteParameters
      : TGSSilhouetteParameters): TGSSilhouette; override;
  published
    property Bottom: TGLAngleLimit180 read FBottom write SetBottom default -90;
    property BottomCap: TGLCapType read FBottomCap write SetBottomCap
      default ctNone;
    property Radius: TGLFloat read FRadius write SetRadius;
    property VCurve: TGLFloat read FVCurve write SetVCurve;
    property HCurve: TGLFloat read FHCurve write SetHCurve;
    property Slices: TGLInt read FSlices write SetSlices default 32;
    property Stacks: TGLInt read FStacks write SetStacks default 32;
    property Start: TGLAngleLimit360 read FStart write SetStart default 0;
    property Stop: TGLAngleLimit360 read FStop write SetStop default 360;
    property Top: TGLAngleLimit180 read FTop write SetTop default 90;
    property TopCap: TGLCapType read FTopCap write SetTopCap default ctNone;
  end;

// Issues for a unit-size cube stippled wireframe
procedure CubeWireframeBuildList(var rci: TGLRenderContextInfo; Size: TGLFloat;
  Stipple: Boolean; const Color: TGSColorVector);

const
  TangentAttributeName: PAnsiChar = 'Tangent';
  BinormalAttributeName: PAnsiChar = 'Binormal';

implementation //============================================================

//---------------------------------------------------------------------------
procedure CubeWireframeBuildList(var rci: TGLRenderContextInfo; Size: TGLFloat;
  Stipple: Boolean; const Color: TGSColorVector);
var
  mi, ma: Single;
begin
{$IFDEF USE_OPENGL_DEBUG}
  if GL.GREMEDY_string_marker then
    gl.StringMarkerGREMEDY(22, 'CubeWireframeBuildList');
{$ENDIF}
  rci.GLStates.Disable(stLighting);
  rci.GLStates.Enable(stLineSmooth);
  if Stipple then
  begin
    rci.GLStates.Enable(stLineStipple);
    rci.GLStates.Enable(stBlend);
    rci.GLStates.SetBlendFunc(bfSrcAlpha, bfOneMinusSrcAlpha);
    rci.GLStates.LineStippleFactor := 1;
    rci.GLStates.LineStipplePattern := $CCCC;
  end;
  rci.GLStates.LineWidth := 1;
  ma := 0.5 * Size;
  mi := -ma;

  gl.Color4fv(@Color);
  gl.Begin_(GL_LINE_STRIP);
  // front face
  gl.Vertex3f(ma, mi, mi);
  gl.Vertex3f(ma, ma, mi);
  gl.Vertex3f(ma, ma, ma);
  gl.Vertex3f(ma, mi, ma);
  gl.Vertex3f(ma, mi, mi);
  // partial up back face
  gl.Vertex3f(mi, mi, mi);
  gl.Vertex3f(mi, mi, ma);
  gl.Vertex3f(mi, ma, ma);
  gl.Vertex3f(mi, ma, mi);
  // right side low
  gl.Vertex3f(ma, ma, mi);
  gl.End_;
  gl.Begin_(GL_LINES);
  // right high
  gl.Vertex3f(ma, ma, ma);
  gl.Vertex3f(mi, ma, ma);
  // back low
  gl.Vertex3f(mi, mi, mi);
  gl.Vertex3f(mi, ma, mi);
  // left high
  gl.Vertex3f(ma, mi, ma);
  gl.Vertex3f(mi, mi, ma);
  gl.End_;
end;



// ------------------
// ------------------ TGLSprite ------------------
// ------------------
constructor TGLSprite.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ObjectStyle := ObjectStyle + [osDirectDraw, osNoVisibilityCulling];
  FAlphaChannel := 1;
  FWidth := 1;
  FHeight := 1;
end;

//---------------------------------------------------------------------------
procedure TGLSprite.Assign(Source: TPersistent);
begin
  if Source is TGLSprite then
  begin
    FWidth := TGLSprite(Source).FWidth;
    FHeight := TGLSprite(Source).FHeight;
    FRotation := TGLSprite(Source).FRotation;
    FAlphaChannel := TGLSprite(Source).FAlphaChannel;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
function TGLSprite.AxisAlignedDimensionsUnscaled: TGSVector;
begin
  Result.X := 0.5 * Abs(FWidth);
  Result.Y := 0.5 * Abs(FHeight);
  // Sprites turn with the camera and can be considered to have the same depth
  // as width
  Result.Z := 0.5 * Abs(FWidth);
end;

//---------------------------------------------------------------------------
procedure TGLSprite.BuildList(var rci: TGLRenderContextInfo);
var
  vx, vy: TAffineVector;
  W, h: Single;
  mat: TGSMatrix;
  u0, v0, u1, v1: Integer;
begin
  if FAlphaChannel <> 1 then
    rci.GLStates.SetGLMaterialAlphaChannel(GL_FRONT, FAlphaChannel);

  mat := rci.PipelineTransformation.ModelViewMatrix^;
  // extraction of the direction vectors of the matrix
  W := FWidth * 0.5;
  h := FHeight * 0.5;
  vx.X := mat.v[0].X;
  vy.X := mat.v[0].Y;
  vx.Y := mat.v[1].X;
  vy.Y := mat.v[1].Y;
  vx.Z := mat.v[2].X;
  vy.Z := mat.v[2].Y;
  ScaleVector(vx, W / VectorLength(vx));
  ScaleVector(vy, h / VectorLength(vy));
  if FMirrorU then
  begin
    u0 := 1;
    u1 := 0;
  end
  else
  begin
    u0 := 0;
    u1 := 1;
  end;
  if FMirrorV then
  begin
    v0 := 1;
    v1 := 0;
  end
  else
  begin
    v0 := 0;
    v1 := 1;
  end;

  if FRotation <> 0 then
  begin
    gl.PushMatrix;
    gl.Rotatef(FRotation, mat.v[0].Z, mat.v[1].Z, mat.v[2].Z);
  end;
  gl.Begin_(GL_QUADS);
  xgl.TexCoord2f(u1, v1);
  gl.Vertex3f(vx.X + vy.X, vx.Y + vy.Y, vx.Z + vy.Z);
  xgl.TexCoord2f(u0, v1);
  gl.Vertex3f(-vx.X + vy.X, -vx.Y + vy.Y, -vx.Z + vy.Z);
  xgl.TexCoord2f(u0, v0);
  gl.Vertex3f(-vx.X - vy.X, -vx.Y - vy.Y, -vx.Z - vy.Z);
  xgl.TexCoord2f(u1, v0);
  gl.Vertex3f(vx.X - vy.X, vx.Y - vy.Y, vx.Z - vy.Z);
  gl.End_;
  if FRotation <> 0 then
    gl.PopMatrix;
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetWidth(const val: TGLFloat);
begin
  if FWidth <> val then
  begin
    FWidth := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetHeight(const val: TGLFloat);
begin
  if FHeight <> val then
  begin
    FHeight := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetRotation(const val: TGLFloat);
begin
  if FRotation <> val then
  begin
    FRotation := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetAlphaChannel(const val: Single);
begin
  if val <> FAlphaChannel then
  begin
    if val < 0 then
      FAlphaChannel := 0
    else if val > 1 then
      FAlphaChannel := 1
    else
      FAlphaChannel := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
function TGLSprite.StoreAlphaChannel: Boolean;
begin
  Result := (FAlphaChannel <> 1);
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetMirrorU(const val: Boolean);
begin
  FMirrorU := val;
  NotifyChange(Self);
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetMirrorV(const val: Boolean);
begin
  FMirrorV := val;
  NotifyChange(Self);
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetSize(const Width, Height: TGLFloat);
begin
  FWidth := Width;
  FHeight := Height;
  NotifyChange(Self);
end;

//---------------------------------------------------------------------------
procedure TGLSprite.SetSquareSize(const Size: TGLFloat);
begin
  FWidth := Size;
  FHeight := Size;
  NotifyChange(Self);
end;

// ------------------
// ------------------ TGLPointParameters ------------------
// ------------------
constructor TGLPointParameters.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FMinSize := 0;
  FMaxSize := 128;
  FFadeTresholdSize := 1;
  FDistanceAttenuation := TGSCoordinates.CreateInitialized(Self, XHmgVector,
    csVector);
end;

//---------------------------------------------------------------------------
destructor TGLPointParameters.Destroy;
begin
  FDistanceAttenuation.Free;
  inherited;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.Assign(Source: TPersistent);
begin
  if Source is TGLPointParameters then
  begin
    FMinSize := TGLPointParameters(Source).FMinSize;
    FMaxSize := TGLPointParameters(Source).FMaxSize;
    FFadeTresholdSize := TGLPointParameters(Source).FFadeTresholdSize;
    FDistanceAttenuation.Assign(TGLPointParameters(Source).DistanceAttenuation);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.DefineProperties(Filer: TFiler);
var
  defaultParams: Boolean;
begin
  inherited;
  defaultParams := (FMaxSize = 128) and (FMinSize = 0) and
    (FFadeTresholdSize = 1);
  Filer.DefineBinaryProperty('PointParams', ReadData, WriteData,
    not defaultParams);
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.ReadData(Stream: TStream);
begin
  with Stream do
  begin
    Read(FMinSize, SizeOf(Single));
    Read(FMaxSize, SizeOf(Single));
    Read(FFadeTresholdSize, SizeOf(Single));
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.WriteData(Stream: TStream);
begin
  with Stream do
  begin
    Write(FMinSize, SizeOf(Single));
    Write(FMaxSize, SizeOf(Single));
    Write(FFadeTresholdSize, SizeOf(Single));
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.Apply;
begin
  if Enabled and GL.ARB_point_parameters then
  begin
    gl.PointParameterf(GL_POINT_SIZE_MIN_ARB, FMinSize);
    gl.PointParameterf(GL_POINT_SIZE_MAX_ARB, FMaxSize);
    gl.PointParameterf(GL_POINT_FADE_THRESHOLD_SIZE_ARB, FFadeTresholdSize);
    gl.PointParameterfv(GL_DISTANCE_ATTENUATION_EXT,
      FDistanceAttenuation.AsAddress);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.UnApply;
begin
  if Enabled and GL.ARB_point_parameters then
  begin
    gl.PointParameterf(GL_POINT_SIZE_MIN_ARB, 0);
    gl.PointParameterf(GL_POINT_SIZE_MAX_ARB, 128);
    gl.PointParameterf(GL_POINT_FADE_THRESHOLD_SIZE_ARB, 1);
    gl.PointParameterfv(GL_DISTANCE_ATTENUATION_EXT, @XVector);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.SetEnabled(const val: Boolean);
begin
  if val <> FEnabled then
  begin
    FEnabled := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.SetMinSize(const val: Single);
begin
  if val <> FMinSize then
  begin
    if val < 0 then
      FMinSize := 0
    else
      FMinSize := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.SetMaxSize(const val: Single);
begin
  if val <> FMaxSize then
  begin
    if val < 0 then
      FMaxSize := 0
    else
      FMaxSize := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.SetFadeTresholdSize(const val: Single);
begin
  if val <> FFadeTresholdSize then
  begin
    if val < 0 then
      FFadeTresholdSize := 0
    else
      FFadeTresholdSize := val;
    NotifyChange(Self);
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPointParameters.SetDistanceAttenuation(const val: TGSCoordinates);
begin
  FDistanceAttenuation.Assign(val);
end;

// ------------------
// ------------------ TGLPoints ------------------
// ------------------
constructor TGLPoints.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ObjectStyle := ObjectStyle + [osDirectDraw, osNoVisibilityCulling];
  FStyle := psSquare;
  FSize := cDefaultPointSize;
  FPositions := TGSAffineVectorList.Create;
  FPositions.Add(NullVector);
  FColors := TGSVectorList.Create;
  FPointParameters := TGLPointParameters.Create(Self);
end;

//---------------------------------------------------------------------------
destructor TGLPoints.Destroy;
begin
  FPointParameters.Free;
  FColors.Free;
  FPositions.Free;
  inherited;
end;

//---------------------------------------------------------------------------
procedure TGLPoints.Assign(Source: TPersistent);
begin
  if Source is TGLPoints then
  begin
    FSize := TGLPoints(Source).FSize;
    FStyle := TGLPoints(Source).FStyle;
    FPositions.Assign(TGLPoints(Source).FPositions);
    FColors.Assign(TGLPoints(Source).FColors);
    StructureChanged
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
procedure TGLPoints.BuildList(var rci: TGLRenderContextInfo);
var
  n: Integer;
  v: TGSVector;
begin
  n := FPositions.Count;
  if n = 0 then
    Exit;

  case FColors.Count of
    0:
      gl.Color4f(1, 1, 1, 1);
    1:
      gl.Color4fv(PGLFloat(FColors.List));
  else
    if FColors.Count < n then
      n := FColors.Count;
    gl.ColorPointer(4, GL_FLOAT, 0, FColors.List);
    gl.EnableClientState(GL_COLOR_ARRAY);
  end;
  if FColors.Count < 2 then
    gl.DisableClientState(GL_COLOR_ARRAY);
  rci.GLStates.Disable(stLighting);
  if n = 0 then
  begin
    v := NullHmgPoint;
    gl.VertexPointer(3, GL_FLOAT, 0, @v);
    n := 1;
  end
  else
    gl.VertexPointer(3, GL_FLOAT, 0, FPositions.List);
  gl.EnableClientState(GL_VERTEX_ARRAY);

  if NoZWrite then
    rci.GLStates.DepthWriteMask := False;
  rci.GLStates.PointSize := FSize;
  PointParameters.Apply;
  if GL.EXT_compiled_vertex_array and (n > 64) then
    gl.LockArrays(0, n);
  case FStyle of
    psSquare:
      begin
        // square point (simplest method, fastest)
        rci.GLStates.Disable(stBlend);
      end;
    psRound:
      begin
        rci.GLStates.Enable(stPointSmooth);
        rci.GLStates.Enable(stAlphaTest);
        rci.GLStates.SetGLAlphaFunction(cfGreater, 0.5);
        rci.GLStates.Disable(stBlend);
      end;
    psSmooth:
      begin
        rci.GLStates.Enable(stPointSmooth);
        rci.GLStates.Enable(stAlphaTest);
        rci.GLStates.SetGLAlphaFunction(cfNotEqual, 0.0);
        rci.GLStates.Enable(stBlend);
        rci.GLStates.SetBlendFunc(bfSrcAlpha, bfOneMinusSrcAlpha);
      end;
    psSmoothAdditive:
      begin
        rci.GLStates.Enable(stPointSmooth);
        rci.GLStates.Enable(stAlphaTest);
        rci.GLStates.SetGLAlphaFunction(cfNotEqual, 0.0);
        rci.GLStates.Enable(stBlend);
        rci.GLStates.SetBlendFunc(bfSrcAlpha, bfOne);
      end;
    psSquareAdditive:
      begin
        rci.GLStates.Enable(stBlend);
        rci.GLStates.SetBlendFunc(bfSrcAlpha, bfOne);
      end;
  else
    Assert(False);
  end;
  gl.DrawArrays(GL_POINTS, 0, n);
  if GL.EXT_compiled_vertex_array and (n > 64) then
    gl.UnlockArrays;
  PointParameters.UnApply;
  gl.DisableClientState(GL_VERTEX_ARRAY);
  if FColors.Count > 1 then
    gl.DisableClientState(GL_COLOR_ARRAY);
end;

//---------------------------------------------------------------------------
function TGLPoints.StoreSize: Boolean;
begin
  Result := (FSize <> cDefaultPointSize);
end;

//---------------------------------------------------------------------------
procedure TGLPoints.SetNoZWrite(const val: Boolean);
begin
  if FNoZWrite <> val then
  begin
    FNoZWrite := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPoints.SetStatic(const val: Boolean);
begin
  if FStatic <> val then
  begin
    FStatic := val;
    if val then
      ObjectStyle := ObjectStyle - [osDirectDraw]
    else
      ObjectStyle := ObjectStyle + [osDirectDraw];
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPoints.SetSize(const val: Single);
begin
  if FSize <> val then
  begin
    FSize := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPoints.SetPositions(const val: TGSAffineVectorList);
begin
  FPositions.Assign(val);
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLPoints.SetColors(const val: TGSVectorList);
begin
  FColors.Assign(val);
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLPoints.SetStyle(const val: TGLPointStyle);
begin
  if FStyle <> val then
  begin
    FStyle := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPoints.SetPointParameters(const val: TGLPointParameters);
begin
  FPointParameters.Assign(val);
end;

// ------------------
// ------------------ TGLLineBase ------------------
// ------------------
constructor TGLLineBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLineColor := TGSColor.Create(Self);
  FLineColor.Initialize(clrWhite);
  FLinePattern := $FFFF;
  FAntiAliased := False;
  FLineWidth := 1.0;
end;

//---------------------------------------------------------------------------
destructor TGLLineBase.Destroy;
begin
  FLineColor.Free;
  inherited Destroy;
end;

//---------------------------------------------------------------------------
procedure TGLLineBase.NotifyChange(Sender: TObject);
begin
  if Sender = FLineColor then
    StructureChanged;
  inherited;
end;

//---------------------------------------------------------------------------
procedure TGLLineBase.SetLineColor(const Value: TGSColor);
begin
  FLineColor.Color := Value.Color;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLLineBase.SetLinePattern(const Value: TGLushort);
begin
  if FLinePattern <> Value then
  begin
    FLinePattern := Value;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLLineBase.SetLineWidth(const val: Single);
begin
  if FLineWidth <> val then
  begin
    FLineWidth := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
function TGLLineBase.StoreLineWidth: Boolean;
begin
  Result := (FLineWidth <> 1.0);
end;

//---------------------------------------------------------------------------
procedure TGLLineBase.SetAntiAliased(const val: Boolean);
begin
  if FAntiAliased <> val then
  begin
    FAntiAliased := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLLineBase.Assign(Source: TPersistent);
begin
  if Source is TGLLineBase then
  begin
    LineColor := TGLLineBase(Source).FLineColor;
    LinePattern := TGLLineBase(Source).FLinePattern;
    LineWidth := TGLLineBase(Source).FLineWidth;
    AntiAliased := TGLLineBase(Source).FAntiAliased;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
procedure TGLLineBase.SetupLineStyle(var rci: TGLRenderContextInfo);
begin
  with rci.GLStates do
  begin
    Disable(stLighting);
    if FLinePattern <> $FFFF then
    begin
      Enable(stLineStipple);
      Enable(stBlend);
      SetBlendFunc(bfSrcAlpha, bfOneMinusSrcAlpha);
      LineStippleFactor := 1;
      LineStipplePattern := FLinePattern;
    end
    else
      Disable(stLineStipple);
    if FAntiAliased then
    begin
      Enable(stLineSmooth);
      Enable(stBlend);
      SetBlendFunc(bfSrcAlpha, bfOneMinusSrcAlpha);
    end
    else
      Disable(stLineSmooth);
    LineWidth := FLineWidth;

    if FLineColor.Alpha <> 1 then
    begin
      if not FAntiAliased then
      begin
        Enable(stBlend);
        SetBlendFunc(bfSrcAlpha, bfOneMinusSrcAlpha);
      end;
      gl.Color4fv(FLineColor.AsAddress);
    end
    else
      gl.Color3fv(FLineColor.AsAddress);

  end;
end;

// ------------------
// ------------------ TGLLinesNode ------------------
// ------------------
constructor TGLLinesNode.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FColor := TGSColor.Create(Self);
  FColor.Initialize((TGLLinesNodes(Collection).GetOwner as TGLLines)
    .NodeColor.Color);
  FColor.OnNotifyChange := OnColorChange;
end;

//---------------------------------------------------------------------------
destructor TGLLinesNode.Destroy;
begin
  FColor.Free;
  inherited Destroy;
end;

//---------------------------------------------------------------------------
procedure TGLLinesNode.Assign(Source: TPersistent);
begin
  if Source is TGLLinesNode then
    FColor.Assign(TGLLinesNode(Source).FColor);
  inherited;
end;

//---------------------------------------------------------------------------
procedure TGLLinesNode.SetColor(const val: TGSColor);
begin
  FColor.Assign(val);
end;

//---------------------------------------------------------------------------
procedure TGLLinesNode.OnColorChange(Sender: TObject);
begin
  (Collection as TGLNodes).NotifyChange;
end;

//---------------------------------------------------------------------------
function TGLLinesNode.StoreColor: Boolean;
begin
  Result := not VectorEquals((TGLLinesNodes(Collection).GetOwner as TGLLines)
    .NodeColor.Color, FColor.Color);
end;

// ------------------
// ------------------ TGLLinesNodes ------------------
// ------------------
constructor TGLLinesNodes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, TGLLinesNode);
end;

//---------------------------------------------------------------------------
procedure TGLLinesNodes.NotifyChange;
begin
  if (GetOwner <> nil) then
    (GetOwner as TGLBaseSceneObject).StructureChanged;
end;

// ------------------
// ------------------ TGLNodedLines ------------------
// ------------------
constructor TGLNodedLines.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FNodes := TGLLinesNodes.Create(Self);
  FNodeColor := TGSColor.Create(Self);
  FNodeColor.Initialize(clrBlue);
  FNodeColor.OnNotifyChange := OnNodeColorChanged;
  FOldNodeColor := clrBlue;
  FNodesAspect := lnaAxes;
  FNodeSize := 1;
end;

//---------------------------------------------------------------------------
destructor TGLNodedLines.Destroy;
begin
  FNodes.Free;
  FNodeColor.Free;
  inherited Destroy;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.SetNodesAspect(const Value: TGLLineNodesAspect);
begin
  if Value <> FNodesAspect then
  begin
    FNodesAspect := Value;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.SetNodeColor(const Value: TGSColor);
begin
  FNodeColor.Color := Value.Color;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.OnNodeColorChanged(Sender: TObject);
var
  i: Integer;
begin
  // update color for nodes...
  for i := 0 to Nodes.Count - 1 do
    if VectorEquals(TGLLinesNode(Nodes[i]).Color.Color, FOldNodeColor) then
      TGLLinesNode(Nodes[i]).Color.Assign(FNodeColor);
  SetVector(FOldNodeColor, FNodeColor.Color);
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.SetNodes(const aNodes: TGLLinesNodes);
begin
  FNodes.Free;
  FNodes := aNodes;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.SetNodeSize(const val: Single);
begin
  if val <= 0 then
    FNodeSize := 1
  else
    FNodeSize := val;
  StructureChanged;
end;

//---------------------------------------------------------------------------
function TGLNodedLines.StoreNodeSize: Boolean;
begin
  Result := FNodeSize <> 1;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.Assign(Source: TPersistent);
begin
  if Source is TGLNodedLines then
  begin
    SetNodes(TGLNodedLines(Source).FNodes);
    FNodesAspect := TGLNodedLines(Source).FNodesAspect;
    FNodeColor.Color := TGLNodedLines(Source).FNodeColor.Color;
    FNodeSize := TGLNodedLines(Source).FNodeSize;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.DrawNode(var rci: TGLRenderContextInfo; X, Y, Z: Single;
  Color: TGSColor);
begin
  gl.PushMatrix;
  gl.Translatef(X, Y, Z);
  case NodesAspect of
    lnaAxes:
      AxesBuildList(rci, $CCCC, FNodeSize * 0.5);
    lnaCube:
      CubeWireframeBuildList(rci, FNodeSize, False, Color.Color);
  else
    Assert(False)
  end;
  gl.PopMatrix;
end;

//---------------------------------------------------------------------------
function TGLNodedLines.AxisAlignedDimensionsUnscaled: TGSVector;
var
  i: Integer;
begin
  RstVector(Result);
  for i := 0 to Nodes.Count - 1 do
    MaxVector(Result, VectorAbs(Nodes[i].AsVector));
  // EG: commented out, line below looks suspicious, since scale isn't taken
  // into account in previous loop, must have been hiding another bug... somewhere...
  // DivideVector(Result, Scale.AsVector);     //DanB ?
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.AddNode(const coords: TGSCoordinates);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  if Assigned(coords) then
    n.AsVector := coords.AsVector;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.AddNode(const X, Y, Z: TGLFloat);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  n.AsVector := VectorMake(X, Y, Z, 1);
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.AddNode(const Value: TGSVector);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  n.AsVector := Value;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLNodedLines.AddNode(const Value: TAffineVector);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  n.AsVector := VectorMake(Value);
  StructureChanged;
end;

// ------------------
// ------------------ TGLLines ------------------
// ------------------
constructor TGLLines.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDivision := 10;
  FSplineMode := lsmLines;
  FNURBSKnots := TGSSingleList.Create;
  FNURBSOrder := 0;
  FNURBSTolerance := 50;
end;

//---------------------------------------------------------------------------
destructor TGLLines.Destroy;
begin
  FNURBSKnots.Free;
  inherited Destroy;
end;

//---------------------------------------------------------------------------
procedure TGLLines.SetDivision(const Value: Integer);
begin
  if Value <> FDivision then
  begin
    if Value < 1 then
      FDivision := 1
    else
      FDivision := Value;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLLines.SetOptions(const val: TGLLinesOptions);
begin
  FOptions := val;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLLines.SetSplineMode(const val: TGLLineSplineMode);
begin
  if FSplineMode <> val then
  begin
    FSplineMode := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLLines.SetNURBSOrder(const val: Integer);
begin
  if val <> FNURBSOrder then
  begin
    FNURBSOrder := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLLines.SetNURBSTolerance(const val: Single);
begin
  if val <> FNURBSTolerance then
  begin
    FNURBSTolerance := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLLines.Assign(Source: TPersistent);
begin
  if Source is TGLLines then
  begin
    FDivision := TGLLines(Source).FDivision;
    FSplineMode := TGLLines(Source).FSplineMode;
    FOptions := TGLLines(Source).FOptions;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
procedure TGLLines.BuildList(var rci: TGLRenderContextInfo);
var
  i, n: Integer;
  A, B, C: TGLFloat;
  f: Single;
  Spline: TCubicSpline;
  vertexColor: TGSVector;
  nodeBuffer: array of TAffineVector;
  colorBuffer: array of TGSVector;
  nurbsRenderer: PGLUNurbs;
begin
  if Nodes.Count > 1 then
  begin
    // first, we setup the line color & stippling styles
    SetupLineStyle(rci);
    if rci.bufferDepthTest then
      rci.GLStates.Enable(stDepthTest);
    if loColorLogicXor in Options then
    begin
      rci.GLStates.Enable(stColorLogicOp);
      rci.GLStates.LogicOpMode := loXOr;
    end;
    // Set up the control point buffer for Bezier splines and NURBS curves.
    // If required this could be optimized by storing a cached node buffer.
    if (FSplineMode = lsmBezierSpline) or (FSplineMode = lsmNURBSCurve) then
    begin
      SetLength(nodeBuffer, Nodes.Count);
      SetLength(colorBuffer, Nodes.Count);
      for i := 0 to Nodes.Count - 1 do
        with TGLLinesNode(Nodes[i]) do
        begin
          nodeBuffer[i] := AsAffineVector;
          colorBuffer[i] := Color.Color;
        end;
    end;
    if FSplineMode = lsmBezierSpline then
    begin
      // map evaluator
      rci.GLStates.PushAttrib([sttEval]);
      gl.Enable(GL_MAP1_VERTEX_3);
      gl.Enable(GL_MAP1_COLOR_4);
      gl.Map1f(GL_MAP1_VERTEX_3, 0, 1, 3, Nodes.Count, @nodeBuffer[0]);
      gl.Map1f(GL_MAP1_COLOR_4, 0, 1, 4, Nodes.Count, @colorBuffer[0]);
    end;

    // start drawing the line
    if (FSplineMode = lsmNURBSCurve) and (FDivision >= 2) then
    begin
      if (FNURBSOrder > 0) and (FNURBSKnots.Count > 0) then
      begin
        nurbsRenderer := gluNewNurbsRenderer;
        // try
        gluNurbsProperty(nurbsRenderer, GLU_SAMPLING_TOLERANCE,
          FNURBSTolerance);
        gluNurbsProperty(nurbsRenderer, GLU_DISPLAY_MODE, GLU_FILL);
        gluBeginCurve(nurbsRenderer);
        gluNurbsCurve(nurbsRenderer, FNURBSKnots.Count, @FNURBSKnots.List[0], 3,
          @nodeBuffer[0], FNURBSOrder, GL_MAP1_VERTEX_3);
        gluEndCurve(nurbsRenderer);
        // finally
        gluDeleteNurbsRenderer(nurbsRenderer);
        // end;
      end;
    end
    else
    begin
      // lines, cubic splines or bezier
      if FSplineMode = lsmSegments then
        gl.Begin_(GL_LINES)
      else if FSplineMode = lsmLoop then
        gl.Begin_(GL_LINE_LOOP)
      else
        gl.Begin_(GL_LINE_STRIP);
      if (FDivision < 2) or (FSplineMode in [lsmLines, lsmSegments, lsmLoop])
      then
      begin
        // standard line(s), draw directly
        if loUseNodeColorForLines in Options then
        begin
          // node color interpolation
          for i := 0 to Nodes.Count - 1 do
            with TGLLinesNode(Nodes[i]) do
            begin
              gl.Color4fv(Color.AsAddress);
              gl.Vertex3f(X, Y, Z);
            end;
        end
        else
        begin
          // single color
          for i := 0 to Nodes.Count - 1 do
            with Nodes[i] do
              gl.Vertex3f(X, Y, Z);
        end;
      end
      else if FSplineMode = lsmCubicSpline then
      begin
        // cubic spline
        Spline := Nodes.CreateNewCubicSpline;
        // try
        f := 1 / FDivision;
        for i := 0 to (Nodes.Count - 1) * FDivision do
        begin
          Spline.SplineXYZ(i * f, A, B, C);
          if loUseNodeColorForLines in Options then
          begin
            n := (i div FDivision);
            if n < Nodes.Count - 1 then
              VectorLerp(TGLLinesNode(Nodes[n]).Color.Color,
                TGLLinesNode(Nodes[n + 1]).Color.Color, (i mod FDivision) * f,
                vertexColor)
            else
              SetVector(vertexColor, TGLLinesNode(Nodes[Nodes.Count - 1])
                .Color.Color);
            gl.Color4fv(@vertexColor);
          end;
          gl.Vertex3f(A, B, C);
        end;
        // finally
        Spline.Free;
        // end;
      end
      else if FSplineMode = lsmBezierSpline then
      begin
        f := 1 / FDivision;
        for i := 0 to FDivision do
          gl.EvalCoord1f(i * f);
      end;
      gl.End_;
    end;
    rci.GLStates.Disable(stColorLogicOp);
    if FSplineMode = lsmBezierSpline then
      rci.GLStates.PopAttrib;
    if Length(nodeBuffer) > 0 then
    begin
      SetLength(nodeBuffer, 0);
      SetLength(colorBuffer, 0);
    end;
    if FNodesAspect <> lnaInvisible then
    begin
      if not rci.ignoreBlendingRequests then
      begin
        rci.GLStates.Enable(stBlend);
        rci.GLStates.SetBlendFunc(bfSrcAlpha, bfOneMinusSrcAlpha);
      end;
      for i := 0 to Nodes.Count - 1 do
        with TGLLinesNode(Nodes[i]) do
          DrawNode(rci, X, Y, Z, Color);
    end;
  end;
end;

// ------------------
// ------------------ TGLCube ------------------
// ------------------
constructor TGLCube.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCubeSize := XYZVector;

  FParts := [cpTop, cpBottom, cpFront, cpBack, cpLeft, cpRight];
  FNormalDirection := ndOutside;
  ObjectStyle := ObjectStyle + [osDirectDraw];
end;

//---------------------------------------------------------------------------
procedure TGLCube.BuildList(var rci: TGLRenderContextInfo);
var
  v1: TAffineVector;
  v2: TAffineVector;
  v1d: TAffineVector;
  v2d: TAffineVector;
  nd: TGLFloat;
  TanLoc, BinLoc: Integer;
begin
  VectorScale(FCubeSize, 0.5, v2);
  v1 := VectorNegate(v2);
  if FNormalDirection = ndInside then
  begin
    v1d := v2;
    v2d := v1;
    nd := -1
  end
  else
  begin
    v1d := v1;
    v2d := v2;
    nd := 1;
  end;
  if GL.ARB_shader_objects and (rci.GLStates.CurrentProgram > 0) then
  begin
    TanLoc := gl.GetAttribLocation(rci.GLStates.CurrentProgram,
      TangentAttributeName);
    BinLoc := gl.GetAttribLocation(rci.GLStates.CurrentProgram,
      BinormalAttributeName);
  end
  else
  begin
    TanLoc := -1;
    BinLoc := -1;
  end;
  gl.Begin_(GL_QUADS);
  if cpFront in FParts then
  begin
    gl.Normal3f(0, 0, nd);
    if TanLoc > -1 then
      gl.VertexAttrib3f(TanLoc, nd, 0, 0);
    if BinLoc > -1 then
      gl.VertexAttrib3f(BinLoc, 0, nd, 0);
    xgl.TexCoord2fv(@XYTexPoint);
    gl.Vertex3fv(@v2);
    xgl.TexCoord2fv(@YTexPoint);
    gl.Vertex3f(v1d.X, v2d.Y, v2.Z);
    xgl.TexCoord2fv(@NullTexPoint);
    gl.Vertex3f(v1.X, v1.Y, v2.Z);
    xgl.TexCoord2fv(@XTexPoint);
    gl.Vertex3f(v2d.X, v1d.Y, v2.Z);
  end;
  if cpBack in FParts then
  begin
    gl.Normal3f(0, 0, -nd);
    if TanLoc > -1 then
      gl.VertexAttrib3f(TanLoc, -nd, 0, 0);
    if BinLoc > -1 then
      gl.VertexAttrib3f(BinLoc, 0, nd, 0);

    xgl.TexCoord2fv(@YTexPoint);
    gl.Vertex3f(v2.X, v2.Y, v1.Z);
    xgl.TexCoord2fv(@NullTexPoint);
    gl.Vertex3f(v2d.X, v1d.Y, v1.Z);
    xgl.TexCoord2fv(@XTexPoint);
    gl.Vertex3fv(@v1);
    xgl.TexCoord2fv(@XYTexPoint);
    gl.Vertex3f(v1d.X, v2d.Y, v1.Z);
  end;
  if cpLeft in FParts then
  begin
    gl.Normal3f(-nd, 0, 0);
    if TanLoc > -1 then
      gl.VertexAttrib3f(TanLoc, 0, 0, nd);
    if BinLoc > -1 then
      gl.VertexAttrib3f(BinLoc, 0, nd, 0);
    xgl.TexCoord2fv(@XYTexPoint);
    gl.Vertex3f(v1.X, v2.Y, v2.Z);
    xgl.TexCoord2fv(@YTexPoint);
    gl.Vertex3f(v1.X, v2d.Y, v1d.Z);
    xgl.TexCoord2fv(@NullTexPoint);
    gl.Vertex3fv(@v1);
    xgl.TexCoord2fv(@XTexPoint);
    gl.Vertex3f(v1.X, v1d.Y, v2d.Z);
  end;
  if cpRight in FParts then
  begin
    gl.Normal3f(nd, 0, 0);
    if TanLoc > -1 then
      gl.VertexAttrib3f(TanLoc, 0, 0, -nd);
    if BinLoc > -1 then
      gl.VertexAttrib3f(BinLoc, 0, nd, 0);
    xgl.TexCoord2fv(@YTexPoint);
    gl.Vertex3fv(@v2);
    xgl.TexCoord2fv(@NullTexPoint);
    gl.Vertex3f(v2.X, v1d.Y, v2d.Z);
    xgl.TexCoord2fv(@XTexPoint);
    gl.Vertex3f(v2.X, v1.Y, v1.Z);
    xgl.TexCoord2fv(@XYTexPoint);
    gl.Vertex3f(v2.X, v2d.Y, v1d.Z);
  end;
  if cpTop in FParts then
  begin
    gl.Normal3f(0, nd, 0);
    if TanLoc > -1 then
      gl.VertexAttrib3f(TanLoc, nd, 0, 0);
    if BinLoc > -1 then
      gl.VertexAttrib3f(BinLoc, 0, 0, -nd);
    xgl.TexCoord2fv(@YTexPoint);
    gl.Vertex3f(v1.X, v2.Y, v1.Z);
    xgl.TexCoord2fv(@NullTexPoint);
    gl.Vertex3f(v1d.X, v2.Y, v2d.Z);
    xgl.TexCoord2fv(@XTexPoint);
    gl.Vertex3fv(@v2);
    xgl.TexCoord2fv(@XYTexPoint);
    gl.Vertex3f(v2d.X, v2.Y, v1d.Z);
  end;
  if cpBottom in FParts then
  begin
    gl.Normal3f(0, -nd, 0);
    if TanLoc > -1 then
      gl.VertexAttrib3f(TanLoc, -nd, 0, 0);
    if BinLoc > -1 then
      gl.VertexAttrib3f(BinLoc, 0, 0, nd);
    xgl.TexCoord2fv(@NullTexPoint);
    gl.Vertex3fv(@v1);
    xgl.TexCoord2fv(@XTexPoint);
    gl.Vertex3f(v2d.X, v1.Y, v1d.Z);
    xgl.TexCoord2fv(@XYTexPoint);
    gl.Vertex3f(v2.X, v1.Y, v2.Z);
    xgl.TexCoord2fv(@YTexPoint);
    gl.Vertex3f(v1d.X, v1.Y, v2d.Z);
  end;
  gl.End_;
end;

//---------------------------------------------------------------------------
function TGLCube.GenerateSilhouette(const silhouetteParameters
  : TGSSilhouetteParameters): TGSSilhouette;
var
  hw, hh, hd: TGLFloat;
  Connectivity: TGSConnectivity;
  sil: TGSSilhouette;
begin
  Connectivity := TGSConnectivity.Create(True);

  hw := FCubeSize.X * 0.5;
  hh := FCubeSize.Y * 0.5;
  hd := FCubeSize.Z * 0.5;

  if cpFront in FParts then
  begin
    Connectivity.AddQuad(AffineVectorMake(hw, hh, hd),
      AffineVectorMake(-hw, hh, hd), AffineVectorMake(-hw, -hh, hd),
      AffineVectorMake(hw, -hh, hd));
  end;
  if cpBack in FParts then
  begin
    Connectivity.AddQuad(AffineVectorMake(hw, hh, -hd),
      AffineVectorMake(hw, -hh, -hd), AffineVectorMake(-hw, -hh, -hd),
      AffineVectorMake(-hw, hh, -hd));
  end;
  if cpLeft in FParts then
  begin
    Connectivity.AddQuad(AffineVectorMake(-hw, hh, hd),
      AffineVectorMake(-hw, hh, -hd), AffineVectorMake(-hw, -hh, -hd),
      AffineVectorMake(-hw, -hh, hd));
  end;
  if cpRight in FParts then
  begin
    Connectivity.AddQuad(AffineVectorMake(hw, hh, hd),
      AffineVectorMake(hw, -hh, hd), AffineVectorMake(hw, -hh, -hd),
      AffineVectorMake(hw, hh, -hd));
  end;
  if cpTop in FParts then
  begin
    Connectivity.AddQuad(AffineVectorMake(-hw, hh, -hd),
      AffineVectorMake(-hw, hh, hd), AffineVectorMake(hw, hh, hd),
      AffineVectorMake(hw, hh, -hd));
  end;
  if cpBottom in FParts then
  begin
    Connectivity.AddQuad(AffineVectorMake(-hw, -hh, -hd),
      AffineVectorMake(hw, -hh, -hd), AffineVectorMake(hw, -hh, hd),
      AffineVectorMake(-hw, -hh, hd));
  end;
  sil := nil;
  Connectivity.CreateSilhouette(silhouetteParameters, sil, False);
  Result := sil;
  Connectivity.Free;
end;

//---------------------------------------------------------------------------
function TGLCube.GetCubeWHD(const Index: Integer): TGLFloat;
begin
  Result := FCubeSize.v[index];
end;

//---------------------------------------------------------------------------
procedure TGLCube.SetCubeWHD(Index: Integer; aValue: TGLFloat);
begin
  if aValue <> FCubeSize.v[index] then
  begin
    FCubeSize.v[index] := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLCube.SetParts(aValue: TGLCubeParts);
begin
  if aValue <> FParts then
  begin
    FParts := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLCube.SetNormalDirection(aValue: TGLNormalDirection);
begin
  if aValue <> FNormalDirection then
  begin
    FNormalDirection := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLCube.Assign(Source: TPersistent);
begin
  if Assigned(Source) and (Source is TGLCube) then
  begin
    FCubeSize := TGLCube(Source).FCubeSize;
    FParts := TGLCube(Source).FParts;
    FNormalDirection := TGLCube(Source).FNormalDirection;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
function TGLCube.AxisAlignedDimensionsUnscaled: TGSVector;
begin
  Result.X := FCubeSize.X * 0.5;
  Result.Y := FCubeSize.Y * 0.5;
  Result.Z := FCubeSize.Z * 0.5;
  Result.W := 0;
end;

//---------------------------------------------------------------------------
function TGLCube.RayCastIntersect(const rayStart, rayVector: TGSVector;
  intersectPoint: PGSVector = nil; intersectNormal: PGSVector = nil): Boolean;
var
  p: array [0 .. 5] of TGSVector;
  rv: TGSVector;
  rs, r: TGSVector;
  i: Integer;
  t: Single;
  eSize: TAffineVector;
begin
  rs := AbsoluteToLocal(rayStart);
  SetVector(rv, VectorNormalize(AbsoluteToLocal(rayVector)));
  eSize.X := FCubeSize.X * 0.5 + 0.0001;
  eSize.Y := FCubeSize.Y * 0.5 + 0.0001;
  eSize.Z := FCubeSize.Z * 0.5 + 0.0001;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  SetVector(p[3], -1, 0, 0);
  SetVector(p[4], 0, -1, 0);
  SetVector(p[5], 0, 0, -1);
  for i := 0 to 5 do
  begin
    if VectorDotProduct(p[i], rv) > 0 then
    begin
      t := -(p[i].X * rs.X + p[i].Y * rs.Y + p[i].Z * rs.Z + 0.5 * FCubeSize.v
        [i mod 3]) / (p[i].X * rv.X + p[i].Y * rv.Y + p[i].Z * rv.Z);
      MakePoint(r, rs.X + t * rv.X, rs.Y + t * rv.Y, rs.Z + t * rv.Z);
      if (Abs(r.X) <= eSize.X) and (Abs(r.Y) <= eSize.Y) and
        (Abs(r.Z) <= eSize.Z) and
        (VectorDotProduct(VectorSubtract(r, rs), rv) > 0) then
      begin
        if Assigned(intersectPoint) then
          MakePoint(intersectPoint^, LocalToAbsolute(r));
        if Assigned(intersectNormal) then
          MakeVector(intersectNormal^, LocalToAbsolute(VectorNegate(p[i])));
        Result := True;
        Exit;
      end;
    end;
  end;
  Result := False;
end;

//---------------------------------------------------------------------------
procedure TGLCube.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('CubeSize', ReadData, WriteData,
    (FCubeSize.X <> 1) or (FCubeSize.Y <> 1) or (FCubeSize.Z <> 1));
end;

//---------------------------------------------------------------------------
procedure TGLCube.ReadData(Stream: TStream);
begin
  with Stream do
  begin
    Read(FCubeSize, SizeOf(TAffineVector));
  end;
end;

//---------------------------------------------------------------------------
procedure TGLCube.WriteData(Stream: TStream);
begin
  with Stream do
  begin
    Write(FCubeSize, SizeOf(TAffineVector));
  end;
end;

// ------------------
// ------------------ TGLQuadricObject ------------------
// ------------------
constructor TGLQuadricObject.Create(AOwner: TComponent);
begin
  inherited;
  FNormals := nsSmooth;
  FNormalDirection := ndOutside;
end;

//---------------------------------------------------------------------------
procedure TGLQuadricObject.SetNormals(aValue: TGLNormalSmoothing);
begin
  if aValue <> FNormals then
  begin
    FNormals := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLQuadricObject.SetNormalDirection(aValue: TGLNormalDirection);
begin
  if aValue <> FNormalDirection then
  begin
    FNormalDirection := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLQuadricObject.SetupQuadricParams(quadric: PGLUquadricObj);
const
  cNormalSmoothinToEnum: array [nsFlat .. nsNone] of Cardinal = (GLU_FLAT,
    GLU_SMOOTH, GLU_NONE);
begin
  gluQuadricDrawStyle(quadric, GLU_FILL);
  gluQuadricNormals(quadric, cNormalSmoothinToEnum[FNormals]);
  SetNormalQuadricOrientation(quadric);
  gluQuadricTexture(quadric, True);
end;

//---------------------------------------------------------------------------
procedure TGLQuadricObject.SetNormalQuadricOrientation(quadric: PGLUquadricObj);
const
  cNormalDirectionToEnum: array [ndInside .. ndOutside] of Cardinal =
    (GLU_INSIDE, GLU_OUTSIDE);
begin
  gluQuadricOrientation(quadric, cNormalDirectionToEnum[FNormalDirection]);
end;

//---------------------------------------------------------------------------
procedure TGLQuadricObject.SetInvertedQuadricOrientation
  (quadric: PGLUquadricObj);
const
  cNormalDirectionToEnum: array [ndInside .. ndOutside] of Cardinal =
    (GLU_OUTSIDE, GLU_INSIDE);
begin
  gluQuadricOrientation(quadric, cNormalDirectionToEnum[FNormalDirection]);
end;

//---------------------------------------------------------------------------
procedure TGLQuadricObject.Assign(Source: TPersistent);
begin
  if Assigned(Source) and (Source is TGLQuadricObject) then
  begin
    FNormals := TGLQuadricObject(Source).FNormals;
    FNormalDirection := TGLQuadricObject(Source).FNormalDirection;
  end;
  inherited Assign(Source);
end;

// ------------------
// ------------------ TGLStar ------------------
// ------------------
constructor TGLStar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSlices := 32;
  FStacks := 32;
  FTop := 90;
  FBottom := -90;
  FStart := 0;
  FStop := 360;
end;

//---------------------------------------------------------------------------
procedure TGLStar.BuildList(var rci: TGLRenderContextInfo);
var
  v1, v2, N1: TAffineVector;
  AngTop, AngBottom, AngStart, AngStop, StepV, StepH: Double;
  SinP, CosP, SinP2, CosP2, SinT, CosT, Phi, Phi2, Theta: Double;
  uTexCoord, uTexFactor, vTexFactor, vTexCoord0, vTexCoord1: Single;
  i, j: Integer;
  DoReverse: Boolean;
begin
//  DoReverse := (FNormalDirection = ndInside);
  rci.GLStates.PushAttrib([sttPolygon]);
  if DoReverse then
    rci.GLStates.InvertFrontFace;
  // common settings
  AngTop := DegToRad(1.0 * FTop);
  AngBottom := DegToRad(1.0 * FBottom);
  AngStart := DegToRad(1.0 * FStart);
  AngStop := DegToRad(1.0 * FStop);
  StepH := (AngStop - AngStart) / FSlices;
  StepV := (AngTop - AngBottom) / FStacks;
  gl.PushMatrix;
  gl.Scalef(Radius, Radius, Radius);
  // top cap
  if (FTop < 90) and (FTopCap in [ctCenter, ctFlat]) then
  begin
    gl.Begin_(GL_TRIANGLE_FAN);
    SinCosine(AngTop, SinP, CosP);
    xgl.TexCoord2f(0.5, 0.5);
    if DoReverse then
      gl.Normal3f(0, -1, 0)
    else
      gl.Normal3f(0, 1, 0);
    if FTopCap = ctCenter then
      gl.Vertex3f(0, 0, 0)
    else
    begin
      gl.Vertex3f(0, SinP, 0);
      N1 := YVector;
      if DoReverse then
        N1.Y := -N1.Y;
    end;
    v1.Y := SinP;
    Theta := AngStart;
    for i := 0 to FSlices do
    begin
      SinCosine(Theta, SinT, CosT);
      v1.X := CosP * SinT;
      v1.Z := CosP * CosT;
      if FTopCap = ctCenter then
      begin
        N1 := VectorPerpendicular(YVector, v1);
        if DoReverse then
          NegateVector(N1);
      end;
      xgl.TexCoord2f(SinT * 0.5 + 0.5, CosT * 0.5 + 0.5);
      gl.Normal3fv(@N1);
      gl.Vertex3fv(@v1);
      Theta := Theta + StepH;
    end;
    gl.End_;
  end;
  // main body
  Phi := AngTop;
  Phi2 := Phi - StepV;
  uTexFactor := 1 / FSlices;
  vTexFactor := 1 / FStacks;
  for j := 0 to FStacks - 1 do
  begin
    Theta := AngStart;
    SinCos(Phi, SinP, CosP);
    SinCos(Phi2, SinP2, CosP2);
    v1.Y := SinP;
    v2.Y := SinP2;
    vTexCoord0 := 1 - j * vTexFactor;
    vTexCoord1 := 1 - (j + 1) * vTexFactor;
    gl.Begin_(GL_TRIANGLE_STRIP);
    for i := 0 to FSlices do
    begin
      SinCos(Theta, SinT, CosT);
      v1.X := CosP * SinT;
      v2.X := CosP2 * SinT;
      v1.Z := CosP * CosT;
      v2.Z := CosP2 * CosT;

      uTexCoord := i * uTexFactor;
      xgl.TexCoord2f(uTexCoord, vTexCoord0);
      if DoReverse then
      begin
        N1 := VectorNegate(v1);
        gl.Normal3fv(@N1);
      end
      else
        gl.Normal3fv(@v1);
      gl.Vertex3fv(@v1);
      xgl.TexCoord2f(uTexCoord, vTexCoord1);
      if DoReverse then
      begin
        N1 := VectorNegate(v2);
        gl.Normal3fv(@N1);
      end
      else
        gl.Normal3fv(@v2);
      gl.Vertex3fv(@v2);
      Theta := Theta + StepH;
    end;
    gl.End_;
    Phi := Phi2;
    Phi2 := Phi2 - StepV;
  end;
  // bottom cap
  if (FBottom > -90) and (FBottomCap in [ctCenter, ctFlat]) then
  begin
    gl.Begin_(GL_TRIANGLE_FAN);
    SinCos(AngBottom, SinP, CosP);
    xgl.TexCoord2f(0.5, 0.5);
    if DoReverse then
      gl.Normal3f(0, 1, 0)
    else
      gl.Normal3f(0, -1, 0);
    if FBottomCap = ctCenter then
      gl.Vertex3f(0, 0, 0)
    else
    begin
      gl.Vertex3f(0, SinP, 0);
      if DoReverse then
        MakeVector(N1, 0, -1, 0)
      else
      begin
        N1 := YVector;
        NegateVector(N1);
      end;
    end;
    v1.Y := SinP;
    Theta := AngStop;
    for i := 0 to FSlices do
    begin
      SinCos(Theta, SinT, CosT);
      v1.X := CosP * SinT;
      v1.Z := CosP * CosT;
      if FBottomCap = ctCenter then
      begin
        N1 := VectorPerpendicular(AffineVectorMake(0, -1, 0), v1);
        if DoReverse then
          NegateVector(N1);
      end;
      xgl.TexCoord2f(SinT * 0.5 + 0.5, CosT * 0.5 + 0.5);
      gl.Normal3fv(@N1);
      gl.Vertex3fv(@v1);
      Theta := Theta - StepH;
    end;
    gl.End_;
  end;
  if DoReverse then
    rci.GLStates.InvertFrontFace;
  gl.PopMatrix;
  rci.GLStates.PopAttrib;
end;

//---------------------------------------------------------------------------
function TGLStar.RayCastIntersect(const rayStart, rayVector: TGSVector;
  intersectPoint: PGSVector = nil; intersectNormal: PGSVector = nil): Boolean;
var
  i1, i2: TGSVector;
  localStart, localVector: TGSVector;
begin
  // compute coefficients of quartic polynomial
  SetVector(localStart, AbsoluteToLocal(rayStart));
  SetVector(localVector, AbsoluteToLocal(rayVector));
  NormalizeVector(localVector);
  if RayCastSphereIntersect(localStart, localVector, NullHmgVector, Radius, i1,
    i2) > 0 then
  begin
    Result := True;
    if Assigned(intersectPoint) then
      SetVector(intersectPoint^, LocalToAbsolute(i1));
    if Assigned(intersectNormal) then
    begin
      i1.W := 0; // vector transform
      SetVector(intersectNormal^, LocalToAbsolute(i1));
    end;
  end
  else
    Result := False;
end;

//---------------------------------------------------------------------------
function TGLStar.GenerateSilhouette(const silhouetteParameters
  : TGSSilhouetteParameters): TGSSilhouette;
var
  i, j: Integer;
  s, C, angleFactor: Single;
  sVec, tVec: TAffineVector;
  Segments: Integer;
begin
  Segments := MaxInteger(FStacks, FSlices);
  // determine a local orthonormal matrix, viewer-oriented
  sVec := VectorCrossProduct(silhouetteParameters.SeenFrom, XVector);
  if VectorLength(sVec) < 1E-3 then
    sVec := VectorCrossProduct(silhouetteParameters.SeenFrom, YVector);
  tVec := VectorCrossProduct(silhouetteParameters.SeenFrom, sVec);
  NormalizeVector(sVec);
  NormalizeVector(tVec);
  // generate the silhouette (outline and capping)
  Result := TGSSilhouette.Create;
  angleFactor := (2 * PI) / Segments;
  for i := 0 to Segments - 1 do
  begin
    SinCosine(i * angleFactor, Radius, s, C);
    Result.vertices.AddPoint(VectorCombine(sVec, tVec, s, C));
    j := (i + 1) mod Segments;
    Result.Indices.Add(i, j);
    if silhouetteParameters.CappingRequired then
      Result.CapIndices.Add(Segments, i, j)
  end;
  if silhouetteParameters.CappingRequired then
    Result.vertices.Add(NullHmgPoint);
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetBottom(aValue: TGLAngleLimit180);
begin
  if FBottom <> aValue then
  begin
    FBottom := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetBottomCap(aValue: TGLCapType);
begin
  if FBottomCap <> aValue then
  begin
    FBottomCap := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetRadius(const aValue: TGLFloat);
begin
  if aValue <> Radius then
  begin
    Radius := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetSlices(aValue: TGLInt);
begin
  if aValue <> FSlices then
  begin
    if aValue <= 0 then
      FSlices := 1
    else
      FSlices := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetStacks(aValue: TGLInt);
begin
  if aValue <> FStacks then
  begin
    if aValue <= 0 then
      FStacks := 1
    else
      FStacks := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetStart(aValue: TGLAngleLimit360);
begin
  if FStart <> aValue then
  begin
    Assert(aValue <= FStop);
    FStart := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetStop(aValue: TGLAngleLimit360);
begin
  if FStop <> aValue then
  begin
    Assert(aValue >= FStart);
    FStop := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetTop(aValue: TGLAngleLimit180);
begin
  if FTop <> aValue then
  begin
    FTop := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.SetTopCap(aValue: TGLCapType);
begin
  if FTopCap <> aValue then
  begin
    FTopCap := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLStar.Assign(Source: TPersistent);
begin
  if Assigned(Source) and (Source is TGLStar) then
  begin
    Radius := TGLStar(Source).Radius;
    FSlices := TGLStar(Source).FSlices;
    FStacks := TGLStar(Source).FStacks;
    FBottom := TGLStar(Source).FBottom;
    FTop := TGLStar(Source).FTop;
    FStart := TGLStar(Source).FStart;
    FStop := TGLStar(Source).FStop;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
function TGLStar.AxisAlignedDimensionsUnscaled: TGSVector;
begin
  Result.X := Abs(Radius);
  Result.Y := Result.X;
  Result.Z := Result.X;
  Result.W := 0;
end;

// ------------------
// ------------------ TGLPolygonBase ------------------
// ------------------
constructor TGLPolygonBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CreateNodes;
  FDivision := 10;
  FSplineMode := lsmLines;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.CreateNodes;
begin
  FNodes := TGLNodes.Create(Self);
end;

//---------------------------------------------------------------------------
destructor TGLPolygonBase.Destroy;
begin
  FNodes.Free;
  inherited Destroy;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.Assign(Source: TPersistent);
begin
  if Source is TGLPolygonBase then
  begin
    SetNodes(TGLPolygonBase(Source).FNodes);
    FDivision := TGLPolygonBase(Source).FDivision;
    FSplineMode := TGLPolygonBase(Source).FSplineMode;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.NotifyChange(Sender: TObject);
begin
  if Sender = Nodes then
    StructureChanged;
  inherited;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.SetDivision(const Value: Integer);
begin
  if Value <> FDivision then
  begin
    if Value < 1 then
      FDivision := 1
    else
      FDivision := Value;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.SetNodes(const aNodes: TGLNodes);
begin
  FNodes.Assign(aNodes);
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.SetSplineMode(const val: TGLLineSplineMode);
begin
  if FSplineMode <> val then
  begin
    FSplineMode := val;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.AddNode(const coords: TGSCoordinates);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  if Assigned(coords) then
    n.AsVector := coords.AsVector;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.AddNode(const X, Y, Z: TGLFloat);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  n.AsVector := VectorMake(X, Y, Z, 1);
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.AddNode(const Value: TGSVector);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  n.AsVector := Value;
  StructureChanged;
end;

//---------------------------------------------------------------------------
procedure TGLPolygonBase.AddNode(const Value: TAffineVector);
var
  n: TGLNode;
begin
  n := Nodes.Add;
  n.AsVector := VectorMake(Value);
  StructureChanged;
end;

// ------------------
// ------------------ TGLSuperellipsoid ------------------
// ------------------
constructor TGLSuperellipsoid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRadius := 0.5;
  FVCurve := 1.0;
  FHCurve := 1.0;
  FSlices := 32;
  FStacks := 32;
  FTop := 90;
  FBottom := -90;
  FStart := 0;
  FStop := 360;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.BuildList(var rci: TGLRenderContextInfo);
var
  CosPc1, SinPc1, CosTc2, SinTc2: Double;
  tc1, tc2: Integer;
  v1, v2, vs, N1: TAffineVector;
  AngTop, AngBottom, AngStart, AngStop, StepV, StepH: Double;
  SinP, CosP, SinP2, CosP2, SinT, CosT, Phi, Phi2, Theta: Double;
  uTexCoord, uTexFactor, vTexFactor, vTexCoord0, vTexCoord1: Double;
  i, j: Integer;
  DoReverse: Boolean;

begin
  DoReverse := (FNormalDirection = ndInside);
  if DoReverse then
    rci.GLStates.InvertFrontFace;

  // common settings
  AngTop := DegToRad(1.0 * FTop);
  AngBottom := DegToRad(1.0 * FBottom);
  AngStart := DegToRad(1.0 * FStart);
  AngStop := DegToRad(1.0 * FStop);
  StepH := (AngStop - AngStart) / FSlices;
  StepV := (AngTop - AngBottom) / FStacks;

  // Even integer used with the Power function, only produce positive points
  tc1 := trunc(VCurve);
  tc2 := trunc(HCurve);
  if tc1 mod 2 = 0 then
    VCurve := VCurve + 1E-6;
  if tc2 mod 2 = 0 then
    HCurve := HCurve - 1E-6;

  // top cap
  if (FTop < 90) and (FTopCap in [ctCenter, ctFlat]) then
  begin
    gl.Begin_(GL_TRIANGLE_FAN);
    SinCos(AngTop, SinP, CosP);
    xgl.TexCoord2f(0.5, 0.5);
    if DoReverse then
      gl.Normal3f(0, -1, 0)
    else
      gl.Normal3f(0, 1, 0);

    if FTopCap = ctCenter then
      gl.Vertex3f(0, 0, 0)
    else
    begin // FTopCap = ctFlat
      if (Sign(SinP) = 1) or (tc1 = VCurve) then
        SinPc1 := Power(SinP, VCurve)
      else
        SinPc1 := -Power(-SinP, VCurve);
      gl.Vertex3f(0, SinPc1 * Radius, 0);
      N1 := YVector;
      if DoReverse then
        N1.Y := -N1.Y;
    end; // FTopCap = ctFlat
    // v1.Y := SinP;
    if (Sign(SinP) = 1) or (tc1 = VCurve) then
      SinPc1 := Power(SinP, VCurve)
    else
      SinPc1 := -Power(-SinP, VCurve);
    v1.Y := SinPc1;
    Theta := AngStart;
    for i := 0 to FSlices do
    begin
      SinCos(Theta, SinT, CosT);
      // v1.X := CosP * SinT;
      if (Sign(CosP) = 1) or (tc1 = VCurve) then
        CosPc1 := Power(CosP, VCurve)
      else
        CosPc1 := -Power(-CosP, VCurve);
      if (Sign(SinT) = 1) or (tc2 = HCurve) then
        SinTc2 := Power(SinT, HCurve)
      else
        SinTc2 := -Power(-SinT, HCurve);
      v1.X := CosPc1 * SinTc2;
      // v1.Z := CosP * CosT;
      if (Sign(CosT) = 1) or (tc2 = HCurve) then
        CosTc2 := Power(CosT, HCurve)
      else
        CosTc2 := -Power(-CosT, HCurve);
      v1.Z := CosPc1 * CosTc2;
      if FTopCap = ctCenter then
      begin
        N1 := VectorPerpendicular(YVector, v1);
        if DoReverse then
          NegateVector(N1);
      end;
      // xgl.TexCoord2f(SinT * 0.5 + 0.5, CosT * 0.5 + 0.5);
      xgl.TexCoord2f(SinTc2 * 0.5 + 0.5, CosTc2 * 0.5 + 0.5);
      gl.Normal3fv(@N1);
      vs := v1;
      ScaleVector(vs, Radius);
      gl.Vertex3fv(@vs);
      Theta := Theta + StepH;
    end;
    gl.End_;
  end;
  // main body
  Phi := AngTop;
  Phi2 := Phi - StepV;
  uTexFactor := 1 / FSlices;
  vTexFactor := 1 / FStacks;
  for j := 0 to FStacks - 1 do
  begin
    Theta := AngStart;
    SinCos(Phi, SinP, CosP);
    SinCos(Phi2, SinP2, CosP2);

    if (Sign(SinP) = 1) or (tc1 = VCurve) then
      SinPc1 := Power(SinP, VCurve)
    else
      SinPc1 := -Power(-SinP, VCurve);
    v1.Y := SinPc1;

    if (Sign(SinP2) = 1) or (tc1 = VCurve) then
      SinPc1 := Power(SinP2, VCurve)
    else
      SinPc1 := -Power(-SinP2, VCurve);
    v2.Y := SinPc1;
    vTexCoord0 := 1 - j * vTexFactor;
    vTexCoord1 := 1 - (j + 1) * vTexFactor;
    gl.Begin_(GL_TRIANGLE_STRIP);
    for i := 0 to FSlices do
    begin
      SinCos(Theta, SinT, CosT);

      if (Sign(CosP) = 1) or (tc1 = VCurve) then
        CosPc1 := Power(CosP, VCurve)
      else
        CosPc1 := -Power(-CosP, VCurve);

      if (Sign(SinT) = 1) or (tc2 = HCurve) then
        SinTc2 := Power(SinT, HCurve)
      else
        SinTc2 := -Power(-SinT, HCurve);
      v1.X := CosPc1 * SinTc2;

      if (Sign(CosP2) = 1) or (tc1 = VCurve) then
        CosPc1 := Power(CosP2, VCurve)
      else
        CosPc1 := -Power(-CosP2, VCurve);
      v2.X := CosPc1 * SinTc2;

      if (Sign(CosP) = 1) or (tc1 = VCurve) then
        CosPc1 := Power(CosP, VCurve)
      else
        CosPc1 := -Power(-CosP, VCurve);
      if (Sign(CosT) = 1) or (tc2 = HCurve) then
        CosTc2 := Power(CosT, HCurve)
      else
        CosTc2 := -Power(-CosT, HCurve);
      v1.Z := CosPc1 * CosTc2;
      if (Sign(CosP2) = 1) or (tc1 = VCurve) then
        CosPc1 := Power(CosP2, VCurve)
      else
        CosPc1 := -Power(-CosP2, VCurve);
      v2.Z := CosPc1 * CosTc2;
      uTexCoord := i * uTexFactor;
      xgl.TexCoord2f(uTexCoord, vTexCoord0);
      if DoReverse then
      begin
        N1 := VectorNegate(v1);
        gl.Normal3fv(@N1);
      end
      else
        gl.Normal3fv(@v1);
      vs := v1;
      ScaleVector(vs, Radius);
      gl.Vertex3fv(@vs);

      xgl.TexCoord2f(uTexCoord, vTexCoord1);
      if DoReverse then
      begin
        N1 := VectorNegate(v2);
        gl.Normal3fv(@N1);
      end
      else
        gl.Normal3fv(@v2);
      vs := v2;
      ScaleVector(vs, Radius);
      gl.Vertex3fv(@vs);
      Theta := Theta + StepH;
    end;
    gl.End_;
    Phi := Phi2;
    Phi2 := Phi2 - StepV;
  end;
  // bottom cap
  if (FBottom > -90) and (FBottomCap in [ctCenter, ctFlat]) then
  begin
    gl.Begin_(GL_TRIANGLE_FAN);
    SinCos(AngBottom, SinP, CosP);
    xgl.TexCoord2f(0.5, 0.5);
    if DoReverse then
      gl.Normal3f(0, 1, 0)
    else
      gl.Normal3f(0, -1, 0);
    if FBottomCap = ctCenter then
      gl.Vertex3f(0, 0, 0)
    else
    begin // FTopCap = ctFlat
      if (Sign(SinP) = 1) or (tc1 = VCurve) then
        SinPc1 := Power(SinP, VCurve)
      else
        SinPc1 := -Power(-SinP, VCurve);
      gl.Vertex3f(0, SinPc1 * Radius, 0);

      if DoReverse then
        MakeVector(N1, 0, -1, 0)
      else
        N1 := YVector;
    end;
    // v1.Y := SinP;
    if (Sign(SinP) = 1) or (tc1 = VCurve) then
      SinPc1 := Power(SinP, VCurve)
    else
      SinPc1 := -Power(-SinP, VCurve);
    v1.Y := SinPc1;

    Theta := AngStop;
    for i := 0 to FSlices do
    begin
      SinCos(Theta, SinT, CosT);
      // v1.X := CosP * SinT;
      if (Sign(CosP) = 1) or (tc1 = VCurve) then
        CosPc1 := Power(CosP, VCurve)
      else
        CosPc1 := -Power(-CosP, VCurve);
      if (Sign(SinT) = 1) or (tc2 = HCurve) then
        SinTc2 := Power(SinT, HCurve)
      else
        SinTc2 := -Power(-SinT, HCurve);
      v1.X := CosPc1 * SinTc2;

      // v1.Z := CosP * CosT;
      if (Sign(CosT) = 1) or (tc2 = HCurve) then
        CosTc2 := Power(CosT, HCurve)
      else
        CosTc2 := -Power(-CosT, HCurve);
      v1.Z := CosPc1 * CosTc2;
      if FBottomCap = ctCenter then
      begin
        N1 := VectorPerpendicular(AffineVectorMake(0, -1, 0), v1);
        if DoReverse then
          NegateVector(N1);
        gl.Normal3fv(@N1);
      end;
      // xgl.TexCoord2f(SinT * 0.5 + 0.5, CosT * 0.5 + 0.5);
      xgl.TexCoord2f(SinTc2 * 0.5 + 0.5, CosTc2 * 0.5 + 0.5);
      vs := v1;
      ScaleVector(vs, Radius);
      gl.Vertex3fv(@vs);
      Theta := Theta - StepH;
    end;
    gl.End_;
  end;
  if DoReverse then
    rci.GLStates.InvertFrontFace;
end;

//---------------------------------------------------------------------------
// This will probably not work
// RayCastSphereIntersect -> RayCastSuperellipsoidIntersect ?
function TGLSuperellipsoid.RayCastIntersect(const rayStart, rayVector: TGSVector;
  intersectPoint: PGSVector = nil; intersectNormal: PGSVector = nil): Boolean;
var
  i1, i2: TGSVector;
  localStart, localVector: TGSVector;
begin
  // compute coefficients of quartic polynomial
  SetVector(localStart, AbsoluteToLocal(rayStart));
  SetVector(localVector, AbsoluteToLocal(rayVector));
  NormalizeVector(localVector);
  if RayCastSphereIntersect(localStart, localVector, NullHmgVector, Radius, i1,
    i2) > 0 then
  begin
    Result := True;
    if Assigned(intersectPoint) then
      SetVector(intersectPoint^, LocalToAbsolute(i1));
    if Assigned(intersectNormal) then
    begin
      i1.W := 0; // vector transform
      SetVector(intersectNormal^, LocalToAbsolute(i1));
    end;
  end
  else
    Result := False;
end;

//---------------------------------------------------------------------------
// This will probably not work ?
function TGLSuperellipsoid.GenerateSilhouette(const silhouetteParameters
  : TGSSilhouetteParameters): TGSSilhouette;
var
  i, j: Integer;
  s, C, angleFactor: Single;
  sVec, tVec: TAffineVector;
  Segments: Integer;
begin
  Segments := MaxInteger(FStacks, FSlices);
  // determine a local orthonormal matrix, viewer-oriented
  sVec := VectorCrossProduct(silhouetteParameters.SeenFrom, XVector);
  if VectorLength(sVec) < 1E-3 then
    sVec := VectorCrossProduct(silhouetteParameters.SeenFrom, YVector);
  tVec := VectorCrossProduct(silhouetteParameters.SeenFrom, sVec);
  NormalizeVector(sVec);
  NormalizeVector(tVec);
  // generate the silhouette (outline and capping)
  Result := TGSSilhouette.Create;
  angleFactor := (2 * PI) / Segments;
  for i := 0 to Segments - 1 do
  begin
    SinCosine(i * angleFactor, FRadius, s, C);
    Result.vertices.AddPoint(VectorCombine(sVec, tVec, s, C));
    j := (i + 1) mod Segments;
    Result.Indices.Add(i, j);
    if silhouetteParameters.CappingRequired then
      Result.CapIndices.Add(Segments, i, j)
  end;
  if silhouetteParameters.CappingRequired then
    Result.vertices.Add(NullHmgPoint);
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetBottom(aValue: TGLAngleLimit180);
begin
  if FBottom <> aValue then
  begin
    FBottom := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetBottomCap(aValue: TGLCapType);
begin
  if FBottomCap <> aValue then
  begin
    FBottomCap := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetHCurve(const aValue: TGLFloat);
begin
  if aValue <> FHCurve then
  begin
    FHCurve := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetRadius(const aValue: TGLFloat);
begin
  if aValue <> FRadius then
  begin
    FRadius := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetSlices(aValue: TGLInt);
begin
  if aValue <> FSlices then
  begin
    if aValue <= 0 then
      FSlices := 1
    else
      FSlices := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetStacks(aValue: TGLInt);
begin
  if aValue <> FStacks then
  begin
    if aValue <= 0 then
      FStacks := 1
    else
      FStacks := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetStart(aValue: TGLAngleLimit360);
begin
  if FStart <> aValue then
  begin
    Assert(aValue <= FStop);
    FStart := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetStop(aValue: TGLAngleLimit360);
begin
  if FStop <> aValue then
  begin
    Assert(aValue >= FStart);
    FStop := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetTop(aValue: TGLAngleLimit180);
begin
  if FTop <> aValue then
  begin
    FTop := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetTopCap(aValue: TGLCapType);
begin
  if FTopCap <> aValue then
  begin
    FTopCap := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.SetVCurve(const aValue: TGLFloat);
begin
  if aValue <> FVCurve then
  begin
    FVCurve := aValue;
    StructureChanged;
  end;
end;

//---------------------------------------------------------------------------
procedure TGLSuperellipsoid.Assign(Source: TPersistent);
begin
  if Assigned(Source) and (Source is TGLSuperellipsoid) then
  begin
    FRadius := TGLSuperellipsoid(Source).FRadius;
    FSlices := TGLSuperellipsoid(Source).FSlices;
    FStacks := TGLSuperellipsoid(Source).FStacks;
    FBottom := TGLSuperellipsoid(Source).FBottom;
    FTop := TGLSuperellipsoid(Source).FTop;
    FStart := TGLSuperellipsoid(Source).FStart;
    FStop := TGLSuperellipsoid(Source).FStop;
  end;
  inherited Assign(Source);
end;

//---------------------------------------------------------------------------
function TGLSuperellipsoid.AxisAlignedDimensionsUnscaled: TGSVector;
begin
  Result.X := Abs(FRadius);
  Result.Y := Result.X;
  Result.Z := Result.X;
  Result.W := 0;
end;

initialization //==============================================================

RegisterClasses([TGLStar, TGLCube, TGLSprite, TGLPoints,
  TGLLines, TGLSuperellipsoid]);

end.
