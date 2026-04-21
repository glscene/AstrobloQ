unit fbKeyboard_en;

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
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFormKeyboard = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnRun: TBitBtn;
    Panel2: TPanel;
    redIntro: TRichEdit;
  private
     
  public
     
  end;

var
  FormKeyboard: TFormKeyboard;

implementation

{$R *.dfm}

end.
