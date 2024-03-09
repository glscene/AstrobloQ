unit fbMaximums;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Bio.Things;

type
  TFormMaximums = class(TForm)
    BackPanel: TPanel;
    panButtonBar: TPanel;
    panOKButton: TPanel;
    btnOK: TBitBtn;
    ListBox: TListBox;
    btnEdit: TBitBtn;
    Panel1: TPanel;
    btnDefaults: TBitBtn;
    EditMax: TEdit;
    procedure btnDefaultsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
  public
    procedure Refresh;
    procedure RefreshMaximums;
  end;

var
  FormMaximums: TFormMaximums;

//============================================================================
implementation

{$R *.dfm}

uses
  Bio.Globals;

procedure TFormMaximums.Refresh;
begin
  RefreshMaximums;
end;

procedure TFormMaximums.btnDefaultsClick(Sender: TObject);
begin
  gThings.DefaultMaximums;
  Refresh;
end;

procedure TFormMaximums.FormShow(Sender: TObject);
begin
  Refresh;
end;

procedure TFormMaximums.RefreshMaximums;
var
  i: integer;
begin
  ListBox.Clear;
  for i := 0 to cLastThing do
  begin
    ListBox.AddItem(
      ThingName(i) + ' ' + IntToStr(gThings.Maximums[i]),
      nil);
  end;
end;

procedure TFormMaximums.ListBoxClick(Sender: TObject);
begin
  // show the selected maximum value in the edit box
  if ListBox.ItemIndex <> -1 then
    EditMax.Text := IntToStr(gThings.Maximums[ListBox.ItemIndex]);
end;

procedure TFormMaximums.btnEditClick(Sender: TObject);
begin
  // save the maximum value from the edit box
  if ListBox.ItemIndex <> -1 then
  try
    StrToInt(EditMax.Text)
  finally
    gThings.Maximums[ListBox.ItemIndex] := StrToInt(EditMax.Text);
  end;
  Refresh;
end;

end.
