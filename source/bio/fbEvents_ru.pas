unit fbEvents_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormEvents = class(TForm)
    Panel22: TPanel;
    redEvents: TRichEdit;
    StatusBar1: TStatusBar;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  public
    procedure AddEvent(aEvent: string);
  end;

var
  FormEvents: TFormEvents;

implementation //--------------------------------------------------------------

uses
  fbFirstForm_ru;

{$R *.DFM}

procedure TFormEvents.AddEvent(aEvent: string);
begin
  redEvents.Lines.Add(aEvent);
end;

procedure TFormEvents.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  frmFirst.RealityForm.ManagerForm.DropEvents;
end;

end.
