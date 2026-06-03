(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit daMaps_en;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.ImgList,
  Vcl.VirtualImageList;

type
  TDataModuleMaps = class(TDataModule)
    VirtPlanetMaps: TVirtualImageList;
    PlanetMaps: TImageCollection;
    VirtPlanetSymbols: TVirtualImageList;
    PlanetSymbols: TImageCollection;
    VirtMoonMaps: TVirtualImageList;
    ConstelFigures: TImageCollection;
    VirtConstelSymbols: TVirtualImageList;
    ConstelSymbols: TImageCollection;
    MoonMaps: TImageCollection;
    ConstelCharts: TImageCollection;
    StarSymbols: TImageCollection;
  private
  public
  end;

var
  DataModuleMaps: TDataModuleMaps;

implementation //==============================================================

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
