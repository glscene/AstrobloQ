(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fpCoco_en;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,
  System.DateUtils,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.NumberBox,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.WinXPickers,

  Apc.Math,
  Apc.PrecNut,
  Apc.Spheric,
  Apc.Sun,
  Apc.Time;

var
  X, Y, Z, XS, YS, ZS: Double;
  T, TEQX, TEQXN: Double;
  LS, BS, RS: Double;
  A: Double33;
  IsEclipt: Boolean;
  CharMode: Char;

type
  TfrmCoco = class(TForm)
    PanelTitle: TPanel;
    rgInput: TRadioGroup;
    rgOutput: TRadioGroup;
    Panel1: TPanel;
    gbXYZ: TGroupBox;
    LabelZ: TLabel;
    LabelY: TLabel;
    LabelX: TLabel;
    GroupBox1: TGroupBox;
    nbDeg: TNumberBox;
    nbX: TNumberBox;
    nbY: TNumberBox;
    nbZ: TNumberBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NumberBox3: TNumberBox;
    NumberBox4: TNumberBox;
    NumberBox5: TNumberBox;
    LabelL: TLabel;
    LabelB: TLabel;
    LabelR: TLabel;
    NumberBox7: TNumberBox;
    ButtonCalculate: TButton;
    nbMin: TNumberBox;
    nbSec: TNumberBox;
    NumberBox6: TNumberBox;
    NumberBox9: TNumberBox;
    NumberBox10: TNumberBox;
    nbDD: TNumberBox;
    LabelRad: TLabel;
    ButtonCalcDD: TButton;
    DateTimePicker1: TDateTimePicker;
    LabelEqinox: TLabel;
    procedure ButtonCalculateClick(Sender: TObject);
    procedure ButtonCalcDDClick(Sender: TObject);
  private
  public
    DD: Double;
  end;

var
  frmCoco: TfrmCoco;

implementation //==============================================================

{$R *.dfm}

procedure TfrmCoco.ButtonCalcDDClick(Sender: TObject);
var
 Deg, Min: Integer;
 Sec: Double;
begin
  Deg := Trunc(nbDeg.Value);
  Min := Trunc(nbMin.Value);
  Sec := nbMin.Value;
  Ddd(Deg, Min, Sec, DD);
  nbDD.Value := DD;
end;

procedure TfrmCoco.ButtonCalculateClick(Sender: TObject);
begin
  //   Compute Coco
end;

end.
