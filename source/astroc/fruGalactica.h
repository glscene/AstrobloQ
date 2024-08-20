//---------------------------------------------------------------------------

#ifndef fruGalacticaH
#define fruGalacticaH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Menus.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TFormGalactica : public TForm
{
__published:	// IDE-managed Components
	TMainMenu *MainMenu;
	TMenuItem *miFile;
	TMenuItem *miOpen;
	TMenuItem *miExit;
	TMenuItem *miView;
	TMenuItem *miTools;
	TMenuItem *miSettings;
	TMenuItem *miHelp;
	TMenuItem *miWiki;
	TMenuItem *miAbout;
	TLang *Langs;
	void __fastcall miExitClick(TObject *Sender);
	void __fastcall miAboutClick(TObject *Sender);
	void __fastcall miSettingsClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormGalactica(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormGalactica *FormGalactica;
//---------------------------------------------------------------------------
#endif
