unit fAnalyzer;

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

  fGLForm;

type
  TFormAnalyzer = class(TFormGL)
    tvAnalyzer: TTreeView;
    PageControl: TPageControl;
    tsAverageDistance: TTabSheet;
    tsDrakeFormula: TTabSheet;
    tsStarTrek: TTabSheet;
    StaticText3: TStaticText;
    StaticText1: TStaticText;
    NumberBox1: TNumberBox;
    nbDc: TNumberBox;
    StaticText2: TStaticText;
    StaticTextDc: TStaticText;
    PanelBottom: TPanel;
    ButtonOk: TButton;
    procedure tvAnalyzerClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnalyzer: TFormAnalyzer;

implementation

{$R *.dfm}

procedure TFormAnalyzer.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormAnalyzer.tvAnalyzerClick(Sender: TObject);
begin
  inherited;
  tvAnalyzer.Items[1].DropHighlighted := False;
  case tvAnalyzer.Selected.StateIndex of
     0: PageControl.ActivePage := tsAverageDistance;
     1: PageControl.ActivePage := tsDrakeFormula;
     2: PageControl.ActivePage := tsStarTrek;
  end;
end;

end.
