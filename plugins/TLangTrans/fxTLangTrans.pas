unit fxTLangTrans;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Actions,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Memo,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Menus,
  FMX.ListBox,
  FMX.ActnList,

  fxAbout;

type
  TfmMainSampleTLang = class(TForm)
    Label1: TLabel;
    btnEn: TButton;
    btnDe: TButton;
    btnFr: TButton;
    Text1: TText;
    btnClose: TButton;
    Label2: TLabel;
    btnZn: TButton;
    Text2: TText;
    btbRu: TButton;
    ListBox1: TListBox;
    ListBoxHeader1: TListBoxHeader;
    MenuBar: TMenuBar;
    miFile: TMenuItem;
    miMethod: TMenuItem;
    miHelp: TMenuItem;
    lbiMoscow: TListBoxItem;
    lbiBerlin: TListBoxItem;
    lbiLondon: TListBoxItem;
    lbiTokyo: TListBoxItem;
    lbCity: TLabel;
    MainMenu: TMainMenu;
    ActionList: TActionList;
    acOpen: TAction;
    acAbout: TAction;
    acLinear: TAction;
    miOpen: TMenuItem;
    StatusBar: TStatusBar;
    MenuItemFile: TMenuItem;
    MenuItemMethod: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemOpen: TMenuItem;
    MenuItemLinear: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemExit: TMenuItem;
    miExit: TMenuItem;
    miLinear: TMenuItem;
    miAbout: TMenuItem;
    acExit: TAction;
    Langs: TLang;
    lbiBeijing: TListBoxItem;
    procedure btnDeClick(Sender: TObject);
    procedure btnFrClick(Sender: TObject);
    procedure btnEnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnZnClick(Sender: TObject);
    procedure btbRuClick(Sender: TObject);
    procedure btnCloseDblClick(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
    procedure acLinearExecute(Sender: TObject);
  private
    procedure ChangeLanguage(ActiveLanguage: string);
  public
    function TransManually(sOriginal: string): string;
  end;

var
  fmMainSampleTLang: TfmMainSampleTLang;

implementation //--------------------------------------------------------

{$R *.fmx}

const
  cTxtManual = 'This text is translated manual';
  cTxtFailed = 'This text can''t be translated';

procedure TfmMainSampleTLang.FormCreate(Sender: TObject);
var
  I:Integer;

begin
  Text1.Text := cTxtManual;
  Text2.Text := cTxtFailed;

  Langs.Lang := 'en'; // Default language

// LoadLangFromStrings(Langs.LangStr['en']);

  // MainMenu items translations
  MenuItemFile.AutoTranslate := True;
  for I := 0 to MenuItemFile.ItemsCount - 1 do
    MenuItemFile.Items[I].AutoTranslate := True;
  MenuItemMethod.AutoTranslate := True;
  for I := 0 to MenuItemMethod.ItemsCount - 1 do
    MenuItemMethod.Items[I].AutoTranslate := True;
  MenuItemHelp.AutoTranslate := True;
  for I := 0 to MenuItemHelp.ItemsCount - 1 do
    MenuItemHelp.Items[I].AutoTranslate := True;

  // MenuBar items translations
  for I := 0 to MenuBar.ItemsCount - 1 do
    MenuBar.Items[I].AutoTranslate := True;
  for I := 0 to miFile.ItemsCount - 1 do
    miFile.Items[I].AutoTranslate := True;
  for I := 0 to miMethod.ItemsCount - 1 do
    miMethod.Items[I].AutoTranslate := True;
  for I := 0 to miHelp.ItemsCount - 1 do
    miHelp.Items[I].AutoTranslate := True;
end;

// translate a text, which is not in the automate translation process of TFmxObjects
function TfmMainSampleTLang.TransManually(sOriginal: string): string;
begin
  // first check, if the selected language has a mapping
  if Langs.Resources.IndexOf(Langs.Lang) >= 0 then
  begin
    // get the resource stringlist of the current language and get the translation
    result := Langs.LangStr[Langs.Lang].Values[sOriginal];
    if result = '' then
    begin
      // text not found in mapping - keep original text
      result := sOriginal;
    end;
  end
  else
  begin
    // language not found: must be the default language
    result := sOriginal;
  end;
end;

procedure TfmMainSampleTLang.ChangeLanguage(ActiveLanguage: string);
var
  I:Integer;
begin
  Langs.Lang := ActiveLanguage;
//  LoadLangFromStrings(Langs.LangStr['en']);
// do some manual text translations
  Text1.Text := TransManually(cTxtManual);
  Text2.Text := TransManually(cTxtFailed);
end;

procedure TfmMainSampleTLang.btnEnClick(Sender: TObject);
begin
  ChangeLanguage('en');
end;

procedure TfmMainSampleTLang.btbRuClick(Sender: TObject);
begin
  ChangeLanguage('ru');
end;

procedure TfmMainSampleTLang.btnDeClick(Sender: TObject);
begin
  ChangeLanguage('de');
end;

procedure TfmMainSampleTLang.btnFrClick(Sender: TObject);
begin
  ChangeLanguage('fr');
end;

procedure TfmMainSampleTLang.btnZnClick(Sender: TObject);
begin
  ChangeLanguage('zn');
end;

procedure TfmMainSampleTLang.acAboutExecute(Sender: TObject);
begin
  //Dialog About...
  fmAbout.Show;
end;

procedure TfmMainSampleTLang.acLinearExecute(Sender: TObject);
begin
  //Dialog Liniar...
end;

procedure TfmMainSampleTLang.acOpenExecute(Sender: TObject);
begin
  //Dialog Open...
end;

procedure TfmMainSampleTLang.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmMainSampleTLang.btnCloseDblClick(Sender: TObject);
begin
  Close;
end;

end.
