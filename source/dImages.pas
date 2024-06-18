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
  Vcl.VirtualImageList, GLS.BaseClasses, GLS.Material;

type
  TDataModuleImages = class(TDataModule)
    PlanetSymbols: TImageCollection;
    VirtPlanetSymbols: TVirtualImageList;
    ImageListInterface: TImageList;
    PlanetMaps: TImageCollection;
    GLPlanetMaps: TGLMaterialLibrary;
  private
  public
  end;

var
  DataModuleImages: TDataModuleImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
