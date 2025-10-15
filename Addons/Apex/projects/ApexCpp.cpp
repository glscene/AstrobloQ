//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\cpp\fcNumint.cpp", FormNumint);
USEFORM("..\cpp\fcOccult.cpp", FormOccult);
USEFORM("..\cpp\fcPhases.cpp", FormPhases);
USEFORM("..\cpp\fcLuna.cpp", FormLuna);
USEFORM("..\cpp\fcEclipse.cpp", FormEclipse);
USEFORM("..\cpp\fcEclTimer.cpp", FormEclTimer);
USEFORM("..\cpp\fcFoto.cpp", FormFoto);
USEFORM("..\cpp\fcPhys.cpp", FormPhys);
USEFORM("..\cpp\fcSunset.cpp", FormSunset);
USEFORM("..\cpp\fcÑoco.cpp", FormCoco);
USEFORM("..\cpp\fcÑomet.cpp", FormComet);
USEFORM("..\cpp\fcPPMcat.cpp", FormPPMcat);
USEFORM("..\cpp\fcPlanetpos.cpp", FormPlanetpos);
USEFORM("..\cpp\fcPlanetrise.cpp", FormPlanetrise);
USEFORM("..\cpp\fcPPMbin.cpp", FormPPMbin);
USEFORM("..\cpp\fcApex.cpp", frmApex);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TfrmApex), &frmApex);
		Application->CreateForm(__classid(TFormLuna), &FormLuna);
		Application->CreateForm(__classid(TFormNumint), &FormNumint);
		Application->CreateForm(__classid(TFormFoto), &FormFoto);
		Application->CreateForm(__classid(TFormSunset), &FormSunset);
		Application->CreateForm(__classid(TFormPhases), &FormPhases);
		Application->CreateForm(__classid(TFormPhys), &FormPhys);
		Application->CreateForm(__classid(TFormPlanetpos), &FormPlanetpos);
		Application->CreateForm(__classid(TFormPlanetrise), &FormPlanetrise);
		Application->CreateForm(__classid(TFormCoco), &FormCoco);
		Application->CreateForm(__classid(TFormOccult), &FormOccult);
		Application->CreateForm(__classid(TFormPPMbin), &FormPPMbin);
		Application->CreateForm(__classid(TFormPPMcat), &FormPPMcat);
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
