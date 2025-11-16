//---------------------------------------------------------------------------

#include <vcl.h>
#include <cstdlib>
#include <ctime>
#include <typeinfo>
#include <iostream>
#include <cmath>
#pragma hdrstop

#include "fcGenStars_ru.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.SceneViewer"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Scene"
#pragma link "GLS.Objects"
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Coordinates"
#pragma resource "*.dfm"
TFormGenstars* FormGenstars;

TFileName Path;

int mx, my; // vars for saving position
unsigned int start, end; // vars for checking time
TStringList* S1 = new TStringList;
TStringList* T1 = new TStringList;
unsigned char FColorIndex, FSpect, FX, FY, FZ;

float X, Y, Z;
int count;
double ex_time;


//---------------------------------------------------------------------------
__fastcall TFormGenstars::TFormGenstars(TComponent* Owner) : TForm(Owner) {}

//---------------------------------------------------------------------------
float* generatePointsForCube()
{
	float* coords = new float[3];
	float min = -0.5;
	float max = 0.5;

	for (int i = 0; i < 3; ++i) {
		float random = ((float)rand()) / (float)RAND_MAX;
		float diff = max - min;
		float r = random * diff;
		coords[i] = min + r;
	}

	return coords;
}
//---------------------------------------------------------------------------
float* generatePointsForSphereSurface()
{
	float* coords = new float[3];
	float r = 0.5;
	float theta = (((float)rand()) / (float)RAND_MAX) * 2.0 * M_PI;
	float phi = (((float)rand()) / (float)RAND_MAX) * M_PI;

	coords[0] = r * sin(phi) * cos(theta);
	coords[1] = r * sin(phi) * sin(theta);
	coords[2] = r * cos(phi);

	return coords;
}

//---------------------------------------------------------------------------
float* generatePointsForSphere()
{
	float* coords = new float[3];
	float random = ((float)rand()) / (float)RAND_MAX;
	float r = -0.5 + random;

	float theta = (((float)rand()) / (float)RAND_MAX) * 2.0 * M_PI;
	float phi = (((float)rand()) / (float)RAND_MAX) * M_PI;

	coords[0] = r * sin(phi) * cos(theta);
	coords[1] = r * sin(phi) * sin(theta);
	coords[2] = r * cos(phi);

	return coords;
}

//---------------------------------------------------------------------------

float* generatePointsForCylinder()
{
	float radius = 0.4;
	float height = 0.8;
	float* coords = new float[3];
	float angle = static_cast<float>(rand()) / RAND_MAX * 2 * M_PI;
	float r = static_cast<float>(rand()) / RAND_MAX * radius;
	float h = static_cast<float>(rand()) / RAND_MAX * height;

	coords[0] = r * cos(angle);
	coords[1] = h - 0.4;
	coords[2] = r * sin(angle);

	return coords;
}

//----------------------------------------------------------------------------
void __fastcall TFormGenstars::FormCreate(TObject* Sender)
{
  Path = GetCurrentDir(); // + "\\Data";
  SetCurrentDir(Path);   // SetCurrentDir(ExtractFilePath(ParamStr(0)));

  srand((unsigned)time(0));
}

//---------------------------------------------------------------------------

void __fastcall TFormGenstars::GLSceneViewer1MouseDown(
	TObject* Sender, TMouseButton Button, TShiftState Shift, int X, int Y)
{
	mx = X;
	my = Y;
}
//---------------------------------------------------------------------------

