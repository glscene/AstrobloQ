//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\Source\astroc\fcAstros.cpp", FormAstroViewer);
USEFORM("..\Source\astroc\fcForm.cpp", FormC);
USEFORM("..\Source\astroc\fcHercRussel.cpp", FormHercRussel);
USEFORM("..\Source\astroc\fcHipparcos.cpp", FormHipparcos);
USEFORM("..\Source\astroc\fcSettings.cpp", FormSettings);
USEFORM("..\Source\astroc\dcBase.cpp", dmBase); /* TDataModule: File Type */
USEFORM("..\Source\astroc\dcDialogs.cpp", dmDialogs); /* TDataModule: File Type */
USEFORM("..\Source\astroc\dcImages.cpp", dmImages); /* TDataModule: File Type */
USEFORM("..\Source\astroc\fcAbout.cpp", FormAbout);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TdmBase), &dmBase);
		Application->CreateForm(__classid(TdmDialogs), &dmDialogs);
		Application->CreateForm(__classid(TdmImages), &dmImages);
		Application->CreateForm(__classid(TFormAstroViewer), &FormAstroViewer);
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
