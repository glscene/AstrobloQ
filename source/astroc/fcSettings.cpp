//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "fcSettings.h"
#include "fcAstroScene.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormSettings *FormSettings;
//---------------------------------------------------------------------------
__fastcall TFormSettings::TFormSettings(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormSettings::chbAxesClick(TObject *Sender)
{
  FormAstroScene->dcArrows->Visible = chbAxes->Checked;
}
//---------------------------------------------------------------------------

