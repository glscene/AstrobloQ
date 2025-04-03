//-------------------------------------
// This unit is part of the Galaxy
//-------------------------------------
unit fxForm;

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
  TFormO = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    ActiveLangID: Integer;
    ActiveLangStr: String;
    procedure ReadIniFile; virtual;
  end;

var
  FormO: TFormO;

implementation //--------------------------------------------------------------

{$R *.fmx}

procedure TFormO.FormCreate(Sender: TObject);
begin
   ReadIniFile;
end;

procedure TFormO.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      // (frmSettings.Name, gbLanguage.Text, 0)
      ActiveLangID := ReadInteger('frmSettings', 'ceLanguages', 0);
      if ActiveLangID = 9 then
        ActiveLangStr := 'en'
        else
        if ActiveLangID = 25 then
          ActiveLangStr := 'ru'
        else
          ActiveLangStr := 'en' // Default language
    finally
      IniFile.Free;
    end;
end;

end.
