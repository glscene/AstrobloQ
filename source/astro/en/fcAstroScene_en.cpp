/****************************************************************************
						   AstrobloQ System
*****************************************************************************/
#include <vcl.h>
#pragma hdrstop

#include "dcImages.h"
#include "fcAstroScene_en.h"
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
#pragma link "Stage.BaseClasses"
#pragma link "Stage.Coordinates"
#pragma resource "*.dfm"

TFormAstroScene* FormAstroScene;

bool grid_on = false;

int CoordRadius[] = { 2260, 4010, 4990, 5650, 6080, 6300, 6381, 6300, 6080,
	5650, 4990, 4010, 2260 };
int PositionX[] = { -6000, -5000, -4000, -3000, -2000, -1000, 0, 1000, 2000,
    3000, 4000, 5000, 6000 };

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
  TFileName FileCSV;
  TFileName FileJpg;
  int NLine;

  tbPlanets->SetFocus();

  switch (tvPlanets->Selected->Index) {
	case 0: { // Sun

			break;
	}
	case 1: { // Mercury
			break;
		}
	case 2: { // Venus
			break;
		}
	case 3: { // Earth
			break;
		}
	case 4: { // Mars
			break;
		}
	case 5: { // Jupiter
			break;
		}
	case 6: { // Saturn
			break;
		}
	case 7: { // Uranus
			break;
		}
	case 8: { // Neptune
			break;
		}
	case 9: { // Pluto
			break;
		}
	default: {
			break;
		}
	}

/* переписать на с++
  // включаем видимость лун
  dcMoon.Visible = true;
  // планеты, астероиды и кометы не видны
  sfPlanet.Visible = false;
  ffPlanet.Visible = false;

  dcAsteroid.Visible = false;
  dcComet.Visible = false;

  // чтение CSV файла трансляции и загрузки карты луны
  FileCSV := CurrentStar + "sol_moons.csv";
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
	sfMoon.Radius = 0.3; // Radius;
	FileJpg = CurrentStar + 'aMoon.jpg';
	sfMoon.Material.Texture.Image.LoadFromFile(FileJpg);
	ffMoon.Material.Texture.Image.LoadFromFile(FileJpg);
	// ffMoon.LoadFromFile(DataDir + '\model\object.3ds');
  end;

(*
  если карты из VirtPlanetMaps
  ffMoon.Material.Texture.Image.Assign(dmImages.VirtPlanetMaps.Images.Items[?]);
  Camera.TagObject = ffPlanet;
*)

  // Show Titan atmosphere
  if (tvMoons.Selected.Text = 'Титан')
  {
	sfMoon.Radius := 0.5;
	DirectOpenGL.Visible := True
  }
  else
  {
	sfMoon.Radius = 0.3;
	DirectOpenGL.Visible = False;
  };

  // Имя луны или спутника для веб-справки ruwiki
  // miHelpWiki->Caption = tvMoons->Selected->Text + "_(спутник)";
  miHelpWiki.Caption := tvMoons.Selected.Text + '_(спутник)';
*/

}
//---------------------------------------------------------------------------

void __fastcall TFormAstroScene::tbnPlanetsClick(TObject *Sender)
{
  // vBodyType = 1;
  // viewing planets
  sfPlanet->Visible = true;

  // freeform not visible yet
  ffPlanet->Visible = false;
  // moons, asteroids and comets not visible
  dcMoon->Visible = false;
  dcAsteroid->Visible = false;
  dcComet->Visible = false;

 // Loading the planet map
 // FileJpg = DataDir + TToolButton(Sender)->ImageName + ".jpg";
  FileJpg = DataDir + tbPlanets->Name + ".jpg";
  sfPlanet->Material->Texture->Image->LoadFromFile(FileJpg);

/*
  // Показать атмосферы планет, заменить на case, так как толщина атмосфер разная
  if (tbPlanets->Buttons[TToolButton(Sender)->ImageIndex]->Caption == "Earth") or
  //   (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption == 'Venus') or
  //   (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption == 'Jupiter') or
  //   (tbPlanets.Buttons[TToolButton(Sender).ImageIndex].Caption == 'Saturn') or
	 (tbPlanets->Buttons[TToolButton(Sender)->ImageIndex]->Caption == "Uranus") or
	 (tbPlanets->Buttons[TToolButton(Sender)->ImageIndex]->Caption == "Neptune")
  {
	//  sfClouds->Visible = true;
	DirectOpenGL->Visible = true;
	FormOptions->chbClouds->Checked = true;
  }
  else
  {
	// sfClouds->Visible = false;
	DirectOpenGL->Visible = false;
	FormOptions->chbClouds->Checked = false;
  };

  // Saturn rings
  if (tbPlanets->Buttons[TToolButton(Sender)->ImageIndex]->Hint = "Saturn")
  (* or (tbPlanets->Buttons[TToolButton(Sender)->ImageIndex]->Hint = "Uranus") *)
  {
	diskRingUpMaterial->Texture->Image->LoadFromFile(CurrentStar  + "saturn_ring.png");
	diskRingUp.Visible = True;
	diskRingDn->Material->Texture.Image.LoadFromFile(CurrentStar  + "saturn_ring.png");
	diskRingDn->Visible = true;
  }
  else
  {
	diskRingUp->Visible = false;
	diskRingDn->Visible := false;
  };

  // Солнце с короной
  if (tbPlanets->Buttons[TToolButton(Sender)->ImageIndex]->Hint = "Sun")
  {
	// corona
  };

*/
  // help + ' в ' + 'RuWiki...';
///  miHelpWiki->Caption = tbPlanets->Buttons[TToolButton(Sender)->ImageIndex]->Hint;

}
//---------------------------------------------------------------------------

