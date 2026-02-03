unit LUX.GPU.OpenGL.Atom.Imager.D2;

interface  

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Grid.T2,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D2,
     LUX.GPU.OpenGL.Atom.Imager;

type  

      

     

     //  TGLImager2D<_TItem_,_TIter_,_TGrid_>

     IGLImager2D = interface( IGLImager )
     ['{69B48023-273B-46B0-A8E4-AD79BABB51FD}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLImager2D<_TItem_:record;
                 _TIter_:TGLPixBufIter2D<_TItem_>,constructor;
                 _TGrid_:TGLPixBuf2D<_TItem_,_TIter_>,constructor> = class( TGLImager<_TItem_,_TIter_,_TGrid_>, IGLImager2D )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       
       procedure SendPixBuf; override;
     end;

     //  TGLPoiIma2D<_TItem_>

     IGLPoiIma2D = interface( IGLImager2D )
     ['{655EF4B2-51B3-4B2F-A9A6-25DBDC399981}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLPoiIma2D<_TItem_:record> = class( TGLImager2D<_TItem_,TGLPoiPixIter2D<_TItem_>,TGLPoiPix2D<_TItem_>>, IGLPoiIma2D )
     private
     protected
     public
     end;

     //  TGLCelIma2D<_TItem_>

     IGLCelIma2D = interface( IGLImager2D )
     ['{1088510C-E25B-47B9-8756-924DBB06BD03}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLCelIma2D<_TItem_:record> = class( TGLImager2D<_TItem_,TGLCelPixIter2D<_TItem_>,TGLCelPix2D<_TItem_>>, IGLCelIma2D )
     private
     protected
     public
     end;



 

//  

implementation //=========================================

uses System.Math;

//  

//  

//TGLImager2D<_TItem_,_TIter_,_TGrid_>







constructor TGLImager2D<_TItem_,_TIter_,_TGrid_>.Create;
begin
     inherited Create( GL_TEXTURE_2D );

end;

destructor TGLImager2D<_TItem_,_TIter_,_TGrid_>.Destroy;
begin

     inherited;
end;

//-------------------------------------------------------

procedure TGLImager2D<_TItem_,_TIter_,_TGrid_>.SendPixBuf;
begin
     Bind;
       glTexImage2D( _Kind, 0, _TexelF, _Grid.ElemsX,
                                        _Grid.ElemsY, 0,
                               _PixelF,
                               _PixelT, nil );
     Unbind;
end;

//TGLPoiIma2D<_TItem_>







//TGLCelIma2D<_TItem_>







//  

// 

initialization //===================== 


finalization // 

end.