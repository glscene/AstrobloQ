//---------------------------------------------------------------------------

#ifndef fcApexH
#define fcApexH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
//---------------------------------------------------------------------------
class TFormApex : public TForm
{
__published:	// IDE-managed Components
	TControlBar *ControlBar;
	TStatusBar *StatusBar;
	TPanel *PanelLeft;
	TPanel *PanelTop;
	TPanel *PanelBottom;
	TTreeView *tvApex;
	TMainMenu *MainMenu;
	TMenuItem *miFile;
	TMenuItem *miNew;
	TMenuItem *Open1;
	TMenuItem *Save1;
	TMenuItem *SaveAs1;
	TMenuItem *N2;
	TMenuItem *miExit;
	TMenuItem *miEdit;
	TMenuItem *Undo1;
	TMenuItem *N5;
	TMenuItem *Cut1;
	TMenuItem *Copy1;
	TMenuItem *Paste1;
	TMenuItem *N4;
	TMenuItem *Find1;
	TMenuItem *Replace1;
	TMenuItem *Window1;
	TMenuItem *Hide1;
	TMenuItem *Show1;
	TMenuItem *Help1;
	TMenuItem *Contents1;
	TMenuItem *miAbout;
	void __fastcall tvApexClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall miExitClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormApex(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormApex *FormApex;
//---------------------------------------------------------------------------
#endif
