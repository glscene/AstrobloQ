//---------------------------------------------------------------------------

#ifndef fcAstroSceneH
#define fcAstroSceneH
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

#include "fcForm.h"
#include "dcImages.h"
#include "GLS.BaseClasses.hpp"
#include "GLS.Coordinates.hpp"


//---------------------------------------------------------------------------
class TfrmAstroScene : public TFormC
{
__published:	// IDE-managed Components
	TGLSceneViewer *GLSceneViewer;
	TPanel *Panel1;
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
	TGLTorus *MeridY_0;
	TGLTorus *MeridY_15;
	TGLTorus *MeridY_30;
	TGLTorus *MeridY_45;
	TGLTorus *MeridY_60;
	TGLTorus *MeridY_75;
	TGLTorus *MerGreenwich_90;
	TGLTorus *MeridY_105;
	TGLTorus *MeridY_120;
	TGLTorus *MeridY_135;
	TGLTorus *MeridY_150;
	TGLTorus *MeridY_165;
	TGLTorus *ParallelN_15;
	TGLTorus *ParallelN_30;
	TGLTorus *ParallelN_45;
	TGLTorus *ParallelN_60;
	TGLTorus *ParallelN_75;
	TGLTorus *PoleN_90;
	TGLTorus *ParallelS_15;
	TGLTorus *ParallelEquator_0;
	TGLTorus *ParallelS_30;
	TGLTorus *ParallelS_45;
	TGLTorus *ParallelS_60;
	TGLTorus *ParallelS_75;
	TGLTorus *PoleS_90;
	TButton *ButtonMercury;
	TButton *ButtonVenus;
	TButton *ButtonEarth;
	TButton *ButtonMars;
	TButton *ButtonJupiter;
	TButton *ButtonSaturn;
	TButton *ButtonUranus;
	TButton *ButtonNeptune;
	TButton *ButtonPluto;
	TGLDummyCube *dmParallelGrid;
	TGLLines *Parallel20;
	TGLDummyCube *dmMeridianGrid;
	TCheckBox *chbRotate;
	TCheckBox *chbAxes;
	TGLDummyCube *dcPlanet;
	TGLArrowLine *ArrowX;
	TGLArrowLine *ArrowY;
	TGLArrowLine *ArrowZ;
	TGLArrowLine *Arrow_X;
	TGLArrowLine *Arrow_Y;
	TGLArrowLine *Arrow_Z;
	TCheckBox *chbPlanet;
	TCheckBox *chbGrid;
	TGLDummyCube *dcArrows;
	TPageControl *PageControl;
	TTabSheet *tsPlanets;
	TTreeView *tvPlanets;
	TTabSheet *tsConstCharts;
	TVirtualImage *VirtualImageChart;
	TTreeView *tvConstellations;
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
	TMenuItem *miSettings;
	TMenuItem *Wiki1;
	TMenuItem *miHipparcos;
	TMenuItem *N2;
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
	void __fastcall chbGridClick(TObject *Sender);
	void __fastcall miSettingsClick(TObject *Sender);
private:	// User declarations
	TFileName DataDir;
	TFileName CurrDir;
	TFileName FileName;
public:		// User declarations
	__fastcall TfrmAstroScene(TComponent* Owner);
	__fastcall TFileName GetDataPath();
	void __fastcall LoadPlanetMap(const String& fileName);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmAstroScene *frmAstroScene;
//---------------------------------------------------------------------------
#endif
