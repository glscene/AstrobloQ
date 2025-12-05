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
  Vcl.Controls,

  GLS.BaseClasses,
  GLS.Material;

type
  TDataModuleImages = class(TDataModule)
    ConstelCharts: TImageCollection;
    ConstelSymbols: TImageCollection;
    PlanetSymbols: TImageCollection;
    VirtPlanetSymbols: TVirtualImageList;
    VirtConstelSymbols: TVirtualImageList;
    ImageListInterface: TImageList;
    PlanetMaps: TImageCollection;
    VirtPlanetMaps: TVirtualImageList;
    MatLibStars: TGLMaterialLibrary;
    MoonMaps: TImageCollection;
    VirtMoonMaps: TVirtualImageList;
    StarSymbols: TImageCollection;
    MatLibPlanets: TGLMaterialLibrary;
    MatLibAsteroids: TGLMaterialLibrary;
    MatLibComets: TGLMaterialLibrary;
    MatLibMoons: TGLMaterialLibrary;
  private
  public
  end;

var
  DataModuleImages: TDataModuleImages;

implementation //=============================================================

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
