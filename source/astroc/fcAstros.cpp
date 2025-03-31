//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "dcImages.h"
#include "fcAstros.h"
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

TFormAstroViewer* FormAstroViewer;

bool grid_on = false;

//---------------------------------------------------------------------------
__fastcall TFormAstroViewer::TFormAstroViewer(TComponent* Owner) : TFormC(Owner) {}

//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::FormCreate(TObject* Sender)
{
    // Load maps for Planets
///   BinDir = ExtractFilePath(Application->ExeName); // String str = "1234567890";
///   String DataPath1 = BinDir.SubString(1,5);  // String s1 = str.substring(1,5), s1 = "12345"
///   String DataPath2 = BinDir.Delete(2,3);  // String s2 = str.delete(2,3), s2 = "1567890"
	
	
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

void __fastcall TFormAstroViewer::miPointtoClick(TObject* Sender)
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

void __fastcall TFormAstroViewer::GLCadencerProgress(
    TObject* Sender, const double DeltaTime, const double NewTime)

{
    if (chbRotate->Checked)
        sfPlanet->TurnAngle = 10 * NewTime;
    else
        sfPlanet->TurnAngle = 0;
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::miHipparcosClick(TObject* Sender)
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

void __fastcall TFormAstroViewer::miHercRusselClick(TObject* Sender)
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

void __fastcall TFormAstroViewer::ButtonMercuryClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("mercury.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonVenusClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("venus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonEarthClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("earth.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonMarsClick(TObject* Sender)
{
	sfPlanet->Material->Texture->Image->LoadFromFile("mars.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonJupiterClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("jupiter.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonSaturnClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("saturn.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonUranusClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("uranus.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonNeptuneClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("neptune.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::ButtonPlutoClick(TObject* Sender)
{
    sfPlanet->Material->Texture->Image->LoadFromFile("pluto.jpg");
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::miExitClick(TObject* Sender)
{
    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::chbAxesClick(TObject* Sender)
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

void __fastcall TFormAstroViewer::chbPlanetClick(TObject* Sender)
{
///    sfPlanet->Visible = chbPlanet->Checked;
    if (chbPlanet->Checked)
      sfPlanet->Material->PolygonMode = pmFill;
    else
      sfPlanet->Material->PolygonMode = pmLines;
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::chbGridClick(TObject* Sender)
{
    dmMeridianGrid->Visible = chbGrid->Checked;
    dmParallelGrid->Visible = chbGrid->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFormAstroViewer::miSettingsClick(TObject *Sender)
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

void __fastcall TFormAstroViewer::miAboutClick(TObject* Sender)
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


