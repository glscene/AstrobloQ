unit flOptions;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Beacon.Components,
  System.Beacon,
  System.Bluetooth,

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
  Vcl.Samples.DirOutln,
  Vcl.ColorGrd,
  Vcl.Samples.Gauges,
  Vcl.CheckLst,
  Vcl.WinXCtrls,
  Vcl.NumberBox,

  fGLForm;

type
  TFormOptions = class(TFormGL)
    PanelBottom: TPanel;
    ButtonOK: TButton;
    PanelMiddle: TPanel;
    PageControl: TPageControl;
    tsMaterial: TTabSheet;
    ListView: TListView;
    ButtonModifyMat: TButton;
    tvOptions: TTreeView;
    PanelTop: TPanel;
    ImageList: TImageList;
    tsStars: TTabSheet;
    tsPlanets: TTabSheet;
    tsGeneral: TTabSheet;
    rgUnits: TRadioGroup;
    SpinEditPrecision: TSpinEdit;
    LabelPrecision: TLabel;
    grbPlanetGuts: TGroupBox;
    LabelIce: TLabel;
    nbIce: TNumberBox;
    nbWater: TNumberBox;
    LabelWater: TLabel;
    nbCrust: TNumberBox;
    LabelCrust: TLabel;
    nbMantle: TNumberBox;
    LabelMantle: TLabel;
    nbCore: TNumberBox;
    LabelCore: TLabel;
    chlbStarClasses: TCheckListBox;
    grbPlanetShow: TGroupBox;
    chbRotate: TCheckBox;
    chbShowAxes: TCheckBox;
    CheckBox4: TCheckBox;
    chbCore: TCheckBox;
    GroupBox1: TGroupBox;
    nbTilt: TNumberBox;
    LabelPlanetTilt: TLabel;
    nbDensity: TNumberBox;
    LabelPlanetDensity: TLabel;
    nbRadius: TNumberBox;
    LabelPlanetRadius: TLabel;
    nbGravityAccel: TNumberBox;
    LabelGravityAccel: TLabel;
    NumberBox7: TNumberBox;
    Label6: TLabel;
    chbAtmosfera: TCheckBox;
    GroupBox2: TGroupBox;
    chbConstFigures: TCheckBox;
    chbConstLines: TCheckBox;
    chbConstBounds: TCheckBox;
    chbClouds: TCheckBox;
    CheckBox1: TCheckBox;
    chbHidePlanet: TCheckBox;
    CheckBox3: TCheckBox;
    procedure tvOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure chbCoreClick(Sender: TObject);
    procedure chbAtmosferaClick(Sender: TObject);
    procedure chbHidePlanetClick(Sender: TObject);
  private
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  public
    //
    Node: TTreeNode;
    Nodes: TTreeNodes;
  end;

var
  FormOptions: TFormOptions;

//================================================
implementation

{$R *.dfm}

uses
  flLitosfera;

procedure TFormOptions.FormCreate(Sender: TObject);
begin
  // спектральные классы звёзд по умолчанию
	chlbStarClasses.Checked[0] := False;
 	chlbStarClasses.Checked[1] := False;
 	chlbStarClasses.Checked[2] := False;
	chlbStarClasses.Checked[3] := True;
 	chlbStarClasses.Checked[4] := True;
 	chlbStarClasses.Checked[5] := True;
 	chlbStarClasses.Checked[6] := True;

//  создание новых узлов
//  Nodes := TTreeNodes.Create (tvSettings);
//  Node := TTreeNode.Create (Nodes);
//  Node := nil;

  // Заполнение индексов узлов дерева установок
  for var I: Integer := 0 to tvOptions.Items.Count - 1 do
  begin
    tvOptions.Items[I].ImageIndex := 0;
    tvOptions.Items[I].SelectedIndex := 1;
    tvOptions.Items[I].StateIndex := I;
  end;
  // 0 - Общие 1- Материал 2 - Планеты 3 - Звёзды
  tvOptions.Select(tvOptions.Items[2]);
  tvOptions.FullExpand;
  tvOptions.Items[2].DropHighlighted := True;
  tvOptionsClick(Self);
end;

//
// Показать сечение планеты с ядром
//
procedure TFormOptions.chbAtmosferaClick(Sender: TObject);
begin
  // FormLitosfera.Atmosphere;
end;

procedure TFormOptions.chbCoreClick(Sender: TObject);
begin
  FormLitosfera.PlanetCore;
end;

procedure TFormOptions.chbHidePlanetClick(Sender: TObject);
begin
  FormLitosfera.ShowHidePlanet;
end;

//---------------------------------------------------------
procedure TFormOptions.tvOptionsClick(Sender: TObject);
begin
  case tvOptions.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsMaterial;
     2: PageControl.ActivePage := tsPlanets;
     3: PageControl.ActivePage := tsStars;
  end;
end;


//------------------------------------------------------------
procedure TFormOptions.ReadIniFile;
begin
  inherited;
  //
end;

//------------------------------------------------------------
procedure TFormOptions.WriteIniFile;
begin
//
end;

//--------------------------------------------------------------
procedure TFormOptions.ButtonOKClick(Sender: TObject);
begin
  Close;
end;


end.
