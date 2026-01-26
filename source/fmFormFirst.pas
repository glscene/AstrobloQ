//-------------------------------------
// This unit is part of AstrobloQ
//-------------------------------------

unit fmFormFirst;

(* The unit for TfrmFirst class as parent for all child forms *)

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
  TfrmFirst = class(TForm)
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
  frmFirst: TfrmFirst;

implementation //=============================================================

{$R *.dfm}

//
procedure TfrmFirst.FormCreate(Sender: TObject);
begin
  ReadInifile;
end;

//----------------------------------------------------------------------------
procedure TfrmFirst.ReadIniFile;
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
procedure TfrmFirst.WriteIniFile;
begin
  PathExe := ExtractFilePath(ParamStr(0));
  SetCurrentDir(PathExe);
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
end;

initialization

end.
