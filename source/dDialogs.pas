unit dDialogs;

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
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
  end;

var
  dmDialogs: TdmDialogs;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDialogs.DataModuleCreate(Sender: TObject);
begin
  //
end;

end.
