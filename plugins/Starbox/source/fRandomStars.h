//---------------------------------------------------------------------------

#ifndef fRandomStarsH
#define fRandomStarsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "GLS.SceneViewer.hpp"
#include "GLS.Cadencer.hpp"
#include "GLS.Scene.hpp"
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include "GLS.Objects.hpp"
#include <Vcl.Menus.hpp>
#include <Vcl.Samples.Spin.hpp>
#include "GLS.BaseClasses.hpp"
#include "GLS.Coordinates.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TGLSceneViewer *GLSceneViewer1;
	TGLScene *GLScene1;
	TGLCadencer *GLCadencer1;
	TTimer *Timer1;
	TStatusBar *StatusBar1;
	TGLCamera *GLCamera1;
	TGLLightSource *GLLightSource1;
	TGLDummyCube *dcBlock;
	TGLPoints *Stars;
	TPanel *PanelLeft;
	TButton *ButtonClear;
	TRadioGroup *rgBlock;
	TButton *btnDraw;
	TMainMenu *MainMenu1;
	TSpinEdit *seNStars;
	TStaticText *StaticText1;
	void __fastcall GLSceneViewer1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall GLSceneViewer1MouseMove(TObject *Sender, TShiftState Shift, int X,
          int Y);
	void __fastcall FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall GLCadencer1Progress(TObject *Sender, const double deltaTime, const double newTime);
	void __fastcall btnDrawClick(TObject *Sender);
	void __fastcall ButtonClearClick(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
