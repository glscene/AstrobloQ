//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "fcApex.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmApex *frmApex;
//---------------------------------------------------------------------------
__fastcall TfrmApex::TfrmApex(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmApex::tvApexClick(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------

void __fastcall TfrmApex::FormCreate(TObject *Sender)
{
  tvApex->Select(tvApex->Items->Item[0]);  // goto to column 0
  tvApexClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TfrmApex::miExitClick(TObject *Sender)
{
 Close();
}
//---------------------------------------------------------------------------

