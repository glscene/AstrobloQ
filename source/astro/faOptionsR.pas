unit faOptionsR;

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

  fmForm;

type
  TfrmOptions = class(TFormI)
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
    tvOptions: TTreeView;
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
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ComboBoxVclStylesChange(Sender: TObject);
    procedure chbConstellationsClick(Sender: TObject);
  private
    Node: TTreeNode;
    Nodes: TTreeNodes;
    procedure ReadIniFile; override; // from base class
    procedure WriteIniFile;
  public
    //
  end;

var
  frmOptions: TfrmOptions;

implementation //------------------------------------------------------------

{$R *.dfm}

uses
  faAstroverusR;

//-------------------------------------------------------------
procedure TfrmOptions.FormCreate(Sender: TObject);
var
  I: Integer;
  StyleName: string;
begin
  // Загрузка сохранённых опций интерфейса
  ReadIniFile;

  // Включение стилей интерфейса в комбобокс
  for StyleName in TStyleManager.StyleNames do
    ComboBoxVclStyles.Items.Add(StyleName);
  ComboBoxVclStyles.ItemIndex := ComboBoxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  // Заполнение тем TreeView индексами
  for I := 0 to tvOptions.Items.Count - 1 do
  begin
    tvOptions.Items[i].ImageIndex := 0;
    tvOptions.Items[i].SelectedIndex := 1;
  end;

  // Выбор начальной темы узла дерева
  tvOptions.Items[1].Selected := True;
  tvOptionsClick(Self);
  // Подсветка темы узла после клика !
  tvOptions.Items[1].DropHighlighted := True;
  // Раскрываем все узлы дерева
  tvOptions.FullExpand;
  // В конце (!) наследование из fdForm
  inherited;
end;

//-----------------------------------------------------------------
// Показать линии, границы, фигуры и названия созвездий
//-----------------------------------------------------------------
procedure TfrmOptions.chbConstellationsClick(Sender: TObject);
begin
  CurrDir := DataDir + 'constellation\';
  if chbConstLines.Checked then
    frmAstroverus.LoadConstLines(CurrDir)
  else
    frmAstroverus.LinesConstellations.Nodes.Clear;
  if chbConstBounds.Checked then
    frmAstroverus.LoadConstBorders(CurrDir)
  else
    frmAstroverus.LinesConstBorders.Nodes.Clear;
end;

//-----------------------------------------------------------------
// Изменение стиля интерфейса, например тёмная тема
//-----------------------------------------------------------------
procedure TfrmOptions.ComboBoxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBoxVclStyles.Text);
end;

//-----------------------------------------------------------------
// Изменение активной страницы PageControl
//-----------------------------------------------------------------
procedure TfrmOptions.tvOptionsClick(Sender: TObject);
begin
  tvOptions.Items[1].DropHighlighted := False;
  case tvOptions.Selected.Index of
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
// Чтение секций Инифайла
//--------------------------------------------------------------------
procedure TfrmOptions.ReadIniFile;
var
  IniFile: TIniFile;
begin
//  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    CheckBoxAxes.Checked := IniFile.ReadBool(frmOptions.Name, CheckBoxAxes.Name, True);
    CheckBoxRotate.Checked := IniFile.ReadBool(frmOptions.Name, CheckBoxRotate.Name, True);
  finally
    IniFile.Free;
  end;
end;

//---------------------------------------------------------
// Запись опций настройки в файл инициализации
//---------------------------------------------------------
procedure TfrmOptions.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    IniFile.WriteBool(frmOptions.Name, CheckBoxAxes.Name, CheckBoxAxes.Checked);
    IniFile.WriteBool(frmOptions.Name, CheckBoxRotate.Name, CheckBoxRotate.Checked);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//----------------------------------------------------------------------------
procedure TfrmOptions.ButtonOKClick(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); // чтобы не дублировать разделы
  WriteIniFile;
  frmOptions.Close;
end;

end.
