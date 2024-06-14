unit dDialogs;

interface

uses
  System.SysUtils,
  System.Classes, Vcl.Dialogs, Vcl.ExtDlgs;

type
  TDataModuleDialogs = class(TDataModule)
    SaveTextFileDialog: TSaveTextFileDialog;
    OpenTextFileDialog: TOpenTextFileDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleDialogs: TDataModuleDialogs;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
