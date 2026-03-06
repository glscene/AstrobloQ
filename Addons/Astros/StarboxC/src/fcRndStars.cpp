//---------------------------------------------------------------------------

#include <vcl.h>
#include <cstdlib>
#include <ctime>
#include <typeinfo>
#include <iostream>
#include <cmath>
#pragma hdrstop

#include "fcRndStars.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.SceneViewer"
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Scene"
#pragma link "GLS.Coordinates"
#pragma link "GLS.Objects"
#pragma resource "*.dfm"
TForm1* Form1;

int stars = 1000000;
int mx, my; // vars for saving position
unsigned int start, end; // vars for checking time
TStringList* S1 = new TStringList;
TStringList* T1 = new TStringList;
unsigned char FColorIndex, FX, FY, FZ;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner)
{
//
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject* Sender)
{
	srand((unsigned)time(0));
	rgContainer->ItemIndex = 0;
}

//---------------------------------------------------------------------------

void __fastcall TForm1::GLSceneViewer1MouseDown(
	TObject* Sender, TMouseButton Button, TShiftState Shift, int X, int Y)
{
	mx = X;
	my = Y;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::GLSceneViewer1MouseMove(
	TObject* Sender, TShiftState Shift, int X, int Y)
{
	if (Shift.Contains(ssLeft)) {
		GLCamera1->MoveAroundTarget(my - Y, mx - X);
		mx = X;
		my = Y;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormMouseWheel(TObject* Sender, TShiftState Shift,
	int WheelDelta, TPoint &MousePos, bool &Handled)
{
	if (GLSceneViewer1->MouseInControl == true) {
		GLCamera1->AdjustDistanceToTarget(Power(1.1, -WheelDelta / 120));
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Timer1Timer(TObject* Sender)
{
	StatusBar1->Panels->Items[1]->Text =
		Format("FPS: %.2f", ARRAYOFCONST((GLSceneViewer1->FramesPerSecond())));
	GLSceneViewer1->ResetPerformanceMonitor();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::GLCadencer1Progress(
	TObject* Sender, const double deltaTime, const double newTime)
{
	GLSceneViewer1->Invalidate();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnDrawClick(TObject* Sender)
{
	rgContainer->Enabled = false;

	// Start checking time
	start = clock();
	float* coords;

	for (int i = 0; i < stars; i++) {
		switch (rgContainer->ItemIndex) {
			case 0:
				coords = generatePointsForCube();
				break;
			case 1:
				coords = generatePointsForSphere();
				break;
			case 2:
				coords = generatePointsForSphereSurface();
				break;
			case 3:
				coords = generatePointsForCylinder();
				break;
			case 4:
				coords = generatePointsForCone();
				break;
		}

		GLPoints1->Size = 2;
		GLPoints1->Positions->Add(coords[0], coords[1], coords[2]);

		GLPoints1->Colors->AddPoint(((float)(rand() % 256)) / 256.0,
			((float)(rand() % 256)) / 256.0, ((float)(rand() % 256)) / 256.0);
	}
	// End of time-checking
	end = clock();
	double ex_time = (end - start) / (double)CLOCKS_PER_SEC;
    // ShowMessage(AnsiString("Exec time: ") + ex_time);
	StatusBar1->Panels->Items[0]->Text = "Exec time: " + FloatToStr(ex_time);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject* Sender)
{
	// Delete all points from the scene
	GLPoints1->Free();
	GLPoints1 = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
	rgContainer->Enabled = true;
}
//---------------------------------------------------------------------------

