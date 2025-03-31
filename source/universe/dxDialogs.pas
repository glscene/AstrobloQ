unit dxDialogs;

interface

uses
  System.SysUtils,
  System.Classes,
  FMX.Dialogs,
  FMX.Types, Vcl.Dialogs;

type
  TdmDialogs = class(TDataModule)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
  private
  public
  end;

var
  dmDialogs: TdmDialogs;

implementation //-------------------------------------------------------------

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
