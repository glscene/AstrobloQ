unit fbIntro_ru;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls;

type
  TFormIntro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnRun: TBitBtn;
    Panel5: TPanel;
    redStats: TRichEdit;
    redIntro: TRichEdit;
    procedure btnRunClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

    Monitors: integer;
  end;

var
  FormIntro: TFormIntro;

implementation

{$R *.DFM}

procedure TFormIntro.FormShow(Sender: TObject);
begin
  redStats.Clear;
  redStats.Lines.Add('system stats');
  redStats.Lines.Add(' monitors = ' + IntToStr(Monitors));
  if Monitors > 1 then
    redStats.Lines.Add(' multimonitor support enabled')
  else
    redStats.Lines.Add(' multimonitor support disabled');

  btnRun.SetFocus;
end;

procedure TFormIntro.btnRunClick(Sender: TObject);
begin
  Close;
end;

end.
