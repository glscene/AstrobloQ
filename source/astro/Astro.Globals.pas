(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit Astro.Globals;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.IniFiles,
  System.UITypes;

const
  //cRegistryKey = 'Software\AstrobloQ';
  RegSoundCube = PathDelim + 'SOFTWARE' + PathDelim + 'AstrobloQ' + PathDelim;

  CubeSize = 1000;

  cAUkm = 149597870.7; // 1 а.е. в километрах
  cLYau =     63241;   // число a.e. в 1 световом году
  cPCau =    206265;   // число a.e. в 1 парсеке
  cLYpc =    3.2616;   // число парсек в 1 световом году

  // file types to import/export
  ftTXT = 'txt';  // text
  ftCSV = 'csv';  // csv
  ftDAT = 'dat';  // dat
  ftSQL = 'sqlite';  // sqlite
  ftTVN = 'tvn';  // treeview nodes

  SeldirHelp: Integer = 180;
  ActiveLanguage: Integer = 9; // 9 - LANG_ENGLISH, 25 - LANG_RUSSIAN

var
  ModelPath:   TFileName;
  TexturePath: TFileName;
  IniFile: TIniFile;

  LanguageID: integer = LANG_RUSSIAN; // or LANG_ENGLISH
  GeneralSection: string = RegSoundCube + 'General';

  SplashStart : Boolean;
  TipOfTheDay : Boolean;

var
  Started: TDateTime;
  HiddenString, StartedNameNumber: String;

  DataPath, ShpPath, EarthDataPath, EarthModelPath, EarthPhotoPath,
    EarthHRPath: TFileName;

  GlowUpDowni, Colorreg: Integer;
  PixelScanSize: Byte;

  PrintBigChecked, UseThumbnails, AutoDisPlay, VoicesON, DoneBeepOn,
    ErrorBeepOn, bAutoSave: Boolean;
  CurrentColor: TColor;

  FormPlanetX, FormPlanetY, FormCyborgX, FormCyborgY, FormLoadSmdMdlX,
    FormLoadSmdMdlY, FormTehnosferaX, FormTehnosferaY, ABCreatorFormX,
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

  DotColorArray: array of TColor;
  MarkerIndex, ColorIndex: Integer;

  MMSysHandle: THandle; // for sound

procedure DoLoader;
//procedure SetPreferences;
procedure DoSaver;
//procedure GetPreferences;

implementation // ------------------------------------------------------------

procedure DoLoader;
var
  P_File: File;
  PathS: string;
begin
  PathS := ExtractFilePath(ParamStr(0)) + 'Galaktika.pof';
  if FileExists(PathS) then
  begin
    AssignFile(P_File, PathS);
    Reset(P_File);
    if IoResult <> 0 then
    begin
     // DoRezError(22)
    end;
//    Read(P_File, PreRcd);
    CloseFile(P_File);
//    SetPreferences;
  end
  else { DoRezError(24) };
end;

// ---------------------------------------------------------------------
procedure DoSaver;
var
  P_File: File;
  PathS: string;
begin
  PathS := ExtractFilePath(ParamStr(0)) + 'Preferences.pof';
//  GetPreferences;
  AssignFile(P_File, PathS);
  Rewrite(P_File);
  if IoResult <> 0 then; // DorezError(23) ;
//  write(P_File, PreRcd);
  CloseFile(P_File);
end;


// ---------------------------------------------------------------------

end.
