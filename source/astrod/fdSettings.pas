unit fdSettings;

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
  FMX.Dialogs,
  FMX.Layouts,
  FMX.TreeView,
  FMX.TabControl,
  FMX.Controls.Presentation,
  FMX.StdCtrls,

  fdForm, FMX.Edit, FMX.ComboEdit, FMX.ListBox;

type
  TfrmSettings = class(TFormO)
    tvSettings: TTreeView;
    tvGeneral: TTreeViewItem;
    tvInterface: TTreeViewItem;
    tvDisplay: TTreeViewItem;
    tvPlanets: TTreeViewItem;
    tvStars: TTreeViewItem;
    tvGalaxy: TTreeViewItem;
    TabControl: TTabControl;
    tiGeneral: TTabItem;
    tiInterface: TTabItem;
    tiDisplay: TTabItem;
    tiPlanets: TTabItem;
    tiStars: TTabItem;
    tiGalaxy: TTabItem;
    gbLanguage: TGroupBox;
    ButtonOk: TButton;
    ceLanguages: TComboEdit;
    cbLanguages: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
  private
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  end;

var
  frmSettings: TfrmSettings;

implementation // -------------------------------------------------------------

{$R *.fmx}


procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  ReadIniFile;
  inherited;
end;

procedure TfrmSettings.tvSettingsClick(Sender: TObject);
begin
  inherited;
  // TabControl.Index := tvSettings.Selected.Count;
  case tvSettings.Selected.Count of
    // TabControl.ActiveTab := TabItemN;
    0:
      TabControl.ActiveTab := tiGeneral;
    1:
      TabControl.ActiveTab := tiInterface;
    2:
      TabControl.ActiveTab := tiDisplay;
    3:
      TabControl.ActiveTab := tiGalaxy;
    4:
      TabControl.ActiveTab := tiStars;
    5:
      TabControl.ActiveTab := tiPlanets;
  end;
end;


//--------------------------------------------------------------------------
procedure TfrmSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    ActiveLangID := cbLanguages.ItemIndex;
    IniFile.WriteInteger(frmSettings.Name, cbLanguages.Name, ActiveLangID);
//    IniFile.WriteString(frmSettings.Name, rbRussian.Text, 'ru');
  finally
    IniFile.Free;
  end;
  inherited;
end;


//--------------------------------------------------------------------------

procedure TfrmSettings.ReadIniFile;
var
  IniFile: TIniFile;

begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    ActiveLangId := IniFile.ReadInteger(frmSettings.Name, gbLanguage.Name, 0);
    cbLanguages.ItemIndex := ActiveLangId;
    /// CheckBoxAxes.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxAxes.Name, True);
    /// CheckBoxRotate.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxRotate.Name, True);
    case ActiveLangId of
      LANG_ENGLISH: cbLanguages.ItemIndex := 0;
      LANG_RUSSIAN: cbLanguages.ItemIndex := 1;
      LANG_PORTUGUESE: cbLanguages.ItemIndex := 2;
      LANG_SPANISH: cbLanguages.ItemIndex := 3;
    else
      cbLanguages.ItemIndex := 0;
    end;
  finally
    IniFile.Free;
  end;
end;

//-------------------------------------------------------------------------

procedure TfrmSettings.ButtonOkClick(Sender: TObject);
var
  FileName: TFileName;
begin
  if CurLangID <> ActiveLangID then
  begin
///    MessageDlg(_('Reload to change language'),  mtInformation, [mbOK], 0);
    FileName := ChangeFileExt(ParamStr(0), '.ini');
    if FileExists(UpperCase(FileName)) then
      DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  end;
  // Write settings
  WriteIniFile;
  frmSettings.Close;
end;


end.
