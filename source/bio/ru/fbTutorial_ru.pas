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
  TFormTutorial = class(TForm)
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
  FormTutorial: TFormTutorial;

implementation

{$R *.dfm}

end.
