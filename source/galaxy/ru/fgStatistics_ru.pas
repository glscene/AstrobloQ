unit fgStatistics_ru;

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

  fmFormFirst,

  VCLTee.TeeGDIPlus,
  VCLTee.TeeProcs,
  VCLTee.TeePreviewPanel, Vcl.Imaging.jpeg;

type
  TfrmStatistics = class(TFormFirst)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    ButtonCalculate: TButton;
    TeePreviewPanel1: TTeePreviewPanel;
    TeeGDIPlus1: TTeeGDIPlus;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
  private

  public

  end;

var
  frmStatistics: TfrmStatistics;

implementation //==============================================================

uses
  fgOptions_ru;

{$R *.dfm}


//---------------------- Число техносфер с телепорталами -------------------
procedure TfrmStatistics.ButtonCalculateClick(Sender: TObject);
var
  Ns, Np, Nc, Nt: Extended; // число звёзд, планет, цивилизаций и техносфер
  Fp, Fb, Fn, Ft, Vg, Ratio: Extended; // фракции лито-, био-, ноо- и техносфер
  Ds, // среднее расстояние между звёздами
  Dp: Extended; // среднее расстояние между планетами
  Ls, Lc: LONG64;  // долголетие звезды и цивилизации
begin
end;

procedure TfrmStatistics.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;


end.
