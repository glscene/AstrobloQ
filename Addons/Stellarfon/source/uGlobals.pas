unit uGlobals;

// The unit is part of the AstrobloQ

interface

uses
  Winapi.Windows,
  System.Win.Registry,
  System.SysUtils,
  System.IniFiles,
  Vcl.Forms;


const
  //cRegistryKey = 'Software\AstrobloQ';
  RegSoundCube = PathDelim + 'SOFTWARE' + PathDelim + 'Stellarfon' + PathDelim;

  CubeSize = 1000;

var
  LangID: Word;
  CurLang: string = 'ru'; // Current default is 'en', localized is 'ru' etc.

 // ExePath: TFileName;
  AppPath:  TFileName = '';
  PathToData : TFileName;
  CurrentPath, Catalog: TFileName;
  ModelPath:   TFileName;
  TexturePath: TFileName;
  IniFile: TIniFile;

  LanguageID: integer;
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

implementation //-------------------------------------------------------------


//---------------------------
 initialization

   FormatSettings.DecimalSeparator := '.';


end.
