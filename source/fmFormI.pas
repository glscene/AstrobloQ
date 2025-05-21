//-------------------------------------
// This unit is part of AstroLibrary
//-------------------------------------

unit fmFormI;

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
  TfrmI = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure ReadIniFile; virtual;
  end;

var
  frmI: TfrmI;

implementation //----------------------------------------------------------

{$R *.dfm}

//
procedure TfrmI.FormCreate(Sender: TObject);
begin
  ReadInifile;
end;

//----------------------------------------------------------

procedure TfrmI.ReadIniFile;
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
