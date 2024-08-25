unit ddDialogs;

interface

uses
  System.SysUtils,
  System.Classes,
  FMX.Dialogs,
  FMX.Types;

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
