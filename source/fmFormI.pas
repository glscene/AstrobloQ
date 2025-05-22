//-------------------------------------
// This unit is part of AstroLibrary
//-------------------------------------

unit fmFormI;

(* The fmForm unit for TFormI class as parent for all child forms *)

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

implementation //----------------------------------------------------------

{$R *.dfm}

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
      //Options.Param := ReadInteger('frmOptions', 'Param', 200);
    finally
      IniFile.Free;
    end;
end;

end.
