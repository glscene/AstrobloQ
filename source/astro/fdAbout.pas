unit fdAbout;

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
  Vcl.ExtCtrls,


  fdForm,
  udGlobals;

type
  TFormAbout = class(TFormI)
    Panel1: TPanel;
  private
  public
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

end.
