/****************************************************************************
						   AstrobloQ System
*****************************************************************************/
#include <vcl.h>
#pragma hdrstop

#include "dcImages.h"
#include "fcAstroScene_ru.h"
#include "fcAbout_en.h"
#include "fcOptions_ru.h"

// #include "fcPointto.h"  // need to be converted from fdPointto.pas

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.Cadencer"
#pragma link "GLS.Scene"
#pragma link "GLS.SceneViewer"
#pragma link "GLS.SimpleNavigation"
#pragma link "GLS.LensFlare"
#pragma link "GLS.Objects"
#pragma link "GLS.SkyDome"
#pragma link "GLS.VectorFileObjects"
#pragma link "GLS.GeomObjects"
#pragma link "fcFormFirst"
#pragma link "dcImages"

#pragma link "Stage.BaseClasses"
#pragma link "Stage.Coordinates"
#pragma resource "*.dfm"

TFormAstroScene* FormAstroScene;

bool grid_on = false;

// массивы узлов линий кругов
int CoordRadius[] = { 2260, 4010, 4990, 5650, 6080, 6300, 6381, 6300, 6080,
	5650, 4990, 4010, 2260 };
int PositionX[] = { -6000, -5000, -4000, -3000, -2000, -1000, 0, 1000, 2000,
	3000, 4000, 5000, 6000 };

//---------------------------------------------------------------------------
__fastcall TFormAstroScene::TFormAstroScene(TComponent* Owner) : TFormFirst(Owner)
{
}

//---------------------------------------------------------------------------
void renderCircle(TGLLines* Line, int radius)
{
	double Segments = 64;
	double RotationAngle = 0;
	double theta = 0;
	double x = 0;
	double y = 0;
	double xCenter = 0;
	double xRotated = 0;
	double yCenter = 0;
	double yRotated = 0;

	Segments = 128;

	for (int i = 0; i < Segments + 1; i = i + 1) {
		theta = 360 * (i / Segments) * (3.141593 / 180);

		x = xCenter + radius * Cos(theta);
		y = yCenter + radius * Sin(theta);
		xRotated = xCenter + (x - xCenter) * Cos(RotationAngle) -
				   (y - yCenter) * Sin(RotationAngle);
		yRotated = yCenter + (x - xCenter) * Sin(RotationAngle) +
				   (y - yCenter) * Cos(RotationAngle);

		Line->Nodes->AddNode(xRotated, 0, yRotated);
	}
}

//---------------------------------------------------------------------------
TFileName __fastcall TFormAstroScene::GetDataPath()
{
	Path = ExtractFilePath(ParamStr(0)).LowerCase();
	int N = Path.Pos("bin");
	if (N > 0)
		Path = Path.SubString(0, N - 1);

	Path = IncludeTrailingPathDelimiter(Path) + "data\\starsys\\sol\\";
	SetCurrentDir(Path);
	return Path;
}

//---------------------------------------------------------------------------
void __fastcall TFormAstroScene::LoadPlanetMap(const String &fileName)
{
	String imagePath = GetDataPath() + fileName;
	if (FileExists(imagePath)) {
		sfPlanet->Material->Texture->Image->LoadFromFile(imagePath);
	} else {
		ShowMessage("Карта не найдена: " + imagePath);
	}
}

