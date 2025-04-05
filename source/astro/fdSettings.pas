unit fdSettings;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.UITypes,
  System.Variants,
  System.Classes,
  System.IniFiles,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.Outline,
  Vcl.Samples.DirOutln,
  Vcl.ColorGrd,
  Vcl.Samples.Gauges,
  Vcl.CheckLst,
  Vcl.WinXCtrls,
  Vcl.NumberBox,
  Vcl.Themes,

  fForm;

type
  TfrmSettings = class(TFormI)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsInterface: TTabSheet;
    tsDisplay: TTabSheet;
    CheckBoxAxes: TCheckBox;
    tsDatatime: TTabSheet;
    PanelScale: TPanel;
    lblScaleX: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    tvSettings: TTreeView;
    PanelTop: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ImageList: TImageList;
    tsGalaxy: TTabSheet;
    tsStars: TTabSheet;
    tsPlanets: TTabSheet;
    lbExoplanets: TListBox;
    Memo1: TMemo;
    tsGeneral: TTabSheet;
    gbxCoordinateSys: TGroupBox;
    rgrSystem: TRadioGroup;
    rgUnits: TRadioGroup;
    gbStarColors: TGroupBox;
    ShapeM: TShape;
    ShapeK: TShape;
    ShapeG: TShape;
    ShapeF: TShape;
    ShapeA: TShape;
    ShapeO: TShape;
    ShapeB: TShape;
    Label4: TLabel;
    Label3: TLabel;
    clbStarColors: TCheckListBox;
    ListBox2: TListBox;
    stColor: TStaticText;
    RadioGroup1: TRadioGroup;
    chbSysTime: TCheckBox;
    SpinEditPrecision: TSpinEdit;
    LabelPrecision: TLabel;
    CheckBoxRotate: TCheckBox;
    GroupBoxConstallations: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    CheckBoxPlanetgrid: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBoxCubemap: TCheckBox;
    ComboBoxVclStyles: TComboBox;
    lbStyle: TLabel;
    cbSplashStart: TCheckBox;
    procedure tvSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
    procedure chbConstellationsClick(Sender: TObject);
  private
    CurLangID : Word;
    Node: TTreeNode;
    Nodes: TTreeNodes;
    procedure ReadIniFile; override; // from base class
    procedure WriteIniFile;
  public
    //
  end;

var
  frmSettings: TfrmSettings;

implementation //------------------------------------------------------------


uses
  fdAstroVersum;
{$R *.dfm}


procedure TfrmSettings.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
begin
  // Read saved settings
  ReadIniFile;

  // Styles for interface
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Fill items with indices for TreeView
  for I := 0 to tvSettings.Items.Count - 1 do
  begin
    tvSettings.Items[i].ImageIndex := 0;
    tvSettings.Items[i].SelectedIndex := 1;
  end;

  // Выбор начальной темы узла дерева
  tvSettings.Items[1].Selected := True;
  tvSettingsClick(Self);
  // Подсветка темы узла после клика !
  tvSettings.Items[1].DropHighlighted := True;
  // Раскрываем все узлы дерева
  tvSettings.FullExpand;
  // В конце (!) наследование из fdForm
  inherited;
end;

//-----------------------------------------------------------------
// Показать линии, границы, фигуры и названия созвездий
//-----------------------------------------------------------------
procedure TfrmSettings.chbConstellationsClick(Sender: TObject);
begin
  CurrDir := DataDir + 'constellation\';
  if chbConstLines.Checked then
    frmAstroViewer.LoadConstLines(CurrDir)
  else
    frmAstroViewer.LinesConstellations.Nodes.Clear;
  if chbConstBounds.Checked then
    frmAstroViewer.LoadConstBorders(CurrDir)
  else
    frmAstroViewer.LinesConstBorders.Nodes.Clear;
end;

//-----------------------------------------------------------------
// Изменение стиля интерфейса
//-----------------------------------------------------------------
procedure TfrmSettings.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

//-----------------------------------------------------------------
// Изменение активной страницы PageControl
//-----------------------------------------------------------------
procedure TfrmSettings.tvSettingsClick(Sender: TObject);
begin
  inherited;
  tvSettings.Items[1].DropHighlighted := False;
  case tvSettings.Selected.Index of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsDisplay;
     3: PageControl.ActivePage := tsDatatime;
     4: PageControl.ActivePage := tsPlanets;
     5: PageControl.ActivePage := tsStars;
     6: PageControl.ActivePage := tsGalaxy;
  end;
end;

//--------------------------------------------------------------------
// Reading settings from ini file
//--------------------------------------------------------------------
procedure TfrmSettings.ReadIniFile;
var
  IniFile: TIniFile;
begin
//  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxes.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(frmSettings.Name, CheckBoxRotate.Name, True);
  finally
    IniFile.Free;
  end;
end;

//---------------------------------------------------------
// Writing settingd in ini file
//---------------------------------------------------------
procedure TfrmSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteBool(frmSettings.Name, CheckBoxAxes.Name, CheckBoxAxes.Checked);
    IniFile.WriteBool(frmSettings.Name, CheckBoxRotate.Name, CheckBoxRotate.Checked);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//----------------------------------------------------------------------------
procedure TfrmSettings.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  WriteIniFile;
  frmSettings.Close;
end;

end.
