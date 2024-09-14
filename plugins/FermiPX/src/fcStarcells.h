//---------------------------------------------------------------------------

#ifndef fcStarcellsH
#define fcStarcellsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "GLScene.BaseClasses.hpp"
#include "GLS.Cadencer.hpp"
#include "GLScene.Coordinates.hpp"
#include "GLS.Objects.hpp"
#include "GLS.Scene.hpp"
#include "GLS.SceneViewer.hpp"
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtDlgs.hpp>
#include <Vcl.CheckLst.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <FireDAC.Phys.SQLite.hpp>
#include <FireDAC.Phys.SQLiteDef.hpp>
//#include <FireDAC.Phys.SQLiteWrapper.Stat.hpp>
#include <FireDAC.Stan.ExprFuncs.hpp>
#include "GLS.GeomObjects.hpp"
#include "GLS.VectorFileObjects.hpp"
#include "GLS.Mesh.hpp"
#include <FireDAC.Phys.SQLiteWrapper.Stat.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.ToolWin.hpp>

//---------------------------------------------------------------------------
struct DelaunayBase
{
	float *color;
	int nodeCount;
	double **node;
	int edgeCount;
	int **edge;
	//int faceCount;
	//int **face;
	//int tetraCount;
    //int **tetra;
};

struct VoronoiBase
{
	float *color;
	int nodeCount;
	double **node;
	int edgeCount;
	double **edge;
	//int faceCount;
	//int **face;
};

class TFormPÑ : public TForm
{
__published:	// IDE-managed Components
	TStatusBar *StatusBar1;
	TGLScene *GLScene1;
	TGLCadencer *GLCadencer1;
	TTimer *Timer1;
	TMainMenu *MainMenu;
	TGLDummyCube *dcGalablock;
	TGLLightSource *GLLightSource1;
	TGLCamera *GLCamera1;
	TOpenTextFileDialog *OpenTextFileDialog1;
	TGLPoints *GLStars;
	TMenuItem *miMode;
	TMenuItem *miStars;
	TMenuItem *miTetranet;
	TMenuItem *miPolynet;
	TMenuItem *N1;
	TMenuItem *miExit;
	TFDConnection *FDConnection1;
	TFDQuery *FDQuery1;
	TMenuItem *miStart;
	TFDPhysSQLiteDriverLink *FDPhysSQLiteDriverLink1;
	TGLLines *GLLines1;
	TGLPolygon *GLPolygon1;
	TGLTetrahedron *GLTetrahedron1;
	TGLFreeForm *GLFreeForm1;
	TMenuItem *miCatalog;
	TMenuItem *N2;
	TMenuItem *miFile;
	TMenuItem *N3;
	TMenuItem *N4;
	TMenuItem *N5;
	TMenuItem *N6;
	TMenuItem *miAbout;
	TMenuItem *miSpace;
	TPageControl *PageControl1;
	TTabSheet *tsSolarCube;
	TTabSheet *tsCatalog;
	TGLSceneViewer *GLSceneViewer1;
	TPanel *Panel1;
	TCheckListBox *chlbClass;
	TLabel *LabelStarClass;
	TControlBar *ControlBar1;
	TMenuItem *miGalagrid;
	TMenuItem *ools1;
	TMenuItem *Starlife1;
	TToolBar *ToolBar1;
	TToolButton *ToolButton1;
	TMenuItem *miOptions;
	void __fastcall GLSceneViewer1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall GLSceneViewer1MouseMove(TObject *Sender, TShiftState Shift, int X,
          int Y);
	void __fastcall FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall GLCadencer1Progress(TObject *Sender, const double deltaTime, const double newTime);
	void __fastcall miExitClick(TObject *Sender);
	void __fastcall miStarsClick(TObject *Sender);
	void __fastcall miTetranetClick(TObject *Sender);
	void __fastcall miPolynetClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall miStartClick(TObject *Sender);
	DelaunayBase __fastcall InitDelaunay(String filename, float color[]);
	VoronoiBase __fastcall InitVoronoi(String filename, float color[]);
	void __fastcall InitDraw();
	void __fastcall DrawStars();
	void __fastcall DrawDelaunay();
	void __fastcall DrawVoronoi();
	void __fastcall chlbClassClickCheck(TObject *Sender);
	void __fastcall miCatalogClick(TObject *Sender);
	void __fastcall Starlife1Click(TObject *Sender);
	void __fastcall miOptionsClick(TObject *Sender);
	void __fastcall miAboutClick(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TFormPÑ(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormPÑ *FormPÑ;
extern TFileName datapath;
//---------------------------------------------------------------------------
#endif
