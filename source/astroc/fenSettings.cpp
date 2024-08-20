//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "fenSettings.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TFormSettings *FormSettings;
//---------------------------------------------------------------------------
__fastcall TFormSettings::TFormSettings(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
