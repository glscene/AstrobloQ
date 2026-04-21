//-------------------------------------
// This unit is part of the Galaxy
//-------------------------------------
unit fxFormFirst_en;

// Original form of the Galaxy

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IniFiles,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs;

type
  TFormX = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    ActiveLangID: Integer;
    ActiveLangStr: String;
    procedure ReadIniFile; virtual;
  end;

var
  FormX: TFormX;

implementation //--------------------------------------------------------------

{$R *.fmx}

procedure TFormX.FormCreate(Sender: TObject);
begin
   ReadIniFile;
end;

procedure TFormX.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      // Reading
    finally
      IniFile.Free;
    end;
end;

end.
