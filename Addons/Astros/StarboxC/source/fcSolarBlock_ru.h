
//---------------------------------------------------------------------------

#ifndef fcSolarBlock_ruH
#define fcSolarBlock_ruH
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
class TFormSolarBlock : public TForm
{
__published:	// IDE-managed Components
	TGLSceneViewer *GLSceneViewer1;
	TGLScene *GLScene1;
	TGLCadencer *GLCadencer1;
	TTimer *Timer1;
	TGLCamera *GLCamera1;
	TGLLightSource *GLLightSource1;
	TGLDummyCube *dcBlock;
	TPanel *PanelLeft;
	TButton *btnDraw;
	TMainMenu *MainMenu1;
	TSpinEdit *seNStars;
	TStaticText *StaticText1;
	TMenuItem *N1;
	TMenuItem *N2;
	TMenuItem *N3;
	TComboBox *cbContainer;
	TLabel *Label1;
	TMenuItem *miOpen;
	TMenuItem *miExit;
	TMenuItem *miType;
	TMenuItem *miAbout;
	TGLPoints *Stars;
	TButton *ButtonClear;
	TMenuItem *N4;
	TMenuItem *miTetranet;
	TMenuItem *miUnifornet;
	TMenuItem *miInterpolate;
	TMenuItem *N5;
	TMenuItem *miConvolute;
	TMenuItem *N6;
	TMenuItem *N7;
	TMenuItem *N8;
	TMenuItem *N9;
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
	void __fastcall miExitClick(TObject *Sender);
	void __fastcall miAboutClick(TObject *Sender);
	void __fastcall miTypeClick(TObject *Sender);
	void __fastcall ButtonClearClick(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);

private:

public:		// User declarations
	__fastcall TFormSolarBlock(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormSolarBlock *FormSolarBlock;
//---------------------------------------------------------------------------
#endif
