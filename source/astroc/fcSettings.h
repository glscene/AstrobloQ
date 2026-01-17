//---------------------------------------------------------------------------

#ifndef fcSettingsH
#define fcSettingsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmSettings : public TForm
{
__published:	// IDE-managed Components
	TPanel *PanelTop;
	TPanel *Panel1;
	TButton *ButtonMercury;
	TButton *ButtonVenus;
	TButton *ButtonEarth;
	TButton *ButtonMars;
	TButton *ButtonJupiter;
	TButton *ButtonSaturn;
	TButton *ButtonUranus;
	TButton *ButtonNeptune;
	TButton *ButtonPluto;
	TCheckBox *chbRotate;
	TCheckBox *chbAxes;
	TCheckBox *chbPlanet;
	TCheckBox *chbGrid;
private:	// User declarations
public:		// User declarations
	__fastcall TfrmSettings(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmSettings *frmSettings;
//---------------------------------------------------------------------------
#endif
