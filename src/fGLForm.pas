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
  Vcl.Actnlist,

  gnuGettext;

type
  TFormGL = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
     
  public
    IniFile : TIniFile;
    procedure ReadIniFile; virtual;
    procedure SetLanguage;
  end;

var
  FormGL: TFormGL;
  LangID : Word;

implementation

{$R *.dfm}

//
// Перевод всех строк компонентов
//
procedure TFormGL.FormCreate(Sender: TObject);
begin
  inherited;
  SetLanguage;
end;

//----------------------------------------------------------
procedure TFormGL.SetLanguage;
var
  LocalePath : TFileName;
  IniFile : TIniFile;

begin
  LocalePath := ExtractFileDir(ParamStr(0)); // Path to GLSViewer
  LocalePath := LocalePath + PathDelim + 'locale' + PathDelim;

  ReadIniFile;
  if (LangID <> LANG_ENGLISH) then
  begin
    Textdomain('galaktika');  // galaktika.mo file renamed from default.mo
    BindTextDomain ('galaktika', LocalePath);
    AddDomainForResourceString('language');
    BindTextDomain ('language', LocalePath);

    //TP_GlobalIgnoreClass(TTable);
    //TP_GlobalIgnoreClass(TFields);
    //TP_GlobalIgnoreClass(TFont);
    //TP_GlobalIgnoreClass(TListBox);
    //TP_GlobalIgnoreClass(TStaticText);
    //TP_GlobalIgnoreClass(TGLLibMaterial);
    //TP_GlobalIgnoreClass(TGLMaterialLibrary);
    //TP_IgnoreClass(TFont);
    TP_GlobalIgnoreClassProperty(TAction, 'Category');
    // Removing the upper line will cause long loading but Action.Category translation
    case LangID of
      LANG_RUSSIAN:
      begin
        UseLanguage('ru');
        Application.HelpFile := UpperCase(LocalePath + 'ru'+ PathDelim+'Galaktika.chm');
        // Help from Ruwiki
      end
      else
      begin
        UseLanguage('en');
        Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'Galaktika.chm');
        // Help from Wiki
      end;
    end;
  end
  else
  begin
    UseLanguage('en');
    Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'Galaktika.chm');
    // Help from Wiki
  end;
  TranslateComponent(Self);
  //TP_GlobalIgnoreClass(TGLLibMaterial);
  //TP_GlobalIgnoreClass(TGLMaterialLibrary);
  //TP_GlobalIgnoreClass(TListBox);
  //TP_GlobalIgnoreClassProperty(TAction, 'Category');
end;



procedure TFormGL.ReadIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      LangID := ReadInteger('FormSettings', 'rgLanguages', 0);
    finally
      IniFile.Free;
    end;
end;

end.
