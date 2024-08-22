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

implementation //-----------------------------------------------------------

{$R *.dfm}

//
procedure TFormI.FormCreate(Sender: TObject);
begin
  ReadIniFile;
  SetLanguage;
end;

//-------------------------------------------------------------------------
procedure TFormI.SetLanguage;
var
  LocalePath : TFileName;
begin
  LocalePath := ExtractFileDir(ParamStr(0));
  LocalePath := LocalePath + PathDelim + 'locale' + PathDelim;

  if (LangID <> LANG_ENGLISH) then
  begin
    Textdomain('galaxy');
    BindTextDomain ('galaxy', LocalePath);
//    AddDomainForResourceString('language');
//    BindTextDomain ('language', LocalePath);
    case LangID of
      LANG_RUSSIAN:
      begin
        UseLanguage('ru');
      end
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
  //TP_GlobalIgnoreClass(TTable);  // removed in ignore file
  //TP_GlobalIgnoreClass(TFields);
  //TP_GlobalIgnoreClass(TGLMaterialLibrary);

  // Uncomment the next line will cause long loading but Action.Category translation
  //TP_GlobalIgnoreClass(TAction);

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
      // use correct argument names
      LangID := ReadInteger('frmSettings', 'rgLanguage', 0);
    finally
      IniFile.Free;
    end;
end;

end.
