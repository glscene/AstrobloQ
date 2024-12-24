//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "fcApex.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormApex *FormApex;
//---------------------------------------------------------------------------
__fastcall TFormApex::TFormApex(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormApex::tvApexClick(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------

void __fastcall TFormApex::FormCreate(TObject *Sender)
{
  tvApex->Select(tvApex->Items->Item[0]);  // goto to column 0
  tvApexClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TFormApex::miExitClick(TObject *Sender)
{
 Close();
}
//---------------------------------------------------------------------------

