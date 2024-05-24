//
// This unit is part of the Galaktika
//
unit fGLOptions;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.UITypes,
  System.Variants,
  System.Classes,
  System.IniFiles,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  //
  dImages,
  fGLForm,
  fGLDialog;

type
  TFormGLOptions = class(TGLDialog)
    rgLanguages: TRadioGroup;
    PanelBackground: TPanel;
    ‘ÓÌ: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgLanguagesClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure PanelBackgroundClick(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile; override;
  end;

var
  FormGLOptions: TFormGLOptions;

//---------------------------------------------------------------------------
implementation

{$R *.dfm}

uses
  GnuGettext,
  fGalaktika;


procedure TFormGLOptions.FormCreate(Sender: TObject);
begin
  inherited;
  ReadIniFile;
end;

procedure TFormGLOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

procedure TFormGLOptions.ReadIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
//      CheckBoxAxis.Checked := ReadBool(Name, CheckBoxAxis.Name, True);
      PanelBackground.Color  := ReadInteger(Name, PanelBackground.Name, 0);
      LangID := ReadInteger(Name, rgLanguages.Name, 0);
      case LangID of
        LANG_ENGLISH : rgLanguages.ItemIndex := 0;
        LANG_RUSSIAN : rgLanguages.ItemIndex := 1;
        LANG_SPANISH : rgLanguages.ItemIndex := 2;
        LANG_FRENCH  : rgLanguages.ItemIndex := 3;
        LANG_GERMAN  : rgLanguages.ItemIndex := 4;
        LANG_ITALIAN : rgLanguages.ItemIndex := 5;
        else
          rgLanguages.ItemIndex := 0;
      end;
    finally
      IniFile.Free;
    end;
end;

procedure TFormGLOptions.rgLanguagesClick(Sender: TObject);
begin
  case rgLanguages.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN;
    2: CurLangID := LANG_SPANISH;
    3: CurLangID := LANG_FRENCH;
    4: CurLangID := LANG_GERMAN;
    5: CurLangID := LANG_ITALIAN;
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

procedure TFormGLOptions.WriteIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  with IniFile do
    try
//      WriteBool(Name, CheckBoxAxis.Name, CheckBoxAxis.Checked);
      WriteInteger(Name, PanelBackground.Name, PanelBackground.Color);
      WriteInteger(Name, rgLanguages.Name, CurLangID);
    finally
      IniFile.Free;
    end;
  inherited;
end;

procedure TFormGLOptions.PanelBackgroundClick(Sender: TObject);
begin
{
   dmDialogs.ColorDialog.Color := PanelBackground.Color;
   if dmDialogs.ColorDialog.Execute then
   begin
     PanelBackground.Color :=  dmDialogs.ColorDialog.Color;
     FormGalaktika.ApplyBgColor;
   end;
}
end;

procedure TFormGLOptions.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  if CurLangID <> LangID then
  begin
    MessageDlg(_('Reload to change language'),
      mtInformation, [mbOK], 0);
    FileName := ChangeFileExt(ParamStr(0), '.ini');
    if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to exclude dublicated sections for each language
  end;
end;

end.