//---------------------------------------------------------------------------
void __fastcall TFormAstroScene::FormCreate(TObject* Sender)
{
	DataDir = GetDataPath();
	SetCurrentDir(DataDir);

	try {
		sfPlanet->Material->Texture->Disabled = false;
		LoadPlanetMap("earth.jpg");
		sfPlanet->Radius = 6371;
	}
	catch (Exception &e) {
		ShowMessage("Ошибка инициализации: " + e.Message);
	}

/*  // Вариант с BinDir. Получаем путь к исполняемому файлу
	String BinDir = ExtractFilePath(ParamStr(0));
	// Путь к папке с картами
	DataDir = BinDir + "..\\data\\map\\";
	// Устанавливаем рабочую директорию
	SetCurrentDir(DataDir);

	// Загружаем текстуру
	sfPlanet->Material->Texture->Disabled = false;
	sfPlanet->Material->Texture->Image->LoadFromFile("earth.jpg");
	sfPlanet->Radius = 6371;

	// Символы планет и лун солнечной системы
	///  tvPlanets->Images = dmImages->VirtualSymbolPlanets; // ?
	// Символы 88 созвездий
	///  tvConstellations->Images = dmImages->VirtualSymbolConsts;
*/

///	chbGridClick(this);
///	chbPlanetClick(this);
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::miPointtoClick(TObject* Sender)
{
	/*
  TfrmPointto*  frmPointto;
  frmPointto = new TfrmPointto(this);
  try {
	  frmPointto->ShowModal();
	}
	__finally {
	  frmPointto->Free();
  }
*/
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::GLCadencerProgress(
	TObject* Sender, const double DeltaTime, const double NewTime)

{
	sfPlanet->TurnAngle = FormOptions->chbRotate->Checked ? 10 * NewTime : 0;
//	if (chbRotate->Checked)
		sfPlanet->TurnAngle = 10 * NewTime;
//	else
//		sfPlanet->TurnAngle = 0;
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::miHipparcosClick(TObject* Sender)
{
	TfrmHipparcos* frmHipparcos;
	frmHipparcos = new TfrmHipparcos(this);
	try {
		frmHipparcos->ShowModal();
	} __finally
	{
		frmHipparcos->Free();
	}
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::miHercRusselClick(TObject* Sender)
{
	TfrmHercRussel* frmHercRussel;
	frmHercRussel = new TfrmHercRussel(this);
	try {
		frmHercRussel->ShowModal();
	} __finally
	{
		frmHercRussel->Free();
	}
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonMercuryClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("mercury.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonVenusClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("venus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonEarthClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("earth.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonMarsClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("mars.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonJupiterClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("jupiter.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonSaturnClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("saturn.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonUranusClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("uranus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonNeptuneClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("neptune.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::ButtonPlutoClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("pluto.jpg");
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::chbAxesClick(TObject* Sender)
{
	sfPlanet->ShowAxes = FormOptions->chbAxes->Checked;
	ArrowX->Visible = FormOptions->chbAxes->Checked;
	ArrowY->Visible = FormOptions->chbAxes->Checked;
	ArrowZ->Visible = FormOptions->chbAxes->Checked;
	Arrow_X->Visible = FormOptions->chbAxes->Checked;
	Arrow_Y->Visible = FormOptions->chbAxes->Checked;
	Arrow_Z->Visible = FormOptions->chbAxes->Checked;
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::chbPlanetClick(TObject* Sender)
{
	///    sfPlanet->Visible = chbPlanet->Checked;
	if (FormOptions->chbPlanet->Checked)
		sfPlanet->Material->PolygonMode = pmFill;
	else
		sfPlanet->Material->PolygonMode = pmLines;
}

void __fastcall TFormAstroScene::miOptionsClick(TObject* Sender)
{
	FormOptions->Show();
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::miAboutClick(TObject* Sender)
{
	TfrmAbout* frmAbout;
	frmAbout = new TfrmAbout(this);
	try {
		frmAbout->ShowModal();
	} __finally
	{
		frmAbout->Free();
	}
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::miExitClick(TObject* Sender)
{
	Close();
}

//---------------------------------------------------------------------------


void __fastcall TFormAstroScene::tvPlanetsClick(TObject *Sender)
{
  String Planets;
  TFileName PlanetFile;
//  TFileNameFileCSV;
  TFileName FileJpg;
  int NLine;

	switch (tvPlanets->Selected->Index) {
		case 0: {
		// Sun
			break;
		}
		case 1: {
		// Mercury
			break;
		}
		case 2: {
		// Venus
			break;
		}
		case 3: {
		// Earth
			break;
		}
		case 4: {
		// Mars
			break;
		}
		default: {
			break;
		}
	}

/* переписать на с++
  // включаем видимость лун
  dcMoon.Visible := True;
  // планеты, астероиды и кометы не видны
  sfPlanet.Visible := False;
  ffPlanet.Visible := False;

  dcAsteroid.Visible := False;
  dcComet.Visible := False;

  // чтение CSV файла трансляции и загрузки карты луны
  FileCSV := CurrentStar + 'sol_moons.csv';
  Moon := tvMoons.Selected.Text;  // находим имя луны в поле name_ru

  // передача индекса узла дерева просмотра в CSV
  NLine := tvMoons.Selected.Index;
  MoonFile := GetMoonFromCSV(FileCSV, NLine, Moon (*Radous*));
  FileJpg := CurrentStar + LowerCase(MoonFile) + '.jpg';
  if FileExists(FileJpg, True) then
  begin
//    sfMoon.Radius := Radius; // считывается из csv файла
	sfMoon.Material.Texture.Image.LoadFromFile(FileJpg);  // сфера
	ffMoon.Material.Texture.Image.LoadFromFile(FileJpg);  // фриформа
	// ffMoon.LoadFromFile(DataDir + '\model\object.3ds'); // модель
  end
  else
  begin
	sfMoon.Radius := 0.3; // Radius;
	FileJpg := CurrentStar + 'aMoon.jpg';
	sfMoon.Material.Texture.Image.LoadFromFile(FileJpg);
	ffMoon.Material.Texture.Image.LoadFromFile(FileJpg);
	// ffMoon.LoadFromFile(DataDir + '\model\object.3ds');
  end;

(*
  если карты из VirtPlanetMaps
  ffMoon.Material.Texture.Image.Assign(dmImages.VirtPlanetMaps.Images.Items[?]);
  Camera.TagObject := ffPlanet;
*)

  // Показать атмосферу Титана
  if tvMoons.Selected.Text = 'Титан' then
  begin
	sfMoon.Radius := 0.5;
	DirectOpenGL.Visible := True
  end
  else
  begin
	sfMoon.Radius := 0.3;
	DirectOpenGL.Visible := False;
  end;

  // Имя луны или спутника для веб-справки ruwiki
  // miHelpWiki->Caption = tvMoons->Selected->Text + "_(спутник)";
  miHelpWiki.Caption := tvMoons.Selected.Text + '_(спутник)';
*/


bool grid_on = false;
bool needRender = true;

//---------------------------------------------------------------------------
// Вывод географической сетки на глобусе
//---------------------------------------------------------------------------
/*
void __fastcall TFormAstroScene::ButtonShowPlanetGridClick(TObject* Sender)
{
    grid_on = !grid_on;

    GridX_1->Visible = grid_on;
    GridX_2->Visible = grid_on;
    GridX_3->Visible = grid_on;
    GridX_4->Visible = grid_on;
    GridX_5->Visible = grid_on;
	GridX_6->Visible = grid_on;
    GridX_7->Visible = grid_on;
    GridX_8->Visible = grid_on;
    GridX_9->Visible = grid_on;
    GridX_10->Visible = grid_on;
    GridX_11->Visible = grid_on;
    GridX_12->Visible = grid_on;
    GridX_13->Visible = grid_on;

    GridY_1->Visible = grid_on;
    GridY_2->Visible = grid_on;
    GridY_3->Visible = grid_on;
    GridY_4->Visible = grid_on;
    GridY_5->Visible = grid_on;
    GridY_6->Visible = grid_on;
    GridY_7->Visible = grid_on;
    GridY_8->Visible = grid_on;
    GridY_9->Visible = grid_on;
	GridY_10->Visible = grid_on;
    GridY_11->Visible = grid_on;
    GridY_12->Visible = grid_on;

    if (needRender) {
        renderCircle(GridX_1, CoordRadius[0]);
        GridX_1->Position->Y = PositionX[0];

        renderCircle(GridX_2, CoordRadius[1]);
        GridX_2->Position->Y = PositionX[1];

        renderCircle(GridX_3, CoordRadius[2]);
        GridX_3->Position->Y = PositionX[2];

        renderCircle(GridX_4, CoordRadius[3]);
        GridX_4->Position->Y = PositionX[3];

        renderCircle(GridX_5, CoordRadius[4]);
        GridX_5->Position->Y = PositionX[4];

        renderCircle(GridX_6, CoordRadius[5]);
        GridX_6->Position->Y = PositionX[5];

        renderCircle(GridX_7, CoordRadius[6]);
        GridX_7->Position->Y = PositionX[6];

        renderCircle(GridX_8, CoordRadius[7]);
        GridX_8->Position->Y = PositionX[7];

        renderCircle(GridX_9, CoordRadius[8]);
        GridX_9->Position->Y = PositionX[8];

        renderCircle(GridX_10, CoordRadius[9]);
        GridX_10->Position->Y = PositionX[9];

        renderCircle(GridX_11, CoordRadius[10]);
        GridX_11->Position->Y = PositionX[10];

		renderCircle(GridX_12, CoordRadius[11]);
        GridX_12->Position->Y = PositionX[11];

        renderCircle(GridX_13, CoordRadius[12]);
        GridX_13->Position->Y = PositionX[12];

        renderCircle(GridY_1, CoordRadius[6]);
        GridY_1->RollAngle = 90;
        GridY_1->PitchAngle = 15;

        renderCircle(GridY_2, CoordRadius[6]);
        GridY_2->RollAngle = 90;
        GridY_2->PitchAngle = 30;

        renderCircle(GridY_3, CoordRadius[6]);
        GridY_3->RollAngle = 90;
        GridY_3->PitchAngle = 45;

		renderCircle(GridY_4, CoordRadius[6]);
        GridY_4->RollAngle = 90;
        GridY_4->PitchAngle = 60;

        renderCircle(GridY_5, CoordRadius[6]);
        GridY_5->RollAngle = 90;
        GridY_5->PitchAngle = 75;

        renderCircle(GridY_6, CoordRadius[6]);
        GridY_6->RollAngle = 90;
		GridY_6->PitchAngle = 90;

        renderCircle(GridY_7, CoordRadius[6]);
        GridY_7->RollAngle = 90;
        GridY_7->PitchAngle = 105;

        renderCircle(GridY_8, CoordRadius[6]);
        GridY_8->RollAngle = 90;
        GridY_8->PitchAngle = 120;

        renderCircle(GridY_9, CoordRadius[6]);
        GridY_9->RollAngle = 90;
        GridY_9->PitchAngle = 135;

        renderCircle(GridY_10, CoordRadius[6]);
        GridY_10->RollAngle = 90;
        GridY_10->PitchAngle = 150;

		renderCircle(GridY_11, CoordRadius[6]);
		GridY_11->RollAngle = 90;
		GridY_11->PitchAngle = 165;

		renderCircle(GridY_12, CoordRadius[6]);
		GridY_12->RollAngle = 90;
		GridY_12->PitchAngle = 180;
		needRender = false;
	}
}

*/

}
//---------------------------------------------------------------------------

