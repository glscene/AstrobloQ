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
  TdmImages = class(TDataModule)
    PlanetSymbols: TImageCollection;
    VirtPlanetSymbols: TVirtualImageList;
    ImageListInterface: TImageList;
    PlanetMaps: TImageCollection;
    GLPlanetMaps: TGLMaterialLibrary;
    GLMatLib: TGLMaterialLibrary;
  private
  public
  end;

var
  dmImages: TdmImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
