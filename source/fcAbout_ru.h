//---------------------------------------------------------------------------

#ifndef fcAbout_ruH
#define fcAbout_ruH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Imaging.jpeg.hpp>
#include <Vcl.Imaging.pngimage.hpp>
//---------------------------------------------------------------------------
class TfrmAbout : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TPageControl *PageControl;
	TTabSheet *tsAstroScene;
	TImage *ImagePlanets;
	TPanel *PanelAllPlanets;
	TTabSheet *tsLitosfera;
	TImage *Image2;
	TPanel *PanelTerrasfera;
	TTabSheet *tsBiosphere;
	TImage *Image1;
	TPanel *PanelBiosfera;
	TTabSheet *tsTehnosfera;
	TImage *Image3;
	TPanel *PanelNoosfera;
	TTabSheet *tsDevelopers;
	TMemo *MemoTeam;
	TTabSheet *tsGalaqtium;
	TImage *ImageGalaxy;
	TPanel *PanelGalaktika;
	TTabSheet *tsUniversum;
	TImage *Image4;
	TPanel *PanelUniverse;
	TTabSheet *tsTools;
	TImage *GLSImage;
	TImage *AGCImage;
private:	// User declarations
public:		// User declarations
	__fastcall TfrmAbout(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmAbout *frmAbout;
//---------------------------------------------------------------------------
#endif
