//-------------------------------------
// This unit is part of AstroLibrary
//-------------------------------------

/* The fcForm unit for TFormC class as parent for all child forms */

//---------------------------------------------------------------------------

#ifndef fcFormFirstH
#define fcFormFirstH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.IniFiles.hpp>

//---------------------------------------------------------------------------
class TFormFirst : public TForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
    int LangID;
    void __fastcall ReadIniFile();
	__fastcall TFormFirst(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormFirst *FormFirst;
//---------------------------------------------------------------------------
#endif
