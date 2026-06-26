/****************************************************************************
						   AstrobloQ System
*****************************************************************************/
#ifndef fcAstroScene_enH
#define fcAstroScene_enH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.VirtualImage.hpp>
#include <Vcl.ToolWin.hpp>

#include "GLS.Cadencer.hpp"
#include "GLS.Scene.hpp"
#include "GLS.SceneViewer.hpp"
#include "GLS.SimpleNavigation.hpp"
#include "GLS.LensFlare.hpp"
#include "GLS.Objects.hpp"
#include "GLS.SkyDome.hpp"
#include "GLS.VectorFileObjects.hpp"
#include "GLS.GeomObjects.hpp"
#include "Stage.BaseClasses.hpp"
#include "Stage.Coordinates.hpp"

#include "fcFormFirst.h"
#include "fcHercRussel_en.h"
#include "fcHipparcos_en.h"

#include "dcImages.h"
#include "Stage.BaseClasses.hpp"
#include "Stage.Coordinates.hpp"


//---------------------------------------------------------------------------
class TFormAstroScene : public TFormFirst
{
__published:	// IDE-managed Components
	TGLSceneViewer *GLSceneViewer;
	TGLCadencer *GLCadencer;
	TGLSimpleNavigation *GLSimpleNavigation;
	TGLScene *GLScene;
	TGLSkyDome *SkyDome;
	TGLCamera *Camera;
	TGLLightSource *LightSourceSun;
	TGLLensFlare *LensFlareSun;
	TGLDummyCube *dcMeshPlanet;
	TGLSphere *sfPlanet;
	TGLFreeForm *ffPlanet;
	TTimer *Timer;
	TGLCamera *CameraController;
	TGLLines *Parallel20;
	TGLDummyCube *dcPlanet;
	TGLArrowLine *ArrowX;
	TGLArrowLine *ArrowY;
	TGLArrowLine *ArrowZ;
	TGLArrowLine *Arrow_X;
	TGLArrowLine *Arrow_Y;
	TGLArrowLine *Arrow_Z;
	TGLDummyCube *dcArrows;
	TControlBar *ControlBar;
	TToolBar *ToolBar1;
	TToolButton *ToolButton1;
	TToolButton *ToolButton2;
	TToolButton *ToolButton3;
	TMainMenu *MainMenu;
	TMenuItem *miFile;
	TMenuItem *miView;
	TMenuItem *miTools;
	TMenuItem *miHelp;
	TMenuItem *miAbout;
	TMenuItem *Open1;
	TMenuItem *Save1;
	TMenuItem *N1;
	TMenuItem *miExit;
	TMenuItem *Show1;
	TMenuItem *miOptions;
	TMenuItem *miHelpWiki;
	TMenuItem *miHipparcos;
	TMenuItem *N2;
	TPanel *Panel1;
	TStaticText *StaticText3;
	TTreeView *tvPlanets;
	TToolBar *tbPlanets;
	TToolButton *tbnSol;
	TToolButton *tbnMercury;
	TToolButton *tbnVenus;
	TToolButton *tbnEarth;
	TToolButton *tbnMars;
	TToolButton *tbnJupiter;
	TToolButton *tbnSaturn;
	TToolButton *tbnUranus;
	TToolButton *tbnNeptune;
	TStaticText *StaticText1;
	TGLDummyCube *dcMoon;
	TGLDummyCube *dcAsteroid;
	TGLDummyCube *dcComet;
	TGLDummyCube *dcStellar;
	TGLDummyCube *dcTopoGrid;
	TGLTorus *MeridianY_0;
	TGLTorus *MeridianY_15;
	TGLTorus *MeridianY_30;
	TGLTorus *MeridianY_45;
	TGLTorus *MeridianY_60;
	TGLTorus *MeridianY_75;
	TGLTorus *MerGreenwich_90;
	TGLTorus *MeridianY_105;
	TGLTorus *MeridianY_120;
	TGLTorus *MeridianY_135;
	TGLTorus *MeridianY_150;
	TGLTorus *MeridianY_165;
	TGLTorus *ParallelN_90;
	TGLTorus *ParallelN_75;
	TGLTorus *ParallelN_60;
	TGLTorus *ParallelN_45;
	TGLTorus *ParallelN_30;
	TGLTorus *ParallelN_15;
	TGLTorus *ParallelEquator_0;
	TGLTorus *ParallelS_15;
	TGLTorus *ParallelS_30;
	TGLTorus *ParallelS_45;
	TGLTorus *ParallelS_60;
	TGLTorus *ParallelS_75;
	TGLTorus *ParallelS_90;
	void __fastcall miAboutClick(TObject *Sender);
	void __fastcall miExitClick(TObject *Sender);
	void __fastcall miPointtoClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall GLCadencerProgress(TObject *Sender, const double DeltaTime, const double NewTime);
	void __fastcall miHipparcosClick(TObject *Sender);
	void __fastcall miHercRusselClick(TObject *Sender);
	void __fastcall ButtonMercuryClick(TObject *Sender);
	void __fastcall ButtonVenusClick(TObject *Sender);
	void __fastcall ButtonEarthClick(TObject *Sender);
	void __fastcall ButtonMarsClick(TObject *Sender);
	void __fastcall ButtonJupiterClick(TObject *Sender);
	void __fastcall ButtonSaturnClick(TObject *Sender);
	void __fastcall ButtonUranusClick(TObject *Sender);
	void __fastcall ButtonNeptuneClick(TObject *Sender);
	void __fastcall ButtonPlutoClick(TObject *Sender);
	void __fastcall chbAxesClick(TObject *Sender);
	void __fastcall chbPlanetClick(TObject *Sender);
	void __fastcall miOptionsClick(TObject *Sender);
	void __fastcall tvPlanetsClick(TObject *Sender);
	void __fastcall tbnPlanetsClick(TObject *Sender);
private:	// User declarations
	TFileName DataDir;
	TFileName CurrDir;
	TFileName FileName;
	TFileName Path;
	TFileName FileJpg;
public:		// User declarations
	__fastcall TFormAstroScene(TComponent* Owner);
	__fastcall TFileName GetDataPath();
	void __fastcall LoadPlanetMap(const String& fileName);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormAstroScene *FormAstroScene;
//---------------------------------------------------------------------------
#endif
