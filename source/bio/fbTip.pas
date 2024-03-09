unit fbTip;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.buttons,
  Vcl.comctrls,

  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFormTip = class(TForm)
    bClose: TBitBtn;
    bNextTip: TBitBtn;
    bRandomTip: TBitBtn;
    cbxShowTips: TCheckBox;
    Image: TImage;
    lblTitle: TLabel;
    mbTip: TMemo;
    pnlBottom: TPanel;
    pnlTip: TPanel;
    pnlTipDetails: TPanel;
    status: TStatusBar;
    bPreviousTip: TBitBtn;
    procedure bNextTipClick(Sender: TObject);
    procedure bRandomTipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bPreviousTipClick(Sender: TObject);
    procedure cbxShowTipsClick(Sender: TObject);
  private
    procedure UpdateStatus;
    procedure GetATip;
  public
    numtip: word;
    FormTips: TStringList;
    procedure LoadTipFile(aFile: string);
    procedure RandomTip;
  end;

implementation

{$R *.DFM}

// ------ TformGETip.FormClose ---------------------------------------------------
procedure TFormTip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormTips.Free;
end;

// ------ TformGETip.FormCreate ------------------------------------------------
procedure TFormTip.FormCreate(Sender: TObject);
begin
  FormTips := TStringList.Create;
end;

// ------ TformGETip.FormShow --------------------------------------------------
procedure TFormTip.FormShow(Sender: TObject);
begin
  if FormTips.Count = 0 then
    FormTips.Add('No tips found!');
  if FormTips.Count = 1 then
    bNextTip.Enabled := False;
  { ** load the last tip }
  if (numtip <= (FormTips.Count - 1)) then
    UpdateStatus
  else
    GetATip; { ** for out of bounds }
end;

// ------ TformGETip.bNextTipClick ---------------------------------------------
procedure TFormTip.bNextTipClick(Sender: TObject);
begin
  if (numtip >= (FormTips.Count - 1)) then
    numtip := 0
  else
    numtip := numtip + 1;
  UpdateStatus;
end;

// ------ TformGETip.bPreviousTipClick ---------------------------------------------
procedure TFormTip.bPreviousTipClick(Sender: TObject);
begin
  if (numtip <= 0) then
    numtip := (FormTips.Count - 1)
  else
    numtip := numtip - 1;
  UpdateStatus;
end;

// ------ TformGETip.bRandomTipClick -------------------------------------------
procedure TFormTip.bRandomTipClick(Sender: TObject);
begin
  GetATip;
end;

procedure TFormTip.cbxShowTipsClick(Sender: TObject);
begin

end;

// ------ TformGETip.GetATip ---------------------------------------------------
procedure TFormTip.GetATip;
begin
  Randomize;
  numtip := Random(FormTips.Count);
  UpdateStatus;
end;

// ------ TformGETip.UpdateStatus ----------------------------------------------
procedure TFormTip.UpdateStatus;

begin
  mbTip.Clear;
  mbTip.Text := FormTips.Strings[numtip];
  status.SimpleText := 'This is tip ' + IntToStr(numtip + 1) + ' of ' + IntToStr(FormTips.Count);
  pnlBottom.SetFocus;
end;

// ------ TformGETip.bCloseClick ----------------------------------------------
procedure TFormTip.bCloseClick(Sender: TObject);
begin
  Close;
end;

// ------ TformGETip.LoadTipFile ----------------------------------------------
procedure TFormTip.LoadTipFile(aFile: string);
begin
  if (aFile <> '') then
  begin
    if FileExists(aFile) then
      FormTips.LoadFromFile(aFile);
  end;
end;

// ------ TformGETip.RandomTip ----------------------------------------------
procedure TFormTip.RandomTip;
begin
  numtip := Random(FormTips.Count);
end;

// =============================================================================
end.
