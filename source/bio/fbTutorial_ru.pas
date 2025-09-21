unit fbTutorial_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmTutorial = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    redIntro: TRichEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    btnRun: TBitBtn;
  private
     
  public
     
  end;

var
  frmTutorial: TfrmTutorial;

implementation

{$R *.dfm}

end.
