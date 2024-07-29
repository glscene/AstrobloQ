//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "fcGalactica.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TFormGalaktic *FormGalaktic;
//---------------------------------------------------------------------------
__fastcall TFormGalaktic::TFormGalaktic(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormGalaktic::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

