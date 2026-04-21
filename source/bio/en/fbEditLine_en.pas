unit fbEditLine_en;

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
  Vcl.Buttons;

type
  TFormEditLine = class(TForm)
    edLine: TEdit;
    BitBtn1: TBitBtn;
    labName: TLabel;
    BitBtn2: TBitBtn;
  private
     
  public
     
  end;

var
  FormEditLine: TFormEditLine;

implementation //--------------------------------------------------------------

{$R *.DFM}

end.
