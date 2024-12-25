unit ddImages;

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
  TdmImages = class(TDataModule)
    ConstelCharts: TImageCollection;
    ConstelSymbols: TImageCollection;
    PlanetSymbols: TImageCollection;
    VirtPlanetSymbols: TVirtualImageList;
    VirtConstelSymbols: TVirtualImageList;
    ConstelFigures: TImageCollection;
    GLPlanetMaps: TGLMaterialLibrary;
    ImageListInterface: TImageList;
  private
  public
  end;

var
  dmImages: TdmImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
