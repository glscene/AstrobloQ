/****************************************************************************
						   AstrobloQ System
*****************************************************************************/
#include <vcl.h>
#pragma hdrstop

#include "fcFormFirst.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormFirst *FormFirst;
//---------------------------------------------------------------------------
__fastcall TFormFirst::TFormFirst(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFormFirst::ReadIniFile()
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

