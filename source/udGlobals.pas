//
(* PaintedNotes for colorized keyboards https://github.com/geoblock *)
//
unit udGlobals;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.IniFiles;


const
  //cRegistryKey = 'Software\AstroLibrary';
  RegSoundCube = PathDelim + 'SOFTWARE' + PathDelim + 'Astromifs' + PathDelim;

  CubeSize = 1000;

  cAUkm = 149597870.7; // 1 а.е. в километрах
  cLYau =     63241;   // число a.e. в 1 световом году
  cPCau =    206265;   // число a.e. в 1 парсеке
  cLYpc =    3.2616;   // число парсек в 1 световом году


var
 // ExePath: TFileName;
  CurrentPath, Catalog: TFileName;
  ModelPath:   TFileName;
  TexturePath: TFileName;
  IniFile: TIniFile;

  LanguageID: integer = LANG_RUSSIAN; // or LANG_ENGLISH
  GeneralSection: string = RegSoundCube + 'General';

  SplashStart : Boolean;
  TipOfTheDay : Boolean;

const
  // file types to import/export
  ftTXT = 'txt';  // text
  ftCSV = 'csv';  // csv
  ftDAT = 'dat';  // dat
  ftSQL = 'sqlite';  // sqlite
  ftTVN = 'tvn';  // treeview nodes

//==========================================================================
implementation
//==========================================================================



//---------------------------
 initialization

   FormatSettings.DecimalSeparator := '.';


end.
