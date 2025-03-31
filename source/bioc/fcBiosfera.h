//---------------------------------------------------------------------------

#ifndef fcBiosferaH
#define fcBiosferaH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Menus.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TFormBiocferax : public TForm
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
	TMenuItem *miSolarSystem;
	void __fastcall miExitClick(TObject *Sender);
	void __fastcall miAboutClick(TObject *Sender);
	void __fastcall miSettingsClick(TObject *Sender);
	void __fastcall miOpenClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormBiocferax(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormBiocferax *FormBiocferax;
//---------------------------------------------------------------------------
#endif
