//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "fruGalactica.h"
#include "fruAbout.h"
#include "fruSettings.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TFormGalactica *FormGalactica;
//---------------------------------------------------------------------------
__fastcall TFormGalactica::TFormGalactica(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFormGalactica::miAboutClick(TObject* Sender)
{
    TFormAbout* FormAbout;
    FormAbout = new TFormAbout(this);
    try {
        FormAbout->ShowModal();
    } __finally
    {
        FormAbout->Free();
    }
}

//---------------------------------------------------------------------------

void __fastcall TFormGalactica::miSettingsClick(TObject *Sender)
{
   FormSettings->Show();
}

//---------------------------------------------------------------------------
void __fastcall TFormGalactica::miExitClick(TObject *Sender)
{
  Close();
}

//---------------------------------------------------------------------------

