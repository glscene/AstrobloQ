unit fdDrake_ru;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  udGlobals;

type
  TFormDrake = class(TForm)
    PanelMain: TPanel;
    GroupBox1: TGroupBox;
    StaticTextNc: TStaticText;
    EditNc: TEdit;
    EditNs: TEdit;
    Label2: TLabel;
    EditFp: TEdit;
    Label3: TLabel;
    EditNe: TEdit;
    Label4: TLabel;
    EditFl: TEdit;
    Label5: TLabel;
    EditFi: TEdit;
    Label6: TLabel;
    EditFc: TEdit;
    Label7: TLabel;
    ButtonNs: TButton;
    Label1: TLabel;
    EditfH: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButtonNsClick(Sender: TObject);
  private
    Ns, fp, ne, fl, fi, fc, fh: double;
  public
  end;

var
  FormDrake: TFormDrake;

implementation

{$R *.dfm}

//--------------------------------------------------------------------

procedure TFormDrake.FormCreate(Sender: TObject);
begin
  EditNs.Text := FloatToStr(cNs);
end;

//--------------------------------------------------------------------

procedure TFormDrake.ButtonNsClick(Sender: TObject);
var
  sNumber: String;
begin
  Ns := StrToFloat(EditNs.Text);
  fp := StrToFloat(EditFp.Text);
  ne := StrToFloat(EditNe.Text);
  fl := StrToFloat(EditFl.Text);
  fi := StrToFloat(EditFi.Text);
  fc := StrToFloat(EditFc.Text);
  fh := StrToFloat(EditFh.Text);
  Ns := Ns * fp * ne * fl * fi * fc * fh;

  Str(Ns:5:0, sNumber);
  EditNc.Text := sNumber;
end;

end.
