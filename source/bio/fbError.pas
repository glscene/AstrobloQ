unit fbError;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  IdBaseComponent,
  IdComponent,
  IdTCPServer,
  IdSMTPServer,
  IdMessage,
  IdTCPConnection,
  IdTCPClient,
  IdMessageClient,
  IdSMTP,
  Vcl.Buttons;

type
  TFormError = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    memReport: TMemo;
    Panel4: TPanel;
    Button4: TButton;
    btnSaveWorld: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure btnHaltClick(Sender: TObject);
    procedure btnSaveWorldClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    fError: Exception;
  public

    property Error: Exception read fError write fError;
  end;

var
  FormError: TFormError;

implementation //-------------------------------------------------------------

{$R *.dfm}

uses
  fbFirstForm;

procedure TFormError.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFormError.Label2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://gitverse.ru/glscene/AstrobloQ',
    '', '', SW_SHOW);
end;

procedure TFormError.Label4Click(Sender: TObject);
var
  myEmail: string;
  myFileName: string;
begin
  myFileName := ExtractFilePath(ParamStr(0)) + 'debug.txt';
  memReport.Lines.SaveToFile(myFileName);

  myEmail := 'telegram:https://t.me/glscene' + memReport.Lines.Strings[0] +
    '&body=Please type a short story of your bug encounter, and paste the error report ' +
    #13#10 + Error.ClassName + ', ' + Error.Message;

  ShellExecute(0, 'open', PChar(myEmail), '', '', SW_SHOW);
end;

procedure TFormError.btnHaltClick(Sender: TObject);
begin
  Halt;
end;

procedure TFormError.btnSaveWorldClick(Sender: TObject);
begin
  FormFirst.RealityForm.SaveAs1Click(Sender);
end;

procedure TFormError.FormShow(Sender: TObject);
begin
  memReport.SelectAll;
  memReport.SetFocus;
end;

end.
