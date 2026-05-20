//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\cpp\fcOccult.cpp", FormOccult);
USEFORM("..\cpp\fcPhases.cpp", FormPhases);
USEFORM("..\cpp\fcPhys.cpp", FormPhys);
USEFORM("..\cpp\fcNumint.cpp", FormNumint);
USEFORM("..\cpp\fcEclTimer.cpp", FormEclTimer);
USEFORM("..\cpp\fcFoto.cpp", FormFoto);
USEFORM("..\cpp\fcLuna.cpp", FormLuna);
USEFORM("..\cpp\fcPlanetpos.cpp", FormPlanetpos);
USEFORM("..\cpp\fcÑoco.cpp", FormCoco);
USEFORM("..\cpp\fcÑomet.cpp", FormComet);
USEFORM("..\cpp\fcSunset.cpp", FormSunset);
USEFORM("..\cpp\fcPlanetrise.cpp", FormPlanetrise);
USEFORM("..\cpp\fcPPMbin.cpp", FormPPMbin);
USEFORM("..\cpp\fcPPMcat.cpp", FormPPMcat);
USEFORM("..\cpp\fcEclipse.cpp", FormEclipse);
USEFORM("..\cpp\fcApex.cpp", frmApex);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TfrmApex), &frmApex);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
