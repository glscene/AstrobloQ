//---------------------------------------------------------------------------

#ifndef fcStarCube_ruH
#define fcStarCube_ruH
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
#include <FireDAC.Stan.ExprFuncs.hpp>
#include "GLS.GeomObjects.hpp"
#include "GLS.VectorFileObjects.hpp"
#include "GLS.Mesh.hpp"
#include "GLS.SimpleNavigation.hpp"
#include <FireDAC.Phys.SQLiteWrapper.Stat.hpp>
//---------------------------------------------------------------------------


struct DelaunayBase
{
	int nodeCount;
	double **node;
	int edgeCount;
	int **edge;
};

struct VoronoiBase
{
	int nodeCount;
	double **node;
	int edgeCount;
	double **edge;
};


//---------------------------------------------------------------------------
class TFormStarcube : public TForm
{
__published:	// IDE-managed Components
	TGLSceneViewer *GLSceneViewer1;
	TGLScene *GLScene1;
	TGLCadencer *GLCadencer1;
	TTimer *Timer1;
	TMainMenu *MainMenu1;
	TGLDummyCube *GLDummyCube1;
	TGLCamera *GLCamera1;
	TOpenTextFileDialog *OpenTextFileDialog1;
	TGLPoints *GLPoints1;
	TMenuItem *Start1;
	TGLLines *GLLines1;
	TGLPolygon *GLPolygon1;
	TGLTetrahedron *GLTetrahedron1;
	TGLFreeForm *DelStruct;
	TPanel *PanelRight;
	TRadioGroup *ClassGroup;
	TPanel *Panel2;
	TPanel *Panel1;
	TPanel *Panel3;
	TPanel *Panel4;
	TPanel *Panel5;
	TPanel *Panel6;
	TPanel *Panel7;
	TGLLines *GLLines2;
	TGLDummyCube *VoxelDummy;
	TGLSimpleNavigation *GLSimpleNavigation1;
	TMenuItem *LoadFiles;
	TMenuItem *N2;
	TMenuItem *StarItem;
	TMenuItem *DelaunayItem;
	TMenuItem *VoronoiItem;
	TMenuItem *N7;
	TMenuItem *N8;
	TSaveTextFileDialog *SaveTextFileDialog1;
	void __fastcall GLCadencer1Progress(TObject *Sender, const double deltaTime, const double newTime);
	void __fastcall FormCreate(TObject *Sender);
	DelaunayBase __fastcall InitDelaunay(String filename);
	VoronoiBase __fastcall InitVoronoi(String filename);
    void __fastcall allClear();
	void __fastcall InitDraw();
	void __fastcall DrawPoints();
	void __fastcall DrawDelaunay();
	void __fastcall DrawVoronoi();
	void __fastcall clbSpectrasClickCheck(TObject *Sender);
	void __fastcall Data1Click(TObject *Sender);
	void __fastcall ClassGroupClick(TObject *Sender);
	void __fastcall Panel2Click(TObject *Sender);
	void __fastcall clbMethodsClickCheck(TObject *Sender);
	void __fastcall LoadFilesClick(TObject *Sender);
	void __fastcall StarItemClick(TObject *Sender);
	void __fastcall DelaunayItemClick(TObject *Sender);
	void __fastcall VoronoiItemClick(TObject *Sender);
	void __fastcall N8Click(TObject *Sender);

private:	// User declarations
    TPoint *Star;
public:		// User declarations

	__fastcall TFormStarcube(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormStarcube *FormStarcube;
extern String datapath;
//---------------------------------------------------------------------------
#endif
