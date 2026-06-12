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

//---------------------------------------------------------------------------
__fastcall TFormAstroScene::TFormAstroScene(TComponent* Owner) : TFormFirst(Owner)
{
}

//---------------------------------------------------------------------------
TFileName __fastcall TFormAstroScene::GetDataPath()
{
	Path = ExtractFilePath(ParamStr(0)).LowerCase();
	int N = Path.Pos("bin");
	if (N > 0)
		Path = Path.SubString(0, N - 1);

	Path = IncludeTrailingPathDelimiter(Path) + "data\\starsys\\sun\\";
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
	/*
	if (chbRotate->Checked)
		sfPlanet->TurnAngle = 10 * NewTime;
	else
		sfPlanet->TurnAngle = 0;
	*/
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

}
//---------------------------------------------------------------------------

