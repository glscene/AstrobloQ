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
  TdfImages = class(TDataModule)
    ImgCollectionPlanets: TImageCollection;
    ImgPlanetSymbols: TImageList;
    ImgVirtPlanets: TVirtualImageList;
    ImgExoplanetSymbols: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dfImages: TdfImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
