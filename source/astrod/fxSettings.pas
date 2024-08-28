unit fxSettings;

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

  FMX.Edit,
  FMX.ComboEdit,
  FMX.ListBox,
  fxForm;

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
    ceLanguages: TComboEdit;
    ButtonOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
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

  for var I: Integer := 0 to TabControl.TabCount - 1 do
    TabControl.Tabs[I].Visible := False;

  TabControl.Tabs[0].Visible := True;
  tvSettings.CanFocus := True;
  TabControl.ActiveTab := tiGeneral;
  inherited;
end;

procedure TfrmSettings.tvSettingsClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to TabControl.TabCount - 1 do
    TabControl.Tabs[I].Visible := False;

  case tvSettings.Selected.Index of
    0: begin
         TabControl.Tabs[0].Visible := True;
         tiGeneral.Visible := True;
         TabControl.ActiveTab := tiGeneral;
       end;
    1: begin
         TabControl.Tabs[1].Visible := True;
         tiInterface.Visible := True;
         TabControl.ActiveTab := tiInterface;
       end;
    2: begin
         TabControl.Tabs[2].Visible := True;
         tiDisplay.Visible := True;
         TabControl.ActiveTab := tiDisplay;
       end;
    3: begin
         TabControl.Tabs[3].Visible := True;
         tiPlanets.Visible := True;
         TabControl.ActiveTab := tiPlanets;
       end;
    4: begin
        TabControl.Tabs[4].Visible := True;
        tiStars.Visible := True;
        TabControl.ActiveTab := tiStars;
       end;
    5: begin
         TabControl.Tabs[5].Visible := True;
         tiGalaxy.Visible := True;
         TabControl.ActiveTab := tiGalaxy;
       end;
  end;
end;

//--------------------------------------------------------------------------
procedure TfrmSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    case ceLanguages.ItemIndex of
      0: ActiveLangID := LANG_ENGLISH; // 9
      1: ActiveLangID := LANG_RUSSIAN; // 25
      2: ActiveLangID := LANG_PORTUGUESE; // 22
      3: ActiveLangID := LANG_SPANISH; // 10
    end;
    IniFile.WriteInteger(frmSettings.Name, ceLanguages.Name, ActiveLangID);
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
    ActiveLangId := IniFile.ReadInteger(frmSettings.Name, ceLanguages.Name, 0);
/// CheckBoxAxes.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxAxes.Name, True);
/// CheckBoxRotate.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxRotate.Name, True);
    case ActiveLangId of
      LANG_ENGLISH: ceLanguages.ItemIndex := 0;
      LANG_RUSSIAN: ceLanguages.ItemIndex := 1;
      LANG_PORTUGUESE: ceLanguages.ItemIndex := 2;
      LANG_SPANISH: ceLanguages.ItemIndex := 3;
    else
      ceLanguages.ItemIndex := 0;
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
