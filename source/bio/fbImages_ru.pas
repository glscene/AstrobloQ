unit fbImages_ru;

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
  Vcl.ImgList,
  Vcl.ExtCtrls,
  System.ImageList;

type
  TfrmImages = class(TForm)
    panImages: TPanel;
    ImageListIcons: TImageList;
  private
     
  public
     
  end;

var
  frmImages: TfrmImages;

implementation //-------------------------------------------------------------

uses
  fbFirstForm_ru;

{$R *.DFM}

end.
