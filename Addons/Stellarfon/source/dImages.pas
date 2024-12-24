unit dImages;

// The unit is part of the AstrobloQ

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Controls,
  GLS.BaseClasses,
  GLS.Material,
  Vcl.VirtualImageList,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection;

type
  TdmImages = class(TDataModule)
    ImageListInterface: TImageList;
    ImageCollection: TImageCollection;
    VirtualImageList: TVirtualImageList;
  private
  public
  end;

var
  dmImages: TdmImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
