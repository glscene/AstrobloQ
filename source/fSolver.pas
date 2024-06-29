unit fSolver;

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

  fGLForm, Vcl.ComCtrls;

type
  TFormSolver = class(TFormGL)
    tvSettings: TTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSolver: TFormSolver;

implementation

{$R *.dfm}

end.
