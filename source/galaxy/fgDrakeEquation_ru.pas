unit fgDrakeEquation_ru;

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

  fmFormFirst;

type
  TFormDrakeQuation = class(TfrmFirst)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    grbDrakeFormula: TGroupBox;
    lbNs: TLabel;
    lbNt: TLabel;
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
    EditDp: TEdit;
    nbFp: TNumberBox;
    stMult5: TStaticText;
    nbNs: TNumberBox;
    ButtonCalculate: TButton;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
  private

  public

  end;

var
  FormDrakeQuation: TFormDrakeQuation;

implementation //==============================================================

uses
  fgOptions_ru;

{$R *.dfm}


//--------------------------- Вычисление --------------------------------------
procedure TFormDrakeQuation.ButtonCalculateClick(Sender: TObject);
var
  Ns, Nt, Np : Extended;
  Fp, Fb, Fn, Ft, Vg, Ratio : Extended;
  Ds, // Расстояние между звёздами
  Dp: Extended; // Расстояние между планетами
  Lc, Ls: LONG64;
begin
  Ns := nbNs.Value;
  frmOptions.EditNs.Text := FloatToStr(Ns);
  Fp := nbFp.Value;
  Np := nbNl.Value;
  Fb := nbFb.Value;
  Fn := nbFn.Value;
  Ft := nbFt.Value;
(*
  Lc := StrToInt64(EditLc.Text);
  Ls := StrToInt64(EditLs.Text);
  Ratio := Lc/Ls;
*)
  // Число звёзд с экзопланетами без учёта долголетия в Ratio
  Nt := {1 Earth +} Round(Ns*Np*Fp*Fb*Fn*Ft (*Ratio*));
  EditNt.Text := FloatToStr(Nt);

  // Определение объёма цилиндра галактики
  Vg := Pi*Sqr(frmOptions.nbRg.Value)*frmOptions.nbHg.Value;
  frmOptions.EditVg.Text := FloatToStrF(Vg, ffFixed, 25, 2);
  // Средне расстояние между звёздами в галактике
  Ratio := Vg/Ns;
  Ds := Power(Ratio, 1/3); // or  Ds := Exp(ln(Ratio)/3);
  // Расстояние между звёздами
  frmOptions.EditDs.Text := FloatToStrF(Ds, ffFixed, 25, 2);

  // Среднее расстояние между планетными системами
  Ratio := Np*Vg/Nt;
  Dp := Power(Ratio, 1/3);
  // Вывод расстояния между экзопланетными системами
  EditDp.Text := FloatToStrF(Dp, ffFixed, 25, 2);
end;

procedure TFormDrakeQuation.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;


end.
