//-------------------------------------
// This unit is part of Stellarfon
//-------------------------------------

unit fsFirstForm;

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
    procedure ReadIniFile; virtual;
  end;

var
  frmFirst: TfrmFirst;

implementation //----------------------------------------------------------

{$R *.dfm}

//
procedure TfrmFirst.FormCreate(Sender: TObject);
begin
  ReadInifile;
end;

//----------------------------------------------------------

procedure TfrmFirst.ReadIniFile;
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
