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

  uGlobals;

type
  TFormI = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure ReadIniFile; virtual;
  end;

var
  FormI: TFormI;

implementation

{$R *.dfm}

//
procedure TFormI.FormCreate(Sender: TObject);
begin
  //
end;

//========================================================================
procedure TFormI.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      LanguageID := ReadInteger('FormOptions', 'rgLanguage', 0);
    finally
      IniFile.Free;
    end;
end;

end.
