unit dbImages;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,

  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.ImgList,
  Vcl.VirtualImageList,
  Vcl.Controls;

type
  TDataModuleImages = class(TDataModule)
    VirtualImageListBio: TVirtualImageList;
    ImageCollectionBio: TImageCollection;
    ImageListIcons: TImageList;
  private
  public
  end;

var
  DataModuleImages: TDataModuleImages;

implementation // ===========================================================

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
