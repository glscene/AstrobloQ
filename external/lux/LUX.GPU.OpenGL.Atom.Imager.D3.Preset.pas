unit LUX.GPU.OpenGL.Atom.Imager.D3.Preset;

interface  

uses System.UITypes,
     FMX.Graphics,
     LUX, LUX.GPU.OpenGL.Atom.Imager.D3;

type  

      

     

     //  TGLPoiIma3D_Single

     TGLPoiIma3D_Single = class( TGLPoiIma3D<Single> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //  TGLCelIma3D_Single

     TGLCelIma3D_Single = class( TGLCelIma3D<Single> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //  TGLPoiIma3D_TAlphaColorF

     TGLPoiIma3D_TAlphaColorF = class( TGLPoiIma3D<TAlphaColorF> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //  TGLCelIma3D_TAlphaColorF

     TGLCelIma3D_TAlphaColorF = class( TGLCelIma3D<TAlphaColorF> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;



 

//  

implementation // 

uses Winapi.OpenGL, Winapi.OpenGLext;

//  

//  

//TGLPoiIma3D_Single







constructor TGLPoiIma3D_Single.Create;
begin
     inherited;

     _TexelF := GL_R32F;
     _PixelF := GL_RED;
     _PixelT := GL_FLOAT;
end;

destructor TGLPoiIma3D_Single.Destroy;
begin

     inherited;
end;

//TGLCelIma3D_Single







constructor TGLCelIma3D_Single.Create;
begin
     inherited;

     _TexelF := GL_R32F;
     _PixelF := GL_RED;
     _PixelT := GL_FLOAT;
end;

destructor TGLCelIma3D_Single.Destroy;
begin

     inherited;
end;

//TGLPoiIma3D_AlphaColorF







constructor TGLPoiIma3D_TAlphaColorF.Create;
begin
     inherited;

     _TexelF := GL_RGBA32F;
     _PixelF := GL_RGBA;
     _PixelT := GL_FLOAT;
end;

destructor TGLPoiIma3D_TAlphaColorF.Destroy;
begin

     inherited;
end;

//TGLCelIma3D_AlphaColorF







constructor TGLCelIma3D_TAlphaColorF.Create;
begin
     inherited;

     _TexelF := GL_RGBA32F;
     _PixelF := GL_RGBA;
     _PixelT := GL_FLOAT;
end;

destructor TGLCelIma3D_TAlphaColorF.Destroy;
begin

     inherited;
end;

//  

// 

initialization // 

finalization // 

end.