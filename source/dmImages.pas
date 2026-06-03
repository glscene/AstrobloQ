(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
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
    ImageListInterface: TImageList;
    MLStarTypes: TGLMaterialLibrary;
    MLPlanetTypes: TGLMaterialLibrary;
    MLAsteroidTypes: TGLMaterialLibrary;
    MLCometTypes: TGLMaterialLibrary;
    MLMoonTypes: TGLMaterialLibrary;
  private
  public
  end;

var
  DataModuleImages: TDataModuleImages;

implementation //=============================================================

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
