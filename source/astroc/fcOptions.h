//---------------------------------------------------------------------------

#ifndef fcOptionsH
#define fcOptionsH
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
	TCheckBox *chbGrid;
	void __fastcall chbAxesClick(TObject *Sender);
	void __fastcall chbPlanetClick(TObject *Sender);
	void __fastcall chbGridClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormOptions(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormOptions *FormOptions;
//---------------------------------------------------------------------------
#endif
