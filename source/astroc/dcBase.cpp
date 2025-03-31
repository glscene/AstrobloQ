//---------------------------------------------------------------------------


#pragma hdrstop

#include "dcBase.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TdmBase *dmBase;
//---------------------------------------------------------------------------
__fastcall TdmBase::TdmBase(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