void __fastcall TFormGenstars::GLSceneViewer1MouseMove(
    TObject* Sender, TShiftState Shift, int X, int Y)
{
    if (Shift.Contains(ssLeft)) {
		GLCamera1->MoveAroundTarget(my - Y, mx - X);
        mx = X;
        my = Y;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormGenstars::FormMouseWheel(TObject* Sender, TShiftState Shift,
	int WheelDelta, TPoint &MousePos, bool &Handled)
{
    if (GLSceneViewer1->MouseInControl == true) {
        GLCamera1->AdjustDistanceToTarget(Power(1.1, -WheelDelta / 120));
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormGenstars::Timer1Timer(TObject* Sender)
{
    StatusBar1->Panels->Items[1]->Text =
        Format("FPS: %.2f", ARRAYOFCONST((GLSceneViewer1->FramesPerSecond())));
    GLSceneViewer1->ResetPerformanceMonitor();
}
//---------------------------------------------------------------------------

void __fastcall TFormGenstars::GLCadencer1Progress(
	TObject* Sender, const double deltaTime, const double newTime)
{
	GLSceneViewer1->Invalidate();
}
//---------------------------------------------------------------------------
void __fastcall TFormGenstars::btnDrawClick(TObject* Sender)
{
	rgContainer->Enabled = false;

	// Start checking time
	start = clock();
	float* coords;

	for (int i = 0; i < seNStars->Value; i++) {
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
		}

		TGLPoints* star = new TGLPoints(Stars);
		Stars->Size = 3;
		Stars->Positions->Add(coords[0], coords[1], coords[2]);

		Stars->Colors->AddPoint(((float)(rand() % 256)) / 256.0,((float)(rand() % 256)) / 256.0, ((float)(rand() % 256)) / 256.0);
	}
	// End of time-checking
	end = clock();
	double ex_time = (end - start) / (double)CLOCKS_PER_SEC;
	StatusBar1->Panels->Items[0]->Text =
		"Time: " + FloatToStr(ex_time) + " years ";
}
//---------------------------------------------------------------------------
void __fastcall TFormGenstars::ButtonClearClick(TObject* Sender)
{
	// Delete all points from the scene
	Stars->Free();
	Stars = (TGLPoints*)(dcBlock->AddNewChild(__classid(TGLPoints)));
	rgContainer->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TFormGenstars::miOpenClick(TObject *Sender)
{
  OpenTextFileDialog1->Filter = "CSV files (*.csv)";
  OpenTextFileDialog1->InitialDir = Path;
  FormatSettings.DecimalSeparator = '.';

  if (OpenTextFileDialog1->Execute()) {
	S1->LoadFromFile(OpenTextFileDialog1->FileName);
	// CSV
	T1->CommaText = S1->Strings[0];

	for (int i = 0; i < T1->Count; i++) {
	  if (T1[0][i] == "x")
		FX = i;
	  else if (T1[0][i] == "y")
		FY = i;
	  else if (T1[0][i] == "z")
		FZ = i;
	  else if (T1[0][i] == "spect")
		FSpect = i;
	}

	start = clock();

	count = 0;


	for (int i = 1; i < S1->Count; i++) {
	  T1->CommaText = S1->Strings[i];
	  try {
		X = StrToFloat(T1[0][FX]) * 0.2;
		Y = StrToFloat(T1[0][FY]) * 0.2;
		Z = StrToFloat(T1[0][FZ]) * 0.2;

		String FullType = T1[0][FSpect];

		// CSV)
		if (FullType == "") FullType = "A";

		String Type = FullType.SubString(0, 1);

		// Class "O"
		if (Type == "O") {
		  GLTypeO->Colors->AddPoint(0, 0, 255);  // (cR, cG, CB)
		  GLTypeO->Positions->Add(X, Y, Z);
		  GLTypeO->Size = 2;
		}
		// Class "B"
		else if (Type == "B") {
		  GLTypeB->Colors->AddPoint(0, 255, 255);  // (cR, cG, CB)
		  GLTypeB->Positions->Add(X, Y, Z);
		  GLTypeB->Size = 2;
		}
		// Class "A"
		else if (Type == "A") {
		  GLTypeA->Colors->AddPoint(255, 255, 255);  // (cR, cG, CB)
		  GLTypeA->Positions->Add(X, Y, Z);
		  GLTypeA->Size = 2;
		}
		// Class "F"
		else if (Type == "F") {
		  GLTypeF->Colors->AddPoint(0, 255, 0);  // (cR, cG, CB)
		  GLTypeF->Positions->Add(X, Y, Z);
		  GLTypeF->Size = 2;
		}
		// Class "G"
		else if (Type == "G") {
		  GLTypeG->Colors->AddPoint(255, 255, 0);  // (cR, cG, CB)
		  GLTypeG->Positions->Add(X, Y, Z);
		  GLTypeG->Size = 2;
		}
		// Class "K"
		else if (Type == "K") {
		  GLTypeK->Colors->AddPoint(255, 0, 255);  // (cR, cG, CB)
		  GLTypeK->Positions->Add(X, Y, Z);
		  GLTypeK->Size = 2;

		}
		// Class "M"
		else {
		  GLTypeM->Colors->AddPoint(254, 0, 0);  // (cR, cG, CB)
		  GLTypeM->Positions->Add(X, Y, Z);
		  GLTypeM->Size = 3;
		}
		count = count + 1;
	  } catch (...) {}
	}

	end = clock();
	ex_time = (end - start) / (double)CLOCKS_PER_SEC;

	delete S1;
	delete T1;
  }

}
//---------------------------------------------------------------------------

void __fastcall TFormGenstars::miSaveAsClick(TObject *Sender)
{
  SaveTextFileDialog1->Filter = "CSV files (*.csv)";
  SaveTextFileDialog1->InitialDir = Path;
  FormatSettings.DecimalSeparator = '.';
  if (SaveTextFileDialog1->Execute()) {
	S1->SaveToFile(SaveTextFileDialog1->FileName);
	// CSV
	T1->CommaText = S1->Strings[0];

	for (int i = 0; i < T1->Count; i++) {
	  if (T1[0][i] == "x")
		FX = i;
	  else if (T1[0][i] == "y")
		FY = i;
	  else if (T1[0][i] == "z")
		FZ = i;
	  else if (T1[0][i] == "spect")
		FSpect = i;
	}
  }
}
//---------------------------------------------------------------------------

