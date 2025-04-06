unit dmImages;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,
  Vcl.ImgList,
  Vcl.VirtualImageList,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  GLS.BaseClasses,
  GLS.Material, Vcl.Controls;

type
  TDataModuleImages = class(TDataModule)
    ConstelCharts: TImageCollection;
    ConstelSymbols: TImageCollection;
    PlanetSymbols: TImageCollection;
    VirtPlanetSymbols: TVirtualImageList;
    VirtConstelSymbols: TVirtualImageList;
    ConstelFigures: TImageCollection;
    ImageListInterface: TImageList;
    GLPlanetMaps: TGLMaterialLibrary;
    PlanetMaps: TImageCollection;
    VirtPlanetMaps: TVirtualImageList;
  private
  public
  end;

var
  DataModuleImages: TDataModuleImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
