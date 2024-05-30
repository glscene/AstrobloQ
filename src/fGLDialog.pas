unit fGLDialog;

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
  fGLForm,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFormGLDialog = class(TFormGL)
    PanelTop: TPanel;
    PanelMiddle: TPanel;
    Memo: TMemo;
    PanelBottom: TPanel;
    ButtonOK: TButton;
    ButtonCancel: TButton;
  private
  public
    function Execute: boolean; virtual;
    procedure ReadIniFile; override;
  end;

var
  FormGLDialog: TFormGLDialog;

implementation

{$R *.dfm}

{ TGLForm1 }

function TFormGLDialog.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TFormGLDialog.ReadIniFile;
begin
  inherited;
  //
end;

end.
