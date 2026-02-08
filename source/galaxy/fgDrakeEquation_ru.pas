unit fgDrakeEquation_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
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
    tvAnalyzer: TTreeView;
    PageControl: TPageControl;
    tsAverageDistance: TTabSheet;
    tsDrakeEquation: TTabSheet;
    PanelBottom: TPanel;
    ButtonOk: TButton;
    NumberBox1: TNumberBox;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    procedure tvAnalyzerClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
  private

  public

  end;

var
  FormDrakeQuation: TFormDrakeQuation;

implementation //==============================================================

{$R *.dfm}

procedure TFormDrakeQuation.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormDrakeQuation.tvAnalyzerClick(Sender: TObject);
begin
  inherited;
  tvAnalyzer.Items[1].DropHighlighted := False;
  case tvAnalyzer.Selected.StateIndex of
     0: PageControl.ActivePage := tsAverageDistance;
     1: PageControl.ActivePage := tsDrakeEquation;
  end;
end;

end.
