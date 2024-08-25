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

  fdForm, FMX.Controls.Presentation, FMX.StdCtrls;

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
    rbEnglish: TRadioButton;
    rbPortugese: TRadioButton;
    rbRussian: TRadioButton;
    rbSpain: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
  private
  public
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  end;

var
  frmSettings: TfrmSettings;

implementation //-------------------------------------------------------------

{$R *.fmx}

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  ReadInifile;
  inherited;
end;

procedure TfrmSettings.tvSettingsClick(Sender: TObject);
begin
  inherited;
//  TabControl.Index := tvSettings.Selected.Count;
  case tvSettings.Selected.Count of
//    TabControl.ActiveTab := TabItemN;
     0: TabControl.ActiveTab := tiGeneral;
     1: TabControl.ActiveTab := tiInterface;
     2: TabControl.ActiveTab := tiDisplay;
     3: TabControl.ActiveTab := tiGalaxy;
     4: TabControl.ActiveTab := tiStars;
     5: TabControl.ActiveTab := tiPlanets;
  end;
end;

procedure TfrmSettings.ReadIniFile;
var
  IniFile: TIniFile;

begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
(*
  try
///    ActiveLang := IniFile.ReadInteger(frmSettings.Name, rbEnglish.Text, 0);
///    CheckBoxAxes.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxAxes.Name, True);
///    CheckBoxRotate.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxRotate.Name, True);
   case (... is TRadioButton)
    case ActiveLang of
      LANG_ENGLISH:
        rgLanguage.ItemIndex := 0;
      LANG_RUSSIAN:
        rgLanguage.ItemIndex := 1;
      LANG_PORTUGUESE:
        rgLanguage.ItemIndex := 2;
      LANG_SPANISH:
        rgLanguage.ItemIndex := 3
    else
      rgLanguage.ItemIndex := 0;
    end;
  finally
    IniFile.Free;
*)
end;

procedure TfrmSettings.WriteIniFile;
begin
 //
end;



end.
