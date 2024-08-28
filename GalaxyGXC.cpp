//---------------------------------------------------------------------------

#include <fmx.h>
#ifdef _WIN32
#include <tchar.h>
#endif
#pragma hdrstop
#include <System.StartUpCopy.hpp>
//---------------------------------------------------------------------------
USEFORM("source\astroc\fcSettings.cpp", FormSettings);
USEFORM("source\astroc\fcGalaxy.cpp", FormGalaxyc);
USEFORM("source\astroc\fcForm.cpp", FormI);
USEFORM("source\astroc\fcAbout.cpp", FormAbout);
//---------------------------------------------------------------------------
extern "C" int FMXmain()
{
	try
	{
		Application->Initialize();
		Application->CreateForm(__classid(TFormGalaxyc), &FormGalaxyc);
		Application->CreateForm(__classid(TFormSettings), &FormSettings);
		Application->CreateForm(__classid(TFormI), &FormI);
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
