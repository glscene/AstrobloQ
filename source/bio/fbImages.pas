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
  TFormImages = class(TForm)
    panImages: TPanel;
    ImageListIcons: TImageList;
  private
     
  public
     
  end;

var
  FormImages: TFormImages;

implementation

uses
  fbFirstForm;

{$R *.DFM}

end.
