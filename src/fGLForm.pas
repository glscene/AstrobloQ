//-------------------------------------
// This unit is part of the Galaktika
//-------------------------------------

unit fGLForm;

(* The fGLForm unit for TGLForm class as parent for all child forms *)

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.IniFiles,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.ExtDlgs,

  uGlobals,
  gnuGettext;

type
  TFormGL = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure ReadIniFile; virtual;
    procedure SetLanguage;
  end;

var
  FormGL: TFormGL;

implementation

{$R *.dfm}

//
procedure TFormGL.FormCreate(Sender: TObject);
begin
  SetLanguage;
end;

//----------------------------------------------------------
procedure TFormGL.SetLanguage;
var
  LocalePath : TFileName;
begin
  LocalePath := ExtractFileDir(ParamStr(0));
  LocalePath := LocalePath + PathDelim + 'locale' + PathDelim;

  ReadIniFile;

  if (LangID <> LANG_ENGLISH) then
  begin
    Textdomain('galablock');
    BindTextDomain ('galablock', LocalePath);
    AddDomainForResourceString('language');
    BindTextDomain ('language', LocalePath);

    // Removing the upper line will cause long loading but Action.Category translation
    case LangID of
      LANG_RUSSIAN:
      begin
        UseLanguage('ru');
        Application.HelpFile := UpperCase(LocalePath + 'ru'+ PathDelim+'Galablock.chm');
      end
      else
      begin
        UseLanguage('en');
        Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'Galablock.chm');
      end;
    end;
  end
  else
  begin
    UseLanguage('en');
    Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'Galablock.chm');
  end;
  //TP_GlobalIgnoreClass(TTable);
  //TP_GlobalIgnoreClass(TFields);
  //TP_GlobalIgnoreClass(TListBox);
  //TP_GlobalIgnoreClass(TGLLibMaterial);
  //TP_GlobalIgnoreClass(TGLMaterialLibrary);

  TranslateComponent(Self);
end;


//========================================================================
procedure TFormGL.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      LangID := ReadInteger('FormSettings', 'rgLanguage', 0);
    finally
      IniFile.Free;
    end;
end;

end.
