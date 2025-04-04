//---------------------------------------------------------------------------

#include <vcl.h>
#include <cstdlib>
#include <ctime>
#include <typeinfo>
#include <iostream>
#include <cmath>
#pragma hdrstop

#include "fRandomStars.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.SceneViewer"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Scene"
#pragma link "GLS.Objects"
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Coordinates"
#pragma resource "*.dfm"
TForm1* Form1;

int mx, my; // vars for saving position
unsigned int start, end; // vars for checking time
TStringList* S1 = new TStringList;
TStringList* T1 = new TStringList;
unsigned char FColorIndex, FX, FY, FZ;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner) {}

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

void __fastcall TForm1::FormCreate(TObject* Sender)
{
    srand((unsigned)time(0));
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
    rgBlock->Enabled = false;

    // Start checking time
    start = clock();
    float* coords;

    for (int i = 0; i < seNStars->Value; i++) {
        switch (rgBlock->ItemIndex) {
            case 0:
                coords = generatePointsForCube();
                break;
            case 1:
                coords = generatePointsForSphere();
                break;
            case 2:
                coords = generatePointsForSphereSurface();
                break;
        }

        Stars->Size = 2;
        Stars->Positions->Add(coords[0], coords[1], coords[2]);

        Stars->Colors->AddPoint(((float)(rand() % 256)) / 256.0,
            ((float)(rand() % 256)) / 256.0, ((float)(rand() % 256)) / 256.0);
    }
    // End of time-checking
    end = clock();
    double ex_time = (end - start) / (double)CLOCKS_PER_SEC;
    // ShowMessage(AnsiString("Exec time: ") + ex_time);
    StatusBar1->Panels->Items[0]->Text =
        "Время операции: " + FloatToStr(ex_time);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonClearClick(TObject* Sender)
{
    // Delete all points from the scene
    Stars->Free();
    Stars = (TGLPoints*)(dcBlock->AddNewChild(__classid(TGLPoints)));
    rgBlock->Enabled = true;
}
//---------------------------------------------------------------------------

