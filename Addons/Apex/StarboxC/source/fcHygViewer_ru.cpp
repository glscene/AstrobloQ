//---------------------------------------------------------------------------

#include <vcl.h>

#include <cstdlib>
#include <ctime>
#include <typeinfo>
#pragma hdrstop

#include "fcHygViewer_ru.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Coordinates"
#pragma link "GLS.Objects"
#pragma link "GLS.Scene"
#pragma link "GLS.SceneViewer"
#pragma link "GLS.SimpleNavigation"
#pragma #pragma link "GLS.BaseClasses"
#pragma link "GLS.Coordinates"
#pragma resource "*.dfm"
TFormViewer* FormViewer;

int mx, my;
unsigned int start, end;
TStringList* Sl = new TStringList; // все строки файла
TStringList* Tl = new TStringList; // текущая строка

unsigned char FX, FY, FZ, FSpect;

float X, Y, Z;

int count;
double ex_time;

TFileName Path;


//---------------------------------------------------------------------------
__fastcall TFormViewer::TFormViewer(TComponent* Owner) : TForm(Owner) {}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::GLSceneViewer1MouseDown(TObject* Sender, TMouseButton Button, TShiftState Shift, int X, int Y) {
  mx = X;
  my = Y;
}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::FormCreate(TObject* Sender) {

  Path = GetCurrentDir(); // + "\\Data";
  SetCurrentDir(Path);
//  SetCurrentDir(ExtractFilePath(ParamStr(0)));

}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::GLSceneViewer1MouseMove(TObject* Sender, TShiftState Shift, int X, int Y) {
  if (Shift.Contains(ssLeft)) {
	GLCamera1->MoveAroundTarget(my - Y, mx - X);
	mx = X;
	my = Y;
  }
}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::Timer1Timer(TObject* Sender) {
  FormViewer->StatusBar1->Panels->Items[0]->Text = Format("Count: %d", ARRAYOFCONST((count)));
  FormViewer->StatusBar1->Panels->Items[1]->Text = Format("Lifetime: %.2f", ARRAYOFCONST((ex_time)));
  GLSceneViewer1->ResetPerformanceMonitor();
}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::GLCadencer1Progress(TObject* Sender, const double deltaTime, const double newTime) {

  // include star moving with vx,vy,vz from file hyg.csv
  GLSceneViewer1->Invalidate();
}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::Exit1Click(TObject* Sender) { FormViewer->Close(); }

//---------------------------------------------------------------------------
void __fastcall TFormViewer::btnClearClick(TObject* Sender) {
  GLTypeO->Free();
  GLTypeB->Free();
  GLTypeA->Free();
  GLTypeF->Free();
  GLTypeG->Free();
  GLTypeK->Free();
  GLTypeM->Free();
  GLTypeO = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeB = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeA = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeF = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeG = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeK = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeM = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLSceneViewer1->Invalidate();
}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::OpenCSV1Click(TObject* Sender) {

  OpenTextFileDialog1->InitialDir = Path;
  OpenTextFileDialog1->Filter = "CSV files (*.csv)";
  FormatSettings.DecimalSeparator = '.';

  if (OpenTextFileDialog1->Execute()) {
	Sl->LoadFromFile(OpenTextFileDialog1->FileName); //загрузка всего CSV файла
	Tl->CommaText = Sl->Strings[0];   //чтение первой строки с именами полей

	for (int i = 0; i < Tl->Count; i++) {
	  if (Tl[0][i] == "x")
		FX = i;
	  else if (Tl[0][i] == "y")
		FY = i;
	  else if (Tl[0][i] == "z")
		FZ = i;
	  else if (Tl[0][i] == "spect")
		FSpect = i;
	}

	start = clock();
	count = 0;

	for (int i = 1; i < Sl->Count; i++) {
	  Tl->CommaText = Sl->Strings[i];
	  try {
		X = StrToFloat(Tl[0][FX]) * 0.2;
		Y = StrToFloat(Tl[0][FY]) * 0.2;
		Z = StrToFloat(Tl[0][FZ]) * 0.2;

		String FullType = Tl[0][FSpect];

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

	delete Sl;
	delete Tl;
  }
}

//---------------------------------------------------------------------------
void __fastcall TFormViewer::Button1Click(TObject* Sender) {
  GLTypeO->Free();
  GLTypeB->Free();
  GLTypeA->Free();
  GLTypeF->Free();
  GLTypeG->Free();
  GLTypeK->Free();
  GLTypeM->Free();
  GLTypeO = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeB = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeA = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeF = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeG = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeK = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLTypeM = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
  GLSceneViewer1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TFormViewer::chbOClick(TObject *Sender)
{
	 // Класс  "O"
	 GLTypeO->Visible =  chbO->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormViewer::chbBClick(TObject *Sender)
{
	// Класс "B"
	GLTypeB->Visible =  chbB->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormViewer::chbAClick(TObject *Sender)
{
	// Класс "A"
	GLTypeA->Visible =  chbA->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormViewer::chbFClick(TObject *Sender)
{
	// Класс "F"
	GLTypeF->Visible =  chbF->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormViewer::chbGClick(TObject *Sender)
{
	// Класс "G"
	GLTypeG->Visible =  chbG->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormViewer::chbKClick(TObject *Sender)
{
	// Класс "K"
	GLTypeK->Visible =  chbK->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormViewer::chbMClick(TObject *Sender)
{
	// Класс "M"
	GLTypeM->Visible =  chbM->Checked;
}
//---------------------------------------------------------------------------

