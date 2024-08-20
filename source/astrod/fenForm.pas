unit fenForm;

interface

uses
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
  TFormI = class(TForm)
    Langs: TLang;
    procedure FormCreate(Sender: TObject);
  private
  public
    ActiveLang: String;
    procedure ReadIniFile; virtual;
  end;

var
  FormI: TFormI;

implementation

{$R *.fmx}

procedure TFormI.FormCreate(Sender: TObject);
begin
   ActiveLang := 'en'; // Default language
   ReadIniFile;
end;

procedure TFormI.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
      ActiveLang := ReadString('FormSettings', 'rgLanguage', 'en');
    finally
      IniFile.Free;
    end;
end;

end.
