unit fbImages_en;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.ImageList,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ImgList,
  Vcl.ExtCtrls;

type
  TfrmImages = class(TForm)
    panImages: TPanel;
    ImageListIcons: TImageList;
  private
     
  public
     
  end;

var
  frmImages: TfrmImages;

implementation //------------------------------------------------------------

uses
  fbFirstForm_en;

{$R *.DFM}

end.
