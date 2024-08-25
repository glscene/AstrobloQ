//-------------------------------------
// This unit is part of the Galaxy
//-------------------------------------
unit fdForm;

// Original form of the Galaxy

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IniFiles,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,

  gnuGettext;

type
  TFormO = class(TForm)
    Langs: TLang;
    procedure FormCreate(Sender: TObject);
  private
  public
    ActiveLangID: Integer;
    ActiveLangStr: String;
    procedure ReadIniFile; virtual;
    procedure SetLanguage;
  end;

var
  FormO: TFormO;

implementation //--------------------------------------------------------------

{$R *.fmx}

procedure TFormO.FormCreate(Sender: TObject);
begin
   ActiveLangStr := 'en'; // Default language
   ReadIniFile;
   SetLanguage;
end;

procedure TFormO.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      // (frmSettings.Name, gbLanguage.Text, 0)
      ActiveLangID := ReadInteger('frmSettings', 'gbLanguage', 0);
      ActiveLangStr := ReadString('frmSettings', 'rgLanguage', 'en');
    finally
      IniFile.Free;
    end;
end;

//--------------------------------------------------------------------------

procedure TFormO.SetLanguage;
var
  LocalePath : TFileName;
begin
  LocalePath := ExtractFileDir(ParamStr(0));
  LocalePath := LocalePath + PathDelim + 'locale' + PathDelim;

  if (ActiveLangStr <> 'en') then
  begin
    Textdomain('galaxy');
    BindTextDomain ('galaxy', LocalePath);
//    AddDomainForResourceString('language');
//    BindTextDomain ('language', LocalePath);
    case ActiveLangID of
      LANG_RUSSIAN: UseLanguage('ru');
      LANG_PORTUGUESE: UseLanguage('pt');
      LANG_SPANISH: UseLanguage('sp');
      else
      begin
        UseLanguage('en');
      end;
    end;
  end
  else
  begin
    UseLanguage('en');
  end;

  TranslateComponent(Self);
end;

end.
