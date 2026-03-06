//---------------------------------------------------------------------------

#include <vcl.h>
#include <cstdlib>
#include <ctime>
#include <typeinfo>
#pragma hdrstop

#include "fcHygStars.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Coordinates"
#pragma link "GLS.Objects"
#pragma link "GLS.Scene"
#pragma link "GLS.SceneViewer"
#pragma resource "*.dfm"
TForm1 *Form1;

int mx, my; // vars for saving position
unsigned int start, end; // vars for checking time
TStringList *S1 = new TStringList;
TStringList *T1 = new TStringList;
unsigned char FColorIndex, FX, FY, FZ;
float ColorIndex, X, Y, Z;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
	TFileName Path = GetCurrentDir() + "\\data";
	SetCurrentDir(Path);
    OpenTextFileDialog1->InitialDir = Path;
	OpenTextFileDialog1->Filter = "CSV files (*.csv)";
	FormatSettings.DecimalSeparator = '.';
}

//---------------------------------------------------------------------------
void __fastcall TForm1::GLSceneViewer1MouseDown(TObject *Sender, TMouseButton Button,
		  TShiftState Shift, int X, int Y)
{
	mx = X; my = Y;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::GLSceneViewer1MouseMove(TObject *Sender, TShiftState Shift,
		  int X, int Y)
{
	if (Shift.Contains(ssLeft))
	{
		GLCamera1->MoveAroundTarget(my-Y, mx-X);
		mx = X; my = Y;
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
		  TPoint &MousePos, bool &Handled)
{
	if(GLSceneViewer1->MouseInControl==true)
	{
		GLCamera1->AdjustDistanceToTarget(Power(1.1,-WheelDelta/120));
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
	Form1->StatusBar1->Panels->Items[0]->Text = Format("Total stars: %d", ARRAYOFCONST((GLPoints1->Positions->Count)));
	Form1->StatusBar1->Panels->Items[1]->Text = Format("FPS: %.2f", ARRAYOFCONST((GLSceneViewer1->FramesPerSecond())));
	GLSceneViewer1->ResetPerformanceMonitor();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::GLCadencer1Progress(TObject *Sender, const double deltaTime,
		  const double newTime)
{
	GLSceneViewer1->Invalidate();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Exit1Click(TObject *Sender)
{
	Form1->Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
	// Delete all points from the scene
	GLPoints1->Free();
	GLPoints1 = (TGLPoints *)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OpenCSV1Click(TObject *Sender)
{
	if(OpenTextFileDialog1->Execute())
	{
		S1->LoadFromFile(OpenTextFileDialog1->FileName);

		// Read headers to StringList T1
		T1->CommaText = S1->Strings[0];

		// Clear all CheckList items
		CheckListBox1->MultiSelect = true;
		CheckListBox1->Items->Clear();

		// Add all headers to CheckList
		for (int i = 0; i < T1->Count; i++) {
			CheckListBox1->Items->Add(T1[0][i]);
			if (T1[0][i] == "ColorIndex") FColorIndex = i;
			else if (T1[0][i] == "X") FX = i;
			else if (T1[0][i] == "Y") FY = i;
			else if (T1[0][i] == "Z") FZ = i;
		}
		ShowMessage(AnsiString("File loaded! Now select fileds and click 'Draw stars'"));
	}
}
//---------------------------------------------------------------------------


void __fastcall TForm1::ButtonDrawClick(TObject *Sender)
{
	// Start checking time
	start = clock();
	for (int i = 1; i < S1->Count; i++) {

		T1->CommaText = S1->Strings[i];

		if (T1[0][FColorIndex] == "") {
			ColorIndex = 1;
		}
		else {
			ColorIndex = StrToFloat(T1[0][FColorIndex]);
		}

		X = StrToFloat(T1[0][FX])*0.05;
		Y = StrToFloat(T1[0][FY])*0.05;
		Z = StrToFloat(T1[0][FZ])*0.05;

		GLPoints1->Size = 2;
		GLPoints1->Positions->Add(X, Y, Z);
		GLPoints1->Colors->AddPoint(ColorIndex, ColorIndex, ColorIndex);
	}
	// End of time-checking
	end = clock();
	double ex_time = (end - start) / (double) CLOCKS_PER_SEC;
	ShowMessage(AnsiString("All stars added in: ") + ex_time);

	delete S1;
	delete T1;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::CheckBox1Click(TObject *Sender)
{
  // Write here a code to generate and draw random stars
}
//---------------------------------------------------------------------------

