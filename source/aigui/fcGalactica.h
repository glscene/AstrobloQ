//---------------------------------------------------------------------------

#ifndef fcGalacticaH
#define fcGalacticaH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Menus.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TFormGalaktic : public TForm
{
__published:	// IDE-managed Components
	TMainMenu *MainMenu;
	TMenuItem *miFile;
	TMenuItem *miOpen;
	TMenuItem *miExit;
	TMenuItem *miView;
	TMenuItem *miOptions;
	TMenuItem *miSettings;
	TMenuItem *miHelp;
	TMenuItem *miWiki;
	TMenuItem *miAbout;
	void __fastcall miExitClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormGalaktic(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormGalaktic *FormGalaktic;
//---------------------------------------------------------------------------
#endif
