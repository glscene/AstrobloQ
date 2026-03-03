//-------------------------------------
// This unit is part of AstrobloQ
//-------------------------------------
unit fmFormFirst;

(* The unit for TFormFirst class as parent for all child forms *)

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
  TFormFirst = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    StyleID: Integer;
    PathExe: TFileName;
    IniFile:  TIniFile;

    procedure ReadIniFile; virtual;
    procedure WriteIniFile;
  end;

var
  FormFirst: TFormFirst;

implementation //=============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TFormFirst.FormCreate(Sender: TObject);
begin
  ReadInifile;
end;

//----------------------------------------------------------------------------
procedure TFormFirst.ReadIniFile;
var
  IniFile: TIniFile;
begin
  //   StyleID := 0;
  PathExe := ExtractFilePath(ParamStr(0));
  SetCurrentDir(PathExe);
///  IniFile := TIniFile.Create(PathExe + 'Gexoblock.ini');
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      //Options.Param := ReadInteger('FormOptions', 'Param', 200);
    finally
      IniFile.Free;
    end;
end;

//----------------------------------------------------------------------------
procedure TFormFirst.WriteIniFile;
begin
  PathExe := ExtractFilePath(ParamStr(0));
  SetCurrentDir(PathExe);
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
end;

initialization //=============================================================

end.
