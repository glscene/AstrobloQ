unit fbImages;

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
  TfmImages = class(TForm)
    panImages: TPanel;
    imgIcons: TImageList;
  private
     
  public
     
  end;

var
  fmImages: TfmImages;

implementation

uses
  fbFirstForm;

{$R *.DFM}

end.
