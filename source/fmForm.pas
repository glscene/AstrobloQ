//-------------------------------------
// This unit is part of AstroLibrary
//-------------------------------------

unit fmForm;

(* The fdForm unit for TFormI class as parent for all child forms *)

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.IniFiles,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.ExtDlgs;

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

uses
  uGlobals;

//
procedure TFormI.FormCreate(Sender: TObject);
begin
  ReadInifile;
end;

//----------------------------------------------------------

procedure TFormI.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      LanguageID := ReadInteger('frmSettings', 'rgLanguage', 0);
    finally
      IniFile.Free;
    end;
end;

end.
