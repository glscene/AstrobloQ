unit dDialogs;

interface

uses
  System.SysUtils,
  System.Classes, Vcl.Dialogs, Vcl.ExtDlgs;

type
  TdmDialogs = class(TDataModule)
    SaveTextFileDialog: TSaveTextFileDialog;
    OpenTextFileDialog: TOpenTextFileDialog;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDialogs: TdmDialogs;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
