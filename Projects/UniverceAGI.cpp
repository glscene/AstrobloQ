//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\Source\actro\fcSettings.cpp", FormSettings);
USEFORM("..\Source\actro\fcAbout.cpp", FormAbout);
USEFORM("..\Source\actro\dcImages.cpp", dmImages); /* TDataModule: File Type */
USEFORM("..\Source\actro\dcDialogs.cpp", dmDialogs); /* TDataModule: File Type */
USEFORM("..\Source\actro\dcBase.cpp", dmBase); /* TDataModule: File Type */
USEFORM("..\Source\actro\fcHipparcos.cpp", FormHipparcos);
USEFORM("..\Source\actro\fcHercRussel.cpp", FormHercRussel);
USEFORM("..\Source\actro\fcForm.cpp", FormC);
USEFORM("..\Source\actro\fcAstroViewer.cpp", FormAstroviewer);
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
		Application->CreateForm(__classid(TFormAstroviewer), &FormAstroviewer);
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
