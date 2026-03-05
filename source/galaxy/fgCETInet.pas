unit fgCETInet;

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
  TfrmCETInet = class(TFormFirst)
    PageControl: TPageControl;
    PanelBottom: TPanel;
    ButtonOk: TButton;
    procedure ButtonOkClick(Sender: TObject);
  private

  public

  end;

var
  frmCETInet: TfrmCETInet;

implementation //==============================================================

{$R *.dfm}

procedure TfrmCETInet.ButtonOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
