unit ddDialogs;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs,
  Vcl.ExtDlgs;

type
  TdmDialogs = class(TDataModule)
    SaveTextFileDialog: TSaveTextFileDialog;
    OpenTextFileDialog: TOpenTextFileDialog;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    SavePictureDialog: TSavePictureDialog;
    OpenPictureDialog: TOpenPictureDialog;
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
