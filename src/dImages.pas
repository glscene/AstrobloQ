unit dImages;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.VirtualImageList;

type
  TDataModuleImages = class(TDataModule)
    ImgCollectionPlanets: TImageCollection;
    ImgVirtPlanets: TVirtualImageList;
    ImageListInterface: TImageList;
  private
  public
  end;

var
  DataModuleImages: TDataModuleImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
