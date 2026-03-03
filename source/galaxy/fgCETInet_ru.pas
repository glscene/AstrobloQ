unit fgCETInet_ru;

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

  fmFormFirst, Vcl.Imaging.jpeg;

type
  TFormCETInet = class(TFormFirst)
    PanelBottom: TPanel;
    ButtonOk: TButton;
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    procedure ButtonOkClick(Sender: TObject);
  private

  public

  end;

var
  FormCETInet: TFormCETInet;

implementation //==============================================================

{$R *.dfm}

procedure TFormCETInet.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
