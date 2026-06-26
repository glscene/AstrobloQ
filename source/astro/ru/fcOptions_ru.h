/****************************************************************************
						   AstrobloQ System
*****************************************************************************/
#ifndef fcOptions_ruH
#define fcOptions_ruH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TFormOptions : public TForm
{
__published:	// IDE-managed Components
	TPanel *PanelTop;
	TPanel *Panel1;
	TCheckBox *chbRotate;
	TCheckBox *chbAxes;
	TCheckBox *chbPlanet;
	TCheckBox *chbTopoGrid;
	void __fastcall chbAxesClick(TObject *Sender);
	void __fastcall chbPlanetClick(TObject *Sender);
	void __fastcall chbTopoGridClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormOptions(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormOptions *FormOptions;
//---------------------------------------------------------------------------
#endif
