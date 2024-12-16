//---------------------------------------------------------------------------


#pragma hdrstop

#include "dcDialogs.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TdmDialogs *dmDialogs;
//---------------------------------------------------------------------------
__fastcall TdmDialogs::TdmDialogs(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
