//---------------------------------------------------------------------------

#ifndef dcImagesH
#define dcImagesH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.ImageList.hpp>
#include <Vcl.BaseImageCollection.hpp>
#include <Vcl.ImageCollection.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.VirtualImageList.hpp>
//---------------------------------------------------------------------------
class TdmImages : public TDataModule
{
__published:	// IDE-managed Components
	TImageCollection *ImageCollectionCharts;
	TImageCollection *ImageCollectionConsts;
	TVirtualImageList *VirtualSymbolConsts;
	TImageCollection *SymbolCollectionConsts;
	TVirtualImageList *VirtualSymbolPlanets;
	TImageCollection *SymbolCollectionPlanets;
private:	// User declarations
public:		// User declarations
	__fastcall TdmImages(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TdmImages *dmImages;
//---------------------------------------------------------------------------
#endif
