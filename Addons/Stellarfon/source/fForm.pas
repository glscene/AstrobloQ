//-------------------------------------
// The unit is part of the AstrobloQ
//-------------------------------------

unit fForm;

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

  gnuGettext;

type
  TFormI = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    LangID: Word;
    procedure ReadIniFile; virtual;
    procedure SetLanguage;
  end;

var
  FormI: TFormI;

implementation

{$R *.dfm}

//
procedure TFormI.FormCreate(Sender: TObject);
begin
  SetLanguage;
end;

//----------------------------------------------------------
procedure TFormI.SetLanguage;
var
  LocalePath : TFileName;
begin
  LocalePath := ExtractFileDir(ParamStr(0));
  LocalePath := LocalePath + PathDelim + 'locale' + PathDelim;

  ReadIniFile;

  if (LangID <> LANG_ENGLISH) then
  begin
    Textdomain('stellarfon');
    BindTextDomain ('stellarfon', LocalePath);
    AddDomainForResourceString('language');
    BindTextDomain ('language', LocalePath);

    // Removing the upper line will cause long loading but Action.Category translation
    case LangID of
      LANG_RUSSIAN:
      begin
        UseLanguage('ru');
        Application.HelpFile := UpperCase(LocalePath + 'ru'+ PathDelim+'Stellarfon.chm');
      end;
      LANG_SPANISH:
      begin
        UseLanguage('es');
        Application.HelpFile := UpperCase(LocalePath + 'es'+ PathDelim+'Stellarfon.chm');
      end
      else
      begin
        UseLanguage('en');
        Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'Stellarfon.chm');
      end;
    end;
  end
  else
  begin
    UseLanguage('en');
    Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'Stellarfon.chm');
  end;
  //TP_GlobalIgnoreClass(TTable);
  //TP_GlobalIgnoreClass(TFields);
  //TP_GlobalIgnoreClass(TListBox);
  //TP_GlobalIgnoreClass(TGLLibMaterial);
  //TP_GlobalIgnoreClass(TGLMaterialLibrary);

  TranslateComponent(Self);
end;


//========================================================================
procedure TFormI.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      LangID := ReadInteger('FormOptions', 'rgLanguage', 0);
    finally
      IniFile.Free;
    end;
end;

end.
