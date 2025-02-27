//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "fcBiosfera.h"
#include "fcAbout.h"
#include "fcSettings.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TFormBiocferax *FormBiocferax;
//---------------------------------------------------------------------------
__fastcall TFormBiocferax::TFormBiocferax(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFormBiocferax::miAboutClick(TObject* Sender)
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

void __fastcall TFormBiocferax::miSettingsClick(TObject *Sender)
{
   FormSettings->Show();
}

//---------------------------------------------------------------------------
void __fastcall TFormBiocferax::miExitClick(TObject *Sender)
{
  Close();
}

//---------------------------------------------------------------------------

void __fastcall TFormBiocferax::miOpenClick(TObject *Sender)
{
 //
}
//---------------------------------------------------------------------------

