//-------------------------------------
// This unit is part of the Galaktika
//-------------------------------------
unit fForm;

(* The fForm unit for TFormI class as parent for all child forms *)

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.IniFiles,
  System.Classes,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.ExtDlgs,
  Vcl.Controls,
  Vcl.StdCtrls,

  gnuGettext;

type
  TFormG = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    ActiveLang: Word;
    procedure ReadIniFile; virtual;
    procedure SetLanguage;
  end;

var
  FormG: TFormG;

implementation //-----------------------------------------------------------

{$R *.dfm}

//
procedure TFormG.FormCreate(Sender: TObject);
begin
  ReadIniFile;
  SetLanguage;
end;

//-------------------------------------------------------------------------
procedure TFormG.SetLanguage;
var
  LocalePath : TFileName;
begin
  LocalePath := ExtractFileDir(ParamStr(0));
  LocalePath := LocalePath + PathDelim + 'locale' + PathDelim;

  if (ActiveLang <> LANG_ENGLISH) then
  begin
    Textdomain('galaxy');
    BindTextDomain ('galaxy', LocalePath);
//    AddDomainForResourceString('language');
//    BindTextDomain ('language', LocalePath);
    case ActiveLang of
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


//------------------------------------------------------------------------
procedure TFormG.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      // use correct argument names
      ActiveLang := ReadInteger('frmSettings', 'rgLanguage', 0);
    finally
      IniFile.Free;
    end;
end;

end.
