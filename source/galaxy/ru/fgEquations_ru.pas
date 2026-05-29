(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fgEquations_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.NumberBox,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,

  fmFormFirst;

type
  TfrmEquations = class(TFormFirst)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    grbDrakeFormula: TGroupBox;
    lbNs: TLabel;
    lbNp: TLabel;
    lbFl: TLabel;
    lbFb: TLabel;
    lbFn: TLabel;
    lbFt: TLabel;
    lbFp: TLabel;
    Label4: TLabel;
    nbFn: TNumberBox;
    nbFb: TNumberBox;
    nbNl: TNumberBox;
    EditNt: TEdit;
    stMult1: TStaticText;
    stMult2: TStaticText;
    stMult3: TStaticText;
    stMult4: TStaticText;
    stEqual: TStaticText;
    nbFt: TNumberBox;
    EditDt: TEdit;
    nbFp: TNumberBox;
    stMult5: TStaticText;
    nbNs: TNumberBox;
    GroupBox1: TGroupBox;
    LabelNs: TLabel;
    LabelNc: TLabel;
    Labelne: TLabel;
    Labelfl: TLabel;
    Labelfi: TLabel;
    Labelfc: TLabel;
    Labelfp: TLabel;
    Label9: TLabel;
    NumberBox_fi: TNumberBox;
    NumberBox_fl: TNumberBox;
    NumberBox_fp: TNumberBox;
    Edit_Nc: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    NumberBox_fc: TNumberBox;
    Edit2: TEdit;
    NumberBox_ne: TNumberBox;
    StaticText6: TStaticText;
    NumberBox_Ns: TNumberBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    lbNh: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    NumberBox7: TNumberBox;
    NumberBox8: TNumberBox;
    NumberBox9: TNumberBox;
    Edit3: TEdit;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    NumberBox10: TNumberBox;
    Edit4: TEdit;
    NumberBox11: TNumberBox;
    StaticText12: TStaticText;
    NumberBox12: TNumberBox;
    Label18: TLabel;
    StaticText13: TStaticText;
    ButtonCalculate: TButton;
    StaticText14: TStaticText;
    NumberBox_L: TNumberBox;
    LabelL: TLabel;
    NumberBox1: TNumberBox;
    NumberBox2: TNumberBox;
    NumberBox3: TNumberBox;
    NumberBox4: TNumberBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    NumberBox5: TNumberBox;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
  private

  public

  end;

var
  frmEquations: TfrmEquations;

implementation //==============================================================

uses
  fgOptions_ru;

{$R *.dfm}

//----------------------------------------------------------------------------
//---------------------- Число техносфер с телепорталами ---------------------
//----------------------------------------------------------------------------
procedure TfrmEquations.ButtonCalculateClick(Sender: TObject);
var
  Ns, Np, Nc, Nt: Extended; // число звёзд, планет, цивилизаций и техносфер
  Fp, Fb, Fn, Ft, Vg, Ratio: Extended; // фракции лито-, био-, ноо- и техносфер
  Ds, // среднее расстояние между звёздами
  Dp: Extended; // среднее расстояние между планетами
  Ls, Lc: LONG64;  // долголетие звезды и цивилизации
begin
  Ns := nbNs.Value;
  FormOptions.EditNs.Text := FloatToStr(Ns);
  Fp := nbFp.Value;
  Np := nbNl.Value;
  Fb := nbFb.Value;
  Fn := nbFn.Value;
  Ft := nbFt.Value;
(*
  Ls := StrToInt64(EditLs.Text);
  Lc := StrToInt64(EditLc.Text);
  Ratio := Lc/Ls;
*)
  // Число звёзд с экзопланетами без учёта долголетия в Ratio
  Nc := {1 Earth +} Round(Ns*Np*Fp*Fb*Fn*Ft (*Ratio*));
///  Nt :=
  Edit_Nc.Text := FloatToStr(Nc);
  EditNt.Text := FloatToStr(Nt);

  // Определение объёма цилиндра галактики
  Vg := Pi*Sqr(FormOptions.nbRg.Value)*FormOptions.nbHg.Value;
  FormOptions.EditVg.Text := FloatToStrF(Vg, ffFixed, 25, 2);
  // Среднее расстояние между звёздами в галактике
  Ratio := Vg/Ns;
  Ds := Power(Ratio, 1/3); // or  Ds := Exp(ln(Ratio)/3);
  // Расстояние между звёздами
  FormOptions.EditDs.Text := FloatToStrF(Ds, ffFixed, 25, 2);

  // Среднее расстояние между планетными системами с цивилизациями
  Ratio := Np*Vg/Nc;
  Dp := Power(Ratio, 1/3);
  // Вывод расстояния между экзопланетными системами
  EditDt.Text := FloatToStrF(Dp, ffFixed, 25, 2);
end;

//-----------------------------------------------------------------------------
procedure TfrmEquations.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;


//-----------------------------------------------------------------------------
end.
