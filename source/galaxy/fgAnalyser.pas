unit fgAnalyser;

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
  TFormAnalyser = class(TfrmFirst)
    tvAnalyzer: TTreeView;
    PageControl: TPageControl;
    tsAverageDistance: TTabSheet;
    tsDrakeFormula: TTabSheet;
    PanelBottom: TPanel;
    ButtonOk: TButton;
    NumberBox1: TNumberBox;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    procedure tvAnalyzerClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnalyser: TFormAnalyser;

implementation

{$R *.dfm}

procedure TFormAnalyser.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormAnalyser.tvAnalyzerClick(Sender: TObject);
begin
  inherited;
  tvAnalyzer.Items[1].DropHighlighted := False;
  case tvAnalyzer.Selected.StateIndex of
     0: PageControl.ActivePage := tsAverageDistance;
     1: PageControl.ActivePage := tsDrakeFormula;
  end;
end;

end.
