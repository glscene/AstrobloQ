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
	TLang *Langs;
	TMainMenu *MainMenu;
	TMenuItem *miFile;
	TMenuItem *MenuItemOpen;
	TMenuItem *MenuItemExit;
	TMenuItem *miView;
	TMenuItem *miTools;
	TMenuItem *miSettings;
	TMenuItem *miDivider1;
	TMenuItem *miAstrogen;
	TMenuItem *miHelp;
	TMenuItem *miWiki;
	TMenuItem *miAbout;
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
