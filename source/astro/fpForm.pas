//-------------------------------------
// This unit is part of AstroLibrary
//-------------------------------------

unit fpForm;

(* The fpForm unit for TFormP class as parent for all child forms *)

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
  TFormP = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    LangID: Word;
    procedure ReadIniFile; virtual;
    procedure SetLanguage;
  end;

var
  FormP: TFormP;

implementation

{$R *.dfm}

//
procedure TFormP.FormCreate(Sender: TObject);
begin
  ReadInifile;
  SetLanguage;
end;

//----------------------------------------------------------
procedure TFormP.SetLanguage;
var
  LocalePath : TFileName;
begin
  LocalePath := ExtractFileDir(ParamStr(0));
  LocalePath := LocalePath + PathDelim + 'locale' + PathDelim;

  if (LangID <> LANG_ENGLISH) then
  begin
    Textdomain('astroviewer');
    BindTextDomain ('astroviewer', LocalePath);
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
    Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'Astrobloq.chm');
  end;

  //TP_GlobalIgnoreClass(TTable);
  //TP_GlobalIgnoreClass(TFields);
  //TP_GlobalIgnoreClass(TGLMaterialLibrary);

  TranslateComponent(Self);
end;


//========================================================================
procedure TFormP.ReadIniFile;
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
