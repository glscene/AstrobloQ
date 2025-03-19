
//---------------------------------------------------------------------------

#ifndef fcGenStarsH
#define fcGenStarsH
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
#include "GLS.Coordinates.hpp"
#include "GLS.Objects.hpp"
#include <Vcl.Menus.hpp>
#include <Vcl.Samples.Spin.hpp>
#include "GLS.BaseClasses.hpp"
#include "GLS.Coordinates.hpp"
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtDlgs.hpp>
//---------------------------------------------------------------------------
class TFormGenstars : public TForm
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
	TRadioGroup *rgContainer;
	TButton *btnDraw;
	TMainMenu *MainMenu1;
	TSpinEdit *seNStars;
	TStaticText *StaticText1;
	TMenuItem *N1;
	TMenuItem *miOpen;
	TMenuItem *miSaveAs;
	TSaveTextFileDialog *SaveTextFileDialog1;
	TOpenTextFileDialog *OpenTextFileDialog1;
	TGLDummyCube *GLDummyCube1;
	TGLPoints *GLTypeM;
	TGLPoints *GLTypeK;
	TGLPoints *GLTypeG;
	TGLPoints *GLTypeF;
	TGLPoints *GLTypeA;
	TGLPoints *GLTypeB;
	TGLPoints *GLTypeO;
	TGLPoints *GLPoints1;
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
	void __fastcall miOpenClick(TObject *Sender);
	void __fastcall miSaveAsClick(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TFormGenstars(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormGenstars *FormGenstars;
//---------------------------------------------------------------------------
#endif
