//---------------------------------------------------------------------------

#include <vcl.h>
#include <cstdlib>
#include <ctime>
#include <typeinfo>
#include <iostream>
#include <cmath>
#pragma hdrstop
#include "GLS.GeomObjects.hpp"
#include "fcSolarBlock_ru.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.SceneViewer"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Scene"
#pragma link "GLS.Objects"
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Coordinates"
#pragma link "GLS.GeomObjects"
#pragma resource "*.dfm"
TFormSolarBlock* FormSolarBlock;

int mx, my; // сохранение позиции мыши
unsigned int start, end; // задание времени

//---------------------------------------------------------------------------
__fastcall TFormSolarBlock::TFormSolarBlock(TComponent* Owner) : TForm(Owner)
{

}

//---------------------------------------------------------------------------
float* GenStarsForCube()
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

float* GenStarsForSphere()
{
  float* coords = new float[3];

	// Радиус сферы
    const float R = 0.5f;

    // 1. Равномерное распределение по объёму: r = R * cbrt(rand)
	float u = static_cast<float>(rand()) / RAND_MAX;
	float r = R * powf(u, 1.0f / 3.0f); // равномерное распределение по объёму

    // 2. Равномерное направление на сфере:
	float theta = static_cast<float>(rand()) / RAND_MAX * 2.0f * M_PI;           // азимут [0, 2π]
	float phi = (float)acos(1.0f - 2.0f * (static_cast<float>(rand()) / RAND_MAX));   // полярный угол [0, π]

    // 3. Декартовы координаты звёзд
	coords[0] = r * sinf(phi) * cosf(theta);
	coords[1] = r * sinf(phi) * sinf(theta);
    coords[2] = r * cosf(phi);

	return coords;
}

//---------------------------------------------------------------------------

float* GenStarsForCylinder()
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

//---------------------------------------------------------------------------

float* GenStarsForCone()
{
	float* coords = new float[3];

	// Конус: высота = 1.0 (от z = -0.5 до z = +0.5)
	// Основание внизу (z = -0.5), вершина вверху (z = +0.5)
	float z = -0.5f + (static_cast<float>(rand()) / RAND_MAX) * 1.0f; // z ∈ [-0.5, +0.5]
	float t = (z + 0.5f) / 1.0f;
	float r_max = 0.5f * (1.0f - t); // радиус уменьшается к вершине

	// Равномерное распределение по площади: r = sqrt(rand) * r_max
	float r = sqrtf(static_cast<float>(rand()) / RAND_MAX) * r_max;
	float angle = (static_cast<float>(rand()) / RAND_MAX) * 2.0f * M_PI;

	coords[0] = r * cosf(angle);
	coords[1] = z;
	coords[2] = r * sinf(angle);

	return coords;
}

//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::FormCreate(TObject* Sender)
{
	srand((unsigned)time(0));

	seNStars->Value = 10000;

  // GLCamera1->Position->SetPoint(0,0,1.5f);
  // GLCamera1->Direction->SetPoint(0,0,-1);
  // GLCamera1->Up->SetPoint(0,1,0);

}

//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::FormShow(TObject *Sender)
{
   cbContainer->SetFocus();
}


//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::GLSceneViewer1MouseDown(
	TObject* Sender, TMouseButton Button, TShiftState Shift, int X, int Y)
{
	mx = X;
	my = Y;
}

//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::GLSceneViewer1MouseMove(
	TObject* Sender, TShiftState Shift, int X, int Y)
{
	if (Shift.Contains(ssLeft)) {
        GLCamera1->MoveAroundTarget(my - Y, mx - X);
        mx = X;
        my = Y;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::FormMouseWheel(TObject* Sender, TShiftState Shift,
	int WheelDelta, TPoint &MousePos, bool &Handled)
{
	if (GLSceneViewer1->MouseInControl == true) {
		GLCamera1->AdjustDistanceToTarget(Power(1.1, -WheelDelta / 120));
	}
}
//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::Timer1Timer(TObject* Sender)
{
   Label1->Caption = Format("FPS: %.2f", ARRAYOFCONST((GLSceneViewer1->FramesPerSecond())));
   GLSceneViewer1->ResetPerformanceMonitor();
}
//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::GLCadencer1Progress(
	TObject* Sender, const double deltaTime, const double newTime)
{
	GLSceneViewer1->Invalidate();
}
//---------------------------------------------------------------------------
void __fastcall TFormSolarBlock::btnDrawClick(TObject* Sender)
{
	cbContainer->Enabled = false;

	// Очистка сцены от звёзд
	Stars->Positions->Clear();
	Stars->Colors->Clear();

	start = clock();
	for (int i = 0; i < seNStars->Value; i++) {
		float* coords=NULL;

		switch (cbContainer->ItemIndex) {
			case 0:
				coords = GenStarsForCube();
				break;
			case 1:
				coords = GenStarsForSphere();
				break;
			case 2:
				coords = GenStarsForCylinder();
				break;
			case 3:
				coords = GenStarsForCone();
				break;
			default: coords=coords = GenStarsForCube();break;
		}

		// Отображение звёзд случайного цвета
		Stars->Positions->Add(coords[0], coords[1], coords[2]);
		Stars->Colors->AddPoint(((float)(rand() % 255+1)) / 255.0,((float)(rand() % 255+1)) / 255.0, ((float)(rand() % 255+1)) / 255.0);
		// Stars->Size = 5;  Stars->Style = psSmooth;

		delete[] coords;
	}
	// end of time-checking
	end = clock();
	double ex_time = (end - start) / (double)CLOCKS_PER_SEC;

	cbContainer->Enabled = true;

}

//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::miAboutClick(TObject *Sender)
{
  ShowMessage("Блок Солнца 1000х1000х1000 световых лет");
}
//---------------------------------------------------------------------------

void __fastcall TFormSolarBlock::miTypeClick(TObject *Sender)
{
 //  cbContainer->SetFocus();
}

//---------------------------------------------------------------------------


void __fastcall TFormSolarBlock::miExitClick(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------



void __fastcall TFormSolarBlock::ButtonClearClick(TObject *Sender)
{
if (Stars)
  {
	Stars->Positions->Clear();
//	Stars->Colors->Clear();
   cbContainer->SetFocus();
  }
}
//---------------------------------------------------------------------------

