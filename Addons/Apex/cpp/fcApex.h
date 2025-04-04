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
class TfrmApex : public TForm
{
__published:	// IDE-managed Components
	TControlBar *ControlBar;
	TStatusBar *StatusBar;
	TPanel *PanelLeft;
	TPanel *PanelTop;
	TPanel *PanelBottom;
	TTreeView *tvApex;
	TMainMenu *MainMenu1;
	TMenuItem *MenuItem1;
	TMenuItem *MenuItem2;
	TMenuItem *MenuItem3;
	TMenuItem *MenuItem4;
	TMenuItem *MenuItem5;
	TMenuItem *MenuItem6;
	TMenuItem *MenuItem7;
	TMenuItem *MenuItem8;
	TMenuItem *MenuItem9;
	TMenuItem *MenuItem10;
	TMenuItem *MenuItem11;
	TMenuItem *MenuItem12;
	TMenuItem *MenuItem13;
	TMenuItem *MenuItem14;
	TMenuItem *MenuItem15;
	TMenuItem *MenuItem16;
	TMenuItem *MenuItem17;
	TMenuItem *MenuItem18;
	TMenuItem *MenuItem19;
	TMenuItem *MenuItem20;
	TMenuItem *MenuItem21;
	TMenuItem *MenuItem22;
	void __fastcall tvApexClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall miExitClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmApex(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmApex *frmApex;
//---------------------------------------------------------------------------
#endif
