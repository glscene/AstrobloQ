//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "fcForm.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormC *FormC;
//---------------------------------------------------------------------------
__fastcall TFormC::TFormC(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFormC::ReadIniFile()
{
    TIniFile* IniFile;

    IniFile = new TIniFile(ChangeFileExt(ParamStr(0), ".ini"));
    try {
        // use correct argument names
        LangID = IniFile->ReadInteger("FormSettings", "rgLanguage", 0);
    } catch (Exception &exception) {
        IniFile->Free();
    }
}

