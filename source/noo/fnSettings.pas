unit fnSettings;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
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
    rgLanguage: TRadioGroup;
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
    Label5: TLabel;
    cbSplashStart: TCheckBox;
    procedure tvSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure rgLanguageClick(Sender: TObject);
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
  fnNoosfera;
{$R *.dfm}


procedure TfrmSettings.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
begin
  // Читаем сохранённые опции интерфейса
  ReadIniFile;

  // Включение стилей интерфейса в комбобокс
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Заполнение тем TreeView индексами
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
    frmUniverse.LoadConstLines(CurrDir)
  else
    frmUniverse.LinesConstellations.Nodes.Clear;
  if chbConstBounds.Checked then
    frmUniverse.LoadConstBorders(CurrDir)
  else
    frmUniverse.LinesConstBorders.Nodes.Clear;
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

procedure TfrmSettings.rgLanguageClick(Sender: TObject);
begin
  case rgLanguage.ItemIndex of
    0: CurLangID := LANG_ENGLISH;
    1: CurLangID := LANG_RUSSIAN
    else
      CurLangID := LANG_ENGLISH;
  end;
end;

//--------------------------------------------------------------------
// Чтение секций Инифайла и установка языка интерфейса
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
// Запись опций настройки в файл инициализации
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
