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
  Vcl.StdCtrls;

type
  TFormG = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    ActiveLang: Word;
    procedure ReadIniFile; virtual;
  end;

var
  FormG: TFormG;

implementation //-----------------------------------------------------------

{$R *.dfm}

//
procedure TFormG.FormCreate(Sender: TObject);
begin
  ReadIniFile;
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
