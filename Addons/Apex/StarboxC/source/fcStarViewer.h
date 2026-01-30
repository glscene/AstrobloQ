//---------------------------------------------------------------------------

#ifndef fcStarViewerH
#define fcStarViewerH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "GLS.BaseClasses.hpp"
#include "GLS.Cadencer.hpp"
#include "GLS.Coordinates.hpp"
#include "GLS.Objects.hpp"
#include "GLS.Scene.hpp"
#include "GLS.SceneViewer.hpp"
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtDlgs.hpp>
#include <Vcl.CheckLst.hpp>
#include "GLS.SimpleNavigation.hpp"
//----
#include "GLS.BaseClasses.hpp"
#include "GLS.Coordinates.hpp"-----------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TStatusBar *StatusBar1;
	TGLSceneViewer *GLSceneViewer1;
	TGLScene *GLScene1;
	TGLCadencer *GLCadencer1;
	TTimer *Timer1;
	TMainMenu *MainMenu1;
	TMenuItem *File1;
	TMenuItem *OpenCSV1;
	TMenuItem *N1;
	TMenuItem *Exit1;
	TGLDummyCube *GLDummyCube1;
	TGLLightSource *GLLightSource1;
	TGLCamera *GLCamera1;
	TOpenTextFileDialog *OpenTextFileDialog1;
	TGLPoints *GLPoints1;
	TPanel *Panel1;
	TGLSimpleNavigation *GLSimpleNavigation1;
	TButton *Button1;
	TGLPoints *GLTypeO;
	TGLPoints *GLTypeB;
	TGLPoints *GLTypeA;
	TGLPoints *GLTypeF;
	TGLPoints *GLTypeG;
	TGLPoints *GLTypeK;
	TGLPoints *GLTypeM;
	TLabel *Label2;
	TShape *ShapeO;
	TShape *ShapeA;
	TShape *ShapeF;
	TShape *ShapeG;
	TShape *ShapeK;
	TShape *ShapeM;
	TShape *ShapeB;
	TCheckBox *chbO;
	TCheckBox *chbB;
	TCheckBox *chbA;
	TCheckBox *chbF;
	TCheckBox *chbG;
	TCheckBox *chbK;
	TCheckBox *chbM;
	void __fastcall GLSceneViewer1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall GLSceneViewer1MouseMove(TObject *Sender, TShiftState Shift, int X,
          int Y);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall GLCadencer1Progress(TObject *Sender, const double deltaTime, const double newTime);
	void __fastcall Exit1Click(TObject *Sender);
	void __fastcall btnClearClick(TObject *Sender);
	void __fastcall OpenCSV1Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall chbOClick(TObject *Sender);
	void __fastcall chbBClick(TObject *Sender);
	void __fastcall chbAClick(TObject *Sender);
	void __fastcall chbFClick(TObject *Sender);
	void __fastcall chbGClick(TObject *Sender);
	void __fastcall chbKClick(TObject *Sender);
	void __fastcall chbMClick(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
