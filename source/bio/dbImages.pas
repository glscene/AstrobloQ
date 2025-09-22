unit dbImages;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.Controls;

type
  TDataModuleImages = class(TDataModule)
    VirtualImageListBio: TVirtualImageList;
    ImageCollectionBio: TImageCollection;
    ImageListIcons: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleImages: TDataModuleImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
