//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "dcImages.h"
#include "fcLitocfera.h"
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

TFormAstroviewer* FormAstroviewer;

bool grid_on = false;

//---------------------------------------------------------------------------
__fastcall TFormAstroviewer::TFormAstroviewer(TComponent* Owner) : TFormC(Owner) {}

//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::FormCreate(TObject* Sender)
{
    // Load map for Planet
    DataDir = ExtractFilePath(ParamStr(0)) + "data\\";
    CurrDir = DataDir + "map\\";
    SetCurrentDir(CurrDir);

    sfPlanet->Material->Texture->Disabled = false;
    sfPlanet->Material->Texture->Image->LoadFromFile("earth.jpg");
    sfPlanet->Radius = 6371;

    // Символы планет и лун солнечной системы
  ///  tvPlanets->Images = dmImages->VirtualSymbolPlanets; // не работает
    // Символы 88 созвездий
  ///  tvConstellations->Images = dmImages->VirtualSymbolConsts;

    chbGridClick(this);
    chbPlanetClick(this);
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::miPointtoClick(TObject* Sender)
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

void __fastcall TFormAstroviewer::GLCadencerProgress(
    TObject* Sender, const double DeltaTime, const double NewTime)

{
    if (chbRotate->Checked)
        sfPlanet->TurnAngle = 10 * NewTime;
    else
        sfPlanet->TurnAngle = 0;
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::miHipparcosClick(TObject* Sender)
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

void __fastcall TFormAstroviewer::miHercRusselClick(TObject* Sender)
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

void __fastcall TFormAstroviewer::ButtonMercuryClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("mercury.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonVenusClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("venus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonEarthClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("earth.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonMarsClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("mars.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonJupiterClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("jupiter.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonSaturnClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("saturn.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonUranusClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("uranus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonNeptuneClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("neptune.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::ButtonPlutoClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("pluto.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::miExitClick(TObject* Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::chbAxesClick(TObject* Sender)
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

void __fastcall TFormAstroviewer::chbPlanetClick(TObject* Sender)
{
///    sfPlanet->Visible = chbPlanet->Checked;
    if (chbPlanet->Checked)
      sfPlanet->Material->PolygonMode = pmFill;
    else
      sfPlanet->Material->PolygonMode = pmLines;
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::chbGridClick(TObject* Sender)
{
    dmMeridianGrid->Visible = chbGrid->Checked;
    dmParallelGrid->Visible = chbGrid->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::miSettingsClick(TObject *Sender)
{
  TFormSettings*  FormSettings;
  FormSettings = new TFormSettings(this);
  try {
	  FormSettings->ShowModal();
	}
	__finally {
	  FormSettings->Free();
  }
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroviewer::miAboutClick(TObject* Sender)
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


