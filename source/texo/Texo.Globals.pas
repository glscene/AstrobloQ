unit Texo.Globals;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.IniFiles,

  Vcl.Graphics,

  GLS.Color,
  GLS.Texture;

const
  SELDIRHELP: INTEGER = 180;

type
  PrefRecord = record
    // Writing in pof file, first line of file serves as Version ID
    PHiddenString, PShpPath, PEarthDataPath, PEarthModelPath, PEarthPhotoPath,
      PEarthHRPath: string[255];
    PStartedNameNumber: string[25];
    PMapBordersColor, PMapGridsColor, PMapDatasColor, PMapBacksColor: TColor;
    PGlowUpDowni, PColorreg: Integer;
    PStarted: TDateTime;

    PClassStartPanelColor, PEditingColor, PBackgroundColor, PHighlightColor,
      PEditColor, PCurrentColor: TColor;

    PErrorBeepOn, PWarningBeepOn, PInfoBeepOn, PConfirmBeepOn,
      PCompletedBeepOn: Boolean;
    PSelectionRadius: Integer;
  end;

type
  PrefFile = file of PrefRecord;

var
  PreRcd: PrefRecord;
  HiddenString, StartedNameNumber: String;

  ShpPath, EarthDataPath, EarthModelPath, EarthPhotoPath,
    EarthHRPath: TFileName;

  GlowUpDowni, Colorreg: Integer;
  MyPixelFormat: TPixelFormat; // pf24bit pf32bit
  PixelScanSize: Byte;
  Started: TDateTime;

  PrintBigChecked, UseThumbnails, AutoDisPlay, VoicesON, DoneBeepOn,
  ErrorBeepOn, bAutoSave: Boolean;

  CurrentColor: TColor;

  FormPlanetX, FormPlanetY, FormCyborgX, FormCyborgY, FormLoadModelX,
  FormLoadModelY, FormNoosferaX, FormNoosferaY, ABCreatorFormX,
  ABCreatorFormY, AboutFormX, AboutFormY, AboutHolographicsX,
  AboutHolographicsY, MessageX, MessageY, HoloFormY, HoloFormX,
  SystemInfoFormX, SystemInfoFormY: Integer;

var
  ThumbColor, MapBordersColor, MapGridsColor, MapDatasColor,
  MapBacksColor: TColor;

  EditingColor, ClassStartPanelColor, BackgroundColor, HighlightColor,
  EditColor: TColor; // ,  CurrentColor

  SelectionRadius: Integer;

  StillOpen, FilePreviews, Skip32BitNotice, SkipIntroScreen, ScaleBarVisible,
  WarningBeepOn, InfoBeepOn, ConfirmBeepOn, CompletedBeepOn: Boolean;

  DotColorArray: array of TGLColorVector;
  MarkerIndex, ColorIndex: Integer;

  MMSysHandle: THandle;
  PlaySound: function(lpszSoundName: PAnsiChar; uFlags: UINT): BOOL; stdcall;

procedure DoLoader;
procedure SetPreferences;
procedure DoSaver;
procedure GetPreferences;

implementation // ---------------------------------------------------------

procedure DoLoader;
var
  P_File: PrefFile;
  PathS: string;
begin
  PathS := ExtractFilePath(ParamStr(0)) + 'Tehnosfera.pof';
  if FileExists(PathS) then
  begin
    AssignFile(P_File, PathS);
    Reset(P_File);
    if IoResult <> 0 then
    begin
     // DoRezError(22);
    end;
    Read(P_File, PreRcd);
    CloseFile(P_File);
    SetPreferences;
  end
  else // DoRezError(24);
end;

procedure SetPreferences;
begin // after loading
  with PreRcd do
  begin
    EarthDataPath := PEarthDataPath;
    ShpPath := PShpPath;
    EarthModelPath := PEarthModelPath;
    EarthPhotoPath := PEarthPhotoPath;
    EarthHRPath := PEarthHRPath;

    EditingColor := PEditingColor;
    BackgroundColor := PBackgroundColor;
    HighlightColor := PHighlightColor;
    ClassStartPanelColor := PClassStartPanelColor;
    EditColor := PEditColor;
    CurrentColor := PCurrentColor;
    ErrorBeepOn := PErrorBeepOn;
    WarningBeepOn := PWarningBeepOn;
    InfoBeepOn := PInfoBeepOn;
    ConfirmBeepOn := PConfirmBeepOn;
    CompletedBeepOn := PCompletedBeepOn;
    Started := PStarted;
    StartedNameNumber := PStartedNameNumber;
    Colorreg := PColorreg;
    SelectionRadius := PSelectionRadius;
    GlowUpDowni := PGlowUpDowni;
    MapBordersColor := PMapBordersColor;
    MapGridsColor := PMapGridsColor;
    MapDatasColor := PMapDatasColor;
    MapBacksColor := PMapBacksColor;
  end;
end;

// ---------------------------------------------------------------------
procedure DoSaver;
var
  P_File: PrefFile;
var
  PathS: string;
begin
  PathS := ExtractFilePath(ParamStr(0)) + 'Tehnosfera.pof';
  GetPreferences;
  AssignFile(P_File, PathS);
  Rewrite(P_File);
  if IoResult <> 0 then; // DorezError(23) ;
  write(P_File, PreRcd);
  CloseFile(P_File);
end;

// ---------------------------------------------------------------------
procedure GetPreferences;
begin // before saving
  with PreRcd do
  begin
    // This is my secret string ? as text?
    PHiddenString := HiddenString;
    PEarthDataPath := EarthDataPath;
    PShpPath := ShpPath;
    PEarthModelPath := EarthModelPath;
    PEarthPhotoPath := EarthPhotoPath;
    PEarthHRPath := EarthHRPath;

    PEditingColor := EditingColor;
    PBackgroundColor := BackgroundColor;
    PHighlightColor := HighlightColor;
    PClassStartPanelColor := ClassStartPanelColor;
    PEditColor := EditColor;
    PCurrentColor := CurrentColor;
    PErrorBeepOn := ErrorBeepOn;
    PWarningBeepOn := WarningBeepOn;
    PInfoBeepOn := InfoBeepOn;
    PConfirmBeepOn := ConfirmBeepOn;
    PCompletedBeepOn := CompletedBeepOn;
    PGlowUpDowni := GlowUpDowni;
    PSelectionRadius := SelectionRadius;
    PColorreg := Colorreg;
    PStarted := Started;
    PStartedNameNumber := StartedNameNumber;
    PMapBordersColor := MapBordersColor;
    PMapGridsColor := MapGridsColor;
    PMapDatasColor := MapDatasColor;
    PMapBacksColor := MapBacksColor;
  end;
end;

// ---------------------------------------------------------------------

end.
