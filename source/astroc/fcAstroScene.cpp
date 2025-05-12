//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "dcImages.h"
#include "fcAstroScene.h"
#include "fcHipparcos.h"
#include "fcHercrussel.h"
#include "fcAbout.h"
#include "fcSettings.h"

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
#pragma link "fcForm"
#pragma link "dcImages"

#pragma link "GLS.BaseClasses"
#pragma link "GLS.Coordinates"
#pragma resource "*.dfm"

TfrmAstroScene* frmAstroScene;

bool grid_on = false;

//---------------------------------------------------------------------------
__fastcall TfrmAstroScene::TfrmAstroScene(TComponent* Owner) : TFormC(Owner)
{
}

//---------------------------------------------------------------------------
TFileName __fastcall TfrmAstroScene::GetDataPath()
{
	TFileName Path = ExtractFilePath(ParamStr(0)).LowerCase();
	int N = Path.Pos("bin");
	if (N > 0)
		Path = Path.SubString(0, N - 1);

	Path = IncludeTrailingPathDelimiter(Path) + "data\\map\\";
	SetCurrentDir(Path);
	return Path;
}

//---------------------------------------------------------------------------
void __fastcall TfrmAstroScene::LoadPlanetMap(const String &fileName)
{
	String imagePath = GetDataPath() + fileName;
	if (FileExists(imagePath)) {
		sfPlanet->Material->Texture->Image->LoadFromFile(imagePath);
	} else {
		ShowMessage("Map not found: " + imagePath);
	}
}

//---------------------------------------------------------------------------
void __fastcall TfrmAstroScene::FormCreate(TObject* Sender)
{
	DataDir = GetDataPath();
	SetCurrentDir(DataDir);

	try {
		sfPlanet->Material->Texture->Disabled = false;
		LoadPlanetMap("earth.jpg");
		sfPlanet->Radius = 6371;
	} catch (Exception &e) {
		ShowMessage("Error of initialization: " + e.Message);
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
	chbGridClick(this);
	chbPlanetClick(this);
}

//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::miPointtoClick(TObject* Sender)
{
	/*
  TFormPointto*  FormPointto;
  FormPointto = new TFormPointto(this);
  try {
	  FormPointto->ShowModal();
	}
	__finally {
	  FormPointto->Free();
  }
*/
}

//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::GLCadencerProgress(
    TObject* Sender, const double DeltaTime, const double NewTime)

{

	sfPlanet->TurnAngle = chbRotate->Checked ? 10 * NewTime : 0;
	/*
	if (chbRotate->Checked)
		sfPlanet->TurnAngle = 10 * NewTime;
	else
		sfPlanet->TurnAngle = 0;
    */
}

//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::miHipparcosClick(TObject* Sender)
{
    TFormHipparcos* FormHipparcos;
    FormHipparcos = new TFormHipparcos(this);
    try {
        FormHipparcos->ShowModal();
    } __finally
    {
        FormHipparcos->Free();
    }
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::miHercRusselClick(TObject* Sender)
{
    TFormHercRussel* FormHercRussel;
    FormHercRussel = new TFormHercRussel(this);
    try {
        FormHercRussel->ShowModal();
    } __finally
    {
        FormHercRussel->Free();
    }
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonMercuryClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("mercury.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonVenusClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("venus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonEarthClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("earth.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonMarsClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("mars.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonJupiterClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("jupiter.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonSaturnClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("saturn.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonUranusClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("uranus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonNeptuneClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("neptune.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::ButtonPlutoClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("pluto.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::miExitClick(TObject* Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::chbAxesClick(TObject* Sender)
{
    /*
  if (chbAxes->Checked)
	sfPlanet->ShowAxes = true;
  else
	sfPlanet->ShowAxes = false;
*/
    sfPlanet->ShowAxes = chbAxes->Checked;
    ArrowX->Visible = chbAxes->Checked;
    ArrowY->Visible = chbAxes->Checked;
    ArrowZ->Visible = chbAxes->Checked;
    Arrow_X->Visible = chbAxes->Checked;
    Arrow_Y->Visible = chbAxes->Checked;
    Arrow_Z->Visible = chbAxes->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::chbPlanetClick(TObject* Sender)
{
    ///    sfPlanet->Visible = chbPlanet->Checked;
    if (chbPlanet->Checked)
		sfPlanet->Material->PolygonMode = pmFill;
    else
        sfPlanet->Material->PolygonMode = pmLines;
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::chbGridClick(TObject* Sender)
{
    dmMeridianGrid->Visible = chbGrid->Checked;
    dmParallelGrid->Visible = chbGrid->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::miSettingsClick(TObject* Sender)
{
    TFormSettings* FormSettings;
    FormSettings = new TFormSettings(this);
    try {
        FormSettings->ShowModal();
    } __finally
    {
        FormSettings->Free();
    }
}
//---------------------------------------------------------------------------

void __fastcall TfrmAstroScene::miAboutClick(TObject* Sender)
{
	TFormAbout* FormAbout;
    FormAbout = new TFormAbout(this);
    try {
        FormAbout->ShowModal();
    } __finally
    {
        FormAbout->Free();
    }
}
//---------------------------------------------------------------------------

