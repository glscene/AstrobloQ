/****************************************************************************
						   AstrobloQ System
*****************************************************************************/
#pragma hdrstop

#include "dcImages.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TdmImages *dmImages;
//---------------------------------------------------------------------------
__fastcall TdmImages::TdmImages(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
