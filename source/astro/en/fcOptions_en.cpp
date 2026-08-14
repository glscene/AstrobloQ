/****************************************************************************
						   AstrobloQ System
*****************************************************************************/
#include <vcl.h>
#pragma hdrstop

#include "fcOptions_en.h"
#include "fcAstroScene_ru.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormOptions *FormOptions;
//---------------------------------------------------------------------------
__fastcall TFormOptions::TFormOptions(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormOptions::chbAxesClick(TObject *Sender)
{
  FormAstroScene->dcArrows->Visible = chbAxes->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormOptions::chbPlanetClick(TObject *Sender)
{
  FormAstroScene->dcPlanet->Visible = chbPlanet->Checked;
}

//---------------------------------------------------------------------------
//                       Показать меридианы и параллели
//---------------------------------------------------------------------------
void __fastcall TFormOptions::chbGridClick(TObject *Sender)
{
  FormAstroScene->dcGlobeGrid->Visible = chbGrid->Checked;
}
//---------------------------------------------------------------------------

