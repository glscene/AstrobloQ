unit uGlobals;

// The unit is part of the AstrobloQ

interface

uses
  Winapi.Windows,
  System.Win.Registry,
  System.SysUtils,
  System.IniFiles,
  Vcl.Forms,

  gnugettext;


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

  Language: integer;
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

procedure InitLanguage;

implementation //-------------------------------------------------------------

// For loading LangID from windows registry
procedure InitLanguage;
begin
  if LangID <> LANG_ENGLISH then
  begin
    Textdomain('stellarfon');
    BindTextDomain ('stellarfon', AppPath + 'Locale'+ PathDelim);
    (*
    AddDomainForResourceString('delphi');
    BindTextDomain ('delphi', AppPath + 'Locale'+ PathDelim);
    *)
    AddDomainForResourceString('language');
    BindTextDomain ('language', AppPath + 'Locale'+ PathDelim);
    //TP_GlobalIgnoreClass(TTable);
    //TP_GlobalIgnoreClass(TFields);
    //TP_GlobalIgnoreClass(TFont);
    //TP_GlobalIgnoreClass(TStaticText);
    //TP_GlobalIgnoreClass(TGLLibMaterial);
    //TP_GlobalIgnoreClass(TGLMaterialLibrary);
    //TP_GlobalIgnoreClass(TListBox);
    /// TP_GlobalIgnoreClassProperty(TAction, 'Category');
    // Removing the upper line will cause long loading but Action.Category translation
  end;
  case LangID of
    LANG_ENGLISH:
    begin
      UseLanguage('en');
      Application.HelpFile := UpperCase(AppPath +'Help'+PathDelim+'en'+ PathDelim+'Stellarfon.chm');
    end;
    LANG_RUSSIAN:
    begin
      UseLanguage('ru');
      Application.HelpFile := UpperCase(AppPath  +'Help'+PathDelim+'ru'+ PathDelim+'Stellarfon.chm');
    end;
    LANG_SPANISH:
    begin
      UseLanguage('es');
      Application.HelpFile := UpperCase(AppPath + 'Help'+PathDelim+'es'+ PathDelim + 'Stellarfon.chm');
    end
    else   //DEFAULT LANGUAGE
    begin
      UseLanguage('en');
      Application.HelpFile := UpperCase(AppPath + 'Help' + PathDelim +'en' + PathDelim + 'Stellarfon.chm');
    end;
  end;
end;


//---------------------------
 initialization

   FormatSettings.DecimalSeparator := '.';


end.
