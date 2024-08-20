//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "fenGalaxyc.h"
#include "fruAbout.h"
#include "fruSettings.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TFormGalaxyc *FormGalaxyc;
//---------------------------------------------------------------------------
__fastcall TFormGalaxyc::TFormGalaxyc(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFormGalaxyc::miAboutClick(TObject* Sender)
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

void __fastcall TFormGalaxyc::miSettingsClick(TObject *Sender)
{
   FormSettings->Show();
}

//---------------------------------------------------------------------------
void __fastcall TFormGalaxyc::miExitClick(TObject *Sender)
{
  Close();
}

//---------------------------------------------------------------------------

